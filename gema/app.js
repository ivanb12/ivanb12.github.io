const $ = (s, root = document) => root.querySelector(s);
const $$ = (s, root = document) => [...root.querySelectorAll(s)];
const menu = $('.menu-toggle'), nav = $('#navigation');
function closeMenu() { nav.classList.remove('is-open'); menu.setAttribute('aria-expanded', 'false'); menu.setAttribute('aria-label', 'Abrir menú'); }
menu.addEventListener('click', () => { const open = menu.getAttribute('aria-expanded') !== 'true'; nav.classList.toggle('is-open', open); menu.setAttribute('aria-expanded', String(open)); menu.setAttribute('aria-label', open ? 'Cerrar menú' : 'Abrir menú'); });
$$('a', nav).forEach(a => a.addEventListener('click', closeMenu));
document.addEventListener('keydown', e => { if (e.key === 'Escape') closeMenu(); });
const agents = {
  code: { number:'01 / PROGRAMAR', title:'Cambios concretos.\nLa última palabra es tuya.', description:'Gema lee el código y prepara propuestas para crear o editar archivos. Revisa las diferencias, selecciona los bloques y aplica el cambio cuando esté listo.', points:['Ediciones por fragmentos y por archivos.','Copias previas y detección de conflictos.','Pruebas del proyecto con tu autorización.'] },
  review: { number:'02 / REVISAR', title:'Otra mirada.\nCon los archivos delante.', description:'Inspecciona documentación, configuración y código para explicar qué hace el proyecto y detectar problemas con referencias verificadas.', points:['Referencias a archivos y líneas reales.','Alcance de lectura visible, incluidos los fragmentos parciales.','No modifica tus archivos ni ejecuta pruebas sin permiso.'] },
  chat: { number:'03 / CONVERSAR', title:'Una conversación.\nCon tu modelo local.', description:'Pregunta, escribe o trabaja una idea desde un chat con historial. Elige el modelo y ajusta el idioma, el detalle y la creatividad de las respuestas.', points:['Historial y búsqueda de conversaciones.','Respuestas progresivas y bloques de código copiables.','Sin cuenta de Gema ni claves de una API de pago.'] },
  plan: { number:'04 / PLANIFICAR', title:'Antes de cambiar código,\nordena el siguiente paso.', description:'Analiza el contexto del proyecto y prepara un plan concreto. Úsalo para entender dependencias, decidir prioridades y dividir un cambio en tareas.', points:['Lectura de los archivos de la carpeta elegida.','Memoria del proyecto para guardar decisiones.','Modo de lectura: prepara el plan sin escribir archivos.'] },
};
const agentTabs = $$('[data-agent]');
function selectAgent(button, focus = false) { const id = button.dataset.agent, agent = agents[id]; agentTabs.forEach(b => { b.setAttribute('aria-selected', String(b === button)); b.tabIndex = b === button ? 0 : -1; }); $('#agent-panel').setAttribute('aria-labelledby', button.id); $('#agent-number').textContent = agent.number; $('#agent-title').replaceChildren(...agent.title.split('\n').flatMap((t,i) => i ? [document.createElement('br'), document.createTextNode(t)] : [document.createTextNode(t)])); $('#agent-description').textContent = agent.description; $('#agent-points').replaceChildren(...agent.points.map(p => { const li = document.createElement('li'); li.textContent = p; return li; })); if(focus) button.focus(); }
agentTabs.forEach((button,i) => { button.addEventListener('click', () => selectAgent(button)); button.addEventListener('keydown', e => { let n; if(e.key==='ArrowRight') n=(i+1)%agentTabs.length; if(e.key==='ArrowLeft') n=(i+agentTabs.length-1)%agentTabs.length; if(e.key==='Home') n=0; if(e.key==='End') n=agentTabs.length-1; if(n!==undefined) {e.preventDefault(); selectAgent(agentTabs[n],true);} }); });
$$('[data-filter]').forEach(button => button.addEventListener('click', () => { $$('[data-filter]').forEach(b => b.setAttribute('aria-pressed', String(b===button))); $$('.model-row').forEach(row => {row.hidden = button.dataset.filter !== 'all' && !row.dataset.kind.split(' ').includes(button.dataset.filter);}); }));
$$('[data-theme]').forEach(button => button.addEventListener('click', () => { $$('[data-theme]').forEach(b => b.setAttribute('aria-pressed', String(b===button))); const theme = button.dataset.theme; $('#theme-preview').src=`assets/home-${theme}.png`; $('#theme-preview').alt=`Gema con el tema ${button.textContent}`; $('#theme-caption').textContent=button.textContent; $('#theme-zoom').dataset.zoom=`assets/home-${theme}.png`; }));
const dialog = $('#image-dialog'); let previous;
$$('[data-zoom]').forEach(button => button.addEventListener('click', () => { previous=button; $('#lightbox-image').src=button.dataset.zoom; dialog.showModal(); }));
$('.lightbox-close').addEventListener('click', () => dialog.close());
dialog.addEventListener('click', e => {if(e.target === dialog) dialog.close();});
dialog.addEventListener('close', () => previous?.focus());
function size(bytes) { return `${(bytes/1048576).toLocaleString('es-ES',{maximumFractionDigits:1})} MB`; }
function releaseValid(r) { return /^\d+\.\d+\.\d+$/.test(r.version) && r.url === `https://ivanb12.github.io/gema/downloads/Gema_${r.version}_x64-setup.exe` && /^[a-f0-9]{64}$/i.test(r.sha256) && r.bytes>0 && Array.isArray(r.notes) && r.notes.every(n => typeof n === 'string') && Number.isFinite(Date.parse(r.pub_date)); }
function renderReleases(data) {
  if(!Array.isArray(data.releases) || !data.releases.length || !data.releases.every(releaseValid)) return;
  const current=data.releases[0]; $$('[data-version]').forEach(e => e.textContent=current.version); $$('[data-download]').forEach(a => a.href=`downloads/Gema_${current.version}_x64-setup.exe`); $$('[data-size]').forEach(e => e.textContent=size(current.bytes));
  $('#release-list').replaceChildren(...data.releases.map((r,i) => {
    const article=document.createElement('article'); article.className='release-card'; article.id=`version-${r.version}`;
    const meta=document.createElement('div'); meta.className='release-version'; const version=document.createElement('strong');version.textContent=r.version;meta.append(version);
    if(i===0){const tag=document.createElement('span');tag.className='tag';tag.textContent='ÚLTIMA VERSIÓN';meta.append(tag);}
    const date=document.createElement('time');date.dateTime=r.pub_date;date.textContent=new Date(r.pub_date).toLocaleDateString('es-ES',{day:'numeric',month:'short',year:'numeric'});meta.append(date);
    const content=document.createElement('div'), title=document.createElement('h3');title.textContent=r.title;content.append(title);
    const ul=document.createElement('ul');r.notes.forEach(n=>{const li=document.createElement('li');li.textContent=n;ul.append(li);});content.append(ul);
    const link=document.createElement('a');link.className='text-link';link.href=`downloads/Gema_${r.version}_x64-setup.exe`;link.download='';link.textContent=`Descargar ${r.version} · ${size(r.bytes)} ↗`;content.append(link);
    const details=document.createElement('details'), summary=document.createElement('summary'), hash=document.createElement('code');summary.textContent='Ver SHA-256';hash.textContent=r.sha256;details.append(summary,hash);content.append(details);article.append(meta,content);return article;
  }));
}
if(window.GEMA_RELEASES) renderReleases(window.GEMA_RELEASES);
fetch('releases.json',{cache:'no-cache'}).then(r=>{if(!r.ok)throw Error();return r.json();}).then(renderReleases).catch(()=>{});
