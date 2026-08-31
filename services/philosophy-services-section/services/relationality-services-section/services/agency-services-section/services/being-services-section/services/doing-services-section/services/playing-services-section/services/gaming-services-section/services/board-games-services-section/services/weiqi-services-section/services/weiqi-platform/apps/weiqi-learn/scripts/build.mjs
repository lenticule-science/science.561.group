#!/usr/bin/env node
// Strips apps/weiqi-kernel/src/*.mts to public/lib/kernel/*.mjs using Node's
// native TypeScript-type stripping (node:module, Node >=22.6, stable "strip"
// mode by Node 24) — no TypeScript compiler, no dependency. This is the app's
// only build step; everything else under public/ is authored directly.
//
// "strip" mode blanks type-only syntax with whitespace, preserving line
// numbers and leaving every runtime token — including string literals such
// as import specifiers — untouched. The kernel's own sources import each
// other as "./x.mts"; a browser (and this app's own served static tree) has
// no loader that resolves ".mts", so every intra-kernel specifier is
// rewritten to ".mjs" in the emitted text, once stripping has already run.

import { stripTypeScriptTypes } from "node:module";
import { readdir, readFile, writeFile, mkdir } from "node:fs/promises";
import { fileURLToPath, pathToFileURL } from "node:url";
import path from "node:path";

const here = path.dirname(fileURLToPath(import.meta.url));
const appRoot = path.resolve(here, "..");
const kernelSrcDir = path.resolve(appRoot, "../../../../apps/weiqi-kernel/src");
const outDir = path.resolve(appRoot, "public/lib/kernel");

// Rewrites only the ".mts" suffix inside a quoted relative-import specifier
// ("./name.mts" or "../name.mts"), never touching prose or unrelated text —
// the kernel's own files use exactly this shape for every intra-kernel
// import, per apps/weiqi-kernel/src/index.mts and its siblings.
function rewriteKernelSpecifiers(source) {
  return source.replace(/(["'](?:\.\.?\/)[^"']*)\.mts(["'])/g, "$1.mjs$2");
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
