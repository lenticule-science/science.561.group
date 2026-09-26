// L-Space is a VICTOR site. This file, pointed at the Lenticule Science
// section, is the whole application: the vault catalog dialect admits every
// note of the science forest, VaultMaze projects the reading experience and
// keeps review state, GEODE is the workbench the author is admitted to, and
// the admission service decides who may read what. The garden is also an MCP server at /mcp,
// for assistants a reader connects (ChatGPT, Claude): its own authorization server signs them in
// through the same admission, and every admitted reader may search and read while only the
// author may write. Nothing here is code that belongs to L-Space; it is what L-Space says about
// itself.

import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { applyMigrations } from '@red-cup-engineering/cloudflare-d1-service/migrations';
import { createSqliteD1 } from '@red-cup-engineering/cloudflare-d1-service/sqlite';
import { ADMISSION_MIGRATIONS } from '@red-cup-engineering/computer-web-server/admission/schema';
import { SIGN_IN_PATH, createWebAdmissionApplication, defaultPublicRoute } from '@red-cup-engineering/computer-web-server/admission/application';
import { createPrincipalRegistry } from '@red-cup-engineering/computer-web-server/admission/principals';
import { openArchive } from '@red-cup-engineering/knowledge-system-server/archive';
import { gardenPrompts, noteResourceTemplates, searchAndFetchTools, vaultMcpTools } from '@red-cup-engineering/knowledge-system-server/mcp-tools';
import { mcpResource } from '@red-cup-engineering/mcp-engineering-services-section/http';
import { createAuthorizationServer, createJsonFileGrantStore } from '@red-cup-engineering/oauth-services-section/authorization-server';
import { createVaultMazeApplication } from '@red-cup-engineering/graphical-knowledge-game-server/application';
import { createVaultMazeProjector } from '@red-cup-engineering/graphical-knowledge-game-server/projector';
import { REVIEW_STORE_SCHEMA, createReviewStore } from '@red-cup-engineering/graphical-knowledge-game-server/review-store';
import { sha256Hex } from "@red-cup-engineering/cryptographic-computer-data-engineering-services-section/integrity";

/** The content root: the Lenticule Science section, every `content/` tree beneath it. */
export const SCIENCE_ROOT = fileURLToPath(new URL('../../', import.meta.url));

/** Path segments that are custody, triage, private, or working strata, never rooms. */
export const EXCLUDED_SEGMENTS = Object.freeze(['legacy', 'triage', 'private', 'dev', 'test', 'fixtures', 'dist', 'sites', 'lib']);

/** Frontmatter fields whose values form concept halls. */
export const ATTRIBUTE_FIELDS = Object.freeze([
  'science-owner', 'type', 'kind', 'tags', 'keywords', 'cites', 'relates-to', 'related-terms', 'related-texts',
]);

/** The one address that may author. Discord principals, including one belonging to the author, are readers. */
export const AUTHOR_EMAIL = 'morgan.sennhauser@gmail.com';

/** The author's own password and Hive sign-ins, which may author too. */
export const AUTHOR_SUBJECTS = Object.freeze(['password:emsenn', 'hive:emsenn0']);

/** Where the deployment keeps its state: principals.json, Hive login nonces, the authorization server's grants. */
const stateDirectory = (environment) => setting('LSPACE_STATE_DIR', environment)
  ?? (setting('LSPACE_DATABASE_PATH', environment) ? dirname(setting('LSPACE_DATABASE_PATH', environment)) : undefined);

const setting = (name, environment = process.env) => {
  const value = environment[name];
  return typeof value === 'string' && value.trim() !== '' ? value : undefined;
};

const publicBaseUrl = (environment) => setting('PUBLIC_BASE_URL', environment)?.replace(/\/$/u, '');

/**
 * Which providers a deployment configured. A provider missing any of its
 * settings is absent, and an absent provider admits nobody through that path.
 * Secrets stay in the environment; this reads names, never values, into a
 * committed file.
 */
export function admissionProviders(environment = process.env) {
  const sessionSecret = setting('SESSION_SECRET', environment);
  const providers = {};
  if (sessionSecret && setting('GOOGLE_CLIENT_ID', environment) && setting('GOOGLE_CLIENT_SECRET', environment)) {
    providers.google = {
      clientId: setting('GOOGLE_CLIENT_ID', environment),
      clientSecret: setting('GOOGLE_CLIENT_SECRET', environment),
      sessionSecret,
      allowedEmails: setting('LSPACE_ALLOWED_EMAILS', environment) ?? '',
      publicBaseUrl: publicBaseUrl(environment),
      sessionCookie: 'l_space_session',
      transactionCookie: 'l_space_oauth',
    };
  }
  // A username and password, or a Hive Keychain signature, for the people principals.json admits.
  const stateDir = stateDirectory(environment);
  if (sessionSecret && stateDir !== undefined) {
    const registry = createPrincipalRegistry({ stateDir });
    providers.password = { sessionSecret, registry, publicBaseUrl: publicBaseUrl(environment), sessionCookie: 'l_space_password_session' };
    providers.hive = { sessionSecret, stateDir, appName: 'l-space.561.group', registry, sessionCookie: 'l_space_hive_session' };
  }
  const guildId = setting('DISCORD_GUILD_ID', environment);
  const roleId = setting('TURNTIDE_ISLANDER_ROLE_ID', environment);
  if (sessionSecret && guildId && roleId && setting('DISCORD_CLIENT_ID', environment) && setting('DISCORD_CLIENT_SECRET', environment)) {
    providers.discord = {
      clientId: setting('DISCORD_CLIENT_ID', environment),
      clientSecret: setting('DISCORD_CLIENT_SECRET', environment),
      guildId,
      roleId,
      sessionSecret,
      publicBaseUrl: publicBaseUrl(environment),
      sessionCookie: 'l_space_discord_session',
      transactionCookie: 'l_space_discord_oauth',
    };
  }
  if (sessionSecret && guildId && roleId && setting('DISCORD_BOT_TOKEN', environment)) {
    providers.discordCommand = {
      publicKey: setting('DISCORD_PUBLIC_KEY', environment),
      botToken: setting('DISCORD_BOT_TOKEN', environment),
      guildId,
      roleId,
      sessionSecret,
      // The incumbent Discord gateway owns this command and signs its approvals.
      commandName: 'l-space-login',
      sessionCookie: 'l_space_discord_session',
      verifierCookie: 'l_space_discord_command_verifier',
      gatewayTimestampHeader: 'x-l-space-gateway-timestamp',
      gatewaySignatureHeader: 'x-l-space-gateway-signature',
    };
  }
  return providers;
}

/** The routes the MCP and OAuth faces answer for themselves: a bearer token or a sign-in redirect, never the admission gate's 401. */
const SELF_ADMITTING = new Set(['/mcp', '/oauth/authorize', '/oauth/token', '/oauth/register', '/oauth/revoke']);
export const lSpacePublicRoute = (path, method) => SELF_ADMITTING.has(path) || path.startsWith('/.well-known/oauth-') || path === '/.well-known/openid-configuration' || defaultPublicRoute(path, method);

/** Where a reader opens a room of the garden: VaultMaze addresses a room by the SHA-256 of its path. */
export const roomUrl = (base, path) => `${base}/#/room/${sha256Hex(path)}`;

/** Per-reader state: review rows and Discord sessions, in one SQLite database at the configured path. */
export async function openState(environment = process.env) {
  const database = createSqliteD1(setting('LSPACE_DATABASE_PATH', environment) ?? ':memory:');
  await applyMigrations(database, [...ADMISSION_MIGRATIONS, { name: '0003_vaultmaze_reviews', sql: REVIEW_STORE_SCHEMA }]);
  return database;
}

/** The composed applications: admission first, then VaultMaze, then GEODE when a live checkout is configured. */
export async function applications(context, environment = process.env) {
  const database = await openState(environment);
  const admission = createWebAdmissionApplication({
    providers: admissionProviders(environment),
    database,
    authorEmail: setting('LSPACE_AUTHOR_EMAIL', environment) ?? AUTHOR_EMAIL,
    // GEODE's writes are the author's; its reads are any admitted reader's; /ns/ is public by doctrine.
    authorRoute: (path, method) => method === 'POST' && (path === '/api/action' || path === '/api/refresh'),
    realm: 'l-space.561.group',
    authors: setting('LSPACE_AUTHOR_SUBJECTS', environment)?.split(',').map((subject) => subject.trim()) ?? [...AUTHOR_SUBJECTS],
    publicRoute: lSpacePublicRoute,
  });
  const composed = [
    admission,
    createVaultMazeApplication({ reviews: createReviewStore(database), subjectOf: (ctx) => admission.subjectOf(ctx) }),
  ];
  const authoringRoot = setting('GEODE_AUTHORING_ROOT', environment);
  let archive;
  if (authoringRoot !== undefined) {
    // GEODE is loaded only where an authoring checkout is configured: a reading
    // deployment carries no workbench in memory.
    const [{ createGeodeVictorApplicationFactory }, { createGeodeAuthoring }] = await Promise.all([
      import('@red-cup-engineering/graphical-knowledge-system-server/server'),
      import('@red-cup-engineering/graphical-knowledge-system-server/authoring'),
    ]);
    const workspace = await createGeodeAuthoring({
      root: authoringRoot,
      region: setting('GEODE_AUTHORING_REGION', environment) ?? '',
      excludes: [...EXCLUDED_SEGMENTS],
    });
    composed.push(createGeodeVictorApplicationFactory({ workspace })(context));
    archive = workspace.archive;
  }
  const openedArchive = () => (archive ??= openArchive({ root: SCIENCE_ROOT, excludes: [...EXCLUDED_SEGMENTS] }));
  composed.push(...mcpApplications({ admission, environment, archive: openedArchive }));
  // The first search builds the full-text index (about half a minute over the forest): build it
  // now, so an assistant's first question is answered within its tool timeout.
  if (setting('LSPACE_WARM_SEARCH', environment) !== 'false') {
    void Promise.resolve(openedArchive()).then((opened) => opened.search('garden', { mode: 'text', limit: 1 })).catch(() => undefined);
  }
  return composed;
}

/**
 * The garden's MCP server and the authorization server that admits assistants to it. A token is
 * issued only to someone the admission service admits, is bound to this garden's /mcp, and
 * carries whether its holder is the author; only the author sees the write tools.
 */
export function mcpApplications({ admission, environment = process.env, archive }) {
  const base = publicBaseUrl(environment) ?? 'https://l-space.561.group';
  const resource = `${base}/mcp`;
  const grants = setting('LSPACE_OAUTH_STATE', environment) ?? (stateDirectory(environment) === undefined ? undefined : join(stateDirectory(environment), 'oauth'));
  const authorization = createAuthorizationServer({
    issuer: base,
    name: 'L-Space',
    resources: [resource],
    ...(grants === undefined ? {} : { store: createJsonFileGrantStore(grants) }),
    authenticate: async (context) => {
      const principal = await admission.identifyContext(context);
      return principal === null ? undefined : { subject: `${principal.provider}:${principal.subjectHash}`, name: principal.label, ...(principal.email === undefined ? {} : { email: principal.email }), author: principal.author === true };
    },
    loginUrl: (returnTo) => `${SIGN_IN_PATH}?return_to=${encodeURIComponent(returnTo)}`,
  });
  const mcp = mcpResource({
    name: 'l-space',
    title: 'L-Space',
    version: '0.3.0',
    instructions: 'L-Space is the Lenticule Science knowledge garden: some twenty thousand Markdown notes, glossary terms and articles. Use search then fetch to find and read notes; the vault_* tools read what the notes say as relations, cells and concepts, and (for the author) write them.',
    tools: [...searchAndFetchTools({ documentUrl: (path) => roomUrl(base, path) }), ...vaultMcpTools],
    resourceTemplates: noteResourceTemplates({ scheme: 'l-space', title: 'L-Space notes', documentUrl: (path) => roomUrl(base, path) }),
    prompts: gardenPrompts(),
    realm: 'l-space.561.group',
    resourceMetadataUrl: `${base}/.well-known/oauth-protected-resource/mcp`,
    verifyToken: (token) => authorization.verifyToken(token, { resource }),
    bind: ({ principal }) => ({ archive, canWrite: principal?.principal?.author === true }),
  });
  return [authorization.app, { resources: [mcp] }];
}

export default {
  configVersion: 1,
  site: {
    name: 'L-Space',
    baseIri: `${publicBaseUrl(process.env) ?? 'https://l-space.561.group'}/`,
    language: 'en',
    license: 'All rights reserved',
    menu: [{ label: 'Garden entrance', href: '/' }],
  },
  catalog: {
    dialect: 'vault',
    source: 'house',
    wing: 'lenticule-science',
    exclude: [...EXCLUDED_SEGMENTS],
    attributeFields: [...ATTRIBUTE_FIELDS],
  },
  // VaultMaze owns the root; VICTOR's publication archives, search, and atlas
  // are for publication sites, and a forest of twenty thousand rooms is not one.
  home: false,
  archives: false,
  search: false,
  tufte: false,
  // The forest releases as a page and a room record for each of 22,000 notes:
  // about a gigabyte, above the release verifier's default sanity limit.
  release: { maxBytes: 4 * 1024 ** 3, maxFiles: 250_000 },
  projectors: [
    createVaultMazeProjector({
      title: 'L-Space',
      subtitle: 'A living projection of the Lenticule Science knowledge forest.',
      eyebrow: 'Authenticated digital garden',
      description: 'L-Space: the authenticated Lenticule Science knowledge garden.',
      vocabulary: { lSpace: 'Lenticule Space' },
      participation: {
        directReadClaims: ['l-space:direct-read', 'l-space:curator'],
        accessibilityBypassClaims: ['l-space:accessibility-bypass'],
        targetRetention: 0.9,
        familiar: { enabled: true, retrievalMode: 'delegated-copy', costPolicy: 'lenticule-science/familiar-cost/v1' },
      },
      sourceRevision: setting('GITHUB_SHA') ?? setting('LENTICULE_SCIENCE_SOURCE_REVISION') ?? null,
    }),
  ],
  applications: (context) => applications(context),
};
