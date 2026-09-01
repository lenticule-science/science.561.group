// Pure helpers exported from ui/tutorial.mjs — no DOM involved, so these
// run directly under node:test. createTutorialPlayer itself keeps all DOM
// access inside itself and the closures it returns, which this file never
// calls (there is no DOM in this test environment — see the other
// *-player.mjs modules' own test files for the same split).

import { test } from "node:test";
import assert from "node:assert/strict";

import {
  sessionRulesetFor,
  fillTemplate,
  markersForPlay,
  findCaptureEvent,
  resultFor,
  stageStates,
} from "../public/js/ui/tutorial.mjs";
import { DEFAULT_STAGES } from "../public/js/lib/tutorial-flow.mjs";

test("sessionRulesetFor: capture-go mode maps to the capture-go ruleset, everything else to chinese", () => {
  assert.equal(sessionRulesetFor({ mode: "capture-go" }), "capture-go");
  assert.equal(sessionRulesetFor({ mode: "free-placement" }), "chinese");
  assert.equal(sessionRulesetFor({ mode: "scripted" }), "chinese");
  assert.equal(sessionRulesetFor({ mode: "full-rules" }), "chinese");
});

test("fillTemplate: substitutes both placeholders", () => {
  const text = fillTemplate("Final: {blackScore} to {whiteScore}.", { blackScore: 41, whiteScore: 39.5 });
  assert.equal(text, "Final: 41 to 39.5.");
});

test("fillTemplate: passes text through unchanged when there is no score (capture-go stages)", () => {
  assert.equal(fillTemplate("First blood.", null), "First blood.");
});

test("fillTemplate: passes text through unchanged when it has no placeholders", () => {
  assert.equal(fillTemplate("Captured.", { blackScore: 1, whiteScore: 0 }), "Captured.");
});

test("markersForPlay: a placement marks last-move only, when nothing was captured", () => {
  const markers = markersForPlay("E4", { events: [] });
  assert.deepEqual(markers, [{ pt: "E4", kind: "last-move" }]);
});

test("markersForPlay: a pass marks nothing as last-move", () => {
  const markers = markersForPlay("pass", { events: [] });
  assert.deepEqual(markers, []);
});

test("markersForPlay: a capturing move marks last-move plus every captured stone", () => {
  const outcome = {
    events: [
      { type: "capture", detail: { by: "black" } },
      { type: "group-killed", detail: { stones: ["D4"] } },
    ],
  };
  const markers = markersForPlay("E4", outcome);
  assert.deepEqual(markers, [
    { pt: "E4", kind: "last-move" },
    { pt: "D4", kind: "event", label: "captured" },
  ]);
});

test("findCaptureEvent: finds a non-self capture among other events", () => {
  // `by` is a real kernel event's numeric Color code (1 = black in the
  // actual kernel), not a "black"/"white" string — findCaptureEvent
  // deliberately never reads it (see its own doc).
  const events = [{ type: "atari-given", detail: {} }, { type: "capture", detail: { by: 1 } }];
  assert.equal(findCaptureEvent(events).type, "capture");
});

test("findCaptureEvent: ignores a self-capture", () => {
  const events = [{ type: "capture", detail: { by: 1, selfCapture: true } }];
  assert.equal(findCaptureEvent(events), undefined);
});

test("findCaptureEvent: undefined on no events at all", () => {
  assert.equal(findCaptureEvent(undefined), undefined);
});

test("resultFor: first-stones reads the session's own move count", () => {
  const def = DEFAULT_STAGES[0];
  const session = { history: () => ["A1", "B2", "C3"] };
  assert.deepEqual(resultFor(def, session, "C3", {}), { type: "placement", count: 3 });
});

test("resultFor: atari extracts the capturing event from the move's own outcome", () => {
  const def = DEFAULT_STAGES[1];
  const session = {};
  const outcome = { events: [{ type: "capture", detail: { by: 1 } }] };
  const result = resultFor(def, session, "E4", outcome);
  assert.equal(result.type, "event");
  assert.equal(result.event.type, "capture");
});

test("resultFor: the game-shaped stages read the session's own status", () => {
  for (const slug of ["capture-go-random", "capture-go-greedy", "real-go-9x9"]) {
    const def = DEFAULT_STAGES.find((s) => s.slug === slug);
    const status = { phase: "playing" };
    const session = { status: () => status };
    assert.deepEqual(resultFor(def, session, "E4", {}), { type: "status", status });
  }
});

test("stageStates: marks stages before the current index done, the current index current, the rest upcoming", () => {
  const stages = [{ slug: "a", title: "A" }, { slug: "b", title: "B" }, { slug: "c", title: "C" }];
  assert.deepEqual(stageStates(stages, 1), [
    { slug: "a", title: "A", state: "done" },
    { slug: "b", title: "B", state: "current" },
    { slug: "c", title: "C", state: "upcoming" },
  ]);
});

test("stageStates: index 0 has nothing done yet", () => {
  const stages = [{ slug: "a", title: "A" }, { slug: "b", title: "B" }];
  assert.deepEqual(
    stageStates(stages, 0).map((s) => s.state),
    ["current", "upcoming"],
  );
});
