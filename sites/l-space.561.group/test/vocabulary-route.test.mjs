import assert from "node:assert/strict";
import test from "node:test";
import worker, { vocabularyResponse } from "../lib/cloudflare/src/worker.mjs";

const origin = "https://l-space.561.group";
const termPath = "science/content/text/glossary/terms/example-term.md";
const termMarkdown = [
  "---",
  "identity: example-term",
  "name: Example Term",
  "consent-status: kin-gated",
  "relations:",
  "  requires: something-else",
  "---",
  "",
  "A live-admitted example term for the l-space route-wiring tests.",
  "",
].join("\n");
const brokenPath = "science/content/text/glossary/terms/broken-term.md";
const brokenMarkdown = ["---", "identity: broken-term", "name: Broken Term", "type: idea", "---", "", "Refused.", ""].join("\n");

function binding() {
  const documents = [
    { path: termPath, properties: {} },
    { path: brokenPath, properties: {} },
  ];
  return {
    snapshot: { documents },
    async read(path) {
      if (path === termPath) return { markdown: termMarkdown };
      if (path === brokenPath) return { markdown: brokenMarkdown };
      throw new RangeError("unknown document");
    },
    async search() { return []; },
    async replace() { throw new Error("not used by /ns/ routes"); },
  };
}

function request(path, init) {
  return new Request(`${origin}${path}`, init);
}

test("vocabularyResponse is unavailable, not unauthenticated, when GEODE has no live binding", async () => {
  const response = await vocabularyResponse(request("/ns/term/example-term", { headers: { accept: "application/ld+json" } }), {}, new URL(`${origin}/ns/term/example-term`));
  assert.equal(response.status, 503);
  assert.deepEqual(await response.json(), { error: "vocabulary unavailable" });
});

test("vocabularyResponse returns null for a path it does not own, so routing falls through", async () => {
  const response = await vocabularyResponse(request("/api/v1/me"), {}, new URL(`${origin}/api/v1/me`));
  assert.equal(response, null);
});

test("/ns/term and /ns/predicate are reachable without a session, and use l-space.561.group as the base IRI", async () => {
  const env = { GEODE_APPLICATION: binding() };
  const term = await worker.fetch(request("/ns/term/example-term", { headers: { accept: "application/ld+json" } }), env);
  assert.equal(term.status, 200);
  const document = await term.json();
  assert.equal(document["@id"], "https://l-space.561.group/ns/term/example-term");
  assert.equal(document["https://l-space.561.group/ns/predicate/requires"], "something-else");
  assert.equal(JSON.stringify(document).includes("ni:"), false);

  const predicate = await worker.fetch(request("/ns/predicate/requires", { headers: { accept: "application/ld+json" } }), env);
  assert.equal(predicate.status, 200);
  assert.equal((await predicate.json())["@id"], "https://l-space.561.group/ns/predicate/requires");
});

test("/ns/term with an HTML Accept 303s to the room path, anonymously", async () => {
  const env = { GEODE_APPLICATION: binding() };
  const response = await worker.fetch(request("/ns/term/example-term", { headers: { accept: "text/html" } }), env);
  assert.equal(response.status, 303);
  assert.match(response.headers.get("location"), /^https:\/\/l-space\.561\.group\/#\/room\/[a-f0-9]{64}$/u);
});

test("/ns/term for a refused carrier is 422 with findings, anonymously, never 401", async () => {
  const env = { GEODE_APPLICATION: binding() };
  const response = await worker.fetch(request("/ns/term/broken-term", { headers: { accept: "application/ld+json" } }), env);
  assert.equal(response.status, 422);
  const body = await response.json();
  assert.equal(body.identity, "broken-term");
  assert.ok(body.findings.some((finding) => finding.rule === "unknown-key"));
});

test("/ns/term for an unknown identity is 404, anonymously, never 401", async () => {
  const env = { GEODE_APPLICATION: binding() };
  const response = await worker.fetch(request("/ns/term/no-such-term", { headers: { accept: "application/ld+json" } }), env);
  assert.equal(response.status, 404);
  assert.deepEqual(await response.json(), { error: "unknown identity", identity: "no-such-term" });
});

test("/ns/ stays anonymous even with no GEODE binding at all (Cloudflare today): 503, not a login redirect", async () => {
  const response = await worker.fetch(request("/ns/term/example-term", { headers: { accept: "application/ld+json" } }), {});
  assert.equal(response.status, 503);
  assert.deepEqual(await response.json(), { error: "vocabulary unavailable" });
});
