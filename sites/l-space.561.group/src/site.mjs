// L-Space is the Lenticule Science knowledge garden, served over the science section's files as
// they are: VaultMaze answers the reading experience live (the world read once, a room rendered
// when it is opened) and keeps each reader's reviews in the house journal, GEODE is the workbench
// the author is admitted to, and the admission service decides who may read what. Media (video, audio, images, documents) lives
// in an ni-addressed store beside the state and is served at /.well-known/ni/ to admitted
// readers; notes embed it by name. The author also browses the Gemini notebooks at /buckets/ as
// S3 buckets. The garden is also an MCP server at /mcp,
// for assistants a reader connects (ChatGPT, Claude): its own authorization server signs them in
// through the same admission, and every admitted reader may search and read while only the
// author may write. Nothing here is code that belongs to L-Space; it is what L-Space says about
// itself.

import { execFileSync } from 'node:child_process';
import { timingSafeEqual } from 'node:crypto';
import { join, relative, sep } from 'node:path';
import { fileURLToPath } from 'node:url';
import { SIGN_IN_PATH, createWebAdmissionApplication, defaultPublicRoute } from '@red-cup-engineering/computer-web-server/admission/application';
import { createPrincipalRegistry } from '@red-cup-engineering/computer-web-server/admission/principals';
import { openArchive } from '@red-cup-engineering/knowledge-system-server/archive';
import { gardenPrompts, noteResourceTemplates, searchAndFetchTools, vaultMcpTools } from '@red-cup-engineering/knowledge-system-server/mcp-tools';
import { mcpResource } from '@red-cup-engineering/mcp-engineering-services-section/http';
import { createAuthorizationServer, createJsonFileGrantStore } from '@red-cup-engineering/oauth-services-section/authorization-server';
import { createVaultMazeApplication } from '@red-cup-engineering/graphical-knowledge-game-server/application';
import { createVaultMazeRuntime } from '@red-cup-engineering/graphical-knowledge-game-server/runtime';
import { createReviewStore } from '@red-cup-engineering/graphical-knowledge-game-server/review-store';
import { mergeApps } from '@red-cup-engineering/computer-web-server/compose';
import { healthResources } from '@red-cup-engineering/computer-web-server/edge/health';
import { sha256Hex } from "@red-cup-engineering/cryptographic-computer-data-engineering-services-section/integrity";
import { createImmutableContentCustody } from '@red-cup-engineering/immutable-content-custody-service';
import { createFileStore, createPathContent } from '@red-cup-engineering/immutable-content-custody-service/file-store';
import { niResource } from '@red-cup-engineering/http-services-section/ni';
import { s3Resource } from '@red-cup-engineering/http-services-section/s3';

/** The 561 Group's root, against which a garden's section path (and so its glossary's concept IRIs) is named. */
export const GROUP_ROOT = fileURLToPath(new URL('../../../../../', import.meta.url));

/** The content root: the Lenticule Science section, every `content/` tree beneath it. */
export const SCIENCE_ROOT = fileURLToPath(new URL('../../../', import.meta.url));

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

/** Where the deployment keeps its state: principals.json, Hive login nonces, the authorization server's grants, reviews. */
const stateDirectory = (environment) => setting('LSPACE_STATE_DIR', environment);

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

/** Where media bytes live, named by their ni URIs: LSPACE_MEDIA_ROOT, else media/ in the state directory. */
export const mediaRoot = (environment = process.env) => setting('LSPACE_MEDIA_ROOT', environment)
  ?? (stateDirectory(environment) === undefined ? undefined : join(stateDirectory(environment), 'media'));

/** The media store as a content store (head, read) for /.well-known/ni/, or undefined when no root is configured. */
export function mediaContent(environment = process.env) {
  const root = mediaRoot(environment);
  return root === undefined ? undefined : createImmutableContentCustody({ store: createFileStore(root), maximumBytes: 1024 ** 3 });
}

/** The author's view of the Gemini notebooks as S3 buckets, signed in with this machine's notebooklm login on first use. */
export const BUCKETS_PATH = '/buckets';
export function notebookBuckets() {
  let opened;
  const buckets = () => (opened ??= import('@red-cup-engineering/gemini-notebook-services-section/gemini-notebook-buckets')
    .then(({ createGeminiNotebookBuckets }) => createGeminiNotebookBuckets())
    .catch((error) => { opened = undefined; throw error; }));
  const delegate = (name) => async (...args) => (await buckets())[name](...args);
  return s3Resource({ listBuckets: delegate('listBuckets'), listObjects: delegate('listObjects'), headObject: delegate('headObject'), getObject: delegate('getObject') }, { mount: BUCKETS_PATH, id: 'gemini-notebook-buckets', title: 'Gemini Notebook' });
}
const isBucketsRoute = (path) => path === BUCKETS_PATH || path.startsWith(`${BUCKETS_PATH}/`);

/** The routes the MCP and OAuth faces answer for themselves: a bearer token or a sign-in redirect, never the admission gate's 401. */
const SELF_ADMITTING = new Set(['/mcp', '/oauth/authorize', '/oauth/token', '/oauth/register', '/oauth/revoke']);
export const lSpacePublicRoute = (path, method) => SELF_ADMITTING.has(path) || path.startsWith('/.well-known/oauth-') || path === '/.well-known/openid-configuration' || defaultPublicRoute(path, method);

/** Where a reader opens a room of the garden: VaultMaze addresses a room by the SHA-256 of its path. */
export const roomUrl = (base, path) => `${base}/#/room/${sha256Hex(path)}`;

/** The vault catalog settings VaultMaze reads the forest with. */
export const LSPACE_CATALOG = Object.freeze({ wing: 'lenticule-science', source: 'house', exclude: [...EXCLUDED_SEGMENTS], attributeFields: [...ATTRIBUTE_FIELDS] });

/** How VaultMaze presents the garden. */
export const LSPACE_PROJECTION = Object.freeze({
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
});

/** The section a garden reads: LSPACE_ROOT, else the Lenticule Science forest. Another instance of
 *  L-Space (Binding Generations') reads its own section under its own wing, title and realm. */
export const lSpaceRoot = (environment = process.env) => setting('LSPACE_ROOT', environment) ?? SCIENCE_ROOT;
/** The path segments a garden leaves out: LSPACE_EXCLUDE (comma-separated), else EXCLUDED_SEGMENTS.
 *  An instance whose site is part of its garden (Binding Generations') drops 'sites'. */
export const lSpaceExcludes = (environment = process.env) => setting('LSPACE_EXCLUDE', environment)?.split(',').map((segment) => segment.trim()).filter(Boolean) ?? [...EXCLUDED_SEGMENTS];
const lSpaceCatalog = (environment) => ({ ...LSPACE_CATALOG, wing: setting('LSPACE_WING', environment) ?? LSPACE_CATALOG.wing, exclude: lSpaceExcludes(environment) });
/** Where a garden's root sits in the 561 Group: `services/science-services-section` for the Lenticule Science forest. */
export const lSpaceSectionPath = (root) => {
  const path = relative(GROUP_ROOT, root).split(sep).join('/');
  if (path.startsWith('..')) throw new TypeError(`L-Space root ${root} is outside the 561 Group`);
  return path;
};

const lSpaceProjection = (environment) => ({
  ...LSPACE_PROJECTION,
  glossary: { sectionPath: lSpaceSectionPath(lSpaceRoot(environment)) },
  ...(setting('LSPACE_TITLE', environment) === undefined ? {} : { title: setting('LSPACE_TITLE', environment) }),
  ...(setting('LSPACE_SUBTITLE', environment) === undefined ? {} : { subtitle: setting('LSPACE_SUBTITLE', environment), description: setting('LSPACE_SUBTITLE', environment) }),
});

function sourceRevision(root, environment) {
  const explicit = setting('GITHUB_SHA', environment) ?? setting('LENTICULE_SCIENCE_SOURCE_REVISION', environment);
  if (explicit !== undefined) return explicit;
  try { return execFileSync('git', ['-C', root, 'rev-parse', 'HEAD'], { encoding: 'utf8', stdio: ['ignore', 'pipe', 'ignore'] }).trim(); }
  catch { return null; }
}

/** The garden as one application of the web server: admission first, then VaultMaze, media, GEODE and MCP. */
export async function lSpaceApplication(environment = process.env) {
  const stateDir = stateDirectory(environment);
  const root = lSpaceRoot(environment);
  if (stateDir === undefined) throw new TypeError('L-Space needs LSPACE_STATE_DIR');
  const admission = createWebAdmissionApplication({
    providers: admissionProviders(environment),
    authorEmail: setting('LSPACE_AUTHOR_EMAIL', environment) ?? AUTHOR_EMAIL,
    // GEODE's writes are the author's; its reads are any admitted reader's; /ns/ is public by doctrine.
    // The notebook buckets read the author's own Google account, so they are the author's alone.
    authorRoute: (path, method) => isBucketsRoute(path) || (method === 'POST' && (path === '/api/action' || path === '/api/refresh')),
    realm: publicBaseUrl(environment) === undefined ? 'l-space.561.group' : new URL(publicBaseUrl(environment)).host,
    authors: setting('LSPACE_AUTHOR_SUBJECTS', environment)?.split(',').map((subject) => subject.trim()) ?? [...AUTHOR_SUBJECTS],
    publicRoute: lSpacePublicRoute,
  });
  const site = { baseIri: `${publicBaseUrl(environment) ?? 'https://l-space.561.group'}/`, language: 'en' };
  const vaultMaze = await createVaultMazeRuntime({ root, catalog: lSpaceCatalog(environment), site, projection: lSpaceProjection(environment), sourceRevision: sourceRevision(root, environment), cacheDir: join(stateDir, 'vaultmaze') });
  const media = mediaContent(environment);
  const composed = [
    { resources: healthResources({ now: () => new Date() }) },
    admission,
    createVaultMazeApplication({ reviews: createReviewStore({ root: stateDir }), subjectOf: (ctx) => admission.subjectOf(ctx) }),
    vaultMaze.application,
    // Media is the store's, or a file beside a note a rendered room named by its content.
    { resources: [niResource([...(media === undefined ? [] : [media]), createPathContent((ni) => vaultMaze.media.get(ni))]), ...(setting('LSPACE_NOTEBOOK_BUCKETS', environment) === 'false' ? [] : [notebookBuckets()])] },
  ];
  const authoringRoot = setting('GEODE_AUTHORING_ROOT', environment);
  let archive;
  if (authoringRoot !== undefined) {
    // GEODE is loaded only where an authoring checkout is configured.
    const [{ geodeApplication }, { createGeodeAuthoring }] = await Promise.all([
      import('@red-cup-engineering/graphical-knowledge-system-server/server'),
      import('@red-cup-engineering/graphical-knowledge-system-server/authoring'),
    ]);
    const workspace = await createGeodeAuthoring({
      root: authoringRoot,
      region: setting('GEODE_AUTHORING_REGION', environment) ?? '',
      excludes: lSpaceExcludes(environment),
    });
    composed.push(geodeApplication({ workspace }));
    archive = workspace.archive;
  }
  const openedArchive = () => (archive ??= openArchive({ root, excludes: lSpaceExcludes(environment) }));
  composed.push(...mcpApplications({ admission, environment, archive: openedArchive }));
  return mergeApps(...composed);
}

/**
 * The platforms whose territory tiles with the garden's, by the credential each presents:
 * `LSPACE_GATEWAY_TOKENS` lists `name=token` pairs (bare-cedar-fog.561.group=...). A gateway carries the
 * garden to everyone its own admission admits, so its calls read the garden as an admitted
 * reader; writing stays with the garden's authors.
 */
export function gatewayPrincipal(token, environment = process.env) {
  const presented = Buffer.from(String(token));
  for (const entry of (setting('LSPACE_GATEWAY_TOKENS', environment) ?? '').split(',')) {
    const at = entry.indexOf('=');
    if (at <= 0) continue;
    const name = entry.slice(0, at).trim(), secret = Buffer.from(entry.slice(at + 1).trim());
    if (secret.length > 0 && secret.length === presented.length && timingSafeEqual(secret, presented)) {
      return { subject: `gateway:${name}`, name, author: false, gateway: true };
    }
  }
  return undefined;
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
    verifyToken: async (token) => gatewayPrincipal(token, environment) ?? authorization.verifyToken(token, { resource }),
    bind: ({ principal }) => ({ archive, canWrite: principal?.principal?.author === true }),
  });
  return [authorization.app, { resources: [mcp] }];
}
