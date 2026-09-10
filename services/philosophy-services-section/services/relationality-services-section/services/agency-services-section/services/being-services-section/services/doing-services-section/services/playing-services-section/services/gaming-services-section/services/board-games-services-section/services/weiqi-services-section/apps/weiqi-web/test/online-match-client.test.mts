import assert from "node:assert/strict";
import test from "node:test";
import { commandRequest, onlineMatchUrl, serverView } from "../public/js/online-match-client.mjs";

test("an invite keeps an opaque capability in the fragment, outside HTTP requests", () => {
  const url = new URL(onlineMatchUrl({ matchId: "m", principal: "p", capability: "secret", color: "white" }, "https://weiqi.561.group/online.html"));
  assert.equal(url.pathname, "/online.html");
  assert.equal(url.search, "");
  assert.match(url.hash, /capability=secret/);
});

test("the browser command envelope carries no rules result", () => {
  assert.deepEqual(commandRequest({ principal: "p", capability: "c", version: 2, command: { kind: "pass" }, idempotencyKey: "i" }), { headers: { authorization: "Bearer c", "content-type": "application/json" }, body: { principal: "p", expectedVersion: 2, command: { kind: "pass" }, idempotencyKey: "i" } });
});

test("the board view is admitted only from a server session checkpoint", () => {
  assert.equal(serverView({ ok: true, session: { state: { toMove: 1 } } }, "black").yourTurn, true);
  assert.equal(serverView({ ok: false }, "black"), null);
});
