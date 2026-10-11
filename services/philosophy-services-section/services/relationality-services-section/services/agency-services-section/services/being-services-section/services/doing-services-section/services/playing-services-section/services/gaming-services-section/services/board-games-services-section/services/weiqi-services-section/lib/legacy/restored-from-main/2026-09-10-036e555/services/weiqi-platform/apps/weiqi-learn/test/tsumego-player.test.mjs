// Pure helpers exported from ui/tsumego-player.mjs — no DOM involved, so
// these run directly under node:test. createTsumegoPlayer itself keeps all
// DOM access inside itself and the closures it returns, which this file
// never calls (there is no DOM in this test environment — see the ground
// rule this repo's other *-player.mjs modules follow the same way).

import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

import { setIndices, synthesizeAnswerText, feedbackFor } from "../public/js/ui/tsumego-player.mjs";

const here = path.dirname(fileURLToPath(import.meta.url));
const appRoot = path.resolve(here, "..");
const { problems } = JSON.parse(readFileSync(path.resolve(appRoot, "public/data/tsumego.json"), "utf8"));

test("setIndices groups by the set of the problem at `index`, in file order", () => {
  const captureStart = problems.findIndex((p) => p.set === "capture");
  const indices = setIndices(problems, captureStart);
  assert.equal(indices.length, 4);
  for (const i of indices) assert.equal(problems[i].set, "capture");
  assert.deepEqual(indices, [...indices].sort((a, b) => a - b), "expected file order");
});

test("setIndices covers every problem across the three sets, with no overlap", () => {
  const seen = new Set();
  for (let i = 0; i < problems.length; i++) {
    for (const j of setIndices(problems, i)) seen.add(j);
  }
  assert.equal(seen.size, problems.length);
});

test("synthesizeAnswerText names the accept move for every problem", () => {
  for (const problem of problems) {
    const text = synthesizeAnswerText(problem);
    assert.ok(text.startsWith(`Play ${problem.accept[0]}.`), `${problem.id}: ${text}`);
  }
});

test("synthesizeAnswerText folds in every line step's note", () => {
  const problem = problems.find((p) => p.id === "life-death-deny-straight");
  const text = synthesizeAnswerText(problem);
  const step = problem.lines.B7[0];
  assert.ok(text.includes(step.move));
  assert.ok(text.includes(step.reply));
  assert.ok(text.includes(step.note));
});

test("synthesizeAnswerText is just the move for a problem with an empty line", () => {
  const problem = problems.find((p) => p.id === "capture-atari");
  assert.equal(synthesizeAnswerText(problem), "Play E4.");
});

test("feedbackFor: solved", () => {
  assert.equal(feedbackFor({ solved: true, stones: [], lastMove: "E4" }), "Solved.");
});

test("feedbackFor: a legal-but-wrong move surfaces its note without an illegal-move framing", () => {
  const text = feedbackFor({ solved: false, refutation: { move: "F5", note: "nope" }, stones: [], lastMove: null });
  assert.equal(text, "F5 doesn't solve it. nope");
});

test("feedbackFor: an illegal move is framed as illegal, not as a wrong-but-legal try", () => {
  const text = feedbackFor({ solved: false, refutation: { move: "D4", reason: "illegal", note: "nope" }, stones: [], lastMove: null });
  assert.equal(text, "D4 isn't a legal move here. nope");
});

test("feedbackFor: an unfinished, still-valid attempt reads as encouragement, not failure", () => {
  const text = feedbackFor({ solved: false, stones: [], lastMove: "A7" });
  assert.equal(text, "Correct so far — your move.");
});
