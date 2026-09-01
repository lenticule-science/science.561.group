#!/usr/bin/env node
// The one-shot CLI transport face. Per SPEC.md's "CLI contract":
//
//   node scripts/check.mjs [globs...] [options]
//
// See SPEC.md for the full flag/exit-code contract. This file owns only
// argv parsing, output formatting, and the exit-code mapping -- every rule
// lives in src/, reached through src/run.mjs's runChecks().

import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { runChecks, ToolFailure } from "../src/run.mjs";
import { KernelImportError } from "../src/kernel.mjs";
import { filterByCode, filterBySeverity, summarize } from "../src/diagnostic.mjs";

const TOOL_NAME = "weiqi-lsp";
const TOOL_VERSION = "0.1.0";
const SEVERITIES = ["info", "warning", "error"];
const THIS_DIR = dirname(fileURLToPath(import.meta.url));
const SECTION_ROOT = resolve(THIS_DIR, "..", "..", "..");

function usageError(message) {
  process.stderr.write(`weiqi-lsp check: ${message}\n`);
  process.exitCode = 2;
}

/**
 * @param {string[]} argv
 * @returns {{globs: string[], json: boolean, only: Set<string>|null, severityMin: string, quiet: boolean, kernelPath: string|undefined}|null}
 *   null if argv was invalid (usageError has already been reported).
 */
export function parseArgs(argv) {
  const globs = [];
  let json = false;
  let only = null;
  let severityMin = "info";
  let quiet = false;
  let kernelPath;

  for (const arg of argv) {
    if (arg === "--json") {
      json = true;
    } else if (arg === "--quiet") {
      quiet = true;
    } else if (arg.startsWith("--only=")) {
      const codes = arg.slice("--only=".length).split(",").map((s) => s.trim()).filter(Boolean);
      only = only ? new Set([...only, ...codes]) : new Set(codes);
    } else if (arg.startsWith("--severity-min=")) {
      const v = arg.slice("--severity-min=".length);
      if (!SEVERITIES.includes(v)) {
        usageError(`--severity-min must be one of ${SEVERITIES.join("|")}, got "${v}".`);
        return null;
      }
      severityMin = v;
    } else if (arg.startsWith("--kernel-path=")) {
      kernelPath = arg.slice("--kernel-path=".length);
    } else if (arg.startsWith("--")) {
      usageError(`Unknown option "${arg}".`);
      return null;
    } else {
      globs.push(arg);
    }
  }
  return { globs, json, only, severityMin, quiet, kernelPath };
}

function formatHuman(diagnostics, filesScanned, summary, quiet) {
  const lines = [];
  if (!quiet) {
    for (const d of diagnostics) {
      const loc = d.start ? `:${d.start.line}:${d.start.column}` : "";
      lines.push(`${d.file}${loc} [${d.severity}] ${d.code} ${d.message} (${d.source})`);
    }
  }
  lines.push(`${TOOL_NAME}: ${filesScanned} file(s) scanned, ${summary.errors} error(s), ${summary.warnings} warning(s), ${summary.info} info.`);
  return lines.join("\n") + "\n";
}

async function main(argv) {
  const parsed = parseArgs(argv);
  if (!parsed) return; // usageError already set process.exitCode = 2.
  const { globs, json, only, severityMin, quiet, kernelPath } = parsed;

  let result;
  try {
    result = await runChecks({ sectionRoot: SECTION_ROOT, globs, kernelPath });
  } catch (err) {
    if (err instanceof ToolFailure || err instanceof KernelImportError) {
      process.stderr.write(`weiqi-lsp check: ${err.message}\n`);
      process.exitCode = 2;
      return;
    }
    throw err;
  }

  const scoped = filterByCode(result.diagnostics, only); // --only restricts evaluation, so it affects exit code.
  const hasError = scoped.some((d) => d.severity === "error");
  const reported = filterBySeverity(scoped, severityMin); // --severity-min filters what is reported only.
  const summary = summarize(reported);

  if (json) {
    process.stdout.write(
      JSON.stringify(
        { tool: TOOL_NAME, version: TOOL_VERSION, filesScanned: result.filesScanned, diagnostics: reported, summary },
        null,
        2,
      ) + "\n",
    );
  } else {
    process.stdout.write(formatHuman(reported, result.filesScanned, summary, quiet));
  }

  process.exitCode = hasError ? 1 : 0;
}

// Only run when invoked directly (node scripts/check.mjs ...), not when
// imported by a test for parseArgs.
if (process.argv[1] && resolve(process.argv[1]) === resolve(fileURLToPath(import.meta.url))) {
  main(process.argv.slice(2)).catch((err) => {
    process.stderr.write(`weiqi-lsp check: unexpected internal error: ${err instanceof Error ? err.stack : err}\n`);
    process.exitCode = 2;
  });
}
