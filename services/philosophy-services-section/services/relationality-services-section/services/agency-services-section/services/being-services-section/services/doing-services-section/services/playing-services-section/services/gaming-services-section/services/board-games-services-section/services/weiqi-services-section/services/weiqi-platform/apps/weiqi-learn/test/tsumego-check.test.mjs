// tsumego-check.mjs tests, run against the real, built kernel tree (not the
// .mts source — see that module's own header) and the real problem set, so
// a change to either would show up here.

import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

import { checkAttempt } from "../public/js/lib/tsumego-check.mjs";

const here = path.dirname(fileURLToPath(import.meta.url));
const appRoot = path.resolve(here, "..");
const { problems } = JSON.parse(readFileSync(path.resolve(appRoot, "public/data/tsumego.json"), "utf8"));

function find(id) {
  const problem = problems.find((p) => p.id === id);
  assert.ok(problem, `no such problem: ${id}`);
  return problem;
}

test("a no-move attempt is unsolved, with no refutation and the diagram's own stones", () => {
  const problem = find("capture-atari");
  const result = checkAttempt(problem, []);
  assert.equal(result.solved, false);
  assert.equal(result.refutation, undefined);
  assert.equal(result.lastMove, null);
  assert.deepEqual(new Set(result.stones.map((s) => s.pt)), new Set(problem.stones.map((s) => s.pt)));
});

test("a one-move problem is solved by playing the accept move", () => {
  const problem = find("capture-atari");
  const result = checkAttempt(problem, ["E4"]);
  assert.equal(result.solved, true);
  assert.equal(result.lastMove, "E4");
  assert.ok(!result.stones.some((s) => s.pt === "D4"), "the captured stone should be gone from the reported board");
});

test("a legal but wrong first move reports a refutation, not an illegal-move reason", () => {
  const problem = find("capture-atari");
  const result = checkAttempt(problem, ["F5"]);
  assert.equal(result.solved, false);
  assert.equal(result.refutation.move, "F5");
  assert.equal(result.refutation.reason, undefined);
  assert.equal(result.refutation.note, problem.failNote);
});

test("an illegal first move (occupied point) is reported as illegal", () => {
  const problem = find("capture-atari");
  const result = checkAttempt(problem, ["D4"]); // already a White stone
  assert.equal(result.solved, false);
  assert.equal(result.refutation.reason, "illegal");
});

test("a problem with a scripted line: matching the reply all the way through solves it", () => {
  const problem = find("life-death-deny-straight");
  const partial = checkAttempt(problem, ["B7"]);
  assert.equal(partial.solved, false);
  assert.equal(partial.refutation, undefined, "a correct-so-far, unfinished attempt is not a refutation");
  assert.equal(partial.lastMove, "A7", "White's scripted reply should have been auto-played");

  const full = checkAttempt(problem, ["B7", "C7"]);
  assert.equal(full.solved, true);
  assert.equal(full.lastMove, "C7");
});

test("a problem with a scripted line: the wrong reply is refuted against the answer key's expected move", () => {
  const problem = find("life-death-deny-straight");
  const result = checkAttempt(problem, ["B7", "A1"]);
  assert.equal(result.solved, false);
  assert.equal(result.refutation.move, "A1");
  assert.equal(result.refutation.expected, "C7");
  assert.equal(result.refutation.note, problem.lines.B7[0].note);
});

test("checkAttempt never mutates the problem object it was handed", () => {
  const problem = find("life-death-deny-straight");
  const before = JSON.parse(JSON.stringify(problem));
  checkAttempt(problem, ["B7", "C7"]);
  assert.deepEqual(problem, before);
});

test("every problem in tsumego.json is solved end to end by its own accept move plus its line's replies", () => {
  for (const problem of problems) {
    for (const accept of problem.accept) {
      const studentMoves = [accept, ...problem.lines[accept].map((step) => step.reply)];
      const result = checkAttempt(problem, studentMoves);
      assert.equal(result.solved, true, `${problem.id}: expected accept "${accept}" plus its line to solve the problem`);
    }
  }
});
