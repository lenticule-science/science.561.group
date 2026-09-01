import { fileURLToPath } from "node:url";

const scienceServicesSectionRoot = fileURLToPath(new URL("../../..", import.meta.url));

/**
 * The public surface is declared, not inferred.
 *
 * L-Space compiles the whole active science forest, so the safe default is that
 * a room is authenticated. A room becomes public only by writing
 * `visibility: public` in its own frontmatter, and the compiled release keeps
 * public rooms in a separate asset tree from authenticated ones. A bug in the
 * request router therefore cannot serve an authenticated room to an anonymous
 * reader: the public routes address a directory that only ever received rooms
 * their own authors marked public.
 */
export const lSpaceSurfacePolicy = Object.freeze({
  schemaVersion: "l-space-surface/v1",
  defaultRoomVisibility: "authenticated",
  publicOptInField: "visibility",
  publicOptInValue: "public",
  publicAssetRoot: "/vault/public",
  authenticatedAssetRoot: "/vault",
  publicRoutes: Object.freeze([
    "/",
    "/healthz",
    "/oauth/login",
    "/oauth/callback",
    "/oauth/discord/login",
    "/oauth/discord/callback",
    "/oauth/logout",
    "/api/v1/discord/command-challenge",
    "/api/v1/discord/interactions",
    "/api/v1/surface",
    "/api/v1/public/index",
    "/api/v1/public/rooms/{sha256-room-id}",
    "/feed.xml",
    "/feed.atom",
    "/feed.json",
  ]),
});

/**
 * Who may sign in.
 *
 * Google authenticates anyone in the world with a Google account, so
 * authentication is not admission. Cloudflare Access used to decide admission
 * with its allow policy; that job now belongs here, and it is the job that
 * matters — without an allowlist, "sign in with Google" would open the whole
 * corpus to the whole internet.
 *
 * The allowlist is a deployment secret, not corpus configuration, so this names
 * the variable rather than its contents. An unset or empty allowlist admits
 * nobody. It never means "admit anyone".
 */
export const lSpaceAdmissionPolicy = Object.freeze({
  schemaVersion: "l-space-admission/v2",
  sessionSecretEnvironmentVariable: "SESSION_SECRET",
  providers: Object.freeze([
    Object.freeze({
      provider: "google",
      allowedEmailsEnvironmentVariable: "LSPACE_ALLOWED_EMAILS",
      emptyAllowlistAdmits: "nobody",
      sessionCookie: "l_space_session",
      sessionTtlSeconds: 1209600,
      reJudgedPerRequest: true,
    }),
    Object.freeze({
      provider: "discord",
      guildIdEnvironmentVariable: "DISCORD_GUILD_ID",
      roleIdEnvironmentVariable: "TURNTIDE_ISLANDER_ROLE_ID",
      sessionCookie: "l_space_discord_session",
      sessionTtlSeconds: 1209600,
      reObservedPerProtectedRequest: true,
      staleRoleSnapshotAdmits: false,
    }),
  ]),
});

export const lSpaceApplicationPolicy = Object.freeze({
  schemaVersion: "l-space-application-selection/v1",
  defaultApplication: "vaultmaze",
  authorityApplication: "geode",
  authority: "the same currently re-judged Google principal admitted for revision-safe authoring",
  userConfigMaySelect: Object.freeze(["vaultmaze"]),
});

export const lSpaceConfig = Object.freeze({
  schemaVersion: "vaultmaze-config/v1",
  id: "l-space",
  title: "L-Space",
  baseUrl: "https://l-space.561.group",
  auth: Object.freeze({
    mode: "oauth",
    // Canonical issuer fields required by the reusable VaultMaze configuration
    // contract. The Worker composes the full provider list below; Google remains
    // the established operator issuer.
    issuer: "https://accounts.google.com",
    clientIdEnvironmentVariable: "GOOGLE_CLIENT_ID",
    clientSecretEnvironmentVariable: "GOOGLE_CLIENT_SECRET",
    callbackPath: "/oauth/callback",
    scopes: Object.freeze(["openid", "email", "profile"]),
    providers: Object.freeze([
      Object.freeze({
        id: "google",
        issuer: "https://accounts.google.com",
        clientIdEnvironmentVariable: "GOOGLE_CLIENT_ID",
        clientSecretEnvironmentVariable: "GOOGLE_CLIENT_SECRET",
        callbackPath: "/oauth/callback",
        scopes: Object.freeze(["openid", "email", "profile"]),
      }),
      Object.freeze({
        id: "discord",
        issuer: "https://discord.com",
        clientIdEnvironmentVariable: "DISCORD_CLIENT_ID",
        clientSecretEnvironmentVariable: "DISCORD_CLIENT_SECRET",
        callbackPath: "/oauth/discord/callback",
        scopes: Object.freeze(["identify", "guilds.members.read"]),
      }),
    ]),
  }),
  participation: Object.freeze({
    mode: "vaultmaze",
    displayName: "VaultMaze",
    engine: "lantern-compatible/v1",
    directReadClaims: Object.freeze(["l-space:direct-read", "l-space:curator"]),
    accessibilityBypassClaims: Object.freeze(["l-space:accessibility-bypass"]),
    targetRetention: 0.9,
    familiar: Object.freeze({
      enabled: true,
      retrievalMode: "delegated-copy",
      costPolicy: "lenticule-science/familiar-cost/v1",
    }),
  }),
  wings: Object.freeze([
    Object.freeze({
      id: "lenticule-science",
      root: scienceServicesSectionRoot,
      dialect: "house",
      visibility: "authenticated",
      tufte: Object.freeze({ strategy: "tiling-grid", columns: 96 }),
      excludeGlobs: Object.freeze(["legacy", "triage", "private", "dev", "test", "fixtures", "dist"]),
      attributeFields: Object.freeze([
        "science-owner", "type", "kind", "tags", "cites", "relates-to",
      ]),
    }),
  ]),
});

/**
 * Resolve one room's visibility. Only a literal `visibility: public` opts a room
 * into the anonymous surface; every other value, including a misspelling or a
 * non-string, falls back to the wing's visibility.
 */
export function roomVisibility(room, wingVisibility = lSpaceSurfacePolicy.defaultRoomVisibility) {
  const declared = room?.frontmatter?.[lSpaceSurfacePolicy.publicOptInField];
  return declared === lSpaceSurfacePolicy.publicOptInValue
    ? "public"
    : wingVisibility;
}
