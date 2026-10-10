// kernel-bridge.mjs tests, run against the real kernel via
// createSessionFactory (see kernel-bridge.mjs's own header): imports the
// kernel straight from its .mts source, type-stripped natively by Node,
// exactly as the ground rules specify — the app's default export instead
// lazily imports the built public/lib/kernel/ tree, which only exists
// after `npm run build` and is exercised by that build script itself, not
// here.

import { test } from "node:test";
import assert from "node:assert/strict";
import * as kernel from "@red-cup-engineering/weiqi-engine";
import { createSessionFactory } from "../public/js/lib/kernel-bridge.mjs";

const createSession = createSessionFactory(kernel);

// A deterministic 5x5 sequence: Black surrounds a lone White stone at C3
// one liberty per ply (White plays elsewhere each time, so it never
// contests), then takes the last liberty on the 7th ply — the ply-by-ply
// events are pinned against a direct kernel.Game run in the sibling
// Weiqi engine test suite's style (see properties.test.mts) before being
// relied on here.
const SETUP_MOVES = ["B3", "C3", "D3", "A1", "C2", "A2"]; // 6 plies; Black to move next
const CAPTURING_MOVE = "C4"; // Black's 7th ply: fills C3's last liberty

function sessionAfterSetup(overrides = {}) {
  const session = createSession({ size: 5, ruleset: "capture-go", captureGoTarget: 1, ...overrides });
  for (const move of SETUP_MOVES) {
    const result = session.play(move);
    assert.ok(result.ok, `setup move "${move}" was rejected (${result.reason})`);
  }
  return session;
}

test("preview() does not mutate stones(), toMove(), or history()", () => {
  const session = sessionAfterSetup();
  const stonesBefore = session.stones();
  const toMoveBefore = session.toMove();
  const historyBefore = session.history();

  // Preview several different candidates, including the eventual capturing
  // move and an unrelated quiet point — none of them should leave a trace.
  for (const candidate of ["C4", "E5", "A3", "pass"]) {
    const result = session.preview(candidate);
    assert.deepEqual(session.stones(), stonesBefore, `preview("${candidate}") changed stones()`);
    assert.equal(session.toMove(), toMoveBefore, `preview("${candidate}") changed toMove()`);
    assert.deepEqual(session.history(), historyBefore, `preview("${candidate}") changed history()`);
    assert.equal(typeof result.legal, "boolean", `preview("${candidate}") did not report a legal flag`);
  }
});

test("preview() reports the capturing move as legal with a capture event, before it is actually played", () => {
  const session = sessionAfterSetup();
  const preview = session.preview(CAPTURING_MOVE);
  assert.equal(preview.legal, true);
  assert.deepEqual(preview.captures, ["C3"]);
  assert.ok(
    preview.events.some((e) => e.type === "capture" && !e.detail.selfCapture),
    "preview did not report a capture event",
  );

  // And the white stone at C3 is still on the board — preview truly did not play it.
  assert.ok(session.stones().some((s) => s.pt === "C3" && s.color === "white"));
});

test("capture-go ends exactly when target captures is reached, with winner and method 'capture'", () => {
  const session = sessionAfterSetup({ captureGoTarget: 1 });
  assert.deepEqual(session.status(), { phase: "playing" });

  const result = session.play(CAPTURING_MOVE);
  assert.ok(result.ok, `capturing move was rejected (${result.reason})`);
  assert.deepEqual(result.captures, ["C3"]);
  assert.deepEqual(session.status(), { phase: "ended", winner: "black", method: "capture" });

  // The board no longer carries the captured stone.
  assert.ok(!session.stones().some((s) => s.pt === "C3"));

  // Play is refused once the session has ended.
  const after = session.play("E5");
  assert.deepEqual(after, { ok: false, reason: "game-ended" });
});

test("capture-go does not end before target captures is reached", () => {
  const session = sessionAfterSetup({ captureGoTarget: 2 });
  const result = session.play(CAPTURING_MOVE);
  assert.ok(result.ok);
  assert.deepEqual(session.status(), { phase: "playing" });
});

test("capture-go forbids passing while a legal move exists", () => {
  const session = createSession({ size: 5, ruleset: "capture-go", captureGoTarget: 1 });
  assert.ok(session.legalMoves().length > 0, "test setup: expected legal moves on an empty 5x5 board");
  assert.deepEqual(session.play("pass"), { ok: false, reason: "pass-forbidden" });
  assert.deepEqual(session.preview("pass"), { legal: false, reason: "pass-forbidden", events: [], captures: [] });
});

test("score() is null for capture-go and populated for a real ruleset", () => {
  const captureGo = createSession({ size: 5, ruleset: "capture-go", captureGoTarget: 1 });
  assert.equal(captureGo.score(), null);

  const chinese = createSession({ size: 5, ruleset: "chinese" });
  const score = chinese.score();
  assert.equal(typeof score.blackScore, "number");
  assert.equal(typeof score.whiteScore, "number");
});

test("history() and toSgf() reflect exactly the moves played", () => {
  const session = sessionAfterSetup();
  assert.deepEqual(session.history(), SETUP_MOVES);

  const sgf = session.toSgf();
  const record = kernel.sgfToGameRecord(sgf);
  assert.equal(record.size, 5);
  assert.equal(record.moves.length, SETUP_MOVES.length);
  const replay = new kernel.Game(5, "japanese");
  for (const mv of record.moves) {
    const coord = mv.point === "pass" ? "pass" : kernel.pointToCoord(5, mv.point);
    const outcome = replay.play(coord);
    assert.ok(outcome.ok, `SGF-replayed move "${coord}" was rejected`);
  }
  assert.deepEqual(Array.from(replay.current.board), Array.from(replayBoard(session)));
});

// Rebuilds the raw board array session.stones() implies, for the boardHash
// comparison above — stones() only exposes occupied points, so this walks
// them back onto a same-size empty board.
function replayBoard(session) {
  const board = new Uint8Array(5 * 5);
  for (const { pt, color } of session.stones()) {
    board[kernel.coordToPoint(5, 5, pt)] = color === "black" ? kernel.BLACK : kernel.WHITE;
  }
  return board;
}
