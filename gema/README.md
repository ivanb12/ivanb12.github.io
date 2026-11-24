# Gema para Windows

Web pública: https://ivanb12.github.io/gema/

Página estática, sin recopilación de conversaciones ni telemetría. La descarga es el instalador independiente de Gema; no incluye pesos de modelos. Windows 10/11 x64.

## Publicar otra versión

1. Compilar y validar un instalador con un número de versión nuevo. Nunca reemplazar un archivo de una versión ya publicada.
2. Añadir `downloads/Gema_<versión>_x64-setup.exe` y calcular su SHA-256 y tamaño exactos.
3. Añadir la versión al principio de `releases.json`, conservando el historial. Actualizar `latest.json` con ese mismo objeto y `release-data.js` con `window.GEMA_RELEASES = <contenido de releases.json>;` para que la página funcione aunque falle el fetch.
4. Actualizar el enlace de descarga y la versión de reserva de `index.html`, y `downloads/SHA256SUMS.txt`. No usar enlaces a instaladores inexistentes.
5. Comprobar la descarga y el hash, la vista móvil y `latest.json`. Publicar mediante un commit en `main` y esperar a que GitHub Pages termine.

El objeto de cada versión usa `version`, `title`, `pub_date` (ISO 8601), `notes` (lista de texto), `platform` (`windows-x86_64`), `url` (URL HTTPS de esta carpeta), `bytes` y `sha256`. Desde Gema 0.2.6, la aplicación compara versiones y descarga el instalador desde GitHub Pages. Verifica el tamaño y el SHA-256 antes de abrirlo. El usuario inicia la instalación desde Ajustes. Las versiones anteriores abren la web para descargarlo.

Para actualizar una instalación: terminar los trabajos, ejecutar el instalador nuevo en la ubicación existente y conservar el perfil. No es necesario desinstalar. Ollama y sus modelos se mantienen.

Las capturas corresponden a la app real con proyectos de ejemplo. Los logotipos de Qwen, Mistral y OpenAI se usan para identificar los modelos del catálogo; no implican afiliación. Véase `credits.txt`.
