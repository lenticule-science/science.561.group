import assert from "node:assert/strict";
import test from "node:test";
import { exportJWK, generateKeyPair, SignJWT } from "jose";
import worker from "../ops/cloudflare/src/worker.mjs";

function context(identity = { id: "reader-1", email: "reader@example.test", groups: [] }) {
  return { access: { async getIdentity() { return identity; } } };
}

function environment() {
  const calls = [];
  return {
    calls,
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

test("the cloud worker requires a verified Access identity", async () => {
  const response = await worker.fetch(new Request("https://science.561.group/api/v1/me"), environment(), {});
  assert.equal(response.status, 401);
});

test("the cloud worker exposes verified identity without leaking its database key", async () => {
  const response = await worker.fetch(new Request("https://science.561.group/api/v1/me"), environment(), context());
  assert.deepEqual(await response.json(), { email: "reader@example.test", groups: [] });
});

test("the cloud worker verifies a hostname Access JWT when ctx.access is absent", async () => {
  const { privateKey, publicKey } = await generateKeyPair("RS256", { extractable: true });
  const publicJwk = { ...await exportJWK(publicKey), alg: "RS256", kid: "test-key", use: "sig" };
  const issuer = "https://access.example.test";
  const audience = "vault-audience";
  const token = await new SignJWT({ email: "reader@example.test", groups: ["curators"] })
    .setProtectedHeader({ alg: "RS256", kid: "test-key" })
    .setIssuer(issuer)
    .setAudience(audience)
    .setIssuedAt()
    .setExpirationTime("5m")
    .sign(privateKey);
  const env = Object.assign(environment(), {
    ACCESS_TEAM_DOMAIN: issuer,
    ACCESS_AUD: audience,
    ACCESS_CERTS_URL: `data:application/json,${encodeURIComponent(JSON.stringify({ keys: [publicJwk] }))}`,
  });
  const request = new Request("https://science.561.group/api/v1/me", {
    headers: { "cf-access-jwt-assertion": token },
  });
  const response = await worker.fetch(request, env, {});
  assert.equal(response.status, 200);
  assert.deepEqual(await response.json(), { email: "reader@example.test", groups: ["curators"] });
});

test("vault room routes accept only content-address-shaped keys", async () => {
  const env = environment();
  const key = "a".repeat(64);
  const response = await worker.fetch(new Request(`https://science.561.group/api/v1/vault/rooms/${key}`), env, context());
  assert.equal(await response.text(), `/vault/rooms/${key}.json`);
  const rejected = await worker.fetch(new Request("https://science.561.group/api/v1/vault/rooms/../../secret"), env, context());
  assert.equal(rejected.status, 404);
});

test("the normalized TUFTE garden projection is served through the authenticated API", async () => {
  const response = await worker.fetch(new Request("https://science.561.group/api/v1/vault/garden"), environment(), context());
  assert.equal(response.status, 200);
  assert.equal(await response.text(), "/vault/views/garden.json");
});

test("VaultMaze reviews are validated and stored under a pseudonymous subject", async () => {
  const env = environment();
  const response = await worker.fetch(new Request("https://science.561.group/api/v1/reviews", {
    method: "PUT",
    body: JSON.stringify({ cardId: "card-1", reviewedAt: 42, rating: 3, stability: 2.5, difficulty: 4 }),
    headers: { "content-type": "application/json" },
  }), env, context());
  assert.equal(response.status, 201);
  assert.match(env.calls[0].values[0], /^[a-f0-9]{64}$/);
  assert.equal(env.calls[0].values[1], "card-1");
  assert.equal(env.calls[0].values.includes("reader@example.test"), false);
});
