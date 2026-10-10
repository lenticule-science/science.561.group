// L-Space is a VICTOR site. This file, pointed at the Lenticule Science
// section, is the whole application: the vault catalog dialect admits every
// note of the science forest, VaultMaze projects the reading experience and
// keeps review state, GEODE is the workbench the author is admitted to, and
// the admission service decides who may read what. Nothing here is code that
// belongs to L-Space; it is what L-Space says about itself.

import { fileURLToPath } from 'node:url';
import { applyMigrations } from '@red-cup-engineering/cloudflare-d1-service/migrations';
import { createSqliteD1 } from '@red-cup-engineering/cloudflare-d1-service/sqlite';
import { ADMISSION_MIGRATIONS, createWebAdmissionApplication } from '@red-cup-engineering/serve-web-admission-service';
import { createVaultMazeApplication } from '@red-cup-engineering/knowledge-vault-reader/application';
import { createVaultMazeProjector } from '@red-cup-engineering/knowledge-vault-reader/projector';
import { REVIEW_STORE_SCHEMA, createReviewStore } from '@red-cup-engineering/knowledge-vault-reader/review-store';

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
  });
  const composed = [
    admission,
    createVaultMazeApplication({ reviews: createReviewStore(database), subjectOf: (ctx) => admission.subjectOf(ctx) }),
  ];
  const authoringRoot = setting('GEODE_AUTHORING_ROOT', environment);
  if (authoringRoot !== undefined) {
    // GEODE is loaded only where an authoring checkout is configured: a reading
    // deployment carries no workbench in memory.
    const [{ createGeodeVictorApplicationFactory }, { createGeodeAuthoring }] = await Promise.all([
      import('@red-cup-engineering/knowledge-vault-web-server'),
      import('@red-cup-engineering/knowledge-vault-web-server/vault-authoring'),
    ]);
    const workspace = await createGeodeAuthoring({
      root: authoringRoot,
      region: setting('GEODE_AUTHORING_REGION', environment) ?? '',
      excludes: [...EXCLUDED_SEGMENTS],
    });
    composed.push(createGeodeVictorApplicationFactory({ workspace })(context));
  }
  return composed;
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
