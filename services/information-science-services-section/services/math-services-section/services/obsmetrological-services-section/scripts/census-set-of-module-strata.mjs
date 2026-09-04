#!/usr/bin/env node
/**
 * Effect: walk the whole Obsmetrologia Lean package for `import` lines
 * (no `lake`/Lean invocation — this census only parses text), build the
 * top-level-module import graph, check it against the session-declared
 * four-stratum layering, and write the dated record to `data/records/`.
 * @module census-set-of-module-strata
 */
import { mkdir, readdir, readFile, stat, writeFile } from "node:fs/promises";
import { join, relative, resolve as resolvePath, sep } from "node:path";
import { fileURLToPath } from "node:url";
import { assembleRecord, buildGraph, DECLARED_STRATA } from "../src/module-strata-census.mjs";

const DEFAULT_PACKAGE_ROOT = fileURLToPath(new URL("../lib/obsmetrologia/", import.meta.url));
const DEFAULT_OUT_DIR = fileURLToPath(new URL("../data/records/", import.meta.url));

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
 * Recursively collect every `.lean` file under `dir`, as `{path, text}`
 * with `path` relative to `root`, forward-slash separated.
 *
 * @param {string} dir - Absolute directory to walk.
 * @param {string} root - Absolute directory paths are made relative to.
 * @returns {Promise<Array<{path: string, text: string}>>}
 */
async function walkLeanFiles(dir, root) {
  const files = [];
  const entries = await readdir(dir, { withFileTypes: true });
  for (const entry of entries) {
    const full = join(dir, entry.name);
    if (entry.isDirectory()) {
      files.push(...(await walkLeanFiles(full, root)));
    } else if (entry.isFile() && entry.name.endsWith(".lean")) {
      const text = await readFile(full, "utf8");
      const relPath = relative(root, full).split(sep).join("/");
      files.push({ path: relPath, text });
    }
  }
  return files;
}

/**
 * Collect the whole-library scan scope: every `.lean` file recursively
 * under `<root>/Obsmetrologia/`, plus the single root manifest
 * `<root>/Obsmetrologia.lean` (present in the corpus proper — the
 * `docs/` Verso manual tree and `.lake` build cache that also live under
 * `root` are out of scope and never walked).
 *
 * @param {string} root - Absolute Lean package root (e.g. `.../lib/obsmetrologia`).
 * @returns {Promise<Array<{path: string, text: string}>>} Sorted by `path`.
 */
export async function readLeanFiles(root) {
  const files = await walkLeanFiles(join(root, "Obsmetrologia"), root);
  const rootManifestPath = join(root, "Obsmetrologia.lean");
  const rootStat = await stat(rootManifestPath).catch(() => null);
  if (rootStat?.isFile()) {
    files.push({ path: "Obsmetrologia.lean", text: await readFile(rootManifestPath, "utf8") });
  }
  return files.sort((a, b) => (a.path < b.path ? -1 : a.path > b.path ? 1 : 0));
}

/**
 * Render the per-module table and upward-import totals as plain text for
 * stdout.
 *
 * @param {ReturnType<typeof assembleRecord>} record
 * @returns {string}
 */
export function renderSummary(record) {
  const lines = [];
  lines.push(
    `files=${record.reading.totalFiles} importLines=${record.reading.totalImportLines} ` +
      `dagEdges=${record.reading.totalImportEdges} acyclic=${record.dag.acyclic ? "yes" : "no"}`,
  );
  lines.push("");
  lines.push("module\tstratum\tfileCount\trank\timports\timportedBy");
  for (const name of Object.keys(record.modules).sort()) {
    const module = record.modules[name];
    lines.push(
      `${name}\t${module.stratum}\t${module.fileCount}\t${module.rank}\t${module.imports.length}\t${module.importedBy.length}`,
    );
  }
  lines.push("");
  lines.push(`upward total=${record.upward.total} intoUnstratified=${record.upward.totalIntoUnstratified}`);
  for (const pair of Object.keys(record.upward.perStratumPair).sort()) {
    lines.push(`  ${pair}: ${record.upward.perStratumPair[pair]}`);
  }
  lines.push(`unstratified modules: ${record.reading.unstratifiedModules.join(", ") || "(none)"}`);
  if (!record.dag.acyclic) {
    for (const cycle of record.dag.cycles) {
      lines.push(`cycle: ${cycle.modules.join(" <-> ")}`);
      for (const edge of cycle.edges) lines.push(`  ${edge.from} -> ${edge.to}: ${edge.files.join(", ")}`);
    }
  }
  const move = record.bestMove;
  if (move.module) {
    lines.push(
      `best single move: ${move.module} ${move.fromStratum} -> ${move.toStratum} ` +
        `removes ${move.upwardImportsRemoved} upward imports (baseline ${move.baselineUpward})`,
    );
  } else {
    lines.push(`best single move: none (baseline ${move.baselineUpward})`);
  }
  return lines.join("\n");
}

async function main() {
  const { outDir: argvOutDir, date: argvDate } = parseArgv(process.argv.slice(2));
  const outDir = resolvePath(argvOutDir ?? DEFAULT_OUT_DIR);
  const date = argvDate ?? todayStamp();
  const packageRoot = DEFAULT_PACKAGE_ROOT;

  const files = await readLeanFiles(packageRoot);
  const graph = buildGraph(files);
  const record = assembleRecord({ checkedAt: new Date().toISOString(), packageRoot, graph, config: DECLARED_STRATA });

  await mkdir(outDir, { recursive: true });
  const recordPath = join(outDir, `${date}-module-strata-census.json`);
  await writeFile(recordPath, `${JSON.stringify(record, null, 2)}\n`, "utf8");

  process.stdout.write(`${renderSummary(record)}\n`);
  process.exit(0);
}

if (import.meta.url === `file://${process.argv[1]}`) {
  main();
}
