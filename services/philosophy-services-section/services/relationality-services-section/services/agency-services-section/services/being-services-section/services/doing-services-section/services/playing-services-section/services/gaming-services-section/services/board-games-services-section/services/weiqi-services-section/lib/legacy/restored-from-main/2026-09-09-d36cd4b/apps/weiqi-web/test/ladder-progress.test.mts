// The Capture Go onboarding ladder's unlock rule (Experience Brief item 2 /
// task item 2), driven directly as pure logic -- no DOM, no localStorage.
// See public/js/ladder-progress.mjs's own header for why this is a
// separate module from play-app.mjs.

import { test } from "node:test";
import assert from "node:assert/strict";
import {
  LADDER_PROGRESS_KEY,
  unlockedCount,
  isRungUnlocked,
  addClearedRung,
  parseClearedRungIds,
} from "../public/js/ladder-progress.mjs";

const RUNGS = ["first-captures", "taking-whats-offered", "mind-your-liberties", "wider-board"];

test("rung 0 is always unlocked with no progress at all", () => {
  assert.equal(unlockedCount(RUNGS, []), 0);
  assert.equal(isRungUnlocked(0, RUNGS, []), true);
  assert.equal(isRungUnlocked(1, RUNGS, []), false);
});

test("clearing rung 0 unlocks rung 1 only", () => {
  const cleared = ["first-captures"];
  assert.equal(unlockedCount(RUNGS, cleared), 1);
  assert.equal(isRungUnlocked(1, RUNGS, cleared), true);
  assert.equal(isRungUnlocked(2, RUNGS, cleared), false);
});

test("clearing rungs out of order does not unlock past the first gap", () => {
  // Rung 2 cleared without rung 1 -- shouldn't be reachable through a UI
  // that disables locked buttons, but the rule itself must still hold if
  // it somehow happens (e.g. hand-edited localStorage).
  const cleared = ["first-captures", "mind-your-liberties"];
  assert.equal(unlockedCount(RUNGS, cleared), 1, "the gap at rung 1 caps progress at rung 1 unlocked");
  assert.equal(isRungUnlocked(2, RUNGS, cleared), false);
});

test("clearing every rung unlocks the whole ladder, capped at the last real rung", () => {
  const cleared = [...RUNGS];
  assert.equal(unlockedCount(RUNGS, cleared), RUNGS.length);
  for (let i = 0; i < RUNGS.length; i++) assert.equal(isRungUnlocked(i, RUNGS, cleared), true);
});

test("isRungUnlocked rejects a negative index", () => {
  assert.equal(isRungUnlocked(-1, RUNGS, []), false);
});

test("addClearedRung appends a new id without mutating the input array", () => {
  const before = ["first-captures"];
  const after = addClearedRung(before, "taking-whats-offered");
  assert.deepEqual(before, ["first-captures"], "input array must not be mutated");
  assert.deepEqual(after, ["first-captures", "taking-whats-offered"]);
});

test("addClearedRung is idempotent -- clearing an already-cleared rung again does not duplicate it", () => {
  const before = ["first-captures", "taking-whats-offered"];
  const after = addClearedRung(before, "first-captures");
  assert.deepEqual(after, before);
  assert.equal(after, before, "a no-op clear returns the same reference (deliberate: lets a caller skip a re-render/re-save when nothing changed)");
});

test("parseClearedRungIds degrades to an empty array for missing/malformed storage", () => {
  assert.deepEqual(parseClearedRungIds(null), []);
  assert.deepEqual(parseClearedRungIds(""), []);
  assert.deepEqual(parseClearedRungIds("not json"), []);
  assert.deepEqual(parseClearedRungIds("42"), []);
  assert.deepEqual(parseClearedRungIds('{"not":"an array"}'), []);
  assert.deepEqual(parseClearedRungIds('["a", 3, null, "b"]'), ["a", "b"], "non-string entries are filtered out, not thrown on");
});

test("parseClearedRungIds round-trips a real JSON.stringify(ids) value", () => {
  const ids = ["first-captures", "taking-whats-offered"];
  assert.deepEqual(parseClearedRungIds(JSON.stringify(ids)), ids);
});

test("LADDER_PROGRESS_KEY is a namespaced, non-empty localStorage key", () => {
  assert.equal(typeof LADDER_PROGRESS_KEY, "string");
  assert.ok(LADDER_PROGRESS_KEY.startsWith("weiqi-"));
});

test("ladder-rungs.json's own rung ids satisfy the ordering the unlock rule assumes (sanity check against the real data file)", async () => {
  const { readFileSync } = await import("node:fs");
  const path = await import("node:path");
  const { fileURLToPath } = await import("node:url");
  const here = path.dirname(fileURLToPath(import.meta.url));
  const doc = JSON.parse(readFileSync(path.resolve(here, "../public/data/ladder-rungs.json"), "utf8"));
  const ids = doc.rungs.map((r) => r.id);
  assert.equal(new Set(ids).size, ids.length, "rung ids must be unique");
  assert.ok(ids.length >= 3, "the ladder should have more than a token one or two rungs");
  for (const rung of doc.rungs) {
    assert.ok(typeof rung.introQuote === "string" && rung.introQuote.length > 0, `${rung.id}: introQuote is required`);
    assert.ok(typeof rung.introSource === "string" && rung.introSource.length > 0, `${rung.id}: introSource is required`);
    assert.ok(typeof rung.celebration === "string" && rung.celebration.length > 0, `${rung.id}: celebration is required`);
  }
});
