#!/usr/bin/env node
/**
 * Effect: run the facilitation-closure grid (bootstrap percolation
 * threshold 2, the Spiral Model, the East model skeleton) over sizes,
 * densities, and seeds, and write the dated
 * `PhysicsFacilitationClosureMeasurement` record. Prints a compact table.
 * @module measure-facilitation-closure
 */
import { mkdir, writeFile } from "node:fs/promises";
import { join, resolve as resolvePath } from "node:path";
import { fileURLToPath } from "node:url";
import { assembleRecord, runCell } from "../src/facilitation-closure.mjs";

const DEFAULT_OUT_DIR = fileURLToPath(new URL("../data/records/", import.meta.url));
const DEFAULT_BASE_SEED = 0xc0ffee;
const DEFAULT_MAX_STAGES = 200000;

const FULL_MODEL_SPECS = {
  bootstrap2: {
    description: "2D bootstrap percolation, threshold 2, on an L×L torus (Chalupa–Leath–Reich 1979).",
    rule: "site facilitated iff >= 2 of its 4 von Neumann neighbours (N,S,E,W) are active",
    citation: "Chalupa, Leath & Reich 1979; Holroyd 2003, p_c(L) ~ pi^2 / (18 ln L)",
    dims: 2,
    sizes: [32, 64, 128, 256],
    densities: [0.02, 0.04, 0.06, 0.08, 0.1, 0.12, 0.15, 0.2],
    seedCount: 4,
  },
  spiral: {
    description: "Spiral Model on an L×L torus (Toninelli, Biroli & Fisher 2006).",
    rule:
      "site facilitated iff (NE both active OR SW both active) AND (NW both active OR SE both active); " +
      "NE=(x+e1,x+e1+e2), SW=(x-e2,x-e1-e2), NW=(x-e1,x-e1+e2), SE=(x+e1,x+e1-e2) " +
      "— verified against Biroli & Toninelli, arXiv:0709.0583, section 2",
    citation:
      "Toninelli, Biroli & Fisher, Phys. Rev. Lett. 96, 035702 (2006); " +
      "Biroli & Toninelli, arXiv:0709.0583 section 2; p_c = p_c^DP ~= 0.705 (directed site percolation)",
    densityConventionNote:
      "p here is the initial ACTIVE (empty) site density: createSeedConfig draws each site active " +
      "with probability p. arXiv:0709.0583 section 2 states its threshold p_c^DP ~= 0.705 on the " +
      "OCCUPIED (blocked) site density; in this measurement's active-density units that is " +
      "1 - 0.705 = 0.295, so this grid's densities straddle the transition at p = 0.295.",
    dims: 2,
    sizes: [32, 64, 128, 256],
    densities: [0.2, 0.25, 0.27, 0.28, 0.29, 0.295, 0.3, 0.31, 0.32, 0.35, 0.4, 0.45],
    seedCount: 4,
  },
  east: {
    description: "1D East model deterministic skeleton on a ring of L sites (negative control).",
    rule: "site facilitated iff its left neighbour is active",
    citation: "Sollich & Evans 1999 (the model's glassiness lives in its stochastic rates, not this closure)",
    dims: 1,
    sizes: [32, 64, 128, 256],
    densities: [0.01, 0.05, 0.1, 0.2],
    seedCount: 4,
  },
};

const QUICK_MODEL_SPECS = {
  bootstrap2: { ...FULL_MODEL_SPECS.bootstrap2, sizes: [16, 32], densities: [0.05, 0.1], seedCount: 2 },
  spiral: { ...FULL_MODEL_SPECS.spiral, sizes: [16, 32], densities: [0.29, 0.3], seedCount: 2 },
  east: { ...FULL_MODEL_SPECS.east, sizes: [16, 32], densities: [0.05, 0.2], seedCount: 2 },
};

/**
 * Parse argv into the measurement's options.
 *
 * @param {string[]} argv - `process.argv.slice(2)`.
 * @returns {{outDir: string|undefined, date: string|undefined, quick: boolean, baseSeed: number, maxStages: number, outPath: string|undefined}}
 */
export function parseArgv(argv) {
  let outDir;
  let date;
  let quick = false;
  let baseSeed = DEFAULT_BASE_SEED;
  let maxStages = DEFAULT_MAX_STAGES;
  let outPath;
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === "--out-dir") {
      outDir = argv[index + 1];
      index += 1;
    } else if (token === "--out") {
      outPath = argv[index + 1];
      index += 1;
    } else if (token === "--date") {
      date = argv[index + 1];
      index += 1;
    } else if (token === "--quick") {
      quick = true;
    } else if (token === "--seed") {
      baseSeed = Number(argv[index + 1]);
      index += 1;
    } else if (token === "--max-stages") {
      maxStages = Number(argv[index + 1]);
      index += 1;
    }
  }
  return { outDir, date, quick, baseSeed, maxStages, outPath };
}

/**
 * Today's date as `YYYY-MM-DD`, in UTC.
 *
 * @returns {string}
 */
export function todayStamp() {
  return new Date().toISOString().slice(0, 10);
}

/**
 * Run the whole grid for one model spec: every (L, p) cell over
 * `seedCount` deterministic seeds.
 *
 * @param {{model: "bootstrap2"|"spiral"|"east", spec: object, baseSeed: number, maxStages: number}} options
 * @returns {Array<object>} Cell results, `sizes × densities` in grid order.
 */
export function runModelGrid({ model, spec, baseSeed, maxStages }) {
  const cells = [];
  for (const L of spec.sizes) {
    for (const p of spec.densities) {
      cells.push(runCell({ model, L, p, seedCount: spec.seedCount, baseSeed, maxStages }));
    }
  }
  return cells;
}

/**
 * Render a compact stdout table: one row per (model, L, p) cell with mean
 * stages and mean frozen fraction.
 *
 * @param {Record<string, Array<{L: number, p: number, meanStages: number, meanFrozenFraction: number, anyExhausted: boolean}>>} modelCells
 * @returns {string}
 */
export function renderTable(modelCells) {
  const lines = ["model\tL\tp\tmeanStages\tmeanFrozenFraction\texhausted"];
  for (const model of Object.keys(modelCells)) {
    for (const cell of modelCells[model]) {
      lines.push(
        [
          model,
          cell.L,
          cell.p,
          cell.meanStages.toFixed(2),
          cell.meanFrozenFraction.toFixed(4),
          cell.anyExhausted,
        ].join("\t"),
      );
    }
  }
  return lines.join("\n");
}

async function main() {
  const { outDir: argvOutDir, date: argvDate, quick, baseSeed, maxStages, outPath } = parseArgv(
    process.argv.slice(2),
  );
  const outDir = resolvePath(argvOutDir ?? DEFAULT_OUT_DIR);
  const date = argvDate ?? todayStamp();
  const modelSpecs = quick ? QUICK_MODEL_SPECS : FULL_MODEL_SPECS;

  const modelCells = {};
  for (const model of Object.keys(modelSpecs)) {
    modelCells[model] = runModelGrid({ model, spec: modelSpecs[model], baseSeed, maxStages });
  }

  const record = assembleRecord({
    checkedAt: new Date().toISOString(),
    baseSeed,
    maxStagesPerCell: maxStages,
    modelSpecs,
    modelCells,
  });

  await mkdir(outDir, { recursive: true });
  const recordPath = outPath
    ? resolvePath(outPath)
    : join(outDir, `${date}-facilitation-closure-measurement.json`);
  await mkdir(join(recordPath, ".."), { recursive: true });
  await writeFile(recordPath, `${JSON.stringify(record, null, 2)}\n`, "utf8");

  process.stdout.write(`${renderTable(modelCells)}\n\n`);
  process.stdout.write(`wrote ${recordPath}\n`);
  process.stdout.write(`${JSON.stringify(record.reading, null, 2)}\n`);
  process.exit(0);
}

if (import.meta.url === `file://${process.argv[1]}`) {
  main();
}
