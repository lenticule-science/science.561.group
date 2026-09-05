#!/usr/bin/env node
/**
 * Effect: run the whole-library Obsmetrologia regime-instantiation census
 * Lean meta program (`census-set-of-regime-instantiations.lean`) via
 * `lake env lean`, parse and aggregate its output, and write the dated
 * record and rows TSV to `data/records/`, never by hand-running the Lean
 * program.
 * @module census-set-of-regime-instantiations
 */
import { projectFileUrlFilepath } from "@red-cup-engineering/project-file-url-filepath-service";
import { writeFileText } from "@red-cup-engineering/file-services/write-file";
import { confinePath } from "@red-cup-engineering/filepath-services-section";
import { isMain } from "@red-cup-engineering/javascript-file-main-guard-service";
import { runCommand } from "./audit-set-of-theorems.mjs";
import { assembleCensusRecord, parseCensusRows } from "../src/regime-instantiation-census.mjs";
// friction (obsmetrological-services-section-node-import-migration, 2026-09-04):
// semantic-record-journal-service writes an append-only JSONL log under data/logs/, never
// an exact named path under data/records/ that other carriers already cite. Kept as a
// house-file-services writer (not raw node:fs) of these two exact-path carriers until the
// journal grows that shape.

const DEFAULT_PACKAGE_ROOT = projectFileUrlFilepath(new URL("../lib/obsmetrologia/", import.meta.url).href);
const DEFAULT_LEAN_SOURCE_PATH = projectFileUrlFilepath(new URL("./census-set-of-regime-instantiations.lean", import.meta.url).href);
const DEFAULT_OUT_DIR = projectFileUrlFilepath(new URL("../data/records/", import.meta.url).href);

/**
 * Parse argv into the die's options.
 *
 * @param {string[]} argv - `process.argv.slice(2)`.
 * @returns {{outDir: string|undefined, date: string|undefined}}
 */
export function parseArgv(argv) {
  let outDir;
  let date;
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === "--out-dir") {
      outDir = argv[index + 1];
      index += 1;
    } else if (token === "--date") {
      date = argv[index + 1];
      index += 1;
    }
  }
  return { outDir, date };
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
 * Run the census: invoke `lake env lean <leanSourcePath>` in `packageRoot`
 * and parse its stdout into `{datums, rows}`. Pure control flow over an
 * injectable `runCommand` so it is testable without Lean installed.
 *
 * @param {{packageRoot: string, leanSourcePath: string, runCommand: typeof runCommand}} options
 * @returns {Promise<{stdout: string, parsed: {datums: Array<object>, rows: Array<object>}}>}
 * @throws {Error} `census-set-of-regime-instantiations-failed:<stderr>` on nonzero exit or zero rows.
 */
export async function runRegimeCensus({ packageRoot, leanSourcePath, runCommand: run }) {
  const result = await run("lake", ["env", "lean", leanSourcePath], { cwd: packageRoot });
  const parsed = parseCensusRows(result.stdout);
  if (result.code !== 0 || parsed.rows.length === 0) {
    throw new Error(`census-set-of-regime-instantiations-failed:${result.stderr || result.stdout}`);
  }
  return { stdout: result.stdout, parsed };
}

async function main() {
  const { outDir: argvOutDir, date: argvDate } = parseArgv(process.argv.slice(2));
  const outDir = confinePath({ root: argvOutDir ?? DEFAULT_OUT_DIR }).path;
  const date = argvDate ?? todayStamp();
  const packageRoot = DEFAULT_PACKAGE_ROOT;
  const leanSourcePath = DEFAULT_LEAN_SOURCE_PATH;

  let stdout;
  let parsed;
  try {
    ({ stdout, parsed } = await runRegimeCensus({ packageRoot, leanSourcePath, runCommand }));
  } catch (error) {
    process.stderr.write(`${error.message ?? String(error)}\n`);
    process.exit(1);
    return;
  }

  const record = assembleCensusRecord({
    checkedAt: new Date().toISOString(),
    packageRoot,
    leanSourcePath,
    parsed,
  });

  const recordPath = `${outDir}/${date}-regime-instantiation-census.json`;
  const rowsPath = `${outDir}/${date}-regime-instantiation-census-rows.tsv`;
  await writeFileText(recordPath, `${JSON.stringify(record, null, 2)}\n`);
  await writeFileText(rowsPath, stdout.endsWith("\n") ? stdout : `${stdout}\n`);

  process.stdout.write(`${JSON.stringify(record.summary, null, 2)}\n`);
  process.exit(0);
}

if (isMain(import.meta.url)) {
  main();
}
