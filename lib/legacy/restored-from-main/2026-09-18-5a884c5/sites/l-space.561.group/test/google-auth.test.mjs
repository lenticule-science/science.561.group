/**
 * The admission boundary.
 *
 * Google will authenticate any account on earth, so these tests are less about
 * "can someone log in" than about who is refused: an unconfigured deployment,
 * an empty allowlist, an address nobody added, a forged cookie, a stale
 * session, a replayed or mismatched state, and a redirect aimed off-site.
 */
import assert from "node:assert/strict";
import test from "node:test";
import {
  authSettings,
  beginLogin,
  completeLogin,
  identify,
  logout,
  safeReturnTo,
  subjectHashOf,
} from "../lib/cloudflare/src/google-auth.mjs";
import {
  createSessionCookie,
  createTransactionCookie,
  readSession,
  SESSION_COOKIE_NAME,
} from "../lib/cloudflare/src/session.mjs";

const SECRET = "test-session-secret-value";
const READER = "reader@example.test";
const url = (path) => new URL(`https://l-space.561.group${path}`);
const request = (cookie) => new Request("https://l-space.561.group/", cookie ? { headers: { cookie } } : undefined);
const cookieValue = (setCookie) => setCookie.split(";")[0];

function env(overrides = {}) {
  return {
    GOOGLE_CLIENT_ID: "client-id.apps.googleusercontent.com",
    GOOGLE_CLIENT_SECRET: "client-secret",
    SESSION_SECRET: SECRET,
    LSPACE_ALLOWED_EMAILS: READER,
    ...overrides,
  };
}

function googleCalls(claims = {}) {
  return {
    async exchange(code, config) {
      assert.equal(config.codeVerifier?.length > 20, true, "PKCE verifier must be sent to Google");
      assert.equal(typeof config.expectedNonce, "string", "a nonce must be required of Google");
      assert.equal(config.redirectPath, "/oauth/callback");
      return {
        email: claims.email ?? READER,
        emailVerified: claims.emailVerified ?? true,
        subject: claims.subject ?? "google-subject-1",
      };
    },
  };
}

test("a deployment missing its secrets admits nobody and says which are missing", async () => {
  for (const missing of ["GOOGLE_CLIENT_ID", "GOOGLE_CLIENT_SECRET", "SESSION_SECRET"]) {
    const broken = env({ [missing]: "" });
    assert.equal(authSettings(broken).configured, false);
    const begun = await beginLogin(request(), broken, url("/oauth/login"));
    assert.equal(begun.status, 503, `${missing} missing must refuse to start a login`);
    assert.ok(begun.missing.includes(missing));
    assert.equal(await identify(request(), broken), null);
  }
});

test("an empty allowlist admits nobody, and never everybody", async () => {
  for (const allowed of ["", "   ", undefined]) {
    const noList = env({ LSPACE_ALLOWED_EMAILS: allowed });
    assert.equal(authSettings(noList).admits, false);
    const completed = await completeLogin(request(), noList, url("/oauth/callback?code=c&state=s"), Date.now, googleCalls());
    assert.equal(completed.status, 503);
    assert.equal(completed.error, "no-allowlist-configured");
    // A previously valid session must also stop working.
    const cookie = await createSessionCookie({
      subject: "s", subjectHash: "h", email: READER, secret: SECRET, now: Date.now,
    });
    assert.equal(await identify(request(cookieValue(cookie)), noList), null);
  }
});

test("the consent redirect carries state, nonce, and an S256 PKCE challenge", async () => {
  const begun = await beginLogin(request(), env(), url("/oauth/login"));
  assert.equal(begun.status, 302);
  const target = new URL(begun.redirect);
  assert.equal(target.origin, "https://accounts.google.com");
  assert.equal(target.searchParams.get("code_challenge_method"), "S256");
  assert.ok(target.searchParams.get("code_challenge")?.length > 20, "a PKCE challenge must be sent");
  assert.ok(target.searchParams.get("nonce")?.length > 20, "a nonce must be sent");
  assert.ok(target.searchParams.get("state")?.length > 20, "a state must be sent");
  assert.equal(target.searchParams.get("redirect_uri"), "https://l-space.561.group/oauth/callback");
  assert.match(target.searchParams.get("scope"), /openid/u);
  assert.equal(begun.cookies.length, 1);
  assert.match(begun.cookies[0], /HttpOnly/u);
  assert.match(begun.cookies[0], /Secure/u);
  assert.match(begun.cookies[0], /SameSite=Lax/u);
});

test("a callback without the matching transaction cookie is refused", async () => {
  const noCookie = await completeLogin(request(), env(), url("/oauth/callback?code=c&state=s"), Date.now, googleCalls());
  assert.equal(noCookie.status, 400);
  assert.equal(noCookie.error, "login-expired");

  const transaction = await createTransactionCookie({
    state: "the-real-state", nonce: "n", codeVerifier: "v".repeat(43), returnTo: "/", secret: SECRET, now: Date.now,
  });
  const wrongState = await completeLogin(
    request(cookieValue(transaction)), env(), url("/oauth/callback?code=c&state=an-attackers-state"), Date.now, googleCalls(),
  );
  assert.equal(wrongState.status, 400);
  assert.equal(wrongState.error, "state-mismatch");
});

test("a verified Google identity outside the allowlist is refused", async () => {
  const transaction = await createTransactionCookie({
    state: "s", nonce: "n", codeVerifier: "v".repeat(43), returnTo: "/", secret: SECRET, now: Date.now,
  });
  const completed = await completeLogin(
    request(cookieValue(transaction)),
    env(),
    url("/oauth/callback?code=c&state=s"),
    Date.now,
    googleCalls({ email: "stranger@example.test" }),
  );
  assert.equal(completed.status, 403);
  assert.equal(completed.error, "not-authorized");
});

test("an unverified Google email is refused even when the address is allowlisted", async () => {
  const transaction = await createTransactionCookie({
    state: "s", nonce: "n", codeVerifier: "v".repeat(43), returnTo: "/", secret: SECRET, now: Date.now,
  });
  const completed = await completeLogin(
    request(cookieValue(transaction)), env(), url("/oauth/callback?code=c&state=s"), Date.now,
    googleCalls({ emailVerified: false }),
  );
  assert.equal(completed.status, 403);
  assert.equal(completed.reason, "email not verified");
});

test("an allowlisted reader completes login and receives a usable session", async () => {
  const transaction = await createTransactionCookie({
    state: "s", nonce: "n", codeVerifier: "v".repeat(43), returnTo: "/#/halls", secret: SECRET, now: Date.now,
  });
  const completed = await completeLogin(
    request(cookieValue(transaction)), env(), url("/oauth/callback?code=c&state=s"), Date.now, googleCalls(),
  );
  assert.equal(completed.status, 302);
  assert.equal(completed.redirect, "/#/halls");
  const session = completed.cookies.find((cookie) => cookie.startsWith(SESSION_COOKIE_NAME));
  assert.ok(session, "a session cookie must be issued");
  assert.match(session, /HttpOnly; Secure; SameSite=Lax; Path=\/;/u);

  const identified = await identify(request(cookieValue(session)), env());
  assert.equal(identified.email, READER);
  assert.equal(identified.subjectHash, await subjectHashOf("google-subject-1"));
});

test("a session is refused once its address leaves the allowlist", async () => {
  const cookie = cookieValue(await createSessionCookie({
    subject: "google-subject-1", subjectHash: "h", email: READER, secret: SECRET, now: Date.now,
  }));
  assert.ok(await identify(request(cookie), env()), "the reader is admitted while allowlisted");
  const removed = env({ LSPACE_ALLOWED_EMAILS: "someone.else@example.test" });
  assert.equal(await identify(request(cookie), removed), null, "removal must take effect immediately");
});

test("a forged, tampered, or expired session is simply not a session", async () => {
  const cookie = cookieValue(await createSessionCookie({
    subject: "s", subjectHash: "h", email: READER, secret: SECRET, now: Date.now,
  }));
  const [name, value] = [cookie.slice(0, cookie.indexOf("=")), cookie.slice(cookie.indexOf("=") + 1)];
  const [payload, signature] = value.split(".");

  assert.equal(await identify(request(`${name}=${payload}.${"A".repeat(signature.length)}`), env()), null);
  assert.equal(await identify(request(`${name}=notevenclose`), env()), null);
  assert.equal(await identify(request(`${name}=`), env()), null);
  assert.equal(await identify(request(""), env()), null);
  // Signed with a different secret.
  const otherSecret = cookieValue(await createSessionCookie({
    subject: "s", subjectHash: "h", email: READER, secret: "a-different-secret", now: Date.now,
  }));
  assert.equal(await identify(request(otherSecret), env()), null);
  // Expired.
  const long = 20 * 24 * 3600 * 1000;
  assert.equal(await readSession(request(cookie), SECRET, () => Date.now() + long), null);
});

test("login never redirects off site", () => {
  for (const hostile of [
    "//evil.example", "https://evil.example", "http://evil.example",
    "/\\evil.example", "\\\\evil.example", "javascript:alert(1)", "", null, undefined, 42,
  ]) {
    assert.equal(safeReturnTo(hostile), "/", `${String(hostile)} must not be a redirect target`);
  }
  assert.equal(safeReturnTo("/#/room/abc"), "/#/room/abc");
  assert.equal(safeReturnTo("/halls"), "/halls");
});

test("logout clears both cookies", () => {
  const result = logout();
  assert.equal(result.status, 302);
  assert.equal(result.cookies.length, 2);
  for (const cookie of result.cookies) assert.match(cookie, /Max-Age=0/u);
});

test("the subject pseudonym is a stable hash, and not the Google subject itself", async () => {
  const hash = await subjectHashOf("google-subject-1");
  assert.match(hash, /^[a-f0-9]{64}$/u);
  assert.equal(hash, await subjectHashOf("google-subject-1"));
  assert.notEqual(hash, await subjectHashOf("google-subject-2"));
  assert.ok(!hash.includes("google-subject-1"));
});

test("the redirect URI is pinned by configuration, not taken from the request", async () => {
  const { publicBaseUrl } = await import("../lib/cloudflare/src/google-auth.mjs");
  // A plain-HTTP hop must not be able to change the URI Google is given.
  assert.equal(
    publicBaseUrl({ PUBLIC_BASE_URL: "https://l-space.561.group" }, new URL("http://l-space.561.group/oauth/login")),
    "https://l-space.561.group",
  );
  assert.equal(publicBaseUrl({ PUBLIC_BASE_URL: "https://l-space.561.group/" }, new URL("http://x/")), "https://l-space.561.group");
  // Unset falls back to the request origin, so local development still works.
  assert.equal(publicBaseUrl({}, new URL("http://127.0.0.1:8788/oauth/login")), "http://127.0.0.1:8788");
  assert.equal(publicBaseUrl({ PUBLIC_BASE_URL: "  " }, new URL("http://127.0.0.1:8788/")), "http://127.0.0.1:8788");

  const begun = await beginLogin(request(), env({ PUBLIC_BASE_URL: "https://l-space.561.group" }), url("/oauth/login"));
  const target = new URL(begun.redirect);
  assert.equal(target.searchParams.get("redirect_uri"), "https://l-space.561.group/oauth/callback");
});
