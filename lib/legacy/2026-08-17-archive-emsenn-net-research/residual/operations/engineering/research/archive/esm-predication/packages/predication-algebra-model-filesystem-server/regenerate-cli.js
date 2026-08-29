#!/usr/bin/env node
/**
 * regenerate-cli — background warmup of the substrate event log.
 *
 * Runs the stat-short-circuited scan over a root directory and
 * appends any new substrate events (ingest-file / file-changed /
 * file-deleted) that reconcile the channel with what's on disk.
 * Exits after writing. Does not replay the log or build a working
 * model — that's the MCP server's job.
 *
 * Usage: regenerate-cli.js --root <dir> [--exclude pattern ...]
 *
 * Why this exists: a Claude Code SessionStart hook runs this in the
 * background so that by the time Claude spawns the harness MCP child
 * process and the child calls fars.regenerate, the event log is
 * already up-to-date and the OS page cache is warm. The child's
 * regenerate becomes a no-op and its first-tool-call bootstrap is
 * cheaper.
 */

import path from "node:path";
import * as regenerateTool from "./directory-regenerate.js";
import { readGitignorePatterns } from "./directory-walk.js";

function parseArgs(argv) {
  const args = { root: null, exclude: [] };
  for (let i = 0; i < argv.length; i++) {
    if (argv[i] === "--root") args.root = argv[i + 1];
    else if (argv[i] === "--exclude") args.exclude.push(argv[i + 1]);
  }
  return args;
}

function buildWalkOptions(root, extraPatterns) {
  const fromGitignore = readGitignorePatterns(path.join(root, ".gitignore"));
  const fromFarsignore = readGitignorePatterns(path.join(root, ".farsignore"));
  const extras = Array.isArray(extraPatterns) ? extraPatterns : [];
  const excludePatterns = [...fromGitignore, ...fromFarsignore, ...extras];
  return { excludePatterns };
}

function main() {
  const args = parseArgs(process.argv.slice(2));
  if (!args.root) {
    process.stderr.write("usage: regenerate-cli --root <directory>\n");
    process.exit(1);
  }
  const root = path.resolve(args.root);
  const walkOptions = buildWalkOptions(root, args.exclude);

  const t0 = Date.now();
  const { stats } = regenerateTool.regenerate(root, { walk: walkOptions });
  process.stderr.write(
    `[regenerate-cli] ${stats.filesScanned} files scanned, ` +
    `${stats.eventsEmitted} new events ` +
    `(${stats.ingestCount} ingest, ${stats.changedCount} changed, ${stats.deletedCount} deleted) ` +
    `in ${Date.now() - t0}ms\n`
  );
}

import { fileURLToPath } from "node:url";
if (process.argv[1] && fileURLToPath(import.meta.url) === process.argv[1]) {
  main();
}
