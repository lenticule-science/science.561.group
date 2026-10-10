import assert from "node:assert/strict";
import test from "node:test";
import {
  beginDiscordLogin,
  completeDiscordLogin,
  discordAuthSettings,
  discordSubjectHash,
  identifyDiscord,
  logoutDiscord,
  purgeExpiredDiscordSessions,
} from "../lib/cloudflare/src/discord-auth.mjs";
import { DiscordUserAuthorizationError } from "@red-cup-engineering/discord-rest-transport-service/user-oauth";
import { DISCORD_SESSION_COOKIE_NAME, sealConfidential } from "../lib/cloudflare/src/session.mjs";

const SECRET = "test-session-secret-value-long-enough";
const GUILD_ID = "1184863861065658419";
const USER_ID = "1184863861065658420";
const ROLE_ID = "1346540684810915973";
const url = (path) => new URL(`https://l-space.561.group${path}`);
const cookieValue = (setCookie) => setCookie.split(";")[0];

class MemorySessionDatabase {
  rows = new Map();

  prepare(sql) {
    const db = this;
    const statement = {
      values: [],
      bind(...values) { this.values = values; return this; },
      async first() {
        if (!/SELECT[\s\S]*discord_oauth_sessions/u.test(sql)) throw new Error(`unexpected first SQL: ${sql}`);
        return db.rows.get(this.values[0]) ?? null;
      },
      async all() {
        if (!/WHERE session_expires_at < \?/u.test(sql)) throw new Error(`unexpected all SQL: ${sql}`);
        const [before, limit] = this.values;
        return { results: [...db.rows.values()].filter((row) => row.session_expires_at < before).slice(0, limit) };
      },
      async run() {
        if (/INSERT INTO discord_oauth_sessions/u.test(sql)) {
          const [session_hash, subject_hash, discord_user_id, display_name, authorization_ciphertext, token_expires_at, session_expires_at] = this.values;
          db.rows.set(session_hash, { session_hash, subject_hash, discord_user_id, display_name, authorization_ciphertext, authorization_version: 0, token_expires_at, session_expires_at, retry_after: 0 });
        } else if (/authorization_version = authorization_version \+ 1/u.test(sql)) {
          const [authorization_ciphertext, token_expires_at, _updated_at, session_hash, expectedVersion] = this.values;
          const row = db.rows.get(session_hash);
          if (row === undefined || row.authorization_version !== expectedVersion) return { success: true, meta: { changes: 0 } };
          Object.assign(row, { authorization_ciphertext, token_expires_at, authorization_version: expectedVersion + 1, retry_after: 0 });
          return { success: true, meta: { changes: 1 } };
        } else if (/SET retry_after = \?/u.test(sql)) {
          const [retry_after, session_hash] = this.values;
          Object.assign(db.rows.get(session_hash), { retry_after });
        } else if (/DELETE FROM discord_oauth_sessions/u.test(sql)) {
          db.rows.delete(this.values[0]);
        } else {
          throw new Error(`unexpected run SQL: ${sql}`);
        }
        return { success: true, meta: { changes: 1 } };
      },
    };
    return statement;
  }
}

function environment(overrides = {}) {
  return {
    DISCORD_CLIENT_ID: "1346540684810915972",
    DISCORD_CLIENT_SECRET: "discord-client-secret",
    DISCORD_GUILD_ID: GUILD_ID,
    TURNTIDE_ISLANDER_ROLE_ID: ROLE_ID,
    SESSION_SECRET: SECRET,
    PUBLIC_BASE_URL: "https://l-space.561.group",
    LEARNER_STATE: new MemorySessionDatabase(),
    ...overrides,
  };
}

function discordCalls(options = {}) {
  const state = { memberCalls: 0, revocations: 0, refreshes: 0 };
  return {
    state,
    async exchange(code, config) {
      assert.equal(code, "authorization-code");
      assert.equal(config.redirectUri, "https://l-space.561.group/oauth/discord/callback");
      assert.ok(config.codeVerifier.length >= 43);
      return { accessToken: "access-one", refreshToken: "refresh-one", expiresIn: options.expiresIn ?? 3600, tokenType: "Bearer", scopes: ["identify", "guilds.members.read"] };
    },
    async refresh(refreshToken) {
      state.refreshes += 1;
      assert.equal(refreshToken, "refresh-one");
      return { accessToken: "access-two", refreshToken: "refresh-two", expiresIn: 3600, tokenType: "Bearer", scopes: ["identify", "guilds.members.read"] };
    },
    async revoke() { state.revocations += 1; },
    async currentUser() { return { id: USER_ID, username: "reader", globalName: "Island Reader" }; },
    async currentMember(accessToken) {
      state.memberCalls += 1;
      if (state.refreshes > 0) assert.equal(accessToken, "access-two");
      return { roles: options.roles ?? [ROLE_ID], pending: options.pending ?? false };
    },
  };
}

async function beginAndComplete(env, calls, now = Date.now) {
  const begun = await beginDiscordLogin(new Request(url("/oauth/discord/login")), env, url("/oauth/discord/login?return_to=%2F%23%2Fhalls"), now);
  const target = new URL(begun.redirect);
  const transaction = cookieValue(begun.cookies[0]);
  const completed = await completeDiscordLogin(
    new Request(url("/oauth/discord/callback"), { headers: { cookie: transaction } }),
    env,
    url(`/oauth/discord/callback?code=authorization-code&state=${encodeURIComponent(target.searchParams.get("state"))}`),
    now,
    calls,
  );
  return { begun, target, completed };
}

test("Discord login refuses missing or non-snowflake deployment authority", async () => {
  for (const name of ["DISCORD_CLIENT_ID", "DISCORD_CLIENT_SECRET", "DISCORD_GUILD_ID", "TURNTIDE_ISLANDER_ROLE_ID", "SESSION_SECRET"]) {
    const settings = discordAuthSettings(environment({ [name]: "" }));
    assert.equal(settings.configured, false);
    assert.ok(settings.missing.includes(name));
  }
  assert.deepEqual(discordAuthSettings(environment({ TURNTIDE_ISLANDER_ROLE_ID: "islander" })).malformed, ["TURNTIDE_ISLANDER_ROLE_ID"]);
});

test("Discord consent asks only for identity and current membership, with state and S256 PKCE", async () => {
  const begun = await beginDiscordLogin(new Request(url("/")), environment(), url("/oauth/discord/login"));
  assert.equal(begun.status, 302);
  const target = new URL(begun.redirect);
  assert.equal(target.origin, "https://discord.com");
  assert.deepEqual(target.searchParams.get("scope").split(" ").sort(), ["guilds.members.read", "identify"]);
  assert.equal(target.searchParams.get("code_challenge_method"), "S256");
  assert.equal(target.searchParams.get("redirect_uri"), "https://l-space.561.group/oauth/discord/callback");
  assert.match(begun.cookies[0], /l_space_discord_oauth=v1\./u, "the PKCE verifier is encrypted, not merely signed");
  assert.match(begun.cookies[0], /HttpOnly; Secure; SameSite=Lax/u);
});

test("only a current islander receives an opaque session backed by encrypted tokens", async () => {
  const env = environment();
  const calls = discordCalls();
  const { completed } = await beginAndComplete(env, calls);
  assert.equal(completed.status, 302);
  assert.equal(completed.redirect, "/#/halls");
  const sessionCookie = completed.cookies.find((cookie) => cookie.startsWith(DISCORD_SESSION_COOKIE_NAME));
  assert.ok(sessionCookie);
  const browserToken = cookieValue(sessionCookie).split("=")[1];
  const [row] = env.LEARNER_STATE.rows.values();
  assert.notEqual(row.session_hash, browserToken, "D1 stores only a hash of the browser bearer");
  assert.equal(row.authorization_ciphertext.includes("access-one"), false);
  assert.equal(row.authorization_ciphertext.includes("refresh-one"), false);
  assert.equal(row.subject_hash, await discordSubjectHash(USER_ID));

  const identity = await identifyDiscord(
    new Request(url("/api/v1/me"), { headers: { cookie: cookieValue(sessionCookie) } }),
    env,
    Date.now,
    calls,
  );
  assert.deepEqual(identity, { provider: "discord", subject: `discord:${USER_ID}`, subjectHash: row.subject_hash, label: "Island Reader" });
  assert.equal(calls.state.memberCalls, 2, "membership is observed at callback and again for the protected request");
});

test("missing, pending, and removed islander roles fail closed", async () => {
  for (const options of [{ roles: [] }, { roles: [ROLE_ID], pending: true }]) {
    const env = environment();
    const calls = discordCalls(options);
    const { completed } = await beginAndComplete(env, calls);
    assert.equal(completed.status, 403);
    assert.equal(env.LEARNER_STATE.rows.size, 0);
    assert.equal(calls.state.revocations, 1);
  }

  const env = environment();
  const calls = discordCalls();
  const { completed } = await beginAndComplete(env, calls);
  const sessionCookie = completed.cookies.find((cookie) => cookie.startsWith(DISCORD_SESSION_COOKIE_NAME));
  calls.currentMember = async () => ({ roles: [], pending: false });
  assert.equal(await identifyDiscord(new Request(url("/"), { headers: { cookie: cookieValue(sessionCookie) } }), env, Date.now, calls), null);
  assert.equal(env.LEARNER_STATE.rows.size, 0, "role removal deletes the local session rather than caching authority");
});

test("expired access is refreshed server-side and logout deletes and revokes it", async () => {
  let current = Date.now();
  const now = () => current;
  const env = environment();
  const calls = discordCalls({ expiresIn: 1 });
  const { completed } = await beginAndComplete(env, calls, now);
  const sessionCookie = completed.cookies.find((cookie) => cookie.startsWith(DISCORD_SESSION_COOKIE_NAME));
  current += 120_000;
  const request = new Request(url("/api/v1/me"), { headers: { cookie: cookieValue(sessionCookie) } });
  assert.ok(await identifyDiscord(request, env, now, calls));
  assert.equal(calls.state.refreshes, 1);
  const logout = await logoutDiscord(request, env, calls);
  assert.equal(env.LEARNER_STATE.rows.size, 0);
  assert.equal(calls.state.revocations, 1);
  assert.ok(logout.cookies.every((cookie) => cookie.includes("Max-Age=0")));
});

test("a concurrent refresh winner is reloaded instead of losing the session", async () => {
  let current = Date.now();
  const now = () => current;
  const env = environment();
  const calls = discordCalls({ expiresIn: 1 });
  const { completed } = await beginAndComplete(env, calls, now);
  const sessionCookie = completed.cookies.find((cookie) => cookie.startsWith(DISCORD_SESSION_COOKIE_NAME));
  current += 120_000;
  const [row] = env.LEARNER_STATE.rows.values();
  calls.refresh = async () => {
    row.authorization_ciphertext = await sealConfidential({ accessToken: "winner-access", refreshToken: "winner-refresh" }, SECRET);
    row.authorization_version += 1;
    row.token_expires_at = Math.floor(current / 1000) + 3600;
    throw new Error("rotated refresh token lost the race");
  };
  calls.currentMember = async (accessToken) => {
    assert.equal(accessToken, "winner-access");
    return { roles: [ROLE_ID], pending: false };
  };
  const identity = await identifyDiscord(
    new Request(url("/api/v1/me"), { headers: { cookie: cookieValue(sessionCookie) } }), env, now, calls,
  );
  assert.equal(identity.provider, "discord");
  assert.equal(env.LEARNER_STATE.rows.size, 1);
});

test("Discord rate limits persist bounded backoff and are retryable without deleting authority", async () => {
  const env = environment();
  const calls = discordCalls();
  const { completed } = await beginAndComplete(env, calls);
  const sessionCookie = completed.cookies.find((cookie) => cookie.startsWith(DISCORD_SESSION_COOKIE_NAME));
  const request = new Request(url("/api/v1/me"), { headers: { cookie: cookieValue(sessionCookie) } });
  calls.currentMember = async () => { throw new DiscordUserAuthorizationError("rate_limited", "slow down", { status: 429, retryAfter: 7 }); };
  assert.deepEqual(await identifyDiscord(request, env, Date.now, calls), { unavailable: true, retryAfter: 7 });
  assert.equal(env.LEARNER_STATE.rows.size, 1);
  assert.equal(calls.state.memberCalls, 1, "the callback was the only successful member observation");
  const backedOff = await identifyDiscord(request, env, Date.now, calls);
  assert.equal(backedOff.unavailable, true);
  assert.ok(backedOff.retryAfter >= 1 && backedOff.retryAfter <= 7);
});

test("the scheduled retention sweep revokes and deletes expired encrypted sessions", async () => {
  const env = environment();
  const calls = discordCalls();
  await beginAndComplete(env, calls);
  const [row] = env.LEARNER_STATE.rows.values();
  row.session_expires_at = 1;
  const result = await purgeExpiredDiscordSessions(env, () => Date.now(), calls);
  assert.deepEqual(result, { purged: 1 });
  assert.equal(calls.state.revocations, 1);
  assert.equal(env.LEARNER_STATE.rows.size, 0);
});

test("a callback without its encrypted transaction or with mismatched state is refused", async () => {
  const env = environment();
  const calls = discordCalls();
  const absent = await completeDiscordLogin(new Request(url("/")), env, url("/oauth/discord/callback?code=authorization-code&state=s"), Date.now, calls);
  assert.equal(absent.error, "discord-login-expired");
  const begun = await beginDiscordLogin(new Request(url("/")), env, url("/oauth/discord/login"));
  const mismatch = await completeDiscordLogin(
    new Request(url("/"), { headers: { cookie: cookieValue(begun.cookies[0]) } }),
    env,
    url("/oauth/discord/callback?code=authorization-code&state=attacker"),
    Date.now,
    calls,
  );
  assert.equal(mismatch.error, "discord-state-mismatch");
});
