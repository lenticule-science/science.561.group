/**
 * L-Space session and OAuth-transaction cookies.
 *
 * Both are HMAC-SHA256 signed, unencrypted bearers of facts the Worker needs
 * back on a later request. They are not secret containers: a session names who
 * the reader is, and a transaction names which login is in flight. Neither
 * holds anything that would harm the reader if read, only things that would
 * harm them if forged, so plain HMAC over a base64url JSON payload is the right
 * size of tool.
 *
 * This follows the shape already proven in the EVE Assist Worker
 * (`eve-online-services-section/src/web/session.mjs`): same signing scheme, same
 * injected clock, same "a forged cookie is simply no session" contract. It is
 * duplicated rather than imported because that module belongs to a game
 * service; the honest fix is to lift this into a shared web-session service,
 * and that is worth doing the moment a third Worker needs it.
 */

export const SESSION_COOKIE_NAME = "l_space_session";
export const TRANSACTION_COOKIE_NAME = "l_space_oauth";
export const DISCORD_SESSION_COOKIE_NAME = "l_space_discord_session";
export const DISCORD_TRANSACTION_COOKIE_NAME = "l_space_discord_oauth";
const DEFAULT_SESSION_TTL_SECONDS = 1209600; // 14 days, matching the house precedent.
const DEFAULT_TRANSACTION_TTL_SECONDS = 600; // A consent round trip, not a session.

function required(value, label) {
  if (value === undefined || value === null || value === "") {
    throw new TypeError(`session: ${label} is required`);
  }
  return value;
}

export function base64UrlEncode(bytes) {
  let binary = "";
  for (const byte of bytes) binary += String.fromCharCode(byte);
  return btoa(binary).replace(/\+/gu, "-").replace(/\//gu, "_").replace(/=+$/u, "");
}

export function base64UrlDecode(value) {
  const normalized = value.replace(/-/gu, "+").replace(/_/gu, "/");
  const pad = normalized.length % 4 === 0 ? "" : "=".repeat(4 - (normalized.length % 4));
  const binary = atob(normalized + pad);
  const bytes = new Uint8Array(binary.length);
  for (let index = 0; index < binary.length; index += 1) bytes[index] = binary.charCodeAt(index);
  return bytes;
}

async function hmacKey(secret) {
  return crypto.subtle.importKey(
    "raw",
    new TextEncoder().encode(secret),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign", "verify"],
  );
}

async function signPayload(payload, secret) {
  const key = await hmacKey(secret);
  const signature = await crypto.subtle.sign("HMAC", key, new TextEncoder().encode(payload));
  return base64UrlEncode(new Uint8Array(signature));
}

async function verifyPayload(payload, signature, secret) {
  let signatureBytes;
  try {
    signatureBytes = base64UrlDecode(signature);
  } catch {
    return false;
  }
  const key = await hmacKey(secret);
  return crypto.subtle.verify("HMAC", key, signatureBytes, new TextEncoder().encode(payload));
}

async function sealed(value, secret) {
  const payload = base64UrlEncode(new TextEncoder().encode(JSON.stringify(value)));
  return `${payload}.${await signPayload(payload, secret)}`;
}

/** Recover a signed value, or null. Never throws on attacker input. */
async function unsealed(raw, secret, now) {
  if (typeof raw !== "string" || raw.length === 0) return null;
  const dot = raw.lastIndexOf(".");
  if (dot === -1) return null;
  const payload = raw.slice(0, dot);
  const signature = raw.slice(dot + 1);
  let valid;
  try {
    valid = await verifyPayload(payload, signature, secret);
  } catch {
    return null;
  }
  if (!valid) return null;
  let parsed;
  try {
    parsed = JSON.parse(new TextDecoder().decode(base64UrlDecode(payload)));
  } catch {
    return null;
  }
  if (typeof parsed?.expiresAt !== "number") return null;
  if (Math.floor(now() / 1000) > parsed.expiresAt) return null;
  return parsed;
}

async function encryptionKey(secret) {
  const material = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(`l-space confidential cookie\0${secret}`));
  return crypto.subtle.importKey("raw", material, { name: "AES-GCM" }, false, ["encrypt", "decrypt"]);
}

/** Encrypt a secret-bearing value. AES-GCM supplies confidentiality and integrity. */
export async function sealConfidential(value, secret) {
  required(secret, "secret");
  const iv = crypto.getRandomValues(new Uint8Array(12));
  const ciphertext = await crypto.subtle.encrypt(
    { name: "AES-GCM", iv },
    await encryptionKey(secret),
    new TextEncoder().encode(JSON.stringify(value)),
  );
  return `v1.${base64UrlEncode(iv)}.${base64UrlEncode(new Uint8Array(ciphertext))}`;
}

/** Recover an encrypted value, or null. Never throws on attacker input. */
export async function unsealConfidential(raw, secret) {
  if (typeof raw !== "string" || !raw.startsWith("v1.")) return null;
  const parts = raw.split(".");
  if (parts.length !== 3) return null;
  try {
    const plaintext = await crypto.subtle.decrypt(
      { name: "AES-GCM", iv: base64UrlDecode(parts[1]) },
      await encryptionKey(secret),
      base64UrlDecode(parts[2]),
    );
    return JSON.parse(new TextDecoder().decode(plaintext));
  } catch {
    return null;
  }
}

export function parseCookies(cookieHeader) {
  const out = {};
  if (typeof cookieHeader !== "string" || cookieHeader.length === 0) return out;
  for (const part of cookieHeader.split(";")) {
    const equals = part.indexOf("=");
    if (equals === -1) continue;
    const name = part.slice(0, equals).trim();
    const value = part.slice(equals + 1).trim();
    if (name) out[name] = value;
  }
  return out;
}

function cookieAttributes(ttlSeconds) {
  return `HttpOnly; Secure; SameSite=Lax; Path=/; Max-Age=${Math.floor(ttlSeconds)}`;
}

export function opaqueCookie(name, value, ttlSeconds) {
  required(name, "cookie name");
  required(value, "cookie value");
  return `${name}=${value}; ${cookieAttributes(ttlSeconds)}`;
}

export function cookieValue(request, name) {
  return parseCookies(request.headers.get("cookie"))[name] ?? null;
}

export async function createSessionCookie(
  { subject, subjectHash, email, secret, now, ttlSeconds = DEFAULT_SESSION_TTL_SECONDS },
) {
  required(subject, "subject");
  required(subjectHash, "subjectHash");
  required(email, "email");
  required(secret, "secret");
  if (typeof now !== "function") throw new TypeError("session: now must be a function");
  const issuedAt = Math.floor(now() / 1000);
  const value = await sealed(
    { subject, subjectHash, email, issuedAt, expiresAt: issuedAt + Math.floor(ttlSeconds) },
    secret,
  );
  return `${SESSION_COOKIE_NAME}=${value}; ${cookieAttributes(ttlSeconds)}`;
}

/** Recover {subject, subjectHash, email} from the request, or null. */
export async function readSession(request, secret, now) {
  required(secret, "secret");
  const cookies = parseCookies(request.headers.get("cookie"));
  const parsed = await unsealed(cookies[SESSION_COOKIE_NAME], secret, now);
  if (!parsed) return null;
  if (typeof parsed.subject !== "string" || typeof parsed.email !== "string") return null;
  if (typeof parsed.subjectHash !== "string") return null;
  return { subject: parsed.subject, subjectHash: parsed.subjectHash, email: parsed.email };
}

/**
 * The in-flight login. State, nonce and PKCE verifier live in a signed cookie
 * rather than server storage: they only ever need to come back to the same
 * browser, and a Worker has no memory between requests to keep them in.
 */
export async function createTransactionCookie(
  { state, nonce, codeVerifier, returnTo, secret, now, ttlSeconds = DEFAULT_TRANSACTION_TTL_SECONDS },
) {
  required(state, "state");
  required(nonce, "nonce");
  required(codeVerifier, "codeVerifier");
  required(secret, "secret");
  const issuedAt = Math.floor(now() / 1000);
  const value = await sealed(
    { state, nonce, codeVerifier, returnTo, issuedAt, expiresAt: issuedAt + Math.floor(ttlSeconds) },
    secret,
  );
  return `${TRANSACTION_COOKIE_NAME}=${value}; ${cookieAttributes(ttlSeconds)}`;
}

export async function readTransaction(request, secret, now) {
  required(secret, "secret");
  const cookies = parseCookies(request.headers.get("cookie"));
  const parsed = await unsealed(cookies[TRANSACTION_COOKIE_NAME], secret, now);
  if (!parsed) return null;
  if (typeof parsed.state !== "string" || typeof parsed.nonce !== "string") return null;
  if (typeof parsed.codeVerifier !== "string") return null;
  return {
    state: parsed.state,
    nonce: parsed.nonce,
    codeVerifier: parsed.codeVerifier,
    returnTo: typeof parsed.returnTo === "string" ? parsed.returnTo : "/",
  };
}

export const clearedCookie = (name) => `${name}=; HttpOnly; Secure; SameSite=Lax; Path=/; Max-Age=0`;
