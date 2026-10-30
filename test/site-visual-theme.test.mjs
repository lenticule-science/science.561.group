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
  assert.ok(!/<\\/(?:style|script)/iu.test(css));
  assert.ok(!/url\\((?:https?:|\\/\\/)/iu.test(css), 'no external asset or tracker');
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
  assert.match(svg, /<title id="title">Lenticule relational optics<\\/title>/u);
  assert.match(svg, /<desc id="description">/u);
  assert.ok(!/<script|<foreignObject|<image|<use /iu.test(svg));
  assert.ok(!/href=|xlink:href=/iu.test(svg));
  assert.ok(!/https?:\\/\\/(?!www\\.w3\\.org\\/2000\\/svg)/iu.test(svg));
});

test('visual repair retains accepted work and the original research doorway', async () => {
  const home = await read('content/start-here.md');
  assert.match(home, /title: "Lenticule Science"/u);
  assert.match(home, /page-title: "Lenticule Science: Research for a Living Agentic Web"/u);
  assert.match(home, /status: active/u);
  assert.match(home, /visibility: public/u);
  assert.doesNotMatch(home, /^# Lenticule Science\\s*$/mu,
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
