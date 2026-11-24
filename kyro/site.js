const metadata = window.KYRO_RELEASES?.releases ?? [];
const [latest, ...older] = metadata;
const oldList = document.querySelector('#older-releases');
const formattedDate = (date) =>
  new Intl.DateTimeFormat('es-ES', { dateStyle: 'medium', timeZone: 'Europe/Madrid' }).format(
    new Date(date),
  );

if (latest) {
  const time = document.querySelector('#release-date');
  time.dateTime = latest.pub_date;
  time.textContent = formattedDate(latest.pub_date);
}
for (const release of older) {
  const item = document.createElement('li');
  const title = document.createElement('span');
  const link = document.createElement('a');
  title.textContent = `${release.version} · ${release.title}`;
  link.href = release.url;
  link.textContent = 'Descargar';
  link.className = 'quiet-link';
  link.setAttribute('aria-label', `Descargar versión ${release.version}`);
  item.append(title, link);
  oldList.append(item);
}

const features = {
  project: {
    title: 'Trabaja desde una carpeta',
    detail:
      'Explora archivos, abre referencias en su línea y revisa las propuestas antes de aplicarlas. Puedes anotar líneas y volver a ellas desde el panel del proyecto.',
    tools: 'Proyectos · Archivos · Notas · Cambios',
    image: 'proyecto.png',
    alt: 'Panel del proyecto junto al chat de Kyro',
  },
  image: {
    title: 'Crea o edita una imagen',
    detail:
      'Conecta ComfyUI, elige un modelo instalado y escribe lo que quieres crear o cambiar. Puedes seguir en el chat mientras esperas el resultado.',
    tools: 'ComfyUI · Qwen Image · Exportación PNG',
    image: 'imagenes.png',
    alt: 'Estudio de imágenes con los controles para elegir un modelo y crear una imagen',
  },
  chat: {
    title: 'Abre un chat local',
    detail:
      'Pregunta, escribe o prepara una tarea con un modelo de Ollama. Puedes cambiar de modelo desde el propio chat y usar la biblioteca para consultar los que tienes instalados.',
    tools: 'Ollama · Biblioteca de modelos · Historial',
    image: 'chat.png',
    alt: 'Chat personal de Kyro con el compositor centrado',
  },
};
const tabs = [...document.querySelectorAll('[data-feature]')];
const panel = document.querySelector('#feature-panel');
function showFeature(button) {
  for (const tab of tabs) {
    const active = tab === button;
    tab.setAttribute('aria-selected', String(active));
    tab.tabIndex = active ? 0 : -1;
  }
  const feature = features[button.dataset.feature];
  panel.setAttribute('aria-labelledby', button.id);
  panel.querySelector('h3').textContent = feature.title;
  panel.querySelector('p').textContent = feature.detail;
  panel.querySelector('.feature-detail').textContent = feature.tools;
  const image = panel.querySelector('img');
  image.src = 'assets/' + feature.image;
  image.alt = feature.alt;
}
tabs.forEach((button, index) => {
  button.addEventListener('click', () => showFeature(button));
  button.addEventListener('keydown', (event) => {
    const target = {
      ArrowLeft: (index + tabs.length - 1) % tabs.length,
      ArrowRight: (index + 1) % tabs.length,
      Home: 0,
      End: tabs.length - 1,
    }[event.key];
    if (target === undefined) return;
    event.preventDefault();
    tabs[target].focus();
    showFeature(tabs[target]);
  });
});

const menu = document.querySelector('.mobile-nav');
const navigation = document.querySelector('#navigation');
function changeMenu(open) {
  menu.setAttribute('aria-expanded', String(open));
  navigation.toggleAttribute('data-open', open);
}
menu.addEventListener('click', () => changeMenu(menu.getAttribute('aria-expanded') !== 'true'));
navigation.addEventListener('click', (event) => {
  if (event.target.closest('a')) changeMenu(false);
});
navigation.addEventListener('keydown', (event) => {
  if (event.key === 'Escape' && navigation.hasAttribute('data-open')) {
    changeMenu(false);
    menu.focus();
  }
});
