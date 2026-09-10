import assert from "node:assert/strict";
import test from "node:test";
import { admitStoredMatchCommand, createStoredMatch } from "../src/match-service.mjs";

const stored = () => createStoredMatch({
  config: { size: 9, ruleset: "chinese" },
  black: { principal: "black", capability: "black-capability" },
  white: { principal: "white", capability: "white-capability" },
});

test("the effect shell stores only an engine-owned replayable match", () => {
  const accepted = admitStoredMatchCommand(stored(), { principal: "black", capability: "black-capability", idempotencyKey: "b1", expectedVersion: 0, command: { kind: "play", move: "C3" } }, 1);
  assert.equal(accepted.status, 200);
  assert.equal(accepted.body.version, 1);
  assert.equal(accepted.stored.match.log.length, 1);
  assert.deepEqual(accepted.stored.match.session.state.moves, ["C3"]);
});

test("capabilities are required before a principal can append a match command", () => {
  const denied = admitStoredMatchCommand(stored(), { principal: "black", capability: "wrong", idempotencyKey: "b1", expectedVersion: 0, command: { kind: "play", move: "C3" } }, 1);
  assert.deepEqual(denied, { status: 401, body: { ok: false, reason: "unauthorized" } });
});

test("the shell preserves engine version conflict and idempotency semantics", () => {
  const first = admitStoredMatchCommand(stored(), { principal: "black", capability: "black-capability", idempotencyKey: "b1", expectedVersion: 0, command: { kind: "play", move: "C3" } }, 1);
  const duplicate = admitStoredMatchCommand(first.stored, { principal: "black", capability: "black-capability", idempotencyKey: "b1", expectedVersion: 0, command: { kind: "play", move: "C3" } }, 2);
  assert.equal(duplicate.status, 200);
  assert.equal(duplicate.body.duplicate, true);
  assert.equal(duplicate.stored.match.log.length, 1);
});
