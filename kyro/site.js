const releases = window.KYRO_RELEASES?.releases ?? [];
const [latest, ...older] = releases;
const dateFormatter = new Intl.DateTimeFormat('es-ES', {
  dateStyle: 'medium',
  timeZone: 'Europe/Madrid',
});
const writeNotes = (list, notes) => {
  list.replaceChildren(
    ...notes.map((note) => {
      const item = document.createElement('li');
      item.textContent = note;
      return item;
    }),
  );
};

if (latest) {
  const time = document.querySelector('#release-date');
  time.dateTime = latest.pub_date;
  time.textContent = dateFormatter.format(new Date(latest.pub_date));
  writeNotes(document.querySelector('#release-notes'), latest.notes);
}

const earlier = document.querySelector('#older-releases');
for (const release of older) {
  const row = document.createElement('li');
  const details = document.createElement('details');
  const summary = document.createElement('summary');
  const notes = document.createElement('ul');
  const link = document.createElement('a');
  summary.textContent = `${release.version} · ${release.title}`;
  writeNotes(notes, release.notes);
  link.href = release.url;
  link.className = 'text-link';
  link.textContent = 'Descargar ' + release.version;
  details.append(summary, notes, link);
  row.append(details);
  earlier.append(row);
}

const tabs = Array.from(document.querySelectorAll('.tour-tabs [role="tab"]'));
function activateTab(active) {
  for (const tab of tabs) {
    const selected = tab === active;
    tab.setAttribute('aria-selected', String(selected));
    tab.tabIndex = selected ? 0 : -1;
    document.getElementById(tab.getAttribute('aria-controls')).hidden = !selected;
  }
}
tabs.forEach((tab, index) => {
  tab.addEventListener('click', () => activateTab(tab));
  tab.addEventListener('keydown', (event) => {
    const next = {
      ArrowLeft: (index + tabs.length - 1) % tabs.length,
      ArrowRight: (index + 1) % tabs.length,
      Home: 0,
      End: tabs.length - 1,
    }[event.key];
    if (next === undefined) return;
    event.preventDefault();
    activateTab(tabs[next]);
    tabs[next].focus();
  });
});

const filterGroup = document.querySelector('.model-filters');
const filters = Array.from(filterGroup.querySelectorAll('[data-filter]'));
const models = Array.from(document.querySelectorAll('[data-model]'));
filterGroup.hidden = false;
for (const button of filters) {
  button.addEventListener('click', () => {
    for (const filter of filters) filter.setAttribute('aria-pressed', String(filter === button));
    const category = button.dataset.filter;
    for (const model of models) {
      model.hidden = category !== 'all' && !model.dataset.model.split(' ').includes(category);
    }
  });
}

const menu = document.querySelector('.mobile-nav');
const navigation = document.querySelector('#navigation');
function setMenu(open) {
  menu.setAttribute('aria-expanded', String(open));
  navigation.toggleAttribute('data-open', open);
}
menu.addEventListener('click', () => setMenu(menu.getAttribute('aria-expanded') !== 'true'));
navigation.addEventListener('click', (event) => {
  if (event.target.closest('a')) setMenu(false);
});
document.querySelector('.site-header').addEventListener('keydown', (event) => {
  if (event.key === 'Escape' && navigation.hasAttribute('data-open')) {
    setMenu(false);
    menu.focus();
  }
});

function openGuide(hash) {
  if (!hash.startsWith('#guia-')) return;
  const guide = document.getElementById(hash.slice(1));
  if (guide instanceof HTMLDetailsElement) guide.open = true;
}
addEventListener('hashchange', () => openGuide(location.hash));
openGuide(location.hash);
