import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { DatabaseSync } from "node:sqlite";
import {
  acceptDiscordInteraction,
  acceptDiscordGatewayCommand,
  createDiscordCommandChallenge,
  identifyDiscordCommandSession,
  pollDiscordCommandChallenge,
} from "../lib/cloudflare/src/discord-command-login.mjs";
import { createD1Adapter } from "../lib/vps/adapter.mjs";
import worker from "../lib/cloudflare/src/worker.mjs";

const GUILD_ID = "123456789012345678";
const ROLE_ID = "234567890123456789";
const USER_ID = "345678901234567890";
const SECRET = "test-session-secret";

async function fixture() {
  const database = new DatabaseSync(":memory:");
  database.exec(await readFile(new URL("../lib/cloudflare/migrations/0004_discord_interaction_command_login.sql", import.meta.url), "utf8"));
  const pair = await crypto.subtle.generateKey({ name: "Ed25519" }, true, ["sign", "verify"]);
  const raw = new Uint8Array(await crypto.subtle.exportKey("raw", pair.publicKey));
  return {
    privateKey: pair.privateKey,
    env: {
      DISCORD_PUBLIC_KEY: [...raw].map((byte) => byte.toString(16).padStart(2, "0")).join(""),
      DISCORD_BOT_TOKEN: "bot-token",
      DISCORD_GUILD_ID: GUILD_ID,
      TURNTIDE_ISLANDER_ROLE_ID: ROLE_ID,
      SESSION_SECRET: SECRET,
      LEARNER_STATE: createD1Adapter(database),
    },
  };
}

function verifierCookie(created) { return created.cookies[0].split(";")[0]; }
const currentIslander = { async member() { return { status: 200, member: { pending: false, roles: [ROLE_ID] } }; } };

async function signedInteraction(privateKey, body, timestamp = String(Math.floor(Date.now() / 1000))) {
  const signature = new Uint8Array(await crypto.subtle.sign({ name: "Ed25519" }, privateKey, new TextEncoder().encode(`${timestamp}${body}`)));
  return new Request("https://l-space.561.group/api/v1/discord/interactions", {
    method: "POST",
    headers: {
      "content-type": "application/json",
      "x-signature-timestamp": timestamp,
      "x-signature-ed25519": [...signature].map((byte) => byte.toString(16).padStart(2, "0")).join(""),
    },
    body,
  });
}

async function signedGatewayCommand(env, payload, timestamp = String(Math.floor(Date.now() / 1000))) {
  const body = JSON.stringify(payload);
  const key = await crypto.subtle.importKey("raw", new TextEncoder().encode(env.DISCORD_BOT_TOKEN), { name: "HMAC", hash: "SHA-256" }, false, ["sign"]);
  const signature = new Uint8Array(await crypto.subtle.sign("HMAC", key, new TextEncoder().encode(`${timestamp}.${body}`)));
  return new Request("https://l-space.561.group/api/v1/discord/gateway-command", {
    method: "POST",
    headers: { "content-type": "application/json", "x-l-space-gateway-timestamp": timestamp, "x-l-space-gateway-signature": [...signature].map((byte) => byte.toString(16).padStart(2, "0")).join("") },
    body,
  });
}

test("command login verifies Discord PING before responding", async () => {
  const { env, privateKey } = await fixture();
  const body = JSON.stringify({ type: 1 });
  const response = await acceptDiscordInteraction(await signedInteraction(privateKey, body), env);
  assert.equal(response.status, 200);
  assert.deepEqual(await response.json(), { type: 1 });

  const rejected = await acceptDiscordInteraction(new Request("https://l-space.561.group/api/v1/discord/interactions", { method: "POST", body }), env);
  assert.equal(rejected.status, 401);
});

test("a signed exact-guild islander command consumes one short browser challenge without retaining Discord identity", async () => {
  const { env, privateKey } = await fixture();
  const created = await createDiscordCommandChallenge(new Request("https://l-space.561.group/", { headers: { "cf-connecting-ip": "203.0.113.9" } }), env);
  assert.equal(created.status, 201);
  const body = JSON.stringify({
    type: 2,
    guild_id: GUILD_ID,
    member: { pending: false, roles: [ROLE_ID], user: { id: USER_ID, username: "not-persisted" } },
    data: { name: "l-space-login", options: [{ name: "code", value: created.challenge }] },
  });
  const interaction = await acceptDiscordInteraction(await signedInteraction(privateKey, body), env);
  assert.equal(interaction.status, 200);
  assert.match((await interaction.json()).data.content, /Login confirmed/u);
  const db = env.LEARNER_STATE;
  const challenge = await db.prepare("SELECT subject_hash FROM discord_command_login_challenges").first();
  assert.equal(JSON.stringify(challenge).includes(USER_ID), false);

  const issued = await pollDiscordCommandChallenge(new Request("https://l-space.561.group/", { headers: { cookie: verifierCookie(created) } }), env, created.challenge);
  assert.equal(issued.status, 200);
  const cookie = issued.cookies[0];
  const persisted = await env.LEARNER_STATE.prepare("SELECT discord_user_ciphertext FROM discord_interaction_sessions").first();
  assert.equal(persisted.discord_user_ciphertext.includes(USER_ID), false, "the bot lookup identity is encrypted at rest");
  const session = await identifyDiscordCommandSession(new Request("https://l-space.561.group/", { headers: { cookie } }), env, Date.now, currentIslander);
  assert.equal(session.provider, "discord");
  assert.equal(session.label, "Turntide islander");
  assert.equal((await pollDiscordCommandChallenge(new Request("https://l-space.561.group/", { headers: { cookie: verifierCookie(created) } }), env, created.challenge)).status, 404);
});

test("a timestamped HMAC gateway command approves the existing challenge without Discord interactions", async () => {
  const { env } = await fixture();
  const created = await createDiscordCommandChallenge(new Request("https://l-space.561.group/"), env);
  const payload = { challenge: created.challenge, guildId: GUILD_ID, userId: USER_ID, pending: false, roles: [ROLE_ID] };
  const approved = await acceptDiscordGatewayCommand(await signedGatewayCommand(env, payload), env);
  assert.equal(approved.status, 204);
  const issued = await pollDiscordCommandChallenge(new Request("https://l-space.561.group/", { headers: { cookie: verifierCookie(created) } }), env, created.challenge);
  assert.equal(issued.status, 200);

  const stale = await acceptDiscordGatewayCommand(await signedGatewayCommand(env, payload, "1"), env);
  assert.equal(stale.status, 401);
  const unsigned = await acceptDiscordGatewayCommand(new Request("https://l-space.561.group/api/v1/discord/gateway-command", { method: "POST", body: JSON.stringify(payload) }), env);
  assert.equal(unsigned.status, 401);
});

test("wrong guild, pending membership, or a missing role cannot approve a challenge", async () => {
  for (const member of [
    { pending: true, roles: [ROLE_ID] }, { pending: false, roles: [] },
  ]) {
    const { env, privateKey } = await fixture();
    const created = await createDiscordCommandChallenge(new Request("https://l-space.561.group/"), env);
    const body = JSON.stringify({ type: 2, guild_id: GUILD_ID, member: { ...member, user: { id: USER_ID } }, data: { name: "l-space-login", options: [{ name: "code", value: created.challenge }] } });
    const response = await acceptDiscordInteraction(await signedInteraction(privateKey, body), env);
    assert.match((await response.json()).data.content, /required/u);
    assert.equal((await pollDiscordCommandChallenge(new Request("https://l-space.561.group/", { headers: { cookie: verifierCookie(created) } }), env, created.challenge)).status, 202);
  }
});

test("challenge creation is bounded per edge-source bucket", async () => {
  const { env } = await fixture();
  const request = new Request("https://l-space.561.group/", { headers: { "cf-connecting-ip": "203.0.113.10" } });
  for (let index = 0; index < 12; index += 1) assert.equal((await createDiscordCommandChallenge(request, env)).status, 201);
  assert.equal((await createDiscordCommandChallenge(request, env)).status, 429);
});

test("polling issues the bearer only through HttpOnly Set-Cookie", async () => {
  const { env, privateKey } = await fixture();
  const created = await createDiscordCommandChallenge(new Request("https://l-space.561.group/"), env);
  const body = JSON.stringify({ type: 2, guild_id: GUILD_ID, member: { pending: false, roles: [ROLE_ID], user: { id: USER_ID } }, data: { name: "l-space-login", options: [{ name: "code", value: created.challenge }] } });
  await acceptDiscordInteraction(await signedInteraction(privateKey, body), env);
  const response = await worker.fetch(new Request("https://l-space.561.group/api/v1/discord/command-challenge", { method: "POST", headers: { "content-type": "application/json", cookie: verifierCookie(created) }, body: JSON.stringify({ action: "poll", challenge: created.challenge }) }), env);
  assert.equal(response.status, 200);
  assert.match(response.headers.get("set-cookie"), /HttpOnly/u);
  assert.equal(JSON.stringify(await response.json()).includes("l_space_discord_session"), false);
});

test("the Discord command code cannot be claimed without its browser verifier", async () => {
  const { env, privateKey } = await fixture();
  const created = await createDiscordCommandChallenge(new Request("https://l-space.561.group/"), env);
  const body = JSON.stringify({ type: 2, guild_id: GUILD_ID, member: { pending: false, roles: [ROLE_ID], user: { id: USER_ID } }, data: { name: "l-space-login", options: [{ name: "code", value: created.challenge }] } });
  await acceptDiscordInteraction(await signedInteraction(privateKey, body), env);
  assert.equal((await pollDiscordCommandChallenge(new Request("https://l-space.561.group/"), env, created.challenge)).status, 404);
  assert.equal((await pollDiscordCommandChallenge(new Request("https://l-space.561.group/", { headers: { cookie: verifierCookie(created) } }), env, created.challenge)).status, 200);
});

test("command sessions re-observe current membership and fail closed", async () => {
  const { env, privateKey } = await fixture();
  const created = await createDiscordCommandChallenge(new Request("https://l-space.561.group/"), env);
  const body = JSON.stringify({ type: 2, guild_id: GUILD_ID, member: { pending: false, roles: [ROLE_ID], user: { id: USER_ID } }, data: { name: "l-space-login", options: [{ name: "code", value: created.challenge }] } });
  await acceptDiscordInteraction(await signedInteraction(privateKey, body), env);
  const issued = await pollDiscordCommandChallenge(new Request("https://l-space.561.group/", { headers: { cookie: verifierCookie(created) } }), env, created.challenge);
  const sessionRequest = new Request("https://l-space.561.group/", { headers: { cookie: issued.cookies[0] } });
  assert.ok(await identifyDiscordCommandSession(sessionRequest, env, Date.now, currentIslander));
  assert.equal(await identifyDiscordCommandSession(sessionRequest, env, Date.now, { async member() { return { status: 404 }; } }), null);
  assert.equal((await env.LEARNER_STATE.prepare("SELECT session_hash FROM discord_interaction_sessions").all()).results.length, 0);
});

test("Discord bot rate limiting is reported as retryable denial", async () => {
  const { env, privateKey } = await fixture();
  const created = await createDiscordCommandChallenge(new Request("https://l-space.561.group/"), env);
  const body = JSON.stringify({ type: 2, guild_id: GUILD_ID, member: { pending: false, roles: [ROLE_ID], user: { id: USER_ID } }, data: { name: "l-space-login", options: [{ name: "code", value: created.challenge }] } });
  await acceptDiscordInteraction(await signedInteraction(privateKey, body), env);
  const issued = await pollDiscordCommandChallenge(new Request("https://l-space.561.group/", { headers: { cookie: verifierCookie(created) } }), env, created.challenge);
  const identity = await identifyDiscordCommandSession(new Request("https://l-space.561.group/", { headers: { cookie: issued.cookies[0] } }), env, Date.now, { async member() { return { status: 429, retryAfter: 7 }; } });
  assert.deepEqual(identity, { unavailable: true, retryAfter: 7 });
});
