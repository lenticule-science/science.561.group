import { deepStrictEqual, ok, strictEqual } from "node:assert/strict";
import { test } from "node:test";
import {
  activateStep,
  assembleRecord,
  buildWrap,
  createRng,
  createSeedConfig,
  deriveSeed,
  firstDensityAboveFrozenThreshold,
  firstDensityBelowFrozenThreshold,
  isBootstrap2Facilitated,
  isSpiralFacilitated,
  meanStagesBySize,
  nearestDensity,
  settleFacilitation,
  stagesGrowWithSize,
} from "../src/facilitation-closure.mjs";

test("createRng: deterministic for a fixed seed", () => {
  const a = createRng(42);
  const b = createRng(42);
  const seqA = Array.from({ length: 10 }, () => a());
  const seqB = Array.from({ length: 10 }, () => b());
  deepStrictEqual(seqA, seqB);
  ok(seqA.every((v) => v >= 0 && v < 1));
});

test("deriveSeed: different labels give different seeds from the same base", () => {
  const s1 = deriveSeed(1, "bootstrap2:L=32:p=0.1:seed=0");
  const s2 = deriveSeed(1, "bootstrap2:L=32:p=0.1:seed=1");
  ok(s1 !== s2);
  strictEqual(deriveSeed(1, "x"), deriveSeed(1, "x"));
});

test("activateStep: inflationary — every active site of the Lean form activateStep_infl", () => {
  const L = 4;
  const wrap = buildWrap(L);
  const rng = createRng(7);
  const active = createSeedConfig(rng, L * L, 0.3);
  for (const model of ["bootstrap2", "spiral"]) {
    const next = activateStep({ model, active, L, wrap });
    for (let i = 0; i < active.length; i += 1) {
      if (active[i] === 1) ok(next[i] === 1, `${model}: site ${i} was active and must stay active`);
    }
  }
});

test("activateStep: monotone — a pointwise-larger active set never facilitates less, matching activateStep_mono", () => {
  const L = 4;
  const wrap = buildWrap(L);
  const rng = createRng(11);
  const a = createSeedConfig(rng, L * L, 0.2);
  const b = Uint8Array.from(a);
  b[0] = 1;
  b[5] = 1;
  for (const model of ["bootstrap2", "spiral"]) {
    const nextA = activateStep({ model, active: a, L, wrap });
    const nextB = activateStep({ model, active: b, L, wrap });
    for (let i = 0; i < a.length; i += 1) {
      if (nextA[i] === 1) ok(nextB[i] === 1, `${model}: site ${i} facilitated in a must stay facilitated in b`);
    }
  }
});

test("settleFacilitation: a fully active seed is a fixed point", () => {
  for (const model of ["bootstrap2", "spiral", "east"]) {
    const L = 5;
    const size = model === "east" ? L : L * L;
    const seedConfig = new Uint8Array(size).fill(1);
    const result = settleFacilitation({ model, seedConfig, L });
    strictEqual(result.stages, 0, `${model}: fully active seed changes on no stage`);
    strictEqual(result.frozenFraction, 0, `${model}: fully active seed has no frozen sites`);
  }
});

test("east model: a single active site activates the whole ring in exactly L-1 stages", () => {
  const L = 12;
  const seedConfig = new Uint8Array(L);
  seedConfig[0] = 1;
  const result = settleFacilitation({ model: "east", seedConfig, L });
  strictEqual(result.stages, L - 1);
  strictEqual(result.frozenFraction, 0);
});

test("bootstrap threshold 2 on a 4x4 fixture: an isolated active site is frozen", () => {
  const L = 4;
  const seedConfig = new Uint8Array(L * L);
  seedConfig[0] = 1; // site (0,0): every neighbour has exactly one active neighbour, never reaches threshold 2
  const result = settleFacilitation({ model: "bootstrap2", seedConfig, L });
  strictEqual(result.stages, 0);
  strictEqual(result.frozenFraction, 15 / 16);
});

test("bootstrap threshold 2: a corner with two active neighbours is facilitated", () => {
  const L = 4;
  const wrap = buildWrap(L);
  const active = new Uint8Array(L * L);
  active[0 + 1 * L] = 1; // (0,1): south neighbour of (0,0)
  active[1 + 0 * L] = 1; // (1,0): east neighbour of (0,0)
  ok(isBootstrap2Facilitated(active, L, 0, 0, wrap));
  ok(!isBootstrap2Facilitated(active, L, 2, 2, wrap));
});

test("spiral rule on a hand-built fixture: NE=(x+e1,x+e1+e2), SE=(x+e1,x+e1-e2) share the east neighbour", () => {
  // Biroli & Toninelli arXiv:0709.0583 section 2: NE=(east, NE-diagonal),
  // SE=(east, SE-diagonal) — east active plus both diagonals satisfies
  // NE and SE together, so (NE||SW) and (NW||SE) both hold.
  const L = 5;
  const wrap = buildWrap(L);
  const centre = { x: 2, y: 2 };
  const eastIdx = wrap.right[centre.x] + centre.y * L;
  const neDiagIdx = wrap.right[centre.x] + wrap.up[centre.y] * L;
  const seDiagIdx = wrap.right[centre.x] + wrap.down[centre.y] * L;

  const facilitated = new Uint8Array(L * L);
  facilitated[eastIdx] = 1;
  facilitated[neDiagIdx] = 1;
  facilitated[seDiagIdx] = 1;
  ok(isSpiralFacilitated(facilitated, L, centre.x, centre.y, wrap));

  const notFacilitated = new Uint8Array(L * L);
  notFacilitated[eastIdx] = 1; // east active alone satisfies neither NE nor SE (diagonals are empty)
  ok(!isSpiralFacilitated(notFacilitated, L, centre.x, centre.y, wrap));
});

/**
 * Small fixture: mean frozen fraction descends from 0.9 to 0.1 as density
 * rises through 0.2, 0.29, 0.3, 0.4 at L=64 — a melting transition between
 * p=0.29 and p=0.3, straddling the Spiral Model's p=0.295 in active-density
 * units.
 */
const FROZEN_FRACTION_FIXTURE = [
  { L: 64, p: 0.2, meanFrozenFraction: 0.9 },
  { L: 64, p: 0.29, meanFrozenFraction: 0.8 },
  { L: 64, p: 0.3, meanFrozenFraction: 0.1 },
  { L: 64, p: 0.4, meanFrozenFraction: 0.0 },
];

test("firstDensityAboveFrozenThreshold: first ascending density whose mean frozen fraction exceeds threshold", () => {
  strictEqual(firstDensityAboveFrozenThreshold(FROZEN_FRACTION_FIXTURE, 64, 0.5), 0.2);
  strictEqual(firstDensityAboveFrozenThreshold(FROZEN_FRACTION_FIXTURE, 64, 0.95), null);
});

test("firstDensityBelowFrozenThreshold: first ascending density whose mean frozen fraction drops below threshold", () => {
  strictEqual(firstDensityBelowFrozenThreshold(FROZEN_FRACTION_FIXTURE, 64, 0.5), 0.3);
  strictEqual(firstDensityBelowFrozenThreshold(FROZEN_FRACTION_FIXTURE, 64, -1), null);
});

test("nearestDensity: closest grid density to a target, ties broken toward the first occurrence", () => {
  strictEqual(nearestDensity([1, 5, 10], 6), 5);
  strictEqual(nearestDensity([0.2, 0.29, 0.3, 0.4], 0.31), 0.3);
  strictEqual(nearestDensity([2, 8], 5), 2);
});

/**
 * Small fixture: mean stage count (κ_L) at one density across four sizes,
 * non-decreasing through L=32,64,128 then dropping at L=256.
 */
const KAPPA_L_FIXTURE = [
  { L: 32, p: 0.295, meanStages: 3 },
  { L: 64, p: 0.295, meanStages: 5 },
  { L: 128, p: 0.295, meanStages: 5 },
  { L: 256, p: 0.295, meanStages: 4 },
];

test("meanStagesBySize: mean stage count at one density, one value per requested size", () => {
  deepStrictEqual(meanStagesBySize(KAPPA_L_FIXTURE, 0.295, [32, 64, 128, 256]), [3, 5, 5, 4]);
  deepStrictEqual(meanStagesBySize(KAPPA_L_FIXTURE, 0.295, [32, 64, 128, 256, 512]), [3, 5, 5, 4, null]);
});

test("stagesGrowWithSize: false when κ_L drops between the last two sizes", () => {
  strictEqual(stagesGrowWithSize(KAPPA_L_FIXTURE, 0.295, [32, 64, 128, 256]), false);
  strictEqual(stagesGrowWithSize(KAPPA_L_FIXTURE, 0.295, [32, 64, 128]), true);
  strictEqual(stagesGrowWithSize(KAPPA_L_FIXTURE, 0.295, [32, 64, 128, 512]), null);
});

/**
 * Build a minimal cell object for `assembleRecord` fixture tests: one seed,
 * mean stats equal to that seed's values.
 */
function makeCell(L, p, meanStages, meanFrozenFraction) {
  return {
    L,
    p,
    seeds: [{ seed: 0, stages: meanStages, frozenFraction: meanFrozenFraction, exhausted: false }],
    meanStages,
    maxStages: meanStages,
    meanFrozenFraction,
    anyExhausted: false,
  };
}

test("assembleRecord: spiral reading carries kappaLGrowthNearTransition; other models do not", () => {
  const spec = (densities) => ({
    description: "d",
    rule: "r",
    citation: "c",
    dims: 2,
    sizes: [32, 64],
    densities,
    seedCount: 1,
  });
  const modelSpecs = {
    bootstrap2: spec([0.2, 0.29, 0.3, 0.4]),
    spiral: spec([0.2, 0.295, 0.4]),
    east: spec([0.2, 0.29, 0.3, 0.4]),
  };
  const cellsFor = (meanStagesAt295) => [
    makeCell(32, 0.2, 1, 0.9),
    makeCell(32, 0.295, meanStagesAt295[0], 0.6),
    makeCell(32, 0.4, 1, 0.0),
    makeCell(64, 0.2, 1, 0.9),
    makeCell(64, 0.295, meanStagesAt295[1], 0.1),
    makeCell(64, 0.4, 1, 0.0),
  ];
  const modelCells = {
    bootstrap2: cellsFor([3, 5]),
    spiral: cellsFor([3, 5]),
    east: cellsFor([3, 5]),
  };
  const record = assembleRecord({
    checkedAt: "2026-09-04T00:00:00.000Z",
    baseSeed: 1,
    maxStagesPerCell: 100,
    modelSpecs,
    modelCells,
  });
  deepStrictEqual(record.reading.spiral.kappaLGrowthNearTransition, {
    density: 0.295,
    meanStagesBySize: [3, 5],
    nonDecreasingAcrossSizes: true,
  });
  strictEqual(record.reading.bootstrap2.kappaLGrowthNearTransition, undefined);
  strictEqual(record.reading.east.kappaLGrowthNearTransition, undefined);
  strictEqual(record.reading.bootstrap2.firstDensityBelowFrozenFraction0_5AtLargestL, 0.295);
});
