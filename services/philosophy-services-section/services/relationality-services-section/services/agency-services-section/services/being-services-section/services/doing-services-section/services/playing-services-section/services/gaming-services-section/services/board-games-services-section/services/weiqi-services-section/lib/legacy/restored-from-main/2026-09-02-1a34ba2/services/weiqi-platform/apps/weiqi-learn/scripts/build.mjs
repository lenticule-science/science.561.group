#!/usr/bin/env node
/**
 * Strips apps/weiqi-kernel/src/*.mts to public/lib/kernel/*.mjs via
 * node:module's stripTypeScriptTypes ("strip" mode, no tsc, no dependency),
 * then rewrites intra-kernel "./x.mts" import specifiers to "./x.mjs" so
 * the emitted tree resolves as real browser ESM. The app's only build step.
 */

import { stripTypeScriptTypes } from "node:module";
import { readdir, readFile, writeFile, mkdir } from "node:fs/promises";
import { fileURLToPath, pathToFileURL } from "node:url";
import path from "node:path";

const here = path.dirname(fileURLToPath(import.meta.url));
const appRoot = path.resolve(here, "..");
const kernelSrcDir = path.resolve(appRoot, "../../../../apps/weiqi-kernel/src");
const outDir = path.resolve(appRoot, "public/lib/kernel");

/** Rewrites ".mts" to ".mjs" only in a quoted specifier following `from`, never in prose. */
function rewriteKernelSpecifiers(source) {
  return source.replace(/(from\s+["'](?:\.\.?\/)[^"']*)\.mts(["'])/g, "$1.mjs$2");
}

async function main() {
  const entries = await readdir(kernelSrcDir, { withFileTypes: true });
  const mtsFiles = entries.filter((e) => e.isFile() && e.name.endsWith(".mts")).map((e) => e.name);
  if (mtsFiles.length === 0) {
    throw new Error(`No .mts sources found in kernel src dir: ${kernelSrcDir}`);
  }

  await mkdir(outDir, { recursive: true });

  for (const fileName of mtsFiles) {
    const srcPath = path.join(kernelSrcDir, fileName);
    const source = await readFile(srcPath, "utf8");
    const stripped = stripTypeScriptTypes(source, { mode: "strip" });
    const rewritten = rewriteKernelSpecifiers(stripped);
    const outName = fileName.slice(0, -4) + ".mjs"; // "x.mts" -> "x.mjs"
    await writeFile(path.join(outDir, outName), rewritten, "utf8");
  }

  console.log(`Stripped ${mtsFiles.length} kernel source file(s) to ${outDir}`);

  await verifyBuiltKernel(outDir);
}

// Fails loudly (throws, non-zero exit) if the built kernel cannot be
// imported or cannot play a legal three-move sequence on a 9x9 board — this
// is the build's own proof that the strip-and-rewrite pipeline produced a
// working ES module tree, not merely files that exist.
async function verifyBuiltKernel(kernelOutDir) {
  const indexPath = path.join(kernelOutDir, "index.mjs");
  const kernel = await import(pathToFileURL(indexPath).href);

  const { Game } = kernel;
  if (typeof Game !== "function") {
    throw new Error(`Built kernel at ${indexPath} does not export Game`);
  }

  const game = new Game(9, "chinese");
  const moves = ["C3", "G7", "C7"];
  for (const move of moves) {
    const outcome = game.play(move);
    if (!outcome.ok) {
      throw new Error(
        `Build verification failed: move "${move}" was rejected by the built kernel (reason: ${outcome.reason}). ` +
          `The strip/rewrite pipeline produced a non-working module tree at ${kernelOutDir}.`,
      );
    }
  }

  if (game.history.length !== moves.length + 1) {
    throw new Error(
      `Build verification failed: expected ${moves.length + 1} positions in game history, got ${game.history.length}`,
    );
  }

  console.log(`Build verification passed: played ${moves.join(", ")} on a 9x9 board via the built kernel.`);
}

main().catch((err) => {
  console.error(err.stack ?? String(err));
  process.exit(1);
});
