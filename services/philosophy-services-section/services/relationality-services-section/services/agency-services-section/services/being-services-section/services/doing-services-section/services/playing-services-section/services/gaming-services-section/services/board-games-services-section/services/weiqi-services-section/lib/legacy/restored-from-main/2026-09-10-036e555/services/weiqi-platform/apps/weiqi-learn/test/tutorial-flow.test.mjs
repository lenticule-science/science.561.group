// tutorial-flow.mjs tests: the state machine simulated with plain
// event/status objects only — no DOM, no kernel, no board or session of
// any kind. See that module's own header for why advance()'s input can
// always be a plain object instead of something built from a real game.

import { test } from "node:test";
import assert from "node:assert/strict";

import { createTutorial, DEFAULT_STAGES, WIN_CHECKS } from "../public/js/lib/tutorial-flow.mjs";

const SLUGS = ["first-stones", "atari", "capture-go-random", "capture-go-greedy", "real-go-9x9"];

// ---------------------------------------------------------------------
// DEFAULT_STAGES shape
// ---------------------------------------------------------------------

test("DEFAULT_STAGES has exactly the five ladder stages, in order", () => {
  assert.deepEqual(
    DEFAULT_STAGES.map((s) => s.slug),
    SLUGS,
  );
});

test("DEFAULT_STAGES: onLoss is present exactly on the three stages with an opposing side to lose to", () => {
  const withLoss = DEFAULT_STAGES.filter((s) => typeof s.onLoss === "string").map((s) => s.slug);
  assert.deepEqual(withLoss, ["capture-go-random", "capture-go-greedy", "real-go-9x9"]);
});

test("DEFAULT_STAGES: every stage has non-empty intro, hint, and onWin text", () => {
  for (const s of DEFAULT_STAGES) {
    assert.ok(s.intro.length > 0, `${s.slug}: intro`);
    assert.ok(s.hint.length > 0, `${s.slug}: hint`);
    assert.ok(s.onWin.length > 0, `${s.slug}: onWin`);
  }
});

test("DEFAULT_STAGES: every stage names a winCheck that actually exists in the registry", () => {
  for (const s of DEFAULT_STAGES) {
    assert.ok(Object.hasOwn(WIN_CHECKS, s.winCheck), `${s.slug}: winCheck "${s.winCheck}"`);
  }
});

// ---------------------------------------------------------------------
// Fresh machine / progress()
// ---------------------------------------------------------------------

test("a fresh tutorial starts at stage 0, status playing, progress not complete", () => {
  const tutorial = createTutorial(DEFAULT_STAGES);
  assert.equal(tutorial.stage().slug, "first-stones");
  assert.equal(tutorial.stage().status, "playing");
  const progress = tutorial.progress();
  assert.equal(progress.index, 0);
  assert.equal(progress.total, 5);
  assert.equal(progress.complete, false);
  assert.deepEqual(progress.slugs, SLUGS);
});

test("stage() returns a fresh object each call — mutating the result never touches the machine's own state", () => {
  const tutorial = createTutorial(DEFAULT_STAGES);
  const first = tutorial.stage();
  first.title = "tampered";
  assert.equal(tutorial.stage().title, "First Stones");
});

test("createTutorial rejects an empty or non-array stage list", () => {
  assert.throws(() => createTutorial([]));
  assert.throws(() => createTutorial(null));
});

// ---------------------------------------------------------------------
// Stage 1: first-stones (stones-placed-3)
// ---------------------------------------------------------------------

test("first-stones: fewer than 3 placed does not advance", () => {
  const tutorial = createTutorial(DEFAULT_STAGES);
  const r1 = tutorial.advance({ type: "placement", count: 1 });
  assert.equal(r1.outcome, "no-change");
  assert.equal(r1.text, DEFAULT_STAGES[0].hint);
  const r2 = tutorial.advance({ type: "placement", count: 2 });
  assert.equal(r2.outcome, "no-change");
  assert.equal(tutorial.stage().slug, "first-stones");
});

test("first-stones: reaching 3 placed wins and moves to atari", () => {
  const tutorial = createTutorial(DEFAULT_STAGES);
  const result = tutorial.advance({ type: "placement", count: 3 });
  assert.equal(result.outcome, "won");
  assert.equal(result.stage, "first-stones");
  assert.equal(result.text, DEFAULT_STAGES[0].onWin);
  assert.equal(result.next, "atari");
  assert.equal(tutorial.stage().slug, "atari");
  assert.equal(tutorial.progress().index, 1);
});

test("first-stones: an unrelated result type (e.g. a stray event) does not advance", () => {
  const tutorial = createTutorial(DEFAULT_STAGES);
  const result = tutorial.advance({ type: "event", event: { type: "capture", detail: { by: "black" } } });
  assert.equal(result.outcome, "no-change");
});

// ---------------------------------------------------------------------
// Stage 2: atari (capture-white)
// ---------------------------------------------------------------------

function atTutorial(...slugs) {
  const tutorial = createTutorial(DEFAULT_STAGES);
  // Drive the machine forward to just before the target stage's own
  // winCheck matters, by winning every stage ahead of it with the
  // smallest satisfying result for that stage's own predicate.
  const winners = {
    "first-stones": { type: "placement", count: 3 },
    atari: { type: "event", event: { type: "capture", term: "capture", detail: { by: 1 } } },
    "capture-go-random": { type: "status", status: { phase: "ended", winner: "black", method: "capture" } },
    "capture-go-greedy": { type: "status", status: { phase: "ended", winner: "black", method: "capture" } },
  };
  for (const slug of slugs) {
    const result = tutorial.advance(winners[slug]);
    assert.equal(result.outcome, "won", `expected winning ${slug} to advance`);
  }
  return tutorial;
}

test("atari: a wrong-but-legal move (no capture event) does not advance, and surfaces the stage's hint", () => {
  const tutorial = atTutorial("first-stones");
  const result = tutorial.advance({ type: "event", event: { type: "atari-given", detail: { by: "black" } } });
  assert.equal(result.outcome, "no-change");
  assert.equal(result.text, DEFAULT_STAGES[1].hint);
  assert.equal(tutorial.stage().slug, "atari");
});

test("atari: capture-white does not key off detail.by at all — a real kernel event's `by` is a numeric Color code, not a color string, and the caller only ever hands this predicate one move's own outcome", () => {
  const tutorial = atTutorial("first-stones");
  // Deliberately no "by" field at all, matching how findCaptureEvent()
  // in ui/tutorial.mjs builds this result — see that function's own doc.
  const result = tutorial.advance({ type: "event", event: { type: "capture", detail: {} } });
  assert.equal(result.outcome, "won");
});

test("atari: a self-capture does not count, regardless of detail.by", () => {
  const tutorial = atTutorial("first-stones");
  const result = tutorial.advance({ type: "event", event: { type: "capture", detail: { by: 1, selfCapture: true } } });
  assert.equal(result.outcome, "no-change");
});

test("atari: no event at all (a move with no captures) does not advance", () => {
  const tutorial = atTutorial("first-stones");
  const result = tutorial.advance({ type: "event", event: undefined });
  assert.equal(result.outcome, "no-change");
});

test("atari: capturing advances to capture-go-random", () => {
  const tutorial = atTutorial("first-stones");
  const result = tutorial.advance({ type: "event", event: { type: "capture", detail: { by: 1 } } });
  assert.equal(result.outcome, "won");
  assert.equal(result.next, "capture-go-random");
  assert.equal(tutorial.stage().slug, "capture-go-random");
});

// ---------------------------------------------------------------------
// Stages 3-5: session-result, including loss-then-retry
// ---------------------------------------------------------------------

test("capture-go-random: the game still playing does not advance", () => {
  const tutorial = atTutorial("first-stones", "atari");
  const result = tutorial.advance({ type: "status", status: { phase: "playing" } });
  assert.equal(result.outcome, "no-change");
});

test("capture-go-random: black winning advances to capture-go-greedy", () => {
  const tutorial = atTutorial("first-stones", "atari");
  const result = tutorial.advance({ type: "status", status: { phase: "ended", winner: "black", method: "capture" } });
  assert.equal(result.outcome, "won");
  assert.equal(result.stage, "capture-go-random");
  assert.equal(result.next, "capture-go-greedy");
});

test("capture-go-random: white winning is a loss, and the stage stays put with status 'lost'", () => {
  const tutorial = atTutorial("first-stones", "atari");
  const result = tutorial.advance({ type: "status", status: { phase: "ended", winner: "white", method: "capture" } });
  assert.equal(result.outcome, "lost");
  assert.equal(result.stage, "capture-go-random");
  assert.equal(result.text, DEFAULT_STAGES[2].onLoss);
  assert.equal(tutorial.stage().slug, "capture-go-random");
  assert.equal(tutorial.stage().status, "lost");
});

test("capture-go-random: a stalemate with no winner at all is also a loss", () => {
  const tutorial = atTutorial("first-stones", "atari");
  const result = tutorial.advance({ type: "status", status: { phase: "ended", method: "stalemate" } });
  assert.equal(result.outcome, "lost");
});

test("loss-then-retry: after a loss, further game results are ignored until retry", () => {
  const tutorial = atTutorial("first-stones", "atari");
  tutorial.advance({ type: "status", status: { phase: "ended", winner: "white", method: "capture" } });
  assert.equal(tutorial.stage().status, "lost");

  // Even a black win reported now doesn't sneak the stage forward — the
  // UI is expected to have started a fresh session before it could ever
  // produce this, but the machine itself must not trust that on faith.
  const stale = tutorial.advance({ type: "status", status: { phase: "ended", winner: "black" } });
  assert.equal(stale.outcome, "no-change");
  assert.equal(tutorial.stage().status, "lost");
});

test("loss-then-retry: retry returns the stage to 'playing' without moving the index", () => {
  const tutorial = atTutorial("first-stones", "atari");
  tutorial.advance({ type: "status", status: { phase: "ended", winner: "white", method: "capture" } });
  const retry = tutorial.advance({ type: "retry" });
  assert.equal(retry.outcome, "retry");
  assert.equal(retry.stage, "capture-go-random");
  assert.equal(tutorial.stage().slug, "capture-go-random");
  assert.equal(tutorial.stage().status, "playing");
});

test("loss-then-retry: after retry, winning the replayed game advances normally", () => {
  const tutorial = atTutorial("first-stones", "atari");
  tutorial.advance({ type: "status", status: { phase: "ended", winner: "white", method: "capture" } });
  tutorial.advance({ type: "retry" });
  const result = tutorial.advance({ type: "status", status: { phase: "ended", winner: "black", method: "capture" } });
  assert.equal(result.outcome, "won");
  assert.equal(tutorial.stage().slug, "capture-go-greedy");
});

test("retry called while not lost is a no-op", () => {
  const tutorial = createTutorial(DEFAULT_STAGES);
  const result = tutorial.advance({ type: "retry" });
  assert.equal(result.outcome, "no-change");
  assert.equal(tutorial.stage().slug, "first-stones");
  assert.equal(tutorial.stage().status, "playing");
});

test("real-go-9x9: losing carries the healthy-losing onLoss text, and a subsequent black win still completes the ladder", () => {
  const tutorial = atTutorial("first-stones", "atari", "capture-go-random", "capture-go-greedy");
  assert.equal(tutorial.stage().slug, "real-go-9x9");

  const lost = tutorial.advance({ type: "status", status: { phase: "ended", winner: "white", method: "score" } });
  assert.equal(lost.outcome, "lost");
  assert.match(lost.text, /close to half/);

  tutorial.advance({ type: "retry" });
  const won = tutorial.advance({ type: "status", status: { phase: "ended", winner: "black", method: "score" } });
  assert.equal(won.outcome, "won");
  assert.equal(won.next, null);
  assert.equal(tutorial.stage(), null);
  assert.equal(tutorial.progress().complete, true);
});

test("advance() called after the ladder is complete reports 'complete' and never throws", () => {
  const tutorial = atTutorial("first-stones", "atari", "capture-go-random", "capture-go-greedy");
  tutorial.advance({ type: "status", status: { phase: "ended", winner: "black", method: "score" } });
  assert.equal(tutorial.stage(), null);
  const result = tutorial.advance({ type: "status", status: { phase: "ended", winner: "black" } });
  assert.equal(result.outcome, "complete");
  assert.equal(result.stage, null);
});

// ---------------------------------------------------------------------
// Misuse
// ---------------------------------------------------------------------

test("a stage naming an unknown winCheck throws when advance() is actually called against it", () => {
  const tutorial = createTutorial([{ slug: "bogus", title: "Bogus", winCheck: "not-a-real-check", hint: "h", onWin: "w" }]);
  assert.throws(() => tutorial.advance({ type: "placement", count: 99 }), /unknown winCheck/);
});
