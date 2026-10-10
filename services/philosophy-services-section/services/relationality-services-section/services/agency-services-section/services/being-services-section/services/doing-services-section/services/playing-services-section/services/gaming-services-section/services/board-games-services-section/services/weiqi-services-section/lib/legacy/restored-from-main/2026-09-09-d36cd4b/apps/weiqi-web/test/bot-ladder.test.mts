// Bot ladder legality: the two new tiers (Watchful/liberty-counting,
// Reaching/influence-heuristic -- Experience Brief item 7, task item 3)
// must never have a move rejected by the kernel, across many seeded
// self-play games, on both capture-go board sizes the ladder actually
// uses (see public/data/ladder-rungs.json). This is the same discipline
// smoke.test.mts already applies to the random-legal/greedy-capture pair;
// this file is its sequel for the two tiers added on top, not a
// replacement.
//
// Run with: node --test 'test/*.test.mts'

import { test } from "node:test";
import assert from "node:assert/strict";
import { Game } from "@lenticule-science/weiqi-kernel";
import * as kernel from "@lenticule-science/weiqi-kernel";
import {
  chooseRandomLegalMove,
  chooseLibertyCountingMove,
  chooseInfluenceMove,
  wasCaptureMove,
  BOT_TIERS,
} from "../public/js/bot.mjs";

const RULESET = "japanese"; // capture-go's traditional simple-ko rules, same as play-app.mjs

/** Deterministic, seedable PRNG (mulberry32) -- same generator smoke.test.mts uses, so a failing seed is reproducible the same way. */
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
}

type Chooser = (game: InstanceType<typeof Game>, k: typeof kernel, rng: () => number) => string;

function playOneGame(boardSize: number, seed: number, blackChooser: Chooser, whiteChooser: Chooser): GameSummary {
  const rng = mulberry32(seed);
  const game = new Game(boardSize, RULESET);
  const maxPlies = 6 * boardSize * boardSize; // generous safety valve against pass-pass loops
  let passStreak = 0;

  for (let ply = 0; ply < maxPlies; ply++) {
    const toMove = game.current.toMove;
    const move = toMove === kernel.BLACK ? blackChooser(game, kernel, rng) : whiteChooser(game, kernel, rng);

    const outcome = game.play(move);
    assert.equal(
      outcome.ok,
      true,
      `size ${boardSize}, seed ${seed}, ply ${ply}: kernel rejected bot-chosen move "${move}"` +
        (outcome.ok ? "" : ` (reason: ${outcome.reason})`),
    );
    if (!outcome.ok) break; // unreachable after the assert; satisfies the type checker

    if (move === "pass") {
      passStreak++;
      if (passStreak >= 2) return { plies: ply + 1, endedBy: "two-passes" };
    } else {
      passStreak = 0;
    }

    if (wasCaptureMove(outcome.events)) {
      return { plies: ply + 1, endedBy: "capture" };
    }
  }

  return { plies: maxPlies, endedBy: "ply-cap" };
}

function runSeries(label: string, boardSize: number, blackChooser: Chooser, whiteChooser: Chooser, count: number) {
  test(`${label}: ${count} seeded games on ${boardSize}x${boardSize}, kernel never rejects a bot-chosen move`, () => {
    const summaries: GameSummary[] = [];
    for (let i = 0; i < count; i++) {
      summaries.push(playOneGame(boardSize, 5000 + i, blackChooser, whiteChooser));
    }
    assert.equal(summaries.length, count);
    for (const s of summaries) {
      assert.ok(["capture", "two-passes", "ply-cap"].includes(s.endedBy));
      assert.ok(s.plies > 0 && s.plies <= 6 * boardSize * boardSize);
    }
  });
}

// Watchful (liberty-counting) as Black against a random opponent, 7x7 --
// the board size the ladder's "Mind Your Liberties" rung actually uses.
runSeries("Watchful vs. Wandering", 7, chooseLibertyCountingMove, chooseRandomLegalMove, 200);

// Reaching (influence heuristic) as Black against a random opponent, 9x9 --
// the board size the ladder's "Wider Board" rung actually uses.
runSeries("Reaching vs. Wandering", 9, chooseInfluenceMove, chooseRandomLegalMove, 200);

// Cross-tier: Watchful vs. Reaching head to head, both directions, so
// neither bot is only ever exercised as Black or only ever as White.
runSeries("Watchful (Black) vs. Reaching (White)", 9, chooseLibertyCountingMove, chooseInfluenceMove, 200);
runSeries("Reaching (Black) vs. Watchful (White)", 9, chooseInfluenceMove, chooseLibertyCountingMove, 200);

test("Watchful takes an available capture exactly like Grabby does (shared priority 1)", () => {
  const game = new Game(7, RULESET);
  assert.equal(game.play("D4").ok, true); // Black
  assert.equal(game.play("C4").ok, true); // White
  assert.equal(game.play("F1").ok, true); // Black elsewhere
  assert.equal(game.play("D3").ok, true); // White
  assert.equal(game.play("F2").ok, true); // Black elsewhere
  assert.equal(game.play("D5").ok, true); // White: Black D4 now in atari (one liberty: E4)
  assert.equal(game.play("F3").ok, true); // Black elsewhere again, does not save D4

  const move = chooseLibertyCountingMove(game, kernel, () => 0);
  assert.equal(move, "E4", `expected Watchful to take the available capture at E4, got "${move}"`);
});

test("Watchful rescues its own group from atari when a capture is not available", () => {
  const game = new Game(7, RULESET);
  // Build a position where Black's D3-D4 pair is in atari with one escape
  // liberty (D5) and White has no capture of its own available.
  assert.equal(game.play("D4").ok, true); // Black
  assert.equal(game.play("A4").ok, true); // White plays away (a quiet stone Black's own away moves never approach)
  assert.equal(game.play("D3").ok, true); // Black extends
  assert.equal(game.play("C4").ok, true); // White
  assert.equal(game.play("A7").ok, true); // Black plays away (a pass-equivalent quiet move)
  assert.equal(game.play("C3").ok, true); // White
  assert.equal(game.play("G7").ok, true); // Black plays away
  assert.equal(game.play("E4").ok, true); // White
  assert.equal(game.play("G1").ok, true); // Black plays away
  assert.equal(game.play("E3").ok, true); // White
  assert.equal(game.play("B1").ok, true); // Black plays away
  assert.equal(game.play("D2").ok, true); // White: Black's D3-D4 pair now at one liberty, D5

  const before = kernel.findGroup(game.current.board, 7, 7, kernel.coordToPoint(7, 7, "D4"));
  assert.equal(before.liberties.size, 1, "test setup check: Black's pair should be in atari before Watchful moves");

  const move = chooseLibertyCountingMove(game, kernel, () => 0);
  assert.equal(move, "D5", `expected Watchful to rescue the atari'd pair at D5, got "${move}"`);
});

test("BOT_TIERS names four tiers in ascending order, each wired to a real chooser function", () => {
  assert.equal(BOT_TIERS.length, 4);
  assert.deepEqual(BOT_TIERS.map((t) => t.id), ["random", "greedy", "liberty", "influence"]);
  for (const tier of BOT_TIERS) {
    assert.equal(typeof tier.chooser, "function");
    assert.ok(tier.label.length > 0);
    assert.ok(tier.description.length > 0);
    // No kyu/dan rank claim anywhere in a tier's own copy.
    assert.doesNotMatch(tier.label + " " + tier.description, /\d+\s*(kyu|dan|k\b|d\b)/i);
  }
});
