// bots.mjs tests, run against the real kernel via createSessionFactory —
// see bridge.test.mjs's header for why the import is the .mts source
// directly rather than the built public/lib/kernel/ tree.

import { test } from "node:test";
import assert from "node:assert/strict";
import * as kernel from "@lenticule-science/weiqi-kernel";
import { createSessionFactory } from "../public/js/lib/kernel-bridge.mjs";
import { randomBot, greedyCaptureBot } from "../public/js/lib/bots.mjs";

const createSession = createSessionFactory(kernel);

// The same deterministic capture setup as bridge.test.mjs: after these six
// plies, Black's only capturing move is C4 (the sole remaining liberty of
// the lone White stone at C3) — every other legal point is quiet or gives
// atari at best, so a capture-preferring bot has exactly one right answer.
const SETUP_MOVES = ["B3", "C3", "D3", "A1", "C2", "A2"];

function sessionWithACaptureAvailable() {
  const session = createSession({ size: 5, ruleset: "capture-go", captureGoTarget: 1 });
  for (const move of SETUP_MOVES) {
    const result = session.play(move);
    assert.ok(result.ok, `setup move "${move}" was rejected (${result.reason})`);
  }
  return session;
}

test("greedyCaptureBot plays the capturing move when one exists", () => {
  const session = sessionWithACaptureAvailable();
  assert.ok(session.legalMoves().includes("C4"), "test setup: C4 should be legal");
  const move = greedyCaptureBot({ session });
  assert.equal(move, "C4");
});

test("randomBot and greedyCaptureBot both return a move session.legalMoves() actually lists", () => {
  const session = sessionWithACaptureAvailable();
  const legal = session.legalMoves();
  assert.ok(legal.includes(randomBot({ session })));
  assert.ok(legal.includes(greedyCaptureBot({ session })));
});

// --- Seeded LCG random-position fuzzing ------------------------------------
//
// A plain linear congruential generator (Numerical Recipes' constants),
// deterministic given its seed — any failure below reproduces exactly from
// the printed seed. Mirrors the pattern weiqi-kernel/test/properties.test.mts
// uses for its own self-play fuzzing.

function makeLcg(seed) {
  let state = seed >>> 0;
  return () => {
    state = (Math.imul(state, 1664525) + 1013904223) >>> 0;
    return state / 4294967296;
  };
}

/**
 * Walks a fresh capture-go session through a short, random number of
 * random legal plies (falling back to "pass" only when no board point is
 * legal, per capture-go's own pass-forbidden constraint), stopping early
 * if the game ends. Every move played is drawn from session.legalMoves()
 * and then actually applied via session.play(), so this only ever visits
 * reachable, rules-legal positions. The ply budget is kept well short of a
 * full board (and captureGoTarget generous) so most walks land mid-game —
 * capture-go's own ending behavior has its own dedicated tests in
 * bridge.test.mjs, this fuzz is about legality of bot output, not endings.
 */
function randomWalk(seed) {
  const rng = makeLcg(seed);
  const size = rng() < 0.5 ? 7 : 9;
  const session = createSession({ size, ruleset: "capture-go", captureGoTarget: 4 });
  const plyBudget = 1 + Math.floor(rng() * size * size * 0.35);
  for (let ply = 0; ply < plyBudget; ply++) {
    if (session.status().phase === "ended") break;
    const legal = session.legalMoves();
    const move = legal.length === 0 ? "pass" : legal[Math.floor(rng() * legal.length)];
    const result = session.play(move);
    assert.ok(result.ok, `seed ${seed}: session.play("${move}") was rejected (${result.reason}) though legalMoves() offered it`);
  }
  return session;
}

test("bots always return a legal move, across 50 random in-progress positions (seeded LCG)", () => {
  const TARGET_SAMPLES = 50;
  const MAX_ATTEMPTS = 500;
  let sampled = 0;
  let seed = 1;
  let attempts = 0;

  while (sampled < TARGET_SAMPLES && attempts < MAX_ATTEMPTS) {
    attempts += 1;
    const session = randomWalk(seed);
    seed += 1;
    if (session.status().phase === "ended") continue; // only in-progress positions are in scope here
    sampled += 1;

    const randomMove = randomBot({ session });
    assert.ok(
      session.preview(randomMove).legal,
      `seed ${seed - 1}: randomBot returned illegal move "${randomMove}"`,
    );

    const greedyMove = greedyCaptureBot({ session });
    assert.ok(
      session.preview(greedyMove).legal,
      `seed ${seed - 1}: greedyCaptureBot returned illegal move "${greedyMove}"`,
    );
  }

  assert.equal(sampled, TARGET_SAMPLES, `only sampled ${sampled} in-progress positions within ${MAX_ATTEMPTS} attempts`);
});
