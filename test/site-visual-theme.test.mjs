import assert from 'node:assert/strict';
import test from 'node:test';
import { readFile } from 'node:fs/promises';

const root = new URL('../', import.meta.url);
const read = path => readFile(new URL(path, root), 'utf8');
const site = JSON.parse(await read('site.json'));

function luminance(hex) {
  const channel = [1, 3, 5].map(index =>
    Number.parseInt(hex.slice(index, index + 2), 16) / 255)
    .map(value => value <= 0.04045 ? value / 12.92 : ((value + 0.055) / 1.055) ** 2.4);
  return channel[0] * 0.2126 + channel[1] * 0.7152 + channel[2] * 0.0722;
}

function contrast(a, b) {
  const left = luminance(a), right = luminance(b);
  return (Math.max(left, right) + 0.05) / (Math.min(left, right) + 0.05);
}

test('one original source-owned Science house theme is scoped and reusable', () => {
  assert.equal(site.baseIri, 'https://science.561.group/');
  assert.equal(site.home, 'start-here');
  assert.equal(site.tufteTheme.name, 'lenticule-laboratory');
  assert.equal(site.tufteThemeStylesheet, true);
  const css = site.tufteTheme.styles;
  assert.ok(css.startsWith('body[data-tufte-theme=lenticule-laboratory]'));
  assert.ok(css.includes('.tufte-masthead'));
  assert.ok(css.includes('.tufte-tile-body article'));
  assert.ok(css.includes('url("/crystal-lens.svg")'), 'use the owned original image');
  assert.ok(css.includes('@media(max-width:800px)'));
  assert.ok(css.includes('@media(prefers-color-scheme:dark)'));
  assert.ok(css.includes('@media(prefers-reduced-motion:reduce)'));
  assert.ok(css.includes(':focus-visible'));
  assert.ok(!/<\/(?:style|script)/iu.test(css));
  assert.ok(!/url\((?:https?:|\/\/)/iu.test(css), 'no external asset or tracker');
});

test('original lab palette keeps critical ink, instrument and link pairs readable', () => {
  const pairs = [
    ['#172A31', '#FFFDF7', 4.5, 'light ink/surface'],
    ['#172A31', '#F5F7F4', 4.5, 'light ink/background'],
    ['#3F5C65', '#FFFDF7', 4.5, 'light instrument text/surface'],
    ['#3D5588', '#FFFDF7', 4.5, 'light link/surface'],
    ['#00695C', '#FFFDF7', 4.5, 'light crystal accent/surface'],
    ['#687F89', '#FFFDF7', 3, 'light boundary/surface'],
    ['#F1F6F2', '#1A2A30', 4.5, 'dark ink/surface'],
    ['#B7D0CE', '#1A2A30', 4.5, 'dark instrument text/surface'],
    ['#C1D3FC', '#1A2A30', 4.5, 'dark link/surface'],
    ['#99DED0', '#20343C', 4.5, 'dark crystal accent/plate'],
    ['#8CA9AF', '#1A2A30', 3, 'dark boundary/surface'],
  ];
  for (const [foreground, background, minimum, reading] of pairs) {
    assert.ok(contrast(foreground, background) >= minimum,
      reading + ' fails token-pair contrast ' + contrast(foreground, background));
    assert.ok(site.tufteTheme.styles.includes(foreground),
      reading + ' is not in the actual house stylesheet');
  }
});

test('science optics specimen is original and does not make a source claim', async () => {
  const svg = await read('static/crystal-lens.svg');
  assert.match(svg, /^<svg /u);
  assert.match(svg, /viewBox="0 0 520 520"/u);
  assert.match(svg, /<title id="title">Lenticule relational optics<\/title>/u);
  assert.match(svg, /<desc id="description">/u);
  assert.ok(!/<script|<foreignObject|<image|<use /iu.test(svg));
  assert.ok(!/href=|xlink:href=/iu.test(svg));
  assert.ok(!/https?:\/\/(?!www\.w3\.org\/2000\/svg)/iu.test(svg));
});

test('visual repair retains accepted work and the original research doorway', async () => {
  const home = await read('content/start-here.md');
  assert.match(home, /title: "Lenticule Science"/u);
  assert.match(home, /page-title: "Lenticule Science: Research for a Living Agentic Web"/u);
  assert.match(home, /status: active/u);
  assert.match(home, /visibility: public/u);
  assert.doesNotMatch(home, /^# Lenticule Science\s*$/mu,
    'the TUFTE masthead owns the only visual H1');
  for (const route of [
    '/climate-breakdown-ergodicity-and-water-governance/',
    '/belnap-four-valued-logic/',
    '/obsmetrologia-formal-mathematics-in-lean-4/',
    '/paraconsistent-transfinite-linear-agent-integration/',
  ]) {
    assert.ok(home.includes(route),'preserve original research entrance '+route);
  }
  assert.equal(site.publisher.name, 'Lenticule Science');
  assert.equal(site.publisher.url, site.baseIri);
});


test('two original climate diagrams have explicit epistemic status, text alternatives and no active or external content', async () => {
  const article = await read('content/climate-breakdown-ergodicity-and-water-governance.md');
  const figures = [
    ['static/climate-stationarity-schematic.svg', '/climate-stationarity-schematic.svg', 'Stationarity is an assumption to test'],
    ['static/climate-pathwise-example.svg', '/climate-pathwise-example.svg', 'A lived budget path differs from the arithmetic average multiplier'],
  ];
  for (const [path, route, title] of figures) {
    const svg = await read(path);
    assert.match(svg, /^<svg xmlns="http:\/\/www\.w3\.org\/2000\/svg"/u);
    assert.ok(svg.length < 8000, 'retain light original SVG assets without external fetches');
    assert.ok(svg.includes('<title id="figure-title">' + title + '</title>'));
    assert.match(svg, /<desc id="figure-description">[\s\S]+<\/desc>/u);
    assert.match(svg, /<metadata>Original Lenticule Science/u);
    assert.doesNotMatch(svg, /<(?:script|foreignObject|image|use)\b/iu);
    assert.doesNotMatch(svg, /(?:href|xlink:href)\s*=/iu);
    assert.doesNotMatch(svg, /https?:\/\/(?!www\.w3\.org\/2000\/svg)/iu);
    // Test the association, not merely the presence of some image or caption.
    // This follows the source-owned Markdown form without claiming TUFTE
    // emitted a semantic HTML figure until its real renderer is inspected.
    const lines = article.split('\n');
    const figuresInArticle = lines.flatMap((line, index) => {
      if (!line.startsWith('![') || !line.endsWith(')')) return [];
      const separator = line.lastIndexOf('](');
      if (separator < 3) return [];
      const actualRoute = line.slice(separator + 2, -1);
      if (!actualRoute.startsWith('/climate-') || !actualRoute.endsWith('.svg')) return [];
      const caption = lines[index + 2] ?? '';
      if (lines[index + 1] !== '' || !caption.startsWith('*Figure ')) return [];
      return [{ route: actualRoute, alt: line.slice(2, separator), caption }];
    });
    assert.equal(figuresInArticle.length, 2, 'each source figure needs its own adjacent caption');
    const image = figuresInArticle.find(figure => figure.route === route);
    assert.ok(image, 'source figure lost its alternative or caption: ' + route);
    const number = route.includes('stationarity') ? 1 : 2;
    assert.ok(image.caption.startsWith('*Figure ' + number + ' — '),
      'figure numbering must stay paired with the original diagram');
    assert.ok(image.alt.length >= 100, 'missing extended scientific alternative: ' + route);
    assert.ok(['not', 'no ', 'illustrat', 'construct'].some(term =>
      image.alt.toLowerCase().includes(term)),
      'alt must distinguish schematic or constructed illustration from evidence: ' + route);
    assert.ok(image.caption.length >= 160, 'visible interpretive caption is missing: ' + route);
    assert.ok(image.caption.includes('[Open Figure ' + number + ' as a scalable SVG](' + route + ')'),
      'narrow-screen reader must have a labeled original, scalable figure route: ' + route);
  }
  assert.match(article, /\*Figure 1 — A baseline is an assumption to test\.\*/u);
  assert.match(article, /\*Figure 2 — One trajectory, not a population average\.\*/u);
  assert.match(article, /schematic, not observed climate data/u);
  assert.match(article, /not observed economic data/u);
  assert.match(article, /no claim about the ergodicity/u);
  assert.match(article, /status: active/u);
  assert.match(article, /visibility: public/u);
});

test('arithmetic bars represent the exact authored 1.0 → 1.5 → 0.9 constructed trajectory', async () => {
  const svg = await read('static/climate-pathwise-example.svg');
  const article = await read('content/climate-breakdown-ergodicity-and-water-governance.md');
  const spans = [
    ['Start', '180', '1.00'],
    ['After ×1.5', '270', '1.50'],
    ['After ×0.6', '162', '0.90'],
  ];
  for (const [label, width, value] of spans) {
    assert.ok(svg.includes('>' + label + '</text>'));
    assert.ok(svg.includes('width="' + width + '" height="40"'));
    assert.ok(svg.includes('>' + value + '</text>'));
  }
  assert.equal(270 / 180, 1.5);
  assert.equal(162 / 180, 0.9);
  assert.match(svg, /Arithmetic mean multiplier/u);
  assert.match(svg, /Geometric mean multiplier/u);
  assert.match(svg, /≈0\.949/u);
  assert.match(svg, /NOT, BY ITSELF, A NONERGODICITY PROOF/u);
  assert.match(article, /1\.5 × 0\.6 = 0\.9/u);
});


test('laboratory figure captions stay full-size, sourced, and legible in both themes', () => {
  const css = site.tufteTheme.styles;
  const marker = 'body[data-tufte-theme=lenticule-laboratory] .tufte-tile-body figure.markdown-figure>figcaption{';
  const section = css.split(marker);
  assert.equal(section.length, 2, 'one original source-owned scientific caption rule');
  const figure = section[1].split('}')[0];
  assert.ok(figure.includes('font:500 1em/1.65'), 'do not reduce scientific figure captions to instrument-label size');
  assert.ok(figure.includes('color:var(--tufte-ink)'), 'use high-contrast source-owned reading ink');
  assert.ok(figure.includes('overflow-wrap:anywhere'), 'long evidence references cannot clip on phones');
  const title = css.split('figure.markdown-figure>figcaption>em{');
  assert.equal(title.length, 2, 'figure label gets its own strong visual hierarchy');
  assert.ok(title[1].split('}')[0].includes('display:block'), 'figure title separates from interpretation');
  assert.ok(css.includes('@media(prefers-color-scheme:dark)'), 'retain the original dark palette');
});


test('scientific source citation and epistemic boundaries survive visual editions', async () => {
  const article = await read('content/climate-breakdown-ergodicity-and-water-governance.md');
  // External bibliographic facts independently checked against PubMed (Milly
  // et al., 2008), Nature Physics (Peters, 2019, Perspective), and OECD's
  // official water-governance instrument on 2026-10-30. This verifies the
  // original text's *attribution*, not its empirical results or peer review.
  const references = [
    ['Milly DOI', '[*Stationarity Is Dead: Whither Water Management?*](https://doi.org/10.1126/science.1151915) (2008)'],
    ['Peters Perspective', '[*The Ergodicity Problem in Economics*](https://www.nature.com/articles/s41567-019-0732-0) (2019)'],
    ['OECD water governance', '[OECD Principles on Water Governance](https://legalinstruments.oecd.org/public/doc/349/body-text.en.html)'],
  ];
  for (const [name, source] of references) {
    assert.ok(article.includes(source), 'original research attribution must remain intact: ' + name);
  }
  assert.ok(article.includes('This is an illustration of arithmetic-versus-compound growth, **not** by itself a proof'),
    'a deterministic arithmetic example cannot be silently published as an ergodicity proof');
  assert.ok(article.includes('That program is a theoretical perspective, not a universal empirical finding'),
    'do not turn a theoretical perspective into a blanket empirical claim');
  assert.ok(article.includes('schematic, not observed climate data'),
    'a designed baseline diagram must not acquire observed-data authority');
  assert.ok(article.includes('constructed teaching example'), 'the budget trajectory is not a dataset');
  assert.ok(article.includes('**Topology is not a title deed or a source of jurisdiction.**'),
    'a diagram must never be misrepresented as granting territorial or treaty authority');
  assert.ok(article.includes('energy-based unit of account') && article.includes('energy-backed claim'),
    'retain the separation of energy accounting and financial obligations');
});
