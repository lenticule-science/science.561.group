import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { resolve } from "node:path";
import { ENGINE_MODULES, retargetSpecifiers } from "../scripts/build-browser-engine.mjs";

const engineRoot = resolve(import.meta.dirname, "..", "public", "js");
const browser = await Promise.all(
  ENGINE_MODULES.map(async (name) => [name, await import(resolve(engineRoot, `${name}.mjs`))]),
).then((entries) => Object.fromEntries(entries));

test("the projected engine loads as plain ESM, with no TypeScript left in it", async () => {
  for (const name of ENGINE_MODULES) {
    const source = await readFile(resolve(engineRoot, `${name}.mjs`), "utf8");
    assert.doesNotMatch(source, /\.mts["']/u, `${name}.mjs must not import a .mts specifier`);
    assert.doesNotMatch(source, /^\s*(?:export\s+)?interface\s/mu, `${name}.mjs must not declare an interface`);
    assert.doesNotMatch(source, /^import type\s/mu, `${name}.mjs must not carry a type-only import`);
  }
});

test("the projected scheduler agrees with the upstream package it was stripped from", async () => {
  const upstream = await import("@red-cup-engineering/lantern-561-group/srs");
  assert.equal(browser.srs.DECAY, upstream.DECAY);
  assert.equal(browser.srs.FACTOR, upstream.FACTOR);
  assert.equal(browser.srs.DEFAULT_TARGET_RETENTION, upstream.DEFAULT_TARGET_RETENTION);
  assert.deepEqual({ ...browser.srs.STAGE_CUTS }, { ...upstream.STAGE_CUTS });

  for (const [t, S] of [[0, 1], [1, 1], [10, 2.5], [365, 0.4], [3, 0]]) {
    assert.equal(browser.srs.recallProbability(t, S), upstream.recallProbability(t, S), `R(${t}, ${S})`);
  }
  for (const grade of [1, 2, 3, 4]) {
    assert.deepEqual(
      browser.srs.reviewCard({ stability: 2.5, difficulty: 5, lastReviewedAt: 10 }, grade, 20),
      upstream.reviewCard({ stability: 2.5, difficulty: 5, lastReviewedAt: 10 }, grade, 20),
      `a fresh review at grade ${grade} must schedule identically`,
    );
    assert.deepEqual(
      browser.srs.reviewCard({ stability: 0, difficulty: 5 }, grade, 20),
      upstream.reviewCard({ stability: 0, difficulty: 5 }, grade, 20),
      `a first review at grade ${grade} must seed identically`,
    );
  }
});

test("the projected light cone agrees with the upstream package", async () => {
  const upstream = await import("@red-cup-engineering/lantern-561-group/lightcone");
  const rooms = [{ id: "a" }, { id: "b" }, { id: "c" }];
  const doors = [{ from: "a", to: "b", weight: "hard", reason: "t" }, { from: "b", to: "c", weight: "hard", reason: "t" }];
  const cards = [
    { id: "1", roomId: "a", kind: "cloze", front: "", back: "", stability: 40, difficulty: 5, lastReviewedAt: 0 },
    { id: "2", roomId: "b", kind: "cloze", front: "", back: "", stability: 0.2, difficulty: 5, lastReviewedAt: 0 },
  ];
  const halls = [{ id: "hall:0", intent: ["type:concept"], rooms: ["a", "b"], stable: true }];

  for (const R of [0.95, 0.8, 0.6, 0.2]) {
    assert.equal(browser.lightcone.classifyStage(R), upstream.classifyStage(R), `stage at R=${R}`);
  }
  const mine = browser.lightcone.computeLightCone(rooms, doors, cards, halls, 5);
  const theirs = upstream.computeLightCone(rooms, doors, cards, halls, 5);
  assert.deepEqual([...mine.states.entries()], [...theirs.states.entries()]);
  assert.deepEqual([...mine.reachable], [...theirs.reachable]);
  assert.deepEqual([...browser.lightcone.rootRooms(rooms, doors)], [...upstream.rootRooms(rooms, doors)]);
});

test("specifier retargeting rewrites only relative engine imports", () => {
  assert.equal(
    retargetSpecifiers(`import { x } from './srs.mts';\nimport y from "./types.mts";`),
    `import { x } from './srs.mjs';\nimport y from "./types.mjs";`,
  );
  assert.equal(
    retargetSpecifiers(`import z from "@scope/pkg/srs.mts";`),
    `import z from "@scope/pkg/srs.mts";`,
  );
});
