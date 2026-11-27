[CmdletBinding()]
param(
  [ValidateSet('fresh', 'upgrade')]
  [string]$Scenario = 'fresh',
  [string]$Output = (Join-Path ([IO.Path]::GetTempPath()) ('kyro-clean-' + [Guid]::NewGuid().ToString('N'))),
  [switch]$RequireMissingWebView2,
  [switch]$RemoveRunnerWebView2,
  [switch]$TestSigning
)

$ErrorActionPreference = 'Stop'
if ($env:OS -ne 'Windows_NT') { throw 'La prueba requiere Windows.' }
$registryKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\Gema'
$profile = Join-Path $env:APPDATA 'com.gema.desktop'
if ((Test-Path -LiteralPath $profile) -or (Test-Path -LiteralPath $registryKey) -or
    (Test-Path -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\Kyro')) {
  throw 'Ejecuta esta prueba en un Windows de pruebas sin instalaciones ni datos de Kyro/Gema.'
}
if (($TestSigning -or $RemoveRunnerWebView2) -and ($env:GITHUB_ACTIONS -ne 'true' -or $env:RUNNER_ENVIRONMENT -ne 'github-hosted')) {
  throw 'Los cambios temporales de certificado o de WebView2 requieren un runner virtual de GitHub.'
}

$root = New-Item -ItemType Directory -Path $Output -Force
$installDir = Join-Path $root.FullName 'app'
$desktop = [Environment]::GetFolderPath('DesktopDirectory')
if (!$desktop) { throw 'La sesión de Windows necesita un escritorio de usuario.' }
New-Item -ItemType Directory -Path $desktop -Force | Out-Null
$report = [ordered]@{
  scenario = $Scenario
  os = (Get-CimInstance Win32_OperatingSystem).Caption
  windowsVersion = [Environment]::OSVersion.Version.ToString()
  webview2Before = $null
  webview2After = $null
  tests = [Collections.Generic.List[string]]::new()
}
$latest = '0.4.28'
$latestHash = '4327df0e236133444c87133a2d16906eb8a89739ca024ca4eb121d5b304c5991'
$previous = '0.4.24'
$previousHash = 'd653e86c8ad701c8248618b07bf30456323102ee38a7f85a665057953c3ac09c'
$fixtureChatTitle = 'Conversación de comprobación'
$fixtureChatBody = 'Este mensaje debe conservarse después de actualizar.'

function Get-WebView2Version {
  $id = '{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}'
  foreach ($base in @(
    'HKCU:\Software\Microsoft\EdgeUpdate\Clients',
    'HKLM:\Software\WOW6432Node\Microsoft\EdgeUpdate\Clients',
    'HKLM:\Software\Microsoft\EdgeUpdate\Clients'
  )) {
    $value = Get-ItemPropertyValue -LiteralPath "$base\$id" -Name 'pv' -ErrorAction SilentlyContinue
    if ($value -and $value -ne '0.0.0.0') { return $value }
  }
  return $null
}

function Remove-TestWebView2 {
  $version = Get-WebView2Version
  if (!$version) { return }
  if ($version -notmatch '^\d+\.\d+\.\d+\.\d+$') { throw 'Versión de WebView2 inesperada.' }
  $runtime = Join-Path ${env:ProgramFiles(x86)} 'Microsoft\EdgeWebView\Application'
  $setup = Join-Path $runtime "$version\Installer\setup.exe"
  if (!(Test-Path -LiteralPath $setup -PathType Leaf)) { throw 'No se encontró el desinstalador del WebView2 preinstalado.' }
  $signature = Get-AuthenticodeSignature -LiteralPath $setup
  if ($signature.Status -ne 'Valid' -or $signature.SignerCertificate.Subject -notmatch '(^|, )O=Microsoft Corporation(,|$)') {
    throw 'No se pudo verificar el desinstalador de Microsoft WebView2.'
  }
  $remove = Start-Process -FilePath $setup -ArgumentList @('--uninstall', '--msedgewebview', '--system-level', '--verbose-logging', '--force-uninstall') -WindowStyle Hidden -PassThru
  if (!$remove.WaitForExit(120000)) { throw 'Terminó el tiempo de espera del desinstalador WebView2.' }
  if ((Get-WebView2Version) -or (Test-Path -LiteralPath (Join-Path $runtime "$version\msedgewebview2.exe"))) {
    throw "El invitado conserva WebView2 tras la desinstalación (código $($remove.ExitCode))."
  }
}

function Assert-Hash([string]$File, [string]$Hash) {
  if ((Get-FileHash -LiteralPath $File -Algorithm SHA256).Hash -ne $Hash) {
    throw "SHA-256 inesperado en $(Split-Path -Leaf $File)."
  }
}

function Get-Installer([string]$Version, [string]$Hash) {
  $file = "Kyro_${Version}_x64-setup.exe"
  $destination = Join-Path $root.FullName $file
  Invoke-WebRequest "https://ivanb12.github.io/kyro/downloads/$file" -OutFile $destination -TimeoutSec 60 -MaximumRetryCount 2 -RetryIntervalSec 2
  Assert-Hash $destination $Hash
  return $destination
}

function Install-Kyro([string]$Installer, [string]$Version) {
  $setup = Start-Process -FilePath $Installer -ArgumentList @('/S', "/D=$installDir") -WindowStyle Hidden -PassThru
  if (!$setup.WaitForExit(240000)) {
    Stop-Process -Id $setup.Id -ErrorAction SilentlyContinue
    throw 'El instalador no terminó en cuatro minutos.'
  }
  if ($setup.ExitCode -ne 0) { throw "El instalador terminó con código $($setup.ExitCode)." }
  $app = Get-Item -LiteralPath (Join-Path $installDir 'gema.exe')
  if ($app.VersionInfo.ProductVersion -ne $Version) { throw 'La versión instalada no coincide.' }
  $entry = Get-ItemProperty -LiteralPath $registryKey
  if ($entry.DisplayName -ne 'Kyro' -or $entry.DisplayVersion -ne $Version) {
    throw 'La versión registrada en Windows no coincide.'
  }
  $cli = Join-Path $installDir 'kyro-cli.exe'
  if ((& $cli --version) -notmatch [regex]::Escape($Version) -or $LASTEXITCODE -ne 0) {
    throw 'La utilidad de terminal no informó de la versión instalada.'
  }
  $shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut((Join-Path $desktop 'Kyro.lnk'))
  if ($shortcut.TargetPath -ne $app.FullName) { throw 'Falta el acceso directo al ejecutable instalado.' }
  $report.tests.Add("Instalación, versión, CLI y acceso directo correctos en $Version.")
}

function Test-AccessibleWindow([IntPtr]$Handle, [string]$ExpectedText) {
  if ($Handle -eq [IntPtr]::Zero) { return $false }
  Add-Type -AssemblyName UIAutomationClient,UIAutomationTypes
  $window = [System.Windows.Automation.AutomationElement]::FromHandle($Handle)
  $name = [System.Windows.Automation.AutomationElement]::NameProperty
  $condition = [System.Windows.Automation.PropertyCondition]::new($name, $ExpectedText)
  return $null -ne $window.FindFirst([System.Windows.Automation.TreeScope]::Descendants, $condition)
}

function Invoke-KyroCheck([string]$ExpectedText) {
  $listener = [Net.Sockets.TcpListener]::new([Net.IPAddress]::Loopback, 0)
  $listener.Start()
  $port = ([Net.IPEndPoint]$listener.LocalEndpoint).Port
  $listener.Stop()
  $previousArguments = $env:WEBVIEW2_ADDITIONAL_BROWSER_ARGUMENTS
  $previousUserData = $env:WEBVIEW2_USER_DATA_FOLDER
  $env:WEBVIEW2_USER_DATA_FOLDER = Join-Path $root.FullName ('webview-' + $port)
  $env:WEBVIEW2_ADDITIONAL_BROWSER_ARGUMENTS = "--remote-debugging-address=127.0.0.1 --remote-debugging-port=$port"
  try {
    $process = Start-Process -FilePath (Join-Path $installDir 'gema.exe') -WorkingDirectory $installDir -PassThru
  } finally {
    $env:WEBVIEW2_ADDITIONAL_BROWSER_ARGUMENTS = $previousArguments
    $env:WEBVIEW2_USER_DATA_FOLDER = $previousUserData
  }
  try {
    $deadline = [DateTime]::UtcNow.AddSeconds(90)
    $checkAccessibilityAfter = [DateTime]::UtcNow.AddSeconds(12)
    $accessible = $false
    do {
      $process.Refresh()
      if ($process.HasExited) { throw "Kyro se cerró durante el arranque ($($process.ExitCode))." }
      try {
        $page = Invoke-RestMethod "http://127.0.0.1:$port/json/list" -TimeoutSec 2 -NoProxy |
          Where-Object { $_.type -eq 'page' -and $_.url -match '^https?://tauri\.localhost' } |
          Select-Object -First 1
      } catch { $page = $null }
      if ($page) { break }
      if ([DateTime]::UtcNow -gt $checkAccessibilityAfter) {
        try { $accessible = Test-AccessibleWindow $process.MainWindowHandle $ExpectedText }
        catch { Write-Verbose $_ }
        if ($accessible) { break }
      }
      Start-Sleep -Milliseconds 500
    } while ([DateTime]::UtcNow -lt $deadline)
    if (!$page -and !$accessible) {
      $process.Refresh()
      Write-Host "Ventana de Kyro: $($process.MainWindowTitle), puerto de prueba: $port."
      Get-CimInstance Win32_Process -Filter "Name='msedgewebview2.exe'" |
        Where-Object CommandLine -Like "*$($root.FullName)*" | Select-Object ProcessId, CommandLine | Out-Host
      throw 'No se detectó la ventana de Kyro en WebView2.'
    }
    if ($page) {
      $dom = @'
const [url, expected] = process.argv.slice(2);
const socket = new WebSocket(url);
let counter = 0;
const deadline = setTimeout(() => { socket.close(); process.exitCode = 1; }, 30000);
const evaluate = () => {
  const id = ++counter;
  socket.send(JSON.stringify({ id, method: 'Runtime.evaluate', params: {
    expression: "Boolean(document.body?.innerText.includes(" + JSON.stringify(expected) + "))",
    returnByValue: true,
  } }));
};
socket.addEventListener('open', evaluate);
socket.addEventListener('message', ({ data }) => {
  const reply = JSON.parse(data);
  if (reply.id !== counter) return;
  if (!reply.result?.result?.value) { setTimeout(evaluate, 500); return; }
  clearTimeout(deadline);
  socket.close();
});
socket.addEventListener('error', () => { clearTimeout(deadline); process.exitCode = 1; });
'@
      $testFile = Join-Path $root.FullName 'verify-window.mjs'
      Set-Content -LiteralPath $testFile -Value $dom -Encoding utf8
      & node $testFile $page.webSocketDebuggerUrl $ExpectedText
      if ($LASTEXITCODE -ne 0) { throw 'Kyro abrió WebView2, pero no se renderizó el contenido esperado.' }
    }
    if (!(Test-Path -LiteralPath (Join-Path $profile 'workspace.sqlite3'))) { throw 'Falta el perfil SQLite.' }
    $null = $process.CloseMainWindow()
    if (!$process.WaitForExit(5000)) { Stop-Process -Id $process.Id }
  } finally {
    if (!$process.HasExited) { Stop-Process -Id $process.Id -ErrorAction SilentlyContinue }
  }
  $report.tests.Add("Interfaz renderizada y perfil SQLite comprobado ($ExpectedText).")
}

function New-DevSignedCopy([string]$Installer) {
  $sdk = Join-Path ${env:ProgramFiles(x86)} 'Windows Kits\10\bin'
  $signTool = Get-ChildItem -LiteralPath $sdk -Filter signtool.exe -File -Recurse |
    Where-Object DirectoryName -Match '\\x64$' | Sort-Object FullName -Descending | Select-Object -First 1
  if (!$signTool) { throw 'El runner necesita SignTool de Windows SDK.' }
  $certificate = New-SelfSignedCertificate -Type CodeSigningCert -Subject 'CN=Kyro prueba desechable' -CertStoreLocation 'Cert:\CurrentUser\My' -NotAfter (Get-Date).AddDays(1)
  $publicKey = Join-Path $root.FullName 'qa.cer'
  Export-Certificate -Cert $certificate -FilePath $publicKey | Out-Null
  Import-Certificate -FilePath $publicKey -CertStoreLocation 'Cert:\CurrentUser\Root' | Out-Null
  $signed = Join-Path $root.FullName 'signed-test.exe'
  Copy-Item -LiteralPath $Installer -Destination $signed
  & $signTool.FullName sign /fd SHA256 /sha1 $certificate.Thumbprint $signed | Out-Host
  if ($LASTEXITCODE -ne 0) { throw 'SignTool no firmó la copia de prueba.' }
  & $signTool.FullName verify /pa $signed | Out-Host
  if ($LASTEXITCODE -ne 0) { throw 'SignTool rechazó la copia de prueba.' }
  $signature = Get-AuthenticodeSignature -LiteralPath $signed
  if ($signature.Status -ne 'Valid' -or $signature.SignerCertificate.Thumbprint -ne $certificate.Thumbprint) {
    throw 'Windows no validó la identidad de prueba.'
  }
  $tampered = Join-Path $root.FullName 'tampered-test.exe'
  $data = [IO.File]::ReadAllBytes($signed)
  $data[4096] = $data[4096] -bxor 1
  [IO.File]::WriteAllBytes($tampered,$data)
  if ((Get-AuthenticodeSignature -LiteralPath $tampered).Status -ne 'HashMismatch') {
    throw 'Windows no señaló el cambio de contenido en la copia firmada.'
  }
  $report.tests.Add('Windows aceptó la copia del instalador firmada con el certificado desechable y rechazó sus bytes alterados.')
  return $signed
}

try {
  if ($RemoveRunnerWebView2) { Remove-TestWebView2 }
  $report.webview2Before = Get-WebView2Version
  if (($RequireMissingWebView2 -or $RemoveRunnerWebView2) -and $report.webview2Before) {
    throw "El invitado ya tiene WebView2 $($report.webview2Before). La prueba requiere un invitado sin ese componente."
  }
  $newInstaller = Get-Installer $latest $latestHash
  if ($TestSigning) { $newInstaller = New-DevSignedCopy $newInstaller }
  if ($Scenario -eq 'fresh') {
    Install-Kyro $newInstaller $latest
    Invoke-KyroCheck 'Primeros pasos'
  } else {
    $oldInstaller = Get-Installer $previous $previousHash
    Install-Kyro $oldInstaller $previous
    New-Item -ItemType Directory -Path $profile -Force | Out-Null
    $seed = @{
      interfaceVersion = 3; onboardingDone = $true; projects = @()
      preferences = @{ autoStartEngine = $false; closeToBackground = $false }
      chats = @(
        @{
          id = 'clean-install-fixture'; title = $fixtureChatTitle; agent = 'chat'
          model = 'qwen3:0.6b'; updated = [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()
          messages = @(@{ id = 'message'; role = 'user'; content = $fixtureChatBody })
        }
      )
    }
    $seed | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $profile 'workspace.json') -Encoding utf8
    Invoke-KyroCheck $fixtureChatTitle
    $db = Join-Path $profile 'workspace.sqlite3'
    $before = (Get-FileHash -LiteralPath $db).Hash
    $oldApp = (Get-FileHash -LiteralPath (Join-Path $installDir 'gema.exe')).Hash
    Install-Kyro $newInstaller $latest
    Assert-Hash $db $before
    Assert-Hash (Join-Path $profile "install-backups/workspace-before-$latest.sqlite3") $before
    Assert-Hash (Join-Path $installDir "rollback/$latest/gema.exe") $oldApp
    Invoke-KyroCheck $fixtureChatTitle
    $report.tests.Add('La actualización conservó el historial, la copia exacta de SQLite y el ejecutable anterior.')
  }
  $report.webview2After = Get-WebView2Version
  if (!$report.webview2After) { throw 'WebView2 no figura registrado después de la instalación.' }
} finally {
  $report | ConvertTo-Json -Depth 6
}
