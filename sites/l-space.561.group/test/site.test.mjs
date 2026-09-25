// L-Space is its configuration. These tests prove that configuration through
// VICTOR's real runtime over a small vault: the shell opens, the anonymous
// surface opens, and everything else refuses a reader without a session.
import assert from 'node:assert/strict';
import { mkdtemp, mkdir, readFile, rm, writeFile } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';
import test from 'node:test';
import { createVictorWebsite } from "@red-cup-engineering/static-site-publisher/website";
import { normalizeProjectConfig } from "@red-cup-engineering/static-site-publisher/config";
import configuration, { ATTRIBUTE_FIELDS, EXCLUDED_SEGMENTS, SCIENCE_ROOT, admissionProviders, applications } from '../static-site-publisher.config.mjs';

const PUBLIC_KEY = 'a'.repeat(64);

async function vaultFixture(t) {
  const root = await mkdtemp(join(tmpdir(), 'l-space-site-'));
  t.after(() => rm(root, { recursive: true, force: true }));
  await mkdir(join(root, 'content'), { recursive: true });
  await mkdir(join(root, 'legacy'), { recursive: true });
  await writeFile(join(root, 'content', 'welcome.md'), `---\ntitle: Welcome\ndate-created: 2026-01-02\nvisibility: public\n---\n\nThe open door.\n`);
  await writeFile(join(root, 'content', 'secret.md'), `---\ntitle: Secret\n---\n\nFor readers only.\n`);
  await writeFile(join(root, 'legacy', 'old.md'), `---\ntitle: Old\n---\n\nCustody, not a room.\n`);
  return root;
}

test('the configuration is a closed VICTOR project configuration with no refusals', () => {
  const normalized = normalizeProjectConfig(configuration);
  assert.deepEqual(normalized.refusals, []);
  assert.equal(normalized.config.catalog.dialect, 'vault');
  assert.equal(normalized.config.catalog.wing, 'lenticule-science');
  assert.deepEqual([...normalized.config.catalog.exclude], [...EXCLUDED_SEGMENTS]);
  assert.deepEqual([...normalized.config.catalog.attributeFields], [...ATTRIBUTE_FIELDS]);
  assert.equal(normalized.config.home, false, 'VaultMaze owns the root');
  assert.equal(normalized.config.tufte, false);
  assert.equal(normalized.config.search, false);
  assert.equal(configuration.projectors.length, 1);
  assert.equal(configuration.projectors[0].name, 'vaultmaze');
});

test('the configuration resolves the science section from its canonical site directory', () => {
  assert.equal(SCIENCE_ROOT, fileURLToPath(new URL('../../..', import.meta.url)));
});

test('a provider is present only when every one of its settings is, and secrets are read from the environment by name', () => {
  assert.deepEqual(admissionProviders({}), {}, 'an empty environment admits nobody through any path');
  const google = admissionProviders({ SESSION_SECRET: 's', GOOGLE_CLIENT_ID: 'id', GOOGLE_CLIENT_SECRET: 'secret', LSPACE_ALLOWED_EMAILS: 'a@b.example' });
  assert.deepEqual(Object.keys(google), ['google']);
  assert.equal(google.google.allowedEmails, 'a@b.example');
  assert.equal(google.google.sessionCookie, 'l_space_session');
  const discord = admissionProviders({
    SESSION_SECRET: 's', DISCORD_GUILD_ID: '123456789012345678', TURNTIDE_ISLANDER_ROLE_ID: '234567890123456789', DISCORD_BOT_TOKEN: 'bot', DISCORD_PUBLIC_KEY: PUBLIC_KEY,
  });
  assert.deepEqual(Object.keys(discord), ['discordCommand'], 'without a client secret there is no OAuth path, only the command login');
  assert.equal(discord.discordCommand.commandName, 'l-space-login');
  assert.equal(discord.discordCommand.gatewaySignatureHeader, 'x-l-space-gateway-signature');
  const source = JSON.stringify(configuration);
  for (const secret of ['GOOGLE_CLIENT_SECRET', 'DISCORD_CLIENT_SECRET', 'DISCORD_BOT_TOKEN', 'SESSION_SECRET']) {
    assert.equal(source.includes(secret), false, `the configuration carries no ${secret} value`);
  }
});

test('the site serves its shell and public surface anonymously and refuses the vault without a session', async (t) => {
  const root = await vaultFixture(t);
  const website = await createVictorWebsite({
    ...configuration,
    contentDir: root,
    site: { ...configuration.site, baseIri: 'http://127.0.0.1/' },
    assets: false,
    release: false,
    applications: (context) => applications(context, {}),
    runtime: { observability: false, probes: false },
  });
  t.after(() => website.close(0));
  const running = await website.start({ host: '127.0.0.1', port: 0 });
  const origin = `http://127.0.0.1:${running.port}`;

  const shell = await fetch(`${origin}/`);
  assert.equal(shell.status, 200);
  assert.match(await shell.text(), /<meta name="application-name" content="L-Space">/);
  const surface = await fetch(`${origin}/vault/public/surface.json`);
  assert.equal(surface.status, 200);
  const surfaceBody = await surface.json();
  assert.equal(surfaceBody.title, 'L-Space');
  assert.equal(surfaceBody.counts.publicRooms, 1);
  assert.equal(surfaceBody.vocabulary.lSpace, 'Lenticule Space');
  const publicIndex = await (await fetch(`${origin}/vault/public/index.json`)).json();
  assert.deepEqual(publicIndex.rooms.map((room) => room.id), ['content/welcome.md']);
  const publicRoom = await fetch(`${origin}/vault/public/rooms/${publicIndex.rooms[0].key}.json`);
  assert.equal(publicRoom.status, 200);

  for (const path of ['/vault/index.json', '/vault/manifest.json', '/vault/views/garden.json', '/api/v1/me', '/api/v1/reviews', '/content/secret/']) {
    const refused = await fetch(`${origin}${path}`);
    assert.equal(refused.status, 401, `${path} must refuse an anonymous reader`);
    assert.deepEqual(await refused.json(), { error: 'access-required' });
  }
  const write = await fetch(`${origin}/api/v1/reviews`, { method: 'PUT', body: '{}' });
  assert.equal(write.status, 401);
  const build = website.getBuild();
  assert.equal(build.catalog.cells.has('legacy/old'), false, 'custody strata are excluded');
  assert.equal(build.report.releasable, true, JSON.stringify(build.report.refusals.slice(0, 3)));
});

test('the deployment unit serves the release through VICTOR and nothing else', async () => {
  const unit = await readFile(new URL('../deploy/l-space.service', import.meta.url), 'utf8');
  assert.match(unit, /static-site-publisher serve .* --release/u);
  assert.match(unit, /--host=127\.0\.0\.1 --port=18848/u);
  assert.doesNotMatch(unit, /worker\.mjs|adapter\.mjs|LSPACE_WORKER_MODULE/u);
  assert.doesNotMatch(unit, /\/home\/emsenn\/services\/l-space\/victor\.config\.mjs/u);
  const caddy = await readFile(new URL('../deploy/Caddyfile', import.meta.url), 'utf8');
  assert.match(caddy, /reverse_proxy 127\.0\.0\.1:18848/u);
});
