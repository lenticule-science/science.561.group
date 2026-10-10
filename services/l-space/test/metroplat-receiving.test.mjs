import assert from 'node:assert/strict';
import { createHash } from 'node:crypto';
import { mkdir, mkdtemp, readFile, rm, writeFile } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { dirname, join } from 'node:path';
import test from 'node:test';

import { servedResponseFromRepr } from '@red-cup-engineering/http-services-section/representation';
import { markdownFileRevision } from '@red-cup-engineering/markdown-engineering-services-section/write-markdown-file';
import { createMcpServer } from '@red-cup-engineering/mcp-engineering-services-section/server';
import { EXCLUDED_SEGMENTS } from '../src/archive-policy.mjs';
import { lSpaceMetroplat } from '../src/metroplat.mjs';

// One already-authored corporate source, selected at an immutable owner commit.
// This fixture qualifies the reader. It does not admit a production source
// occurrence or claim that an installed machine carries the production corpus.
const DECLARED_SOURCE = Object.freeze({
  schemaVersion: 'lspace-receiving-source/v1',
  repository: 'lenticule-science/science-services-section',
  commit: 'e121b962a77d6d44bff069444f31d62f2cc57c0a',
  path: 'services/l-space/README.md',
  blob: '4e424765dfb2e42c5ee19b94e74cab7bda79a400',
  file: 'l-space-README.e121b962.md',
  byteLength: 6000,
  sha256: 'a92152b7c88cbc43d31b2fc9bb72aff7ba6143d5400d5684411947a387adccf4',
  sciencePrefix: 'science-services-section',
  canonicalPath: 'science-services-section/services/l-space/README.md',
  query: 'MetroPlat corpus access',
});
const fixtureDirectory = new URL('./fixtures/receiving/', import.meta.url);
const installedRoot = 'lib/emsenn/services/561-group/services';
const publicBaseUrl = 'https://lspace-receiving.invalid';
const documentPath = id => `/knowledge?document=${encodeURIComponent(id)}`;
const documentUrl = id => new URL(documentPath(id), publicBaseUrl).href;
const sha256 = value => createHash('sha256').update(value).digest('hex');
const escapeHtml = value => value.replace(/[&<>"']/gu, character => ({
  '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;',
})[character]);

function verifyFixture(declaration, bytes) {
  assert.deepEqual(declaration, DECLARED_SOURCE, 'the declared immutable source selection must not drift');
  assert.equal(bytes.length, declaration.byteLength, 'declared source byte length');
  assert.equal(createHash('sha1').update(`blob ${bytes.length}\0`).update(bytes).digest('hex'),
    declaration.blob, 'declared Git blob must match the exact fixture bytes');
  assert.equal(sha256(bytes), declaration.sha256, 'declared source SHA-256');
  const text = bytes.toString('utf8');
  assert.deepEqual(Buffer.from(text, 'utf8'), bytes, 'fixture must round-trip as UTF-8');
  // Use the same owning revision helper as CAIRN, not the Git blob hash.
  const revision = markdownFileRevision(text);
  assert.equal(revision, `sha256:${declaration.sha256}`);
  return { declaration, bytes, text, revision };
}

async function readFixture() {
  const declaration = JSON.parse(await readFile(new URL('source.json', fixtureDirectory), 'utf8'));
  const bytes = await readFile(new URL(DECLARED_SOURCE.file, fixtureDirectory));
  return verifyFixture(declaration, bytes);
}

async function applicationFixture(t, { materialize = true, rootExists = true, controls = false } = {}) {
  // PR39 deliberately gives this override priority. Never clear or change the
  // caller's environment, and never accidentally scan a configured live root.
  assert.ok(!process.env.METROPLAT_LSPACE_CORPUS_ROOT,
    'receiving requires METROPLAT_LSPACE_CORPUS_ROOT unset or empty; refusing an ambient corpus');
  const source = await readFixture();
  const temporary = await mkdtemp(join(tmpdir(), 'lspace-real-receiving-'));
  t.after(() => rm(temporary, { recursive: true, force: true }));
  const repositoryRoot = join(temporary, 'release');
  const root = join(repositoryRoot, installedRoot);
  const stateDir = join(temporary, 'state');
  await mkdir(stateDir, { recursive: true });
  if (rootExists) await mkdir(root, { recursive: true });
  if (materialize) {
    const file = join(root, source.declaration.canonicalPath);
    await mkdir(dirname(file), { recursive: true });
    await writeFile(file, source.bytes, { flag: 'wx' });
    assert.deepEqual(await readFile(file), source.bytes);
  }
  const excludedPaths = [];
  if (controls) {
    // Fresh, harmless negative-control text; no private corpus payload is used.
    for (const segment of EXCLUDED_SEGMENTS) {
      excludedPaths.push(`${source.declaration.sciencePrefix}/${segment}/receiving-control.md`);
    }
    excludedPaths.push('unadmitted-section/services/receiving-control.md');
    excludedPaths.push('unadmitted-section/content/text/receiving-control.md');
    for (const path of excludedPaths) {
      const file = join(root, path);
      await mkdir(dirname(file), { recursive: true });
      await writeFile(file, '# Synthetic exclusion control\n\nlspacereceivingexclusionmarker\n', { flag: 'wx' });
    }
  }
  // No supplied archive, serializer, stat implementation, admission override,
  // environment file or external service. L-Space opens its real CAIRN archive.
  const application = lSpaceMetroplat({
    config: { repositoryRoot, stateDir, publicBaseUrl },
    configuration: { root: installedRoot, sciencePrefix: source.declaration.sciencePrefix },
  });
  const call = async (name, input) => {
    const tool = application.tools.find(candidate => candidate.name === `lspace_${name}`);
    assert.ok(tool, `real L-Space ${name} descriptor is installed`);
    return tool.handler(input);
  };
  const resource = id => {
    const found = application.applications.flatMap(app => app.resources ?? []).find(item => item.id === id);
    assert.ok(found, `real L-Space ${id} resource is installed`);
    return found;
  };
  const request = (id, path) => resource(id).handler({ url: new URL(path, publicBaseUrl) });
  return { application, call, request, root, stateDir, source, excludedPaths };
}

async function receiveDeclaredDocument({ call, source }) {
  const found = await call('search', { query: source.declaration.query });
  assert.deepEqual(found.results.map(result => result.id), [source.declaration.canonicalPath],
    'receiving must search and find the declared source, not accept an empty directory');
  assert.equal(found.results[0].url, documentUrl(source.declaration.canonicalPath));
  const document = await call('fetch', { id: found.results[0].id });
  assert.equal(document.id, source.declaration.canonicalPath);
  assert.equal(document.title, 'L-Space');
  assert.equal(document.url, documentUrl(source.declaration.canonicalPath));
  assert.equal(document.text, source.text);
  assert.equal(document.metadata.revision, source.revision);
  return { found, document };
}

test('declared receiving fixture retains exact owner identity and refuses source or byte drift', async () => {
  const source = await readFixture();
  for (const [field, value] of Object.entries({
    repository: 'unselected/owner', commit: '0'.repeat(40), path: 'README.md', blob: '0'.repeat(40),
  })) {
    assert.throws(() => verifyFixture({ ...source.declaration, [field]: value }, source.bytes),
      /immutable source selection/);
  }
  const changed = Buffer.from(source.bytes);
  changed[0] ^= 1;
  assert.throws(() => verifyFixture(source.declaration, changed), /declared Git blob/);
});

test('real L-Space and CAIRN receive the declared document with canonical and legacy ID contracts', async t => {
  const fixture = await applicationFixture(t);
  const { call, source, stateDir } = fixture;
  const { document } = await receiveDeclaredDocument(fixture);
  const legacy = await call('fetch', { id: source.declaration.path });
  assert.equal(legacy.id, source.declaration.path, 'fetch retains its caller input ID');
  assert.equal(legacy.url, documentUrl(source.declaration.path), 'fetch retains its caller input URL');
  assert.equal(legacy.text, document.text);
  assert.deepEqual(legacy.metadata, document.metadata);
  for (const path of [source.declaration.canonicalPath, source.declaration.path]) {
    const reading = await call('vault_read', { path });
    assert.equal(reading.type, 'CairnDocumentReading');
    assert.equal(reading.path, source.declaration.canonicalPath);
    assert.equal(reading.markdown, source.text);
    assert.equal(reading.revision, source.revision);
  }
  // The real search path must have used its isolated persistent index/catalogue.
  assert.ok((await readFile(join(stateDir, 'knowledge', 'full-text.sqlite'))).length > 0);
  const observations = (await readFile(join(stateDir, 'knowledge', 'observations.jsonl'), 'utf8'))
    .trim().split('\n').map(line => JSON.parse(line));
  assert.ok(observations.some(row => row.path === source.declaration.canonicalPath && row.revision === source.revision));
});

test('shared MCP serialization and real reading resources preserve the same source and original links', async t => {
  const fixture = await applicationFixture(t);
  const { application, request, source } = fixture;
  const { found, document } = await receiveDeclaredDocument(fixture);
  const server = createMcpServer({ name: 'lspace-receiving', version: '1', tools: application.tools });
  const invoke = async (name, args) => {
    const response = await server.handleMessage({ jsonrpc: '2.0', id: 1, method: 'tools/call',
      params: { name: `lspace_${name}`, arguments: args } });
    assert.equal(response.error, undefined);
    assert.notEqual(response.result.isError, true);
    assert.deepEqual(JSON.parse(response.result.content[0].text), response.result.structuredContent);
    return response.result.structuredContent;
  };
  assert.deepEqual(await invoke('search', { query: source.declaration.query }), found);
  assert.deepEqual(await invoke('fetch', { id: source.declaration.canonicalPath }), document);
  assert.equal((await invoke('fetch', { id: source.declaration.path })).url, documentUrl(source.declaration.path));
  assert.ok(!application.tools.some(tool => /^lspace_vault_(?:write|edit|properties|move|merge)$/u.test(tool.name)));

  // Exercise actual application resources and the owning representation encoder,
  // without binding a listener or claiming host/authentication/transport receiving.
  const search = await servedResponseFromRepr(await request('lspace.metroplat',
    `/knowledge?query=${encodeURIComponent(source.declaration.query)}`), 'GET');
  assert.equal(search.status, 200);
  assert.ok(search.body.includes(`href="${documentPath(source.declaration.canonicalPath)}"`));
  for (const id of [source.declaration.canonicalPath, source.declaration.path]) {
    const reading = await servedResponseFromRepr(await request('lspace.metroplat', documentPath(id)), 'GET');
    assert.equal(reading.status, 200);
    assert.equal(reading.type, 'text/html; charset=utf-8');
    assert.ok(reading.body.includes(`<p>${escapeHtml(id)}</p>`));
    assert.ok(reading.body.includes(escapeHtml(source.text)), 'full source bytes survive the actual reading projection');
    assert.ok(reading.body.includes(escapeHtml(JSON.stringify(document.metadata, null, 2))));
    const room = await request('lspace.metroplat', `/knowledge?room=${sha256(id)}`);
    assert.ok(room instanceof Response);
    assert.equal(room.status, 303);
    assert.equal(room.headers.get('location'), documentPath(source.declaration.canonicalPath));
  }
  // This README mentions public visibility but does not itself opt into it.
  const publicReading = await servedResponseFromRepr(await request('lspace.public-reading',
    `/knowledge/public?document=${encodeURIComponent(source.declaration.canonicalPath)}`), 'GET');
  assert.equal(publicReading.status, 404);
});

test('real reader excludes custody/working strata, unadmitted and missing documents', async t => {
  const fixture = await applicationFixture(t, { controls: true });
  await receiveDeclaredDocument(fixture);
  const { call, request, source, excludedPaths } = fixture;
  assert.deepEqual((await call('search', { query: 'lspacereceivingexclusionmarker' })).results, []);
  const refused = [...excludedPaths, 'private/receiving-control.md',
    `${source.declaration.sciencePrefix}/services/l-space/not-materialized.md`,
    'services/l-space/not-materialized.md', 'README.md',
    `relocated/${source.declaration.canonicalPath}`];
  for (const id of refused) {
    await assert.rejects(() => call('fetch', { id }),
      error => error instanceof RangeError && error.reason === 'not-found');
    const reading = await servedResponseFromRepr(await request('lspace.metroplat', documentPath(id)), 'GET');
    assert.equal(reading.status, 503, `existing unavailable-reading contract: ${id}`);
    assert.ok(!reading.body.includes('lspacereceivingexclusionmarker'));
  }
});

test('missing corpus refuses before scanning and an empty real directory cannot pass receiving', async t => {
  await t.test('missing root keeps the PR39 operational error', async child => {
    const fixture = await applicationFixture(child, { materialize: false, rootExists: false });
    await assert.rejects(() => receiveDeclaredDocument(fixture),
      error => error.code === 'LSPACE_CORPUS_ROOT_UNAVAILABLE' && error.root === fixture.root);
    const reading = await servedResponseFromRepr(await fixture.request('lspace.metroplat',
      `/knowledge?query=${encodeURIComponent(fixture.source.declaration.query)}`), 'GET');
    assert.equal(reading.status, 503);
  });
  await t.test('empty root never substitutes for the selected authored source', async child => {
    const fixture = await applicationFixture(child, { materialize: false });
    await assert.rejects(() => receiveDeclaredDocument(fixture),
      error => error.code === 'LSPACE_CORPUS_SECTION_UNAVAILABLE' && error.section === fixture.source.declaration.sciencePrefix);
    await assert.rejects(() => fixture.call('fetch', { id: fixture.source.declaration.canonicalPath }),
      error => error instanceof RangeError && error.reason === 'not-found');
  });
});
