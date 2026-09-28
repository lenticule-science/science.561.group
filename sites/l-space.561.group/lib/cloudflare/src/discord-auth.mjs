/**
 * Discord user OAuth and live Turntide Island role admission for L-Space.
 *
 * The browser receives only a random opaque session bearer. Discord access and
 * refresh tokens stay in D1 encrypted with SESSION_SECRET, and protected
 * requests re-observe the reader's current membership record. A role snapshot
 * is never durable authorization.
 */
import {
  DiscordUserAuthorizationError,
  discordMemberHasRole,
  discordUserAuthorizationUrl,
  exchangeDiscordAuthorizationCode,
  getCurrentDiscordGuildMember,
  getCurrentDiscordUser,
  refreshDiscordAuthorization,
  revokeDiscordAuthorization,
} from "@red-cup-engineering/discord-rest-transport-service/user-oauth";
import { publicBaseUrl, safeReturnTo } from "./google-auth.mjs";
import {
  base64UrlEncode,
  clearedCookie,
  cookieValue,
  DISCORD_SESSION_COOKIE_NAME,
  DISCORD_TRANSACTION_COOKIE_NAME,
  opaqueCookie,
  sealConfidential,
  unsealConfidential,
} from "./session.mjs";
import { randomToken } from "./random-token.mjs";

export const DISCORD_LOGIN_PATH = "/oauth/discord/login";
export const DISCORD_CALLBACK_PATH = "/oauth/discord/callback";
const TRANSACTION_TTL_SECONDS = 600;
const SESSION_TTL_SECONDS = 14 * 24 * 60 * 60;
const REFRESH_SKEW_SECONDS = 60;
const SNOWFLAKE = /^\d{17,20}$/u;



async function sha256Bytes(value) {
  return new Uint8Array(await crypto.subtle.digest("SHA-256", new TextEncoder().encode(value)));
}

async function sha256Base64Url(value) {
  return base64UrlEncode(await sha256Bytes(value));
}

async function sha256Hex(value) {
  return [...await sha256Bytes(value)].map((byte) => byte.toString(16).padStart(2, "0")).join("");
}

export async function discordSubjectHash(userId) {
  return sha256Hex(`discord:${userId}`);
}

export function discordAuthSettings(env) {
  const missing = [];
  for (const name of [
    "DISCORD_CLIENT_ID",
    "DISCORD_CLIENT_SECRET",
    "DISCORD_GUILD_ID",
    "TURNTIDE_ISLANDER_ROLE_ID",
    "SESSION_SECRET",
  ]) {
    if (typeof env[name] !== "string" || env[name].trim().length === 0) missing.push(name);
  }
  const malformed = [];
  for (const name of ["DISCORD_CLIENT_ID", "DISCORD_GUILD_ID", "TURNTIDE_ISLANDER_ROLE_ID"]) {
    if (!missing.includes(name) && !SNOWFLAKE.test(env[name])) malformed.push(name);
  }
  return {
    configured: missing.length === 0 && malformed.length === 0,
    missing,
    malformed,
    clientId: env.DISCORD_CLIENT_ID,
    clientSecret: env.DISCORD_CLIENT_SECRET,
    guildId: env.DISCORD_GUILD_ID,
    islanderRoleId: env.TURNTIDE_ISLANDER_ROLE_ID,
    sessionSecret: env.SESSION_SECRET,
  };
}

function redirectUri(env, url) {
  return `${publicBaseUrl(env, url)}${DISCORD_CALLBACK_PATH}`;
}

async function transactionCookie(value, secret, now) {
  const issuedAt = Math.floor(now() / 1000);
  return opaqueCookie(
    DISCORD_TRANSACTION_COOKIE_NAME,
    await sealConfidential({ ...value, issuedAt, expiresAt: issuedAt + TRANSACTION_TTL_SECONDS }, secret),
    TRANSACTION_TTL_SECONDS,
  );
}

async function readTransaction(request, secret, now) {
  const raw = cookieValue(request, DISCORD_TRANSACTION_COOKIE_NAME);
  const value = await unsealConfidential(raw, secret);
  if (value === null || typeof value !== "object") return null;
  if (typeof value.expiresAt !== "number" || Math.floor(now() / 1000) > value.expiresAt) return null;
  if (typeof value.state !== "string" || typeof value.codeVerifier !== "string") return null;
  return {
    state: value.state,
    codeVerifier: value.codeVerifier,
    returnTo: safeReturnTo(value.returnTo),
  };
}

function database(env) {
  return env?.LEARNER_STATE && typeof env.LEARNER_STATE.prepare === "function" ? env.LEARNER_STATE : null;
}

async function insertSession(db, row) {
  await db.prepare(`
    INSERT INTO discord_oauth_sessions (
      session_hash, subject_hash, discord_user_id, display_name,
      authorization_ciphertext, token_expires_at, session_expires_at,
      created_at, updated_at
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
  `).bind(
    row.sessionHash, row.subjectHash, row.discordUserId, row.displayName,
    row.authorizationCiphertext, row.tokenExpiresAt, row.sessionExpiresAt,
    row.createdAt, row.updatedAt,
  ).run();
}

async function findSession(db, sessionHash) {
  return db.prepare(`
    SELECT session_hash, subject_hash, discord_user_id, display_name,
           authorization_ciphertext, authorization_version, token_expires_at,
           session_expires_at, retry_after
      FROM discord_oauth_sessions
     WHERE session_hash = ?
  `).bind(sessionHash).first();
}

async function updateAuthorization(db, sessionHash, ciphertext, tokenExpiresAt, updatedAt, expectedVersion) {
  const result = await db.prepare(`
    UPDATE discord_oauth_sessions
       SET authorization_ciphertext = ?, token_expires_at = ?, updated_at = ?,
           authorization_version = authorization_version + 1, retry_after = 0
     WHERE session_hash = ? AND authorization_version = ?
  `).bind(ciphertext, tokenExpiresAt, updatedAt, sessionHash, expectedVersion).run();
  return Number(result?.meta?.changes ?? 0) > 0;
}

async function updateRetryAfter(db, sessionHash, retryAfter) {
  await db.prepare("UPDATE discord_oauth_sessions SET retry_after = ? WHERE session_hash = ?")
    .bind(retryAfter, sessionHash).run();
}

async function expiredSessions(db, nowSeconds, limit) {
  const result = await db.prepare(`
    SELECT session_hash, authorization_ciphertext
      FROM discord_oauth_sessions
     WHERE session_expires_at < ?
     ORDER BY session_expires_at
     LIMIT ?
  `).bind(nowSeconds, limit).all();
  return result.results ?? [];
}

async function deleteSession(db, sessionHash) {
  await db.prepare("DELETE FROM discord_oauth_sessions WHERE session_hash = ?").bind(sessionHash).run();
}

async function revokeQuietly(authorization, settings, calls) {
  if (authorization === null || typeof authorization?.refreshToken !== "string") return;
  try {
    await calls.revoke(authorization.refreshToken, {
      clientId: settings.clientId, clientSecret: settings.clientSecret, tokenTypeHint: "refresh_token",
    });
  } catch { /* Refusal and cleanup never become authorization on revocation failure. */ }
}

export const defaultDiscordCalls = Object.freeze({
  exchange: exchangeDiscordAuthorizationCode,
  refresh: refreshDiscordAuthorization,
  revoke: revokeDiscordAuthorization,
  currentUser: getCurrentDiscordUser,
  currentMember: getCurrentDiscordGuildMember,
});

/** Scheduled bounded retention: revoke and remove expired OAuth sessions. */
export async function purgeExpiredDiscordSessions(env, now = Date.now, calls = defaultDiscordCalls, limit = 25) {
  const settings = discordAuthSettings(env);
  const db = database(env);
  if (!settings.configured || db === null) return { purged: 0 };
  const rows = await expiredSessions(db, Math.floor(now() / 1000), Math.max(1, Math.min(500, limit)));
  let purged = 0;
  for (const row of rows) {
    const authorization = await unsealConfidential(row.authorization_ciphertext, settings.sessionSecret);
    await revokeQuietly(authorization, settings, calls);
    await deleteSession(db, row.session_hash);
    purged += 1;
  }
  return { purged };
}

export async function beginDiscordLogin(request, env, url, now = Date.now) {
  const settings = discordAuthSettings(env);
  if (!settings.configured) {
    return { status: 503, error: "discord-login-unconfigured", missing: settings.missing, malformed: settings.malformed };
  }
  const state = randomToken();
  const codeVerifier = randomToken(48);
  const returnTo = safeReturnTo(url.searchParams.get("return_to"));
  return {
    status: 302,
    redirect: discordUserAuthorizationUrl({
      clientId: settings.clientId,
      redirectUri: redirectUri(env, url),
      state,
      codeChallenge: await sha256Base64Url(codeVerifier),
      prompt: "consent",
    }),
    cookies: [await transactionCookie({ state, codeVerifier, returnTo }, settings.sessionSecret, now)],
  };
}

export async function completeDiscordLogin(request, env, url, now = Date.now, calls = defaultDiscordCalls) {
  const settings = discordAuthSettings(env);
  if (!settings.configured) {
    return { status: 503, error: "discord-login-unconfigured", missing: settings.missing, malformed: settings.malformed };
  }
  const db = database(env);
  if (db === null) return { status: 503, error: "discord-session-store-unconfigured" };
  const transaction = await readTransaction(request, settings.sessionSecret, now);
  if (transaction === null) return { status: 400, error: "discord-login-expired" };
  if (url.searchParams.get("state") !== transaction.state) return { status: 400, error: "discord-state-mismatch" };
  const code = url.searchParams.get("code");
  if (typeof code !== "string" || code.length === 0) {
    return { status: 400, error: url.searchParams.get("error") ?? "no-discord-authorization-code" };
  }

  let authorization;
  let user;
  let member;
  try {
    authorization = await calls.exchange(code, {
      clientId: settings.clientId,
      clientSecret: settings.clientSecret,
      redirectUri: redirectUri(env, url),
      codeVerifier: transaction.codeVerifier,
    });
    [user, member] = await Promise.all([
      calls.currentUser(authorization.accessToken),
      calls.currentMember(authorization.accessToken, settings.guildId),
    ]);
  } catch (error) {
    console.warn("Discord callback refused", error instanceof DiscordUserAuthorizationError ? error.code : "server_error");
    await revokeQuietly(authorization, settings, calls);
    if (error instanceof DiscordUserAuthorizationError && [429, 500, 502, 503, 504].includes(error.status)) {
      return { status: 503, error: "discord-authorization-unavailable", retryAfter: Math.max(1, Math.ceil(error.retryAfter ?? 1)) };
    }
    return { status: 502, error: "discord-exchange-failed" };
  }

  if (!discordMemberHasRole(member, settings.islanderRoleId)) {
    try {
      await calls.revoke(authorization.refreshToken, {
        clientId: settings.clientId, clientSecret: settings.clientSecret, tokenTypeHint: "refresh_token",
      });
    } catch { /* Refusal does not depend on revocation succeeding. */ }
    return { status: 403, error: "discord-islander-role-required" };
  }

  const issuedAt = Math.floor(now() / 1000);
  const sessionToken = randomToken(32);
  const sessionHash = await sha256Hex(sessionToken);
  const sessionExpiresAt = issuedAt + SESSION_TTL_SECONDS;
  try {
    await insertSession(db, {
      sessionHash,
      subjectHash: await discordSubjectHash(user.id),
      discordUserId: user.id,
      displayName: user.globalName ?? user.username,
      authorizationCiphertext: await sealConfidential({
        accessToken: authorization.accessToken,
        refreshToken: authorization.refreshToken,
      }, settings.sessionSecret),
      tokenExpiresAt: issuedAt + Math.floor(authorization.expiresIn),
      sessionExpiresAt,
      createdAt: issuedAt,
      updatedAt: issuedAt,
    });
  } catch (error) {
    console.error("Discord session could not be stored", error?.message ?? "unknown error");
    await revokeQuietly(authorization, settings, calls);
    return { status: 503, error: "discord-session-store-unavailable", retryAfter: 1 };
  }
  return {
    status: 302,
    redirect: transaction.returnTo,
    cookies: [
      opaqueCookie(DISCORD_SESSION_COOKIE_NAME, sessionToken, SESSION_TTL_SECONDS),
      clearedCookie(DISCORD_TRANSACTION_COOKIE_NAME),
    ],
  };
}

async function refreshStoredAuthorization(row, settings, db, sessionHash, now, calls, currentAuthorization) {
  const sealed = currentAuthorization ?? await unsealConfidential(row.authorization_ciphertext, settings.sessionSecret);
  if (
    sealed === null || typeof sealed !== "object" ||
    typeof sealed.accessToken !== "string" || typeof sealed.refreshToken !== "string"
  ) return null;
  const expectedVersion = Number.isInteger(row.authorization_version) ? row.authorization_version : 0;
  let refreshed;
  try {
    refreshed = await calls.refresh(sealed.refreshToken, {
      clientId: settings.clientId,
      clientSecret: settings.clientSecret,
    });
  } catch (error) {
    // Discord rotates refresh tokens. A concurrent request may already have
    // won this refresh; use its committed authorization instead of deleting
    // the session merely because this request lost the race.
    const winner = await findSession(db, sessionHash);
    if (winner !== null && winner !== undefined && winner.authorization_version !== expectedVersion) {
      const authorization = await unsealConfidential(winner.authorization_ciphertext, settings.sessionSecret);
      if (authorization !== null) return { ...authorization, tokenExpiresAt: winner.token_expires_at, row: winner };
    }
    throw error;
  }
  const updatedAt = Math.floor(now() / 1000);
  const authorizationCiphertext = await sealConfidential({
    accessToken: refreshed.accessToken,
    refreshToken: refreshed.refreshToken,
  }, settings.sessionSecret);
  const tokenExpiresAt = updatedAt + Math.floor(refreshed.expiresIn);
  const committed = await updateAuthorization(
    db, sessionHash, authorizationCiphertext, tokenExpiresAt, updatedAt, expectedVersion,
  );
  if (!committed) {
    const winner = await findSession(db, sessionHash);
    if (winner !== null && winner !== undefined && winner.authorization_version !== expectedVersion) {
      const authorization = await unsealConfidential(winner.authorization_ciphertext, settings.sessionSecret);
      if (authorization !== null) return { ...authorization, tokenExpiresAt: winner.token_expires_at, row: winner };
    }
    throw new Error("Discord authorization refresh lost without a committed winner");
  }
  return {
    accessToken: refreshed.accessToken,
    refreshToken: refreshed.refreshToken,
    tokenExpiresAt,
    row: { ...row, authorization_ciphertext: authorizationCiphertext, authorization_version: expectedVersion + 1, token_expires_at: tokenExpiresAt, retry_after: 0 },
  };
}

export async function identifyDiscord(request, env, now = Date.now, calls = defaultDiscordCalls) {
  const settings = discordAuthSettings(env);
  const db = database(env);
  if (!settings.configured || db === null) return null;
  const sessionToken = cookieValue(request, DISCORD_SESSION_COOKIE_NAME);
  if (sessionToken === null) return null;
  const sessionHash = await sha256Hex(sessionToken);
  let row = await findSession(db, sessionHash);
  if (row === null || row === undefined) return null;
  const nowSeconds = Math.floor(now() / 1000);
  if (typeof row.session_expires_at !== "number" || row.session_expires_at < nowSeconds) {
    const expiredAuthorization = await unsealConfidential(row.authorization_ciphertext, settings.sessionSecret);
    await revokeQuietly(expiredAuthorization, settings, calls);
    await deleteSession(db, sessionHash);
    return null;
  }
  if (typeof row.retry_after === "number" && row.retry_after > nowSeconds) {
    return { unavailable: true, retryAfter: Math.max(1, row.retry_after - nowSeconds) };
  }
  let sealed = await unsealConfidential(row.authorization_ciphertext, settings.sessionSecret);
  if (
    sealed === null || typeof sealed !== "object" ||
    typeof sealed.accessToken !== "string" || typeof sealed.refreshToken !== "string"
  ) {
    await deleteSession(db, sessionHash);
    return null;
  }

  try {
    if (typeof row.token_expires_at !== "number" || row.token_expires_at <= nowSeconds + REFRESH_SKEW_SECONDS) {
      const refreshed = await refreshStoredAuthorization(row, settings, db, sessionHash, now, calls, sealed);
      if (refreshed === null) throw new Error("stored Discord authorization is unreadable");
      sealed = refreshed;
      row = refreshed.row;
    }
    let member;
    try {
      member = await calls.currentMember(sealed.accessToken, settings.guildId);
    } catch (error) {
      if (!(error instanceof DiscordUserAuthorizationError) || error.status !== 401) throw error;
      const refreshed = await refreshStoredAuthorization(row, settings, db, sessionHash, now, calls, sealed);
      if (refreshed === null) throw error;
      sealed = refreshed;
      row = refreshed.row;
      member = await calls.currentMember(sealed.accessToken, settings.guildId);
    }
    if (!discordMemberHasRole(member, settings.islanderRoleId)) {
      await revokeQuietly(sealed, settings, calls);
      await deleteSession(db, sessionHash);
      return null;
    }
    if (row.retry_after !== 0) await updateRetryAfter(db, sessionHash, 0);
  } catch (error) {
    // Transient Discord failures deny this request without converting a valid
    // session into a stale authorization snapshot. Token failures are removed.
    if (error instanceof DiscordUserAuthorizationError && error.status === 429) {
      const seconds = Math.max(1, Math.ceil(error.retryAfter ?? 1));
      await updateRetryAfter(db, sessionHash, nowSeconds + seconds);
      return { unavailable: true, retryAfter: seconds };
    }
    if (error instanceof DiscordUserAuthorizationError && [500, 502, 503, 504].includes(error.status)) {
      return { unavailable: true, retryAfter: 1 };
    }
    await deleteSession(db, sessionHash);
    return null;
  }

  return {
    provider: "discord",
    subject: `discord:${row.discord_user_id}`,
    subjectHash: row.subject_hash,
    label: row.display_name,
  };
}

export async function logoutDiscord(request, env, calls = defaultDiscordCalls) {
  const settings = discordAuthSettings(env);
  const db = database(env);
  const sessionToken = cookieValue(request, DISCORD_SESSION_COOKIE_NAME);
  if (settings.configured && db !== null && sessionToken !== null) {
    const sessionHash = await sha256Hex(sessionToken);
    const row = await findSession(db, sessionHash);
    if (row !== null && row !== undefined) {
      const sealed = await unsealConfidential(row.authorization_ciphertext, settings.sessionSecret);
      await deleteSession(db, sessionHash);
      await revokeQuietly(sealed, settings, calls);
    }
  }
  return {
    status: 302,
    redirect: "/",
    cookies: [
      clearedCookie(DISCORD_SESSION_COOKIE_NAME),
      clearedCookie(DISCORD_TRANSACTION_COOKIE_NAME),
    ],
  };
}
