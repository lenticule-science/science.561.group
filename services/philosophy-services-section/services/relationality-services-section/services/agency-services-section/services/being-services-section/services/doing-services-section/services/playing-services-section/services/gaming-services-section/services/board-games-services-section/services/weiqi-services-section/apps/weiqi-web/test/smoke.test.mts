// Smoke test: import the kernel (relative .mts import, run directly by
// Node's type stripping -- the house pattern) and the bot, then play 100
// capture-go self-play games (random-legal Black vs. greedy-capture White)
// asserting the kernel never reports an illegal outcome for a bot-chosen
// move, and that every game reaches a well-defined end state.
//
// Run with: node --test 'test/*.test.mts'

import { test } from "node:test";
import assert from "node:assert/strict";
import { Game } from "@lenticule-science/weiqi-kernel";
import * as kernel from "@lenticule-science/weiqi-kernel";
// bot.mjs lives under public/js/ (not a separate src/) because it is
// plain, already-browser-ready JS with no build step of its own -- the
// SAME file the play page imports client-side (see public/js/play-app.mjs)
// runs here unmodified under Node, proving the two consumers share one
// implementation rather than parallel copies.
import { chooseGreedyCaptureMove, chooseRandomLegalMove, wasCaptureMove } from "../public/js/bot.mjs";

const BOARD_SIZE = 7;
// Simple ko (japanese) is the traditional capture-go ko rule; komi/scoring
// are irrelevant to capture-go, which ends the instant either side captures.
const RULESET = "japanese";
const MAX_PLIES = 4 * BOARD_SIZE * BOARD_SIZE; // generous safety valve against pass-pass loops

/** Deterministic, seedable PRNG (mulberry32) so a failing seed is reproducible. */
function mulberry32(seed: number) {
  let a = seed;
  return function rng() {
    a |= 0;
    a = (a + 0x6d2b79f5) | 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

interface GameSummary {
  plies: number;
  endedBy: "capture" | "two-passes" | "ply-cap";
  winner: "black" | "white" | null;
}

function playOneGame(seed: number): GameSummary {
  const rng = mulberry32(seed);
  const game = new Game(BOARD_SIZE, RULESET);
  let passStreak = 0;

  for (let ply = 0; ply < MAX_PLIES; ply++) {
    const toMove = game.current.toMove; // BLACK = 1, WHITE = 2
    const move =
      toMove === kernel.BLACK
        ? chooseRandomLegalMove(game, kernel, rng)
        : chooseGreedyCaptureMove(game, kernel, rng);

    const outcome = game.play(move);

    // The core invariant this smoke test exists to check: a move the bot
    // selected (always pre-checked via game.isLegal, or the always-legal
    // "pass") must never be reported illegal by the kernel.
    assert.equal(outcome.ok, true, `ply ${ply}: kernel rejected bot-chosen move "${move}"`);
    if (!outcome.ok) break; // unreachable after the assert, satisfies the type checker

    if (move === "pass") {
      passStreak++;
      if (passStreak >= 2) {
        return { plies: ply + 1, endedBy: "two-passes", winner: null };
      }
    } else {
      passStreak = 0;
    }

    if (wasCaptureMove(outcome.events)) {
      const winner = toMove === kernel.BLACK ? "black" : "white";
      return { plies: ply + 1, endedBy: "capture", winner };
    }
  }

  return { plies: MAX_PLIES, endedBy: "ply-cap", winner: null };
}

test("100 random capture-go self-play games: kernel never rejects a bot-chosen move", () => {
  const summaries: GameSummary[] = [];
  for (let i = 0; i < 100; i++) {
    summaries.push(playOneGame(1000 + i));
  }

  assert.equal(summaries.length, 100);

  // Every game must reach a well-defined end (a capture, a settled
  // two-pass end, or -- rarely, on a crowded 7x7 -- the ply cap), never
  // hang or throw.
  for (const s of summaries) {
    assert.ok(["capture", "two-passes", "ply-cap"].includes(s.endedBy));
    assert.ok(s.plies > 0 && s.plies <= MAX_PLIES);
  }

  // The vast majority of capture-go games between a random mover and a
  // greedy-capture bot on 7x7 should actually resolve by capture well
  // before the ply cap -- a sanity check on the bot/kernel wiring itself,
  // not just on "nothing threw."
  const captureEnded = summaries.filter((s) => s.endedBy === "capture").length;
  assert.ok(
    captureEnded >= 80,
    `expected most games to end by capture, got ${captureEnded}/100 (${JSON.stringify(
      summaries.filter((s) => s.endedBy !== "capture").map((s) => s.endedBy),
    )})`,
  );
});

test("greedy-capture bot always prefers an available capturing move", () => {
  // Hand-construct a position where White has an obvious 1-stone capture
  // available (Black at D4 surrounded on three sides) and confirm the bot
  // takes it rather than playing elsewhere.
  const game = new Game(BOARD_SIZE, RULESET);
  assert.equal(game.play("D4").ok, true); // Black
  assert.equal(game.play("C4").ok, true); // White
  assert.equal(game.play("F1").ok, true); // Black plays elsewhere
  assert.equal(game.play("D3").ok, true); // White
  assert.equal(game.play("F2").ok, true); // Black plays elsewhere
  assert.equal(game.play("D5").ok, true); // White: Black D4 now in atari (one liberty: E4)
  assert.equal(game.play("F3").ok, true); // Black plays elsewhere again, does not save D4

  const move = chooseGreedyCaptureMove(game, kernel, () => 0);
  assert.equal(move, "E4", `expected the bot to take the available capture at E4, got "${move}"`);

  const outcome = game.play(move);
  assert.equal(outcome.ok, true);
  if (outcome.ok) {
    assert.ok(wasCaptureMove(outcome.events), "expected a capture event from the bot's chosen move");
  }
});

test("random-legal move chooser never proposes an occupied or off-board point", () => {
  const rng = mulberry32(42);
  const game = new Game(BOARD_SIZE, RULESET);
  for (let i = 0; i < 30; i++) {
    const move = chooseRandomLegalMove(game, kernel, rng);
    if (move === "pass") continue;
    assert.equal(game.isLegal(move), true, `chooseRandomLegalMove proposed illegal move "${move}"`);
    const outcome = game.play(move);
    assert.equal(outcome.ok, true);
  }
});
