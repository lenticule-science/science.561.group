/**
 * Pure facilitation-closure algebra for deterministic KCMs, matching
 * `AperiodicOrder.GlassDynamics.KCM.activateStep`: `next x = a x ||
 * sites.any (y => a y && fac y x)`, synchronous per stage. Bootstrap
 * percolation/Spiral use monotone threshold/pair predicates in place of a
 * single `fac` edge, preserving `activateStep_infl`/`_mono`. No I/O.
 * @module facilitation-closure
 */

import { settle, SettlementDivergence } from "@lenticule-science/obsmetrologic-settlement";

/**
 * splitmix32: a small, fast, deterministic 32-bit PRNG. Returns a `next()`
 * closure producing floats in `[0, 1)`; the same seed always produces the
 * same sequence (the replay ethic — no `Math.random`).
 *
 * @param {number} seed - 32-bit integer seed.
 * @returns {() => number} `next()`, called once per random draw.
 */
export function createRng(seed) {
  let state = seed >>> 0;
  return function next() {
    state = (state + 0x9e3779b9) >>> 0;
    let z = state;
    z = Math.imul(z ^ (z >>> 16), 0x85ebca6b) >>> 0;
    z = Math.imul(z ^ (z >>> 13), 0xc2b2ae35) >>> 0;
    z = (z ^ (z >>> 16)) >>> 0;
    return z / 4294967296;
  };
}

/**
 * FNV-1a string hash to a 32-bit unsigned integer, used to derive one
 * deterministic per-cell seed from a base seed and a label (model, L, p,
 * seed index) without any two cells sharing a random stream.
 *
 * @param {string} text
 * @returns {number} 32-bit unsigned integer.
 */
export function fnv1a(text) {
  let hash = 0x811c9dc5;
  for (let i = 0; i < text.length; i += 1) {
    hash ^= text.charCodeAt(i);
    hash = Math.imul(hash, 0x01000193) >>> 0;
  }
  return hash >>> 0;
}

/**
 * Derive one 32-bit cell seed from a base seed and a label, deterministic
 * and reproducible: `fnv1a(\`${baseSeed}:${label}\`)`.
 *
 * @param {number} baseSeed
 * @param {string} label
 * @returns {number}
 */
export function deriveSeed(baseSeed, label) {
  return fnv1a(`${baseSeed}:${label}`);
}

/**
 * Build the once-per-lattice-size periodic (torus/ring) neighbour index
 * tables, reused across every stage of a settling run so wraparound is not
 * recomputed with `%` on every site every stage.
 *
 * @param {number} L - Lattice side length (or ring length for 1D).
 * @returns {{up: Int32Array, down: Int32Array, left: Int32Array, right: Int32Array}}
 */
export function buildWrap(L) {
  const up = new Int32Array(L);
  const down = new Int32Array(L);
  const left = new Int32Array(L);
  const right = new Int32Array(L);
  for (let i = 0; i < L; i += 1) {
    up[i] = (i - 1 + L) % L;
    down[i] = (i + 1) % L;
    left[i] = (i - 1 + L) % L;
    right[i] = (i + 1) % L;
  }
  return { up, down, left, right };
}

/**
 * A deterministic seed configuration: `size` sites, each active
 * (initially empty/facilitated-away, per the memo's convention that `p`
 * is the initial *active* density) independently with probability `p`,
 * drawn in site order from `rng`.
 *
 * @param {() => number} rng
 * @param {number} size
 * @param {number} p
 * @returns {Uint8Array} `1` active, `0` inactive, length `size`.
 */
export function createSeedConfig(rng, size, p) {
  const active = new Uint8Array(size);
  for (let i = 0; i < size; i += 1) {
    active[i] = rng() < p ? 1 : 0;
  }
  return active;
}

/**
 * Two-dimensional bootstrap percolation, threshold 2 (Chalupa–Leath–Reich
 * 1979): a site is facilitated iff at least 2 of its 4 von Neumann
 * neighbours (N, S, E, W) on the L×L torus are active.
 *
 * @param {Uint8Array} active
 * @param {number} L
 * @param {number} x
 * @param {number} y
 * @param {{up: Int32Array, down: Int32Array, left: Int32Array, right: Int32Array}} wrap
 * @returns {boolean}
 */
export function isBootstrap2Facilitated(active, L, x, y, wrap) {
  const n = active[x + wrap.up[y] * L];
  const s = active[x + wrap.down[y] * L];
  const e = active[wrap.right[x] + y * L];
  const w = active[wrap.left[x] + y * L];
  return n + s + e + w >= 2;
}

/**
 * The Spiral Model (Biroli & Toninelli, "Spiral model, jamming percolation
 * and glass-jamming transitions", arXiv:0709.0583, §2 — the same model
 * introduced with Fisher, Phys. Rev. Lett. 96, 035702, 2006) on an L×L
 * torus. Verified against the paper's §2 definition: with `e1`, `e2` the
 * coordinate unit vectors, NE=(x+e1, x+e1+e2), SW=(x-e2, x-e1-e2),
 * NW=(x-e1, x-e1+e2), SE=(x+e1, x+e1-e2) — each pair is one orthogonal
 * neighbour plus its diagonal extension, not two orthogonal neighbours. A
 * site is facilitated iff (NE both active OR SW both active) AND (NW both
 * active OR SE both active).
 *
 * @param {Uint8Array} active
 * @param {number} L
 * @param {number} x
 * @param {number} y
 * @param {{up: Int32Array, down: Int32Array, left: Int32Array, right: Int32Array}} wrap
 * @returns {boolean}
 */
export function isSpiralFacilitated(active, L, x, y, wrap) {
  const row = y * L;
  const upRow = wrap.up[y] * L;
  const downRow = wrap.down[y] * L;
  const east = active[wrap.right[x] + row];
  const west = active[wrap.left[x] + row];
  const south = active[x + downRow];
  const neDiag = active[wrap.right[x] + upRow];
  const swDiag = active[wrap.left[x] + downRow];
  const nwDiag = active[wrap.left[x] + upRow];
  const seDiag = active[wrap.right[x] + downRow];
  const neSatisfied = east && neDiag;
  const swSatisfied = south && swDiag;
  const nwSatisfied = west && nwDiag;
  const seSatisfied = east && seDiag;
  return (neSatisfied || swSatisfied) && (nwSatisfied || seSatisfied);
}

/**
 * The 1D East model's deterministic skeleton on a ring of L sites: a site
 * is facilitated iff its left neighbour is active (Sollich & Evans 1999
 * put the model's glassiness in its stochastic rates, not this closure;
 * used here as the negative control — no frozen residual for any seed).
 *
 * @param {Uint8Array} active
 * @param {number} x
 * @param {{left: Int32Array}} wrap
 * @returns {boolean}
 */
export function isEastFacilitated(active, x, wrap) {
  return active[wrap.left[x]] === 1;
}

/** @type {ReadonlyArray<"bootstrap2"|"spiral"|"east">} */
export const MODEL_NAMES = ["bootstrap2", "spiral", "east"];

/**
 * The Spiral Model's directed-site-percolation threshold, `p_c^DP ~= 0.705`
 * (Biroli & Toninelli, arXiv:0709.0583 section 2), converted into this
 * measurement's active-density units: `1 - 0.705 = 0.295`.
 * @type {number}
 */
export const SPIRAL_TRANSITION_ACTIVE_DENSITY = 0.295;

/**
 * Lattice dimensionality and site count for a model at size L: bootstrap2
 * and spiral run on an L×L torus (L² sites); east runs on a ring of L
 * sites.
 *
 * @param {"bootstrap2"|"spiral"|"east"} model
 * @param {number} L
 * @returns {{dims: 1|2, size: number}}
 */
export function latticeShape(model, L) {
  if (model === "east") return { dims: 1, size: L };
  return { dims: 2, size: L * L };
}

/**
 * One synchronous `activateStep`: `next[x] = active[x] || facilitated(x)`,
 * computed for every site from the `active` snapshot only (no
 * read-after-write within a stage), exactly the Lean semantics with the
 * model's monotone facilitation predicate standing in for `fac`.
 *
 * @param {{model: "bootstrap2"|"spiral"|"east", active: Uint8Array, L: number, wrap: {up: Int32Array, down: Int32Array, left: Int32Array, right: Int32Array}}} options
 * @returns {Uint8Array} The next stage's configuration, same length as `active`.
 */
export function activateStep({ model, active, L, wrap }) {
  const next = new Uint8Array(active.length);
  if (model === "east") {
    for (let x = 0; x < L; x += 1) {
      next[x] = active[x] || (isEastFacilitated(active, x, wrap) ? 1 : 0);
    }
    return next;
  }
  for (let y = 0; y < L; y += 1) {
    const row = y * L;
    for (let x = 0; x < L; x += 1) {
      const i = row + x;
      if (active[i]) {
        next[i] = 1;
        continue;
      }
      const facilitated =
        model === "bootstrap2"
          ? isBootstrap2Facilitated(active, L, x, y, wrap)
          : isSpiralFacilitated(active, L, x, y, wrap);
      next[i] = facilitated ? 1 : 0;
    }
  }
  return next;
}

/**
 * Run the deterministic facilitation closure to its fixed point (or to the
 * per-cell stage budget, whichever comes first): repeatedly apply
 * `activateStep`, counting only stages that change at least one site as
 * `κ_L` per the closure-ordinal reading (the Lean `activateStep_fixed`
 * theorem: once nothing changes, the field is `activateStep`-fixed, i.e.
 * the facilitation closure of the seed has been reached).
 *
 * @param {{model: "bootstrap2"|"spiral"|"east", seedConfig: Uint8Array, L: number, maxStages?: number}} options
 * @returns {{
 *   stages: number,
 *   frozenFraction: number,
 *   changedPerStage: number[],
 *   exhausted: boolean,
 *   finalActiveFraction: number,
 * }} `stages` is κ_L; `frozenFraction` is the fixed-point (or budget-cutoff)
 *   inactive-site fraction; `exhausted` is true iff the per-cell stage
 *   budget was hit before a fixed point.
 */
export function settleFacilitation({ model, seedConfig, L, maxStages = 200000 }) {
  const wrap = buildWrap(L);
  const changedPerStage = [];
  let previous = null;
  let current = seedConfig;
  let exhausted = false;
  // The cell fiber here is the two-element knowledge order 0 ≤ 1 (inactive ≤ active), whose
  // join is OR and whose bottom is 0; a configuration is one section of that fiber over the
  // lattice, so the settling merge is the pointwise OR. `activateStep` is inflationary and
  // monotone (the Lean `activateStep_infl`/`_mono`), so the orbit only climbs. Recording the
  // per-stage changed-site count and the running state as the merge is taken is the whole of
  // this measurement's own bookkeeping; the ITERATION is the settlement node's, not ours.
  const merge = (before, after) => {
    const joined = new Uint8Array(before.length);
    let changed = 0;
    for (let i = 0; i < joined.length; i += 1) {
      joined[i] = before[i] | after[i];
      if (previous !== null && joined[i] !== previous[i]) changed += 1;
    }
    if (previous !== null) changedPerStage.push(changed);
    previous = joined;
    current = joined;
    return joined;
  };
  const equal = (a, b) => {
    for (let i = 0; i < a.length; i += 1) if (a[i] !== b[i]) return false;
    return true;
  };
  try {
    settle((active) => activateStep({ model, active, L, wrap }), seedConfig, {
      merge,
      equal,
      maxIter: maxStages,
    });
    changedPerStage.pop(); // the quiescent stage that proved the fixed point changed nothing
  } catch (error) {
    if (!(error instanceof SettlementDivergence)) throw error;
    exhausted = true; // the per-cell stage budget ran out before quiescence
  }
  const stages = changedPerStage.length;
  let activeCount = 0;
  for (let i = 0; i < current.length; i += 1) activeCount += current[i];
  const frozenFraction = (current.length - activeCount) / current.length;
  return {
    stages,
    frozenFraction,
    changedPerStage,
    exhausted,
    finalActiveFraction: activeCount / current.length,
  };
}

/**
 * Mean of a numeric array (0 for an empty array).
 *
 * @param {number[]} values
 * @returns {number}
 */
export function mean(values) {
  if (values.length === 0) return 0;
  return values.reduce((sum, value) => sum + value, 0) / values.length;
}

/**
 * Run one (model, L, p) cell over `seedCount` deterministic seeds derived
 * from `baseSeed`, and summarize: per-seed stage counts and frozen
 * fractions are kept in full (never collapsed to only the mean), plus the
 * cell's mean/max stage count, mean frozen fraction, and whether any seed
 * hit the stage budget.
 *
 * @param {{model: "bootstrap2"|"spiral"|"east", L: number, p: number, seedCount: number, baseSeed: number, maxStages?: number}} options
 * @returns {{
 *   L: number, p: number,
 *   seeds: Array<{seed: number, stages: number, frozenFraction: number, exhausted: boolean}>,
 *   meanStages: number, maxStages: number, meanFrozenFraction: number, anyExhausted: boolean,
 * }}
 */
export function runCell({ model, L, p, seedCount, baseSeed, maxStages = 200000 }) {
  const { size } = latticeShape(model, L);
  const seeds = [];
  for (let seedIndex = 0; seedIndex < seedCount; seedIndex += 1) {
    const cellSeed = deriveSeed(baseSeed, `${model}:L=${L}:p=${p}:seed=${seedIndex}`);
    const rng = createRng(cellSeed);
    const seedConfig = createSeedConfig(rng, size, p);
    const result = settleFacilitation({ model, seedConfig, L, maxStages });
    seeds.push({
      seed: cellSeed,
      stages: result.stages,
      frozenFraction: result.frozenFraction,
      exhausted: result.exhausted,
    });
  }
  return {
    L,
    p,
    seeds,
    meanStages: mean(seeds.map((s) => s.stages)),
    maxStages: Math.max(...seeds.map((s) => s.stages)),
    meanFrozenFraction: mean(seeds.map((s) => s.frozenFraction)),
    anyExhausted: seeds.some((s) => s.exhausted),
  };
}

/**
 * The first `p` (grid order, ascending) at which a model's mean frozen
 * fraction at lattice size `L` first exceeds `threshold`, or `null` if no
 * grid density does.
 *
 * @param {Array<{L: number, p: number, meanFrozenFraction: number}>} cells
 * @param {number} L
 * @param {number} threshold
 * @returns {number|null}
 */
export function firstDensityAboveFrozenThreshold(cells, L, threshold) {
  const atSize = cells.filter((cell) => cell.L === L).sort((a, b) => a.p - b.p);
  const hit = atSize.find((cell) => cell.meanFrozenFraction > threshold);
  return hit ? hit.p : null;
}

/**
 * The first `p` (grid order, ascending) at which a model's mean frozen
 * fraction at lattice size `L` first drops below `threshold`, or `null` if
 * no grid density does. Scanning ascending density for a downward crossing
 * locates a melting transition (frozen fraction high below the threshold
 * density, low above it), the complementary question to
 * `firstDensityAboveFrozenThreshold`'s upward crossing.
 *
 * @param {Array<{L: number, p: number, meanFrozenFraction: number}>} cells
 * @param {number} L
 * @param {number} threshold
 * @returns {number|null}
 */
export function firstDensityBelowFrozenThreshold(cells, L, threshold) {
  const atSize = cells.filter((cell) => cell.L === L).sort((a, b) => a.p - b.p);
  const hit = atSize.find((cell) => cell.meanFrozenFraction < threshold);
  return hit === undefined ? null : hit.p;
}

/**
 * The density in `densities` closest to `target` (ties broken toward the
 * first occurrence in `densities` order).
 *
 * @param {number[]} densities
 * @param {number} target
 * @returns {number}
 */
export function nearestDensity(densities, target) {
  let best = densities[0];
  let bestDiff = Math.abs(densities[0] - target);
  for (const d of densities) {
    const diff = Math.abs(d - target);
    if (diff < bestDiff) {
      best = d;
      bestDiff = diff;
    }
  }
  return best;
}

/**
 * A model's mean stage count at density `p`, one value per size in
 * `sizes` (in the given order), or `null` where `p` is not present at
 * that size.
 *
 * @param {Array<{L: number, p: number, meanStages: number}>} cells
 * @param {number} p
 * @param {number[]} sizes
 * @returns {Array<number|null>}
 */
export function meanStagesBySize(cells, p, sizes) {
  const byL = new Map();
  for (const cell of cells) {
    if (cell.p === p) byL.set(cell.L, cell.meanStages);
  }
  return sizes.map((L) => (byL.has(L) ? byL.get(L) : null));
}

/**
 * The maximum per-seed stage count (`κ_L`) observed across all of a
 * model's cells.
 *
 * @param {Array<{seeds: Array<{stages: number}>}>} cells
 * @returns {number}
 */
export function maxStagesObserved(cells) {
  let max = 0;
  for (const cell of cells) {
    for (const seed of cell.seeds) {
      if (seed.stages > max) max = seed.stages;
    }
  }
  return max;
}

/**
 * Whether a model's mean stage count at density `p` is non-decreasing as
 * `L` grows through `sizes` (ascending order) — the finite-size signature
 * of a growing correlation length/relaxation time at a jamming
 * transition. Returns `null` when `p` is not present at every size (the
 * question is undefined without a full column).
 *
 * @param {Array<{L: number, p: number, meanStages: number}>} cells
 * @param {number} p
 * @param {number[]} sizes - Ascending lattice sizes to check.
 * @returns {boolean|null}
 */
export function stagesGrowWithSize(cells, p, sizes) {
  const byL = new Map();
  for (const cell of cells) {
    if (cell.p === p) byL.set(cell.L, cell.meanStages);
  }
  const series = sizes.map((L) => byL.get(L));
  if (series.some((v) => v === undefined)) return null;
  for (let i = 1; i < series.length; i += 1) {
    if (series[i] < series[i - 1]) return false;
  }
  return true;
}

/**
 * Assemble the final measurement record document from the grid's raw
 * per-model cell results. Pure: no `checkedAt`/clock reads here — the
 * caller stamps `checkedAt` so the record is otherwise byte-identical
 * across replays with the same seed and grid.
 *
 * @param {{
 *   checkedAt: string,
 *   baseSeed: number,
 *   maxStagesPerCell: number,
 *   modelSpecs: Record<string, {description: string, rule: string, citation: string, dims: 1|2, sizes: number[], densities: number[], seedCount: number}>,
 *   modelCells: Record<string, Array<{L: number, p: number, seeds: Array<{seed: number, stages: number, frozenFraction: number, exhausted: boolean}>, meanStages: number, maxStages: number, meanFrozenFraction: number, anyExhausted: boolean}>>,
 * }} options
 * @returns {object} The `PhysicsFacilitationClosureMeasurement` record.
 */
export function assembleRecord({ checkedAt, baseSeed, maxStagesPerCell, modelSpecs, modelCells }) {
  const models = {};
  const reading = {};
  for (const model of MODEL_NAMES) {
    const spec = modelSpecs[model];
    const cells = modelCells[model];
    models[model] = { ...spec, cells };
    const largestL = Math.max(...spec.sizes);
    const p50Above = firstDensityAboveFrozenThreshold(cells, largestL, 0.5);
    const p50Below = firstDensityBelowFrozenThreshold(cells, largestL, 0.5);
    const kMax = maxStagesObserved(cells);
    reading[model] = {
      firstDensityAboveFrozenFraction0_5AtLargestL: p50Above,
      firstDensityBelowFrozenFraction0_5AtLargestL: p50Below,
      largestLChecked: largestL,
      maxStagesObserved: kMax,
      anyCellExhausted: cells.some((cell) => cell.anyExhausted),
    };
    if (model === "spiral") {
      const nearestP = nearestDensity(spec.densities, SPIRAL_TRANSITION_ACTIVE_DENSITY);
      reading[model].kappaLGrowthNearTransition = {
        density: nearestP,
        meanStagesBySize: meanStagesBySize(cells, nearestP, spec.sizes),
        nonDecreasingAcrossSizes: stagesGrowWithSize(cells, nearestP, spec.sizes),
      };
    }
  }
  return {
    type: "PhysicsFacilitationClosureMeasurement",
    checkedAt,
    seedAlgorithm: "splitmix32, per-cell seed derived via fnv1a(`${baseSeed}:${model}:L=${L}:p=${p}:seed=${seedIndex}`)",
    baseSeed,
    maxStagesPerCell,
    models,
    reading,
  };
}
