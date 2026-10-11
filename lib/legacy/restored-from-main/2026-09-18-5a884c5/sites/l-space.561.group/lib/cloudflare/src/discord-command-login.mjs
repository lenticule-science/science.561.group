/**
 * Discord application-command admission. This deliberately has no OAuth
 * client secret: Discord's Ed25519 signature authenticates the command, then
 * the configured bot re-observes current membership on every protected read.
 */
import { base64UrlEncode, clearedCookie, cookieValue, opaqueCookie, sealConfidential, unsealConfidential, DISCORD_SESSION_COOKIE_NAME } from "./session.mjs";
import { discordSubjectHash } from "./discord-auth.mjs";

export const DISCORD_INTERACTION_PATH = "/api/v1/discord/interactions";
export const DISCORD_COMMAND_CHALLENGE_PATH = "/api/v1/discord/command-challenge";
export const DISCORD_GATEWAY_COMMAND_PATH = "/api/v1/discord/gateway-command";
const COMMAND_NAME = "l-space-login";
const CHALLENGE_TTL_SECONDS = 5 * 60;
const SESSION_TTL_SECONDS = 14 * 24 * 60 * 60;
const RATE_WINDOW_SECONDS = 60;
const RATE_LIMIT = 12;
const DISCORD_COMMAND_VERIFIER_COOKIE_NAME = "l_space_discord_command_verifier";
const SNOWFLAKE = /^\d{17,20}$/u;
const HEX = /^[a-f0-9]{64}$/iu;

const dbFor = (env) => env?.LEARNER_STATE && typeof env.LEARNER_STATE.prepare === "function" ? env.LEARNER_STATE : null;
const nowSeconds = (now) => Math.floor(now() / 1000);
const encoder = new TextEncoder();

function randomToken(bytes = 32) {
  return base64UrlEncode(crypto.getRandomValues(new Uint8Array(bytes)));
}

async function hash(value) {
  const bytes = new Uint8Array(await crypto.subtle.digest("SHA-256", encoder.encode(value)));
  return [...bytes].map((byte) => byte.toString(16).padStart(2, "0")).join("");
}

function publicKeyBytes(value) {
  if (typeof value !== "string" || !HEX.test(value)) return null;
  return Uint8Array.from(value.match(/.{2}/gu), (part) => Number.parseInt(part, 16));
}

function settings(env) {
  const missing = ["DISCORD_PUBLIC_KEY", "DISCORD_BOT_TOKEN", "DISCORD_GUILD_ID", "TURNTIDE_ISLANDER_ROLE_ID", "SESSION_SECRET"]
    .filter((name) => typeof env?.[name] !== "string" || env[name].trim() === "");
  const malformed = [];
  if (!missing.includes("DISCORD_PUBLIC_KEY") && publicKeyBytes(env.DISCORD_PUBLIC_KEY) === null) malformed.push("DISCORD_PUBLIC_KEY");
  for (const name of ["DISCORD_GUILD_ID", "TURNTIDE_ISLANDER_ROLE_ID"]) {
    if (!missing.includes(name) && !SNOWFLAKE.test(env[name])) malformed.push(name);
  }
  return { configured: missing.length === 0 && malformed.length === 0, missing, malformed };
}

function gatewaySettings(env) {
  const missing = ["DISCORD_BOT_TOKEN", "DISCORD_GUILD_ID", "TURNTIDE_ISLANDER_ROLE_ID", "SESSION_SECRET"]
    .filter((name) => typeof env?.[name] !== "string" || env[name].trim() === "");
  const malformed = ["DISCORD_GUILD_ID", "TURNTIDE_ISLANDER_ROLE_ID"]
    .filter((name) => !missing.includes(name) && !SNOWFLAKE.test(env[name]));
  return { configured: missing.length === 0 && malformed.length === 0, missing, malformed };
}

function sourceBucket(request) {
  const forwarded = request.headers.get("cf-connecting-ip") ?? request.headers.get("x-forwarded-for")?.split(",")[0]?.trim();
  // A missing edge address shares one conservative bucket; it never disables
  // the limit or stores a client-provided raw address.
  return typeof forwarded === "string" && forwarded.length <= 128 ? forwarded : "unknown";
}

async function allowChallenge(request, env, now) {
  const db = dbFor(env);
  if (db === null) return false;
  const current = nowSeconds(now);
  const key = await hash(`discord-command-rate\0${env.SESSION_SECRET}\0${sourceBucket(request)}`);
  await db.prepare(`
    INSERT INTO discord_command_login_rate_limits (rate_key, attempts, reset_at) VALUES (?, 1, ?)
    ON CONFLICT(rate_key) DO UPDATE SET
      attempts = CASE WHEN reset_at <= ? THEN 1 ELSE attempts + 1 END,
      reset_at = CASE WHEN reset_at <= ? THEN ? ELSE reset_at END
  `).bind(key, current + RATE_WINDOW_SECONDS, current, current, current + RATE_WINDOW_SECONDS).run();
  const row = await db.prepare("SELECT attempts, reset_at FROM discord_command_login_rate_limits WHERE rate_key = ?").bind(key).first();
  return Number(row?.attempts) <= RATE_LIMIT;
}

export async function createDiscordCommandChallenge(request, env, now = Date.now) {
  const config = settings(env);
  const db = dbFor(env);
  if (!config.configured) return { status: 503, error: "discord-command-login-unconfigured" };
  if (db === null) return { status: 503, error: "discord-command-store-unconfigured" };
  if (!(await allowChallenge(request, env, now))) return { status: 429, error: "discord-command-login-rate-limited", retryAfter: RATE_WINDOW_SECONDS };
  const code = randomToken(18);
  const verifier = randomToken(32);
  const current = nowSeconds(now);
  await db.prepare(`INSERT INTO discord_command_login_challenges (challenge_hash, verifier_hash, expires_at, created_at) VALUES (?, ?, ?, ?)`)
    .bind(await hash(code), await hash(verifier), current + CHALLENGE_TTL_SECONDS, current).run();
  return { status: 201, challenge: code, expiresAt: current + CHALLENGE_TTL_SECONDS, command: `/${COMMAND_NAME} ${code}`, cookies: [opaqueCookie(DISCORD_COMMAND_VERIFIER_COOKIE_NAME, verifier, CHALLENGE_TTL_SECONDS)] };
}

export async function pollDiscordCommandChallenge(request, env, offered, now = Date.now) {
  const config = settings(env);
  const db = dbFor(env);
  if (!config.configured || db === null || typeof offered !== "string" || offered.length < 16 || offered.length > 128) return { status: 404, error: "discord-command-challenge-not-found" };
  const current = nowSeconds(now);
  const challengeHash = await hash(offered);
  const verifier = cookieValue(request, DISCORD_COMMAND_VERIFIER_COOKIE_NAME);
  const row = await db.prepare(`SELECT verifier_hash, expires_at, approved_at, consumed_at, subject_hash, discord_user_ciphertext FROM discord_command_login_challenges WHERE challenge_hash = ?`).bind(challengeHash).first();
  if (row === null || row === undefined || row.expires_at < current || row.consumed_at !== null) return { status: 404, error: "discord-command-challenge-not-found" };
  if (typeof verifier !== "string" || row.verifier_hash !== await hash(verifier)) return { status: 404, error: "discord-command-challenge-not-found" };
  if (row.approved_at === null || typeof row.subject_hash !== "string" || typeof row.discord_user_ciphertext !== "string") return { status: 202, authenticated: false, expiresAt: row.expires_at };
  const consumed = await db.prepare(`UPDATE discord_command_login_challenges SET consumed_at = ? WHERE challenge_hash = ? AND consumed_at IS NULL AND approved_at IS NOT NULL AND expires_at >= ?`)
    .bind(current, challengeHash, current).run();
  if (Number(consumed?.meta?.changes ?? 0) !== 1) return { status: 404, error: "discord-command-challenge-not-found" };
  const session = randomToken();
  await db.prepare(`INSERT INTO discord_interaction_sessions (session_hash, subject_hash, discord_user_ciphertext, session_expires_at, created_at) VALUES (?, ?, ?, ?, ?)`)
    .bind(await hash(session), row.subject_hash, row.discord_user_ciphertext, current + SESSION_TTL_SECONDS, current).run();
  return { status: 200, authenticated: true, cookies: [opaqueCookie(DISCORD_SESSION_COOKIE_NAME, session, SESSION_TTL_SECONDS), clearedCookie(DISCORD_COMMAND_VERIFIER_COOKIE_NAME)] };
}

async function validDiscordSignature(request, env, raw, now) {
  const timestamp = request.headers.get("x-signature-timestamp");
  const signature = request.headers.get("x-signature-ed25519");
  if (typeof timestamp !== "string" || !/^\d{10,13}$/u.test(timestamp) || typeof signature !== "string" || !/^[a-f0-9]{128}$/iu.test(signature)) return false;
  const supplied = Number(timestamp);
  const seconds = timestamp.length === 13 ? Math.floor(supplied / 1000) : supplied;
  if (!Number.isSafeInteger(seconds) || Math.abs(nowSeconds(now) - seconds) > 300) return false;
  try {
    const key = await crypto.subtle.importKey("raw", publicKeyBytes(env.DISCORD_PUBLIC_KEY), { name: "Ed25519" }, false, ["verify"]);
    return crypto.subtle.verify({ name: "Ed25519" }, key, Uint8Array.from(signature.match(/.{2}/gu), (part) => Number.parseInt(part, 16)), encoder.encode(`${timestamp}${raw}`));
  } catch { return false; }
}

function commandCode(payload) {
  if (payload?.type !== 2 || payload?.data?.name !== COMMAND_NAME || !Array.isArray(payload?.data?.options)) return null;
  const option = payload.data.options.find((item) => item?.name === "code" && typeof item.value === "string");
  return option?.value ?? null;
}

function interactionReply(content) {
  return { type: 4, data: { content, flags: 64 } };
}

function hexBytes(value) {
  return typeof value === "string" && /^[a-f0-9]{64}$/iu.test(value)
    ? Uint8Array.from(value.match(/.{2}/gu), (part) => Number.parseInt(part, 16))
    : null;
}

async function validGatewaySignature(request, env, rawBytes, now) {
  const timestamp = request.headers.get("x-l-space-gateway-timestamp");
  const signature = hexBytes(request.headers.get("x-l-space-gateway-signature"));
  if (typeof timestamp !== "string" || !/^\d{10}$/u.test(timestamp) || signature === null || Math.abs(nowSeconds(now) - Number(timestamp)) > 300) return false;
  try {
    const key = await crypto.subtle.importKey("raw", encoder.encode(env.DISCORD_BOT_TOKEN), { name: "HMAC", hash: "SHA-256" }, false, ["verify"]);
    const prefix = encoder.encode(`${timestamp}.`), signed = new Uint8Array(prefix.length + rawBytes.length);
    signed.set(prefix); signed.set(rawBytes, prefix.length);
    return crypto.subtle.verify("HMAC", key, signature, signed);
  } catch { return false; }
}

export async function acceptDiscordGatewayCommand(request, env, now = Date.now) {
  if (!gatewaySettings(env).configured) return new Response("Not found", { status: 404 });
  const rawBytes = new Uint8Array(await request.arrayBuffer());
  if (!(await validGatewaySignature(request, env, rawBytes, now))) return new Response("Unauthorized", { status: 401 });
  let payload;
  try { payload = JSON.parse(new TextDecoder().decode(rawBytes)); } catch { return new Response("Bad Request", { status: 400 }); }
  const keys = payload !== null && typeof payload === "object" && !Array.isArray(payload) ? Object.keys(payload).sort() : [];
  if (keys.join(",") !== "challenge,guildId,pending,roles,userId" || typeof payload.challenge !== "string" || typeof payload.guildId !== "string" || typeof payload.userId !== "string" || typeof payload.pending !== "boolean" || !Array.isArray(payload.roles) || !payload.roles.every((role) => typeof role === "string")) return new Response("Bad Request", { status: 400 });
  if (payload.guildId !== env.DISCORD_GUILD_ID || payload.pending || !SNOWFLAKE.test(payload.userId) || !payload.roles.includes(env.TURNTIDE_ISLANDER_ROLE_ID)) return new Response("Forbidden", { status: 403 });
  const db = dbFor(env);
  if (db === null) return new Response("Unavailable", { status: 503 });
  const current = nowSeconds(now);
  const changed = await db.prepare(`UPDATE discord_command_login_challenges SET approved_at = ?, subject_hash = ?, discord_user_ciphertext = ? WHERE challenge_hash = ? AND approved_at IS NULL AND consumed_at IS NULL AND expires_at >= ?`)
    .bind(current, await discordSubjectHash(payload.userId), await sealConfidential({ id: payload.userId }, env.SESSION_SECRET), await hash(payload.challenge), current).run();
  return new Response(null, { status: Number(changed?.meta?.changes ?? 0) === 1 ? 204 : 404 });
}

export async function acceptDiscordInteraction(request, env, now = Date.now) {
  const config = settings(env);
  if (!config.configured) return new Response("Not found", { status: 404 });
  const raw = await request.text();
  if (!(await validDiscordSignature(request, env, raw, now))) return new Response("Unauthorized", { status: 401 });
  let payload;
  try { payload = JSON.parse(raw); } catch { return new Response("Bad Request", { status: 400 }); }
  if (payload?.type === 1) return Response.json({ type: 1 }); // Discord PING, only after signature verification.
  const code = commandCode(payload);
  if (code === null) return Response.json(interactionReply("Unknown command."));
  const member = payload.member;
  const userId = member?.user?.id;
  if (payload.guild_id !== env.DISCORD_GUILD_ID || member?.pending === true || !SNOWFLAKE.test(userId ?? "") || !Array.isArray(member?.roles) || !member.roles.includes(env.TURNTIDE_ISLANDER_ROLE_ID)) {
    return Response.json(interactionReply("Current Turntide Island membership and the islander role are required."));
  }
  const db = dbFor(env);
  if (db === null) return Response.json(interactionReply("Login is temporarily unavailable."));
  const current = nowSeconds(now);
  const changed = await db.prepare(`UPDATE discord_command_login_challenges SET approved_at = ?, subject_hash = ?, discord_user_ciphertext = ? WHERE challenge_hash = ? AND approved_at IS NULL AND consumed_at IS NULL AND expires_at >= ?`)
    .bind(current, await discordSubjectHash(userId), await sealConfidential({ id: userId }, env.SESSION_SECRET), await hash(code), current).run();
  return Response.json(interactionReply(Number(changed?.meta?.changes ?? 0) === 1 ? "Login confirmed. Return to L-Space in this browser." : "That login code is expired, invalid, or already used."));
}

export const defaultDiscordBotCalls = Object.freeze({
  async member(userId, env) {
    const response = await fetch(`https://discord.com/api/v10/guilds/${encodeURIComponent(env.DISCORD_GUILD_ID)}/members/${encodeURIComponent(userId)}`, { headers: { authorization: `Bot ${env.DISCORD_BOT_TOKEN}` } });
    if (response.status === 200) {
      try { return { status: 200, member: await response.json() }; } catch { return { status: 502 }; }
    }
    let retryAfter = Number(response.headers.get("retry-after"));
    if (response.status === 429) {
      try { retryAfter = Number((await response.json()).retry_after) || retryAfter; } catch { /* Header fallback below. */ }
    }
    return { status: response.status, retryAfter: Number.isFinite(retryAfter) && retryAfter > 0 ? Math.ceil(retryAfter) : 1 };
  },
});

export async function identifyDiscordCommandSession(request, env, now = Date.now, calls = defaultDiscordBotCalls) {
  const config = settings(env);
  const db = dbFor(env);
  const cookie = cookieValue(request, DISCORD_SESSION_COOKIE_NAME);
  if (!config.configured || db === null || typeof cookie !== "string") return null;
  const sessionHash = await hash(cookie);
  const row = await db.prepare("SELECT subject_hash, discord_user_ciphertext, session_expires_at FROM discord_interaction_sessions WHERE session_hash = ?").bind(sessionHash).first();
  if (row === null || row === undefined) return null;
  if (row.session_expires_at < nowSeconds(now)) { await db.prepare("DELETE FROM discord_interaction_sessions WHERE session_hash = ?").bind(sessionHash).run(); return null; }
  const identity = await unsealConfidential(row.discord_user_ciphertext, env.SESSION_SECRET);
  if (typeof identity?.id !== "string" || !SNOWFLAKE.test(identity.id)) { await db.prepare("DELETE FROM discord_interaction_sessions WHERE session_hash = ?").bind(sessionHash).run(); return null; }
  let observed;
  try { observed = await calls.member(identity.id, env); } catch { return { unavailable: true, retryAfter: 1 }; }
  const status = Number(observed?.status);
  if (status === 429 || status === 401 || status === 403 || status >= 500 || !Number.isFinite(status)) return { unavailable: true, retryAfter: Math.max(1, Math.min(60, Number(observed?.retryAfter) || 1)) };
  if (status !== 200 || observed.member?.pending === true || !Array.isArray(observed.member?.roles) || !observed.member.roles.includes(env.TURNTIDE_ISLANDER_ROLE_ID)) {
    await db.prepare("DELETE FROM discord_interaction_sessions WHERE session_hash = ?").bind(sessionHash).run();
    return null;
  }
  return { provider: "discord", subjectHash: row.subject_hash, label: "Turntide islander" };
}
