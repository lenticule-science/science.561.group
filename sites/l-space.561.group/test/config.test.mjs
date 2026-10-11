import assert from "node:assert/strict";
import test from "node:test";
import { lSpaceAdmissionPolicy, lSpaceConfig as config, lSpaceSurfacePolicy, roomVisibility } from "../src/config.mjs";

test("L-Space names its Google and Discord login protocols without carrying secrets", () => {
  assert.equal(config.title, "L-Space");
  assert.equal(config.baseUrl, "https://l-space.561.group");
  assert.equal(config.auth.mode, "oauth");
  assert.equal(config.auth.issuer, "https://accounts.google.com", "the upstream vault contract retains its canonical issuer");
  const google = config.auth.providers.find((provider) => provider.id === "google");
  const discord = config.auth.providers.find((provider) => provider.id === "discord");
  assert.equal(google.issuer, "https://accounts.google.com");
  assert.equal(google.callbackPath, "/oauth/callback");
  assert.deepEqual([...google.scopes], ["openid", "email", "profile"]);
  assert.equal(google.clientIdEnvironmentVariable, "GOOGLE_CLIENT_ID");
  assert.equal(google.clientSecretEnvironmentVariable, "GOOGLE_CLIENT_SECRET");
  assert.equal(discord.issuer, "https://discord.com");
  assert.equal(discord.callbackPath, "/oauth/discord/callback");
  assert.deepEqual([...discord.scopes], ["identify", "guilds.members.read"]);
  // A corpus configuration is committed; a client secret is not.
  const serialized = JSON.stringify(config);
  for (const secretish of ["client_secret", "GOCSPX", "apps.googleusercontent.com"]) {
    assert.ok(!serialized.includes(secretish), `config must not carry ${secretish}`);
  }
});

test("admission is a named, fail-closed deployment policy", () => {
  const google = lSpaceAdmissionPolicy.providers.find((provider) => provider.provider === "google");
  const discord = lSpaceAdmissionPolicy.providers.find((provider) => provider.provider === "discord");
  assert.equal(google.allowedEmailsEnvironmentVariable, "LSPACE_ALLOWED_EMAILS");
  assert.equal(google.emptyAllowlistAdmits, "nobody");
  assert.equal(google.reJudgedPerRequest, true);
  assert.equal(discord.guildIdEnvironmentVariable, "DISCORD_GUILD_ID");
  assert.equal(discord.roleIdEnvironmentVariable, "TURNTIDE_ISLANDER_ROLE_ID");
  assert.equal(discord.reObservedPerProtectedRequest, true);
  assert.equal(discord.staleRoleSnapshotAdmits, false);
  // The policy names where the allowlist lives; it never carries the list.
  assert.ok(!JSON.stringify(lSpaceAdmissionPolicy).includes("@"));
});

test("the login routes are part of the anonymous surface", () => {
  for (const route of ["/oauth/login", "/oauth/callback", "/oauth/discord/login", "/oauth/discord/callback", "/oauth/logout"]) {
    assert.ok(lSpaceSurfacePolicy.publicRoutes.includes(route), `${route} must be reachable signed out`);
  }
});

test("canonical compilation excludes custody and non-public working strata", () => {
  const excluded = new Set(config.wings[0].excludeGlobs);
  for (const name of ["legacy", "triage", "private", "dev", "test", "fixtures", "dist"]) {
    assert.equal(excluded.has(name), true, `${name} must be excluded`);
  }
});

test("SPACE ownership and relations are compiler attributes", () => {
  assert.deepEqual(config.wings[0].attributeFields.slice(0, 2), ["science-owner", "type"]);
  assert.equal(config.wings[0].attributeFields.includes("relates-to"), true);
});

test("TUFTE uses a bounded deterministic tiling strategy at L-Space scale", () => {
  assert.deepEqual(config.wings[0].tufte, { strategy: "tiling-grid", columns: 96 });
});

test("VaultMaze is the guided passage layer, with explicit privileged and accessibility bypasses", () => {
  assert.equal(config.participation.displayName, "VaultMaze");
  assert.equal(config.participation.mode, "vaultmaze");
  assert.equal(config.participation.directReadClaims.includes("l-space:direct-read"), true);
  assert.equal(config.participation.accessibilityBypassClaims.includes("l-space:accessibility-bypass"), true);
  assert.equal(config.participation.familiar.enabled, true);
});

test("a room is authenticated unless its own frontmatter opts into the public surface", () => {
  assert.equal(lSpaceSurfacePolicy.defaultRoomVisibility, "authenticated");
  assert.equal(roomVisibility({ frontmatter: { visibility: "public" } }), "public");
  for (const declared of ["Public", "PUBLIC", "public ", true, 1, null, undefined, ["public"]]) {
    assert.equal(
      roomVisibility({ frontmatter: { visibility: declared } }),
      "authenticated",
      `${JSON.stringify(declared)} must not open a room to anonymous readers`,
    );
  }
  assert.equal(roomVisibility({ frontmatter: {} }), "authenticated");
  assert.equal(roomVisibility({}), "authenticated");
  assert.equal(roomVisibility(undefined), "authenticated");
});

test("the public and authenticated release trees are separate asset roots", () => {
  assert.equal(lSpaceSurfacePolicy.publicAssetRoot, "/vault/public");
  assert.equal(lSpaceSurfacePolicy.authenticatedAssetRoot, "/vault");
  assert.ok(lSpaceSurfacePolicy.publicAssetRoot.startsWith(lSpaceSurfacePolicy.authenticatedAssetRoot));
});
