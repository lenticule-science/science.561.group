/**
 * The client and the Worker have to agree about routes, and nothing else checks
 * that they do. This reads the real endpoints out of `public/app.js` and asks
 * the real Worker to serve each one, so a renamed route fails here instead of
 * failing in a reader's browser.
 */
import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { resolve } from "node:path";
import worker from "../lib/cloudflare/src/worker.mjs";
import { createSessionCookie } from "../lib/cloudflare/src/session.mjs";

const SECRET = "test-session-secret-value";
const READER = "reader@example.test";

const source = await readFile(resolve(import.meta.dirname, "..", "public", "app.js"), "utf8");

function environment() {
  return {
    GOOGLE_CLIENT_ID: "client-id.apps.googleusercontent.com",
    GOOGLE_CLIENT_SECRET: "client-secret",
    SESSION_SECRET: SECRET,
    LSPACE_ALLOWED_EMAILS: READER,
    ASSETS: { async fetch(request) { return new Response(new URL(request.url).pathname); } },
    LEARNER_STATE: {
      prepare() {
        return { bind() { return this; }, async all() { return { results: [] }; }, async run() { return { success: true }; } };
      },
    },
  };
}
async function signedIn(path, init = {}) {
  const cookie = await createSessionCookie({
    subject: "google-subject-1", subjectHash: "f".repeat(64), email: READER, secret: SECRET, now: Date.now,
  });
  return new Request(`https://l-space.561.group${path}`, {
    ...init,
    headers: { ...(init.headers ?? {}), cookie: cookie.split(";")[0] },
  });
}

/** Every `/api/...` path the client fetches, with template holes filled in. */
function clientEndpoints(text) {
  const found = new Set();
  for (const match of text.matchAll(/fetch\(\s*[`"'](\/[^`"'$]*)(\$\{[^}]*\})?[`"']/gu)) {
    found.add(match[2] ? `${match[1]}${"a".repeat(64)}` : match[1]);
  }
  return [...found].sort();
}

test("every endpoint the client fetches is served by the worker", async () => {
  const endpoints = clientEndpoints(source);
  assert.ok(endpoints.length >= 6, `expected the client to call several endpoints, found ${endpoints.length}`);
  for (const endpoint of endpoints) {
    const response = await worker.fetch(await signedIn(endpoint), environment());
    assert.notEqual(response.status, 404, `the worker has no route for ${endpoint}`);
  }
});

test("the client's anonymous endpoints are reachable without an identity", async () => {
  for (const endpoint of ["/api/v1/surface", "/api/v1/public/index"]) {
    assert.ok(source.includes(endpoint), `app.js should fetch ${endpoint} on the anonymous path`);
    const response = await worker.fetch(new Request(`https://l-space.561.group${endpoint}`), environment());
    assert.equal(response.status, 200, `${endpoint} must open without an identity`);
  }
});

test("the client writes reviews in the shape the worker validates", async () => {
  assert.match(source, /method:\s*"PUT"/u, "the client must PUT its reviews");
  for (const field of ["cardId", "reviewedAt", "rating", "stability", "difficulty"]) {
    assert.ok(source.includes(field), `the review record must carry ${field}`);
  }
  const response = await worker.fetch(
    await signedIn("/api/v1/reviews", {
      method: "PUT",
      headers: { "content-type": "application/json" },
      body: JSON.stringify({ cardId: "c1", reviewedAt: 20692, rating: 3, stability: 2.5, difficulty: 5 }),
    }),
    environment(),
  );
  assert.equal(response.status, 201);
});

test("the client loads its scheduler from the projected engine, not a second copy", () => {
  assert.match(source, /from\s+["']\.\/js\/srs\.mjs["']/u, "srs must come from the projected engine");
  assert.match(source, /from\s+["']\.\/js\/lightcone\.mjs["']/u, "lightcone must come from the projected engine");
  assert.doesNotMatch(source, /function\s+recallProbability/u, "the client must not reimplement recallProbability");
  assert.doesNotMatch(source, /function\s+reviewCard/u, "the client must not reimplement reviewCard");
});
