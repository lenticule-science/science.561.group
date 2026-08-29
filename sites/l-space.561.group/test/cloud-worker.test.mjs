import assert from "node:assert/strict";
import test from "node:test";
import worker from "../lib/cloudflare/src/worker.mjs";
import { createSessionCookie } from "../lib/cloudflare/src/session.mjs";

const SECRET = "test-session-secret-value";
const READER = "reader@example.test";

function environment() {
  const calls = [];
  return {
    calls,
    GOOGLE_CLIENT_ID: "client-id.apps.googleusercontent.com",
    GOOGLE_CLIENT_SECRET: "client-secret",
    SESSION_SECRET: SECRET,
    LSPACE_ALLOWED_EMAILS: READER,
    ASSETS: { async fetch(request) { return new Response(new URL(request.url).pathname); } },
    LEARNER_STATE: {
      prepare(sql) {
        const call = { sql, values: [] };
        calls.push(call);
        return {
          bind(...values) { call.values = values; return this; },
          async all() { return { results: [] }; },
          async run() { return { success: true }; },
        };
      },
    },
  };
}

/** A request carrying a valid session for an allowlisted reader. */
async function signedIn(path, init = {}) {
  const cookie = await createSessionCookie({
    subject: "google-subject-1",
    subjectHash: "f".repeat(64),
    email: READER,
    secret: SECRET,
    now: Date.now,
  });
  return new Request(`https://l-space.561.group${path}`, {
    ...init,
    headers: { ...(init.headers ?? {}), cookie: cookie.split(";")[0] },
  });
}

test("the vault requires a session, and says where to get one", async () => {
  const response = await worker.fetch(new Request("https://l-space.561.group/api/v1/me"), environment());
  assert.equal(response.status, 401);
  assert.deepEqual(await response.json(), { error: "access-required", login: "/oauth/login", discordLogin: "/oauth/discord/login" });
});

test("a signed-in reader sees their own address and nothing else", async () => {
  const response = await worker.fetch(await signedIn("/api/v1/me"), environment());
  assert.deepEqual(await response.json(), { provider: "google", label: READER, email: READER });
});

test("a reader whose address is not allowlisted has no session at all", async () => {
  const env = { ...environment(), LSPACE_ALLOWED_EMAILS: "someone.else@example.test" };
  const response = await worker.fetch(await signedIn("/api/v1/me"), env);
  assert.equal(response.status, 401);
});

test("a deployment with no allowlist admits nobody", async () => {
  const env = { ...environment(), LSPACE_ALLOWED_EMAILS: "" };
  const response = await worker.fetch(await signedIn("/api/v1/vault/index"), env);
  assert.equal(response.status, 401);
});

test("vault room routes accept only content-address-shaped keys", async () => {
  const env = environment();
  const key = "a".repeat(64);
  const response = await worker.fetch(await signedIn(`/api/v1/vault/rooms/${key}`), env);
  assert.equal(await response.text(), `/vault/rooms/${key}.json`);
  const rejected = await worker.fetch(await signedIn("/api/v1/vault/rooms/../../secret"), env);
  assert.equal(rejected.status, 404);
});

test("the normalized TUFTE garden projection is served through the authenticated API", async () => {
  const response = await worker.fetch(await signedIn("/api/v1/vault/garden"), environment());
  assert.equal(response.status, 200);
  assert.equal(await response.text(), "/vault/views/garden.json");
});

test("VaultMaze reviews are validated and stored under a pseudonymous subject", async () => {
  const env = environment();
  const response = await worker.fetch(await signedIn("/api/v1/reviews", {
    method: "PUT",
    body: JSON.stringify({ cardId: "card-1", reviewedAt: 42, rating: 3, stability: 2.5, difficulty: 4 }),
    headers: { "content-type": "application/json" },
  }), env);
  assert.equal(response.status, 201);
  assert.match(env.calls[0].values[0], /^[a-f0-9]{64}$/u);
  assert.equal(env.calls[0].values[1], "card-1");
  assert.equal(env.calls[0].values.includes(READER), false, "the reader's address must not reach the review row");
});

const ANONYMOUS = {};
const ROOM_KEY = "a".repeat(64);

async function anonymous(path, init) {
  return worker.fetch(new Request(`https://l-space.561.group${path}`, init), environment());
}

test("the anonymous front door opens without a session", async () => {
  const shell = await anonymous("/");
  assert.equal(shell.status, 200);
  assert.equal(await shell.text(), "/", "the root path is passed through, not rewritten");
  assert.equal((await anonymous("/healthz")).status, 200);
  assert.equal(await (await anonymous("/styles.css")).text(), "/styles.css");
  assert.equal(await (await anonymous("/js/srs.mjs")).text(), "/js/srs.mjs");
});

test("anonymous corpus routes address only the opted-in public tree", async () => {
  assert.equal(await (await anonymous("/api/v1/surface")).text(), "/vault/public/surface.json");
  assert.equal(await (await anonymous("/api/v1/public/index")).text(), "/vault/public/index.json");
  assert.equal(
    await (await anonymous(`/api/v1/public/rooms/${ROOM_KEY}`)).text(),
    `/vault/public/rooms/${ROOM_KEY}.json`,
  );
  assert.equal(await (await anonymous("/feed.xml")).text(), "/vault/public/feed.xml");
});

test("the authenticated vault is unreachable without a session, by any spelling", async () => {
  const refused = [
    "/vault/index.json",
    "/vault/manifest.json",
    `/vault/rooms/${ROOM_KEY}.json`,
    "/vault/views/garden.json",
    "/api/v1/vault/index",
    `/api/v1/vault/rooms/${ROOM_KEY}`,
    "/api/v1/me",
    "/api/v1/reviews",
    "/js/%2e%2e/vault/index.json",
    "/js/../../vault/index.json",
    "/JS/srs.mjs",
    "/vault/public/../index.json",
  ];
  for (const path of refused) {
    const response = await anonymous(path);
    assert.equal(response.status, 401, `${path} must refuse an anonymous reader`);
    assert.deepEqual(await response.json(), { error: "access-required", login: "/oauth/login", discordLogin: "/oauth/discord/login" });
  }
});

test("anonymous writes are refused even on public routes", async () => {
  for (const method of ["PUT", "POST", "DELETE"]) {
    const response = await anonymous("/api/v1/public/index", { method });
    assert.equal(response.status, 401, `${method} must not reach the public tree`);
  }
});

test("halls are served to an authenticated reader as a projection of the compiled world", async () => {
  const response = await worker.fetch(await signedIn("/api/v1/vault/halls"), environment());
  assert.equal(await response.text(), "/vault/views/halls.json");
});

test("the front door serves the shell instead of redirecting to itself", async () => {
  // The real static asset server canonicalises `/index.html` to `/`. A worker
  // that answers `/` by asking for `/index.html` therefore builds a redirect
  // loop that a permissive mock will never show. This mock canonicalises too.
  const canonicalising = {
    ...environment(),
    ASSETS: {
      async fetch(request) {
        const { pathname } = new URL(request.url);
        if (pathname === "/index.html") {
          return new Response(null, { status: 307, headers: { location: "/" } });
        }
        return new Response(`<!doctype html><title>L-Space</title> ${pathname}`);
      },
    },
  };
  const response = await worker.fetch(new Request("https://l-space.561.group/"), canonicalising);
  assert.equal(response.status, 200, "the front door must not redirect");
  assert.match(await response.text(), /L-Space/u);
});
