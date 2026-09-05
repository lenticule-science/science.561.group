#!/usr/bin/env node
/**
 * Effect: run the whole-library Obsmetrologia theorem/axiom census Lean
 * meta program (`census-set-of-theorem-axioms.lean`) via `lake env lean`,
 * parse and aggregate its output, and write the dated record and rows
 * TSV to `data/records/`, never by hand-running the Lean program.
 * @module census-set-of-theorem-axioms
 */
import { projectFileUrlFilepath } from "@red-cup-engineering/project-file-url-filepath-service";
import { writeFileText } from "@red-cup-engineering/file-services/write-file";
import { confinePath } from "@red-cup-engineering/filepath-services-section";
import { isMain } from "@red-cup-engineering/javascript-file-main-guard-service";
import { runCommand } from "./audit-set-of-theorems.mjs";
import { assembleCensusRecord, parseCensusRows } from "../src/theorem-census.mjs";
// friction (obsmetrological-services-section-node-import-migration, 2026-09-04):
// semantic-record-journal-service writes an append-only JSONL log under data/logs/, never
// an exact named path under data/records/ that other carriers already cite (e.g.
// <date>-theorem-axiom-census.json / -rows.tsv here). Kept as a house-file-services writer
// (not raw node:fs) of these two exact-path carriers until the journal grows that shape.

const DEFAULT_PACKAGE_ROOT = projectFileUrlFilepath(new URL("../lib/obsmetrologia/", import.meta.url).href);
const DEFAULT_LEAN_SOURCE_PATH = projectFileUrlFilepath(new URL("./census-set-of-theorem-axioms.lean", import.meta.url).href);
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
 * and parse its stdout into rows. Pure control flow over an injectable
 * `runCommand` so it is testable without Lean installed.
 *
 * @param {{packageRoot: string, leanSourcePath: string, runCommand: typeof runCommand}} options
 * @returns {Promise<Array<{name: string, axioms: string[]}>>} Rows, in the program's own (sorted) output order.
 * @throws {Error} `census-set-of-theorem-axioms-failed:<stderr>` on nonzero exit or zero rows.
 */
export async function runCensus({ packageRoot, leanSourcePath, runCommand: run }) {
  const result = await run("lake", ["env", "lean", leanSourcePath], { cwd: packageRoot });
  const rows = parseCensusRows(result.stdout);
  if (result.code !== 0 || rows.length === 0) {
    throw new Error(`census-set-of-theorem-axioms-failed:${result.stderr || result.stdout}`);
  }
  return rows;
}

/**
 * Render census rows back into the checked-in TSV shape (`name\taxioms`,
 * one row per line, comma-joined axioms, trailing newline).
 *
 * @param {Array<{name: string, axioms: string[]}>} rows
 * @returns {string}
 */
export function renderRowsTsv(rows) {
  return rows.map((row) => `${row.name}\t${row.axioms.join(",")}`).join("\n") + "\n";
}

async function main() {
  const { outDir: argvOutDir, date: argvDate } = parseArgv(process.argv.slice(2));
  const outDir = confinePath({ root: argvOutDir ?? DEFAULT_OUT_DIR }).path;
  const date = argvDate ?? todayStamp();
  const packageRoot = DEFAULT_PACKAGE_ROOT;
  const leanSourcePath = DEFAULT_LEAN_SOURCE_PATH;

  let rows;
  try {
    rows = await runCensus({ packageRoot, leanSourcePath, runCommand });
  } catch (error) {
    process.stderr.write(`${error.message ?? String(error)}\n`);
    process.exit(1);
    return;
  }

  const record = assembleCensusRecord({
    checkedAt: new Date().toISOString(),
    packageRoot,
    leanSourcePath,
    rows,
  });

  const recordPath = `${outDir}/${date}-theorem-axiom-census.json`;
  const rowsPath = `${outDir}/${date}-theorem-axiom-census-rows.tsv`;
  await writeFileText(recordPath, `${JSON.stringify(record, null, 2)}\n`);
  await writeFileText(rowsPath, renderRowsTsv(rows));

  process.stdout.write(`${JSON.stringify(record.summary, null, 2)}\n`);
  process.exit(0);
}

if (isMain(import.meta.url)) {
  main();
}
