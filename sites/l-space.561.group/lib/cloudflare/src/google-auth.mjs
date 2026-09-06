/**
 * Google OIDC login for L-Space, as a Cloudflare Worker.
 *
 * Cloudflare Access used to supply identity, which meant its allow policy was
 * quietly doing authorization as well. Google will authenticate anyone on earth
 * with a Google account, so that second job is now this module's, and it is the
 * job that matters: without an allowlist, "sign in with Google" opens the whole
 * corpus to the whole internet. Every path here fails closed — a missing
 * secret, a missing allowlist, an empty allowlist, and an unverified email all
 * refuse, and none of them refuse quietly.
 */
import { OAuthError } from "@red-cup-engineering/oauth-services-section";
import { exchangeGoogleCallback } from "@red-cup-engineering/exchange-google-callback-service";
import {
  judgePrincipalAdmission,
  resolveAdmissionPolicy,
} from "@red-cup-engineering/judge-principal-admission-service";
import { relayToGoogleConsent } from "@red-cup-engineering/relay-to-google-consent-service";
import {
  base64UrlEncode,
  clearedCookie,
  createSessionCookie,
  createTransactionCookie,
  readSession,
  readTransaction,
  SESSION_COOKIE_NAME,
  TRANSACTION_COOKIE_NAME,
} from "./session.mjs";

export const LOGIN_PATH = "/oauth/login";
export const CALLBACK_PATH = "/oauth/callback";
export const LOGOUT_PATH = "/oauth/logout";

function randomToken(bytes = 32) {
  return base64UrlEncode(crypto.getRandomValues(new Uint8Array(bytes)));
}

async function sha256Base64Url(value) {
  const digest = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(value));
  return base64UrlEncode(new Uint8Array(digest));
}

export async function subjectHashOf(subject) {
  const digest = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(subject));
  return [...new Uint8Array(digest)].map((byte) => byte.toString(16).padStart(2, "0")).join("");
}

/**
 * Where to send the reader after login. Only a same-site absolute path is
 * allowed: `//evil.example` and `https://evil.example` are both valid values
 * for a `Location` header, and neither is a place this site may send anyone.
 */
export function safeReturnTo(offered) {
  if (typeof offered !== "string" || offered.length === 0) return "/";
  if (!offered.startsWith("/")) return "/";
  if (offered.startsWith("//")) return "/";
  if (offered.includes("\\")) return "/";
  return offered;
}

/**
 * Read deployment configuration, refusing rather than guessing.
 * A deployment missing its secrets is a deployment that must not admit anyone.
 */
/**
 * The origin Google will be told to redirect back to.
 *
 * This is pinned by configuration rather than read from the request, because a
 * redirect URI has to match what is registered with Google byte for byte, and
 * the request's own origin is not a reliable source of it: behind a proxy, or
 * over a plain-HTTP hop, `url.origin` can be `http://` for a site that is only
 * ever legitimately reached over `https://`. The request origin remains the
 * fallback so local development works without extra configuration.
 */
export function publicBaseUrl(env, url) {
  const configured = typeof env.PUBLIC_BASE_URL === "string" ? env.PUBLIC_BASE_URL.trim() : "";
  return configured === "" ? url.origin : configured.replace(/\/$/u, "");
}

export function authSettings(env) {
  const missing = [];
  for (const name of ["GOOGLE_CLIENT_ID", "GOOGLE_CLIENT_SECRET", "SESSION_SECRET"]) {
    if (typeof env[name] !== "string" || env[name].length === 0) missing.push(name);
  }
  const allowed = typeof env.LSPACE_ALLOWED_EMAILS === "string" ? env.LSPACE_ALLOWED_EMAILS : "";
  return {
    missing,
    configured: missing.length === 0,
    googleClientId: env.GOOGLE_CLIENT_ID,
    googleClientSecret: env.GOOGLE_CLIENT_SECRET,
    sessionSecret: env.SESSION_SECRET,
    allowedEmails: allowed,
    // An unset or empty allowlist admits nobody. It never means "admit anyone".
    admits: allowed.trim().length > 0,
  };
}

const admissionPolicy = (settings) => resolveAdmissionPolicy({ allowedEmails: settings.allowedEmails });

/**
 * The Google calls, injectable so tests exercise the real decision logic
 * without reaching the network. Production always uses the defaults.
 */
export const defaultGoogleCalls = Object.freeze({
  exchange: exchangeGoogleCallback,
});

export async function beginLogin(request, env, url, now = Date.now) {
  const settings = authSettings(env);
  if (!settings.configured) {
    return { status: 503, error: "login-unconfigured", missing: settings.missing };
  }
  const state = randomToken();
  const nonce = randomToken();
  const codeVerifier = randomToken(48);
  const returnTo = safeReturnTo(url.searchParams.get("return_to"));
  const redirect = relayToGoogleConsent({
    state,
    nonce,
    googleClientId: settings.googleClientId,
    publicBaseUrl: publicBaseUrl(env, url),
    redirectPath: CALLBACK_PATH,
    scopes: ["openid", "email", "profile"],
    codeChallenge: await sha256Base64Url(codeVerifier),
    prompt: "select_account",
  });
  return {
    status: 302,
    redirect,
    cookies: [
      await createTransactionCookie({ state, nonce, codeVerifier, returnTo, secret: settings.sessionSecret, now }),
    ],
  };
}

export async function completeLogin(request, env, url, now = Date.now, calls = defaultGoogleCalls) {
  const settings = authSettings(env);
  if (!settings.configured) {
    return { status: 503, error: "login-unconfigured", missing: settings.missing };
  }
  if (!settings.admits) {
    // Refuse before contacting Google: with no allowlist there is no one to admit.
    return { status: 503, error: "no-allowlist-configured" };
  }

  const transaction = await readTransaction(request, settings.sessionSecret, now);
  if (!transaction) return { status: 400, error: "login-expired" };

  const offeredState = url.searchParams.get("state");
  if (typeof offeredState !== "string" || offeredState !== transaction.state) {
    return { status: 400, error: "state-mismatch" };
  }
  const code = url.searchParams.get("code");
  if (typeof code !== "string" || code.length === 0) {
    return { status: 400, error: url.searchParams.get("error") ?? "no-authorization-code" };
  }

  let identity;
  try {
    identity = await calls.exchange(code, {
      googleClientId: settings.googleClientId,
      googleClientSecret: settings.googleClientSecret,
      // Must be byte-identical to the value sent at /oauth/login: Google
      // compares the two, and so does the authorization-code binding.
      publicBaseUrl: publicBaseUrl(env, url),
      redirectPath: CALLBACK_PATH,
      codeVerifier: transaction.codeVerifier,
      expectedNonce: transaction.nonce,
    });
  } catch (error) {
    const code = error instanceof OAuthError ? error.code : "server_error";
    console.warn("Google callback refused", code, error?.description ?? error?.message ?? "");
    return { status: 502, error: "google-exchange-failed" };
  }

  const admission = judgePrincipalAdmission(
    { email: identity.email, emailVerified: identity.emailVerified },
    admissionPolicy(settings),
  );
  if (!admission.admitted) {
    return { status: 403, error: "not-authorized", reason: admission.reason, email: identity.email };
  }
  if (typeof identity.subject !== "string" || identity.subject.length === 0) {
    return { status: 502, error: "google-subject-missing" };
  }

  return {
    status: 302,
    redirect: safeReturnTo(transaction.returnTo),
    cookies: [
      await createSessionCookie({
        subject: identity.subject,
        subjectHash: await subjectHashOf(identity.subject),
        email: identity.email,
        secret: settings.sessionSecret,
        now,
      }),
      clearedCookie(TRANSACTION_COOKIE_NAME),
    ],
  };
}

export function logout() {
  return {
    status: 302,
    redirect: "/",
    cookies: [clearedCookie(SESSION_COOKIE_NAME), clearedCookie(TRANSACTION_COOKIE_NAME)],
  };
}

/**
 * The identity for one request, or null.
 *
 * Admission is re-judged on every request rather than trusted from the cookie,
 * so removing someone from the allowlist locks them out immediately instead of
 * whenever their session happens to expire.
 */
export async function identify(request, env, now = Date.now) {
  const settings = authSettings(env);
  if (!settings.configured || !settings.admits) return null;
  const session = await readSession(request, settings.sessionSecret, now);
  if (!session) return null;
  const admission = judgePrincipalAdmission(
    { email: session.email, emailVerified: true },
    admissionPolicy(settings),
  );
  return admission.admitted ? session : null;
}
