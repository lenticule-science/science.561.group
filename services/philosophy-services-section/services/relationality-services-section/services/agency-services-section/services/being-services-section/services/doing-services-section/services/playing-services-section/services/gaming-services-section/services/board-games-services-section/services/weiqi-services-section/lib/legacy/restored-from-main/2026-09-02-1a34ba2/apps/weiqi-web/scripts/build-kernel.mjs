// Zero-dep build step: copy ../../weiqi-kernel/src/*.mts into
// public/js/kernel/*.mjs as plain browser-loadable ESM.
//
// The kernel is authored as .mts and consumed directly by Node (which
// type-strips .mts on the fly). Browsers cannot do that, so this script
// does the same stripping ahead of time, once, at build time, using
// node:module's own native `stripTypeScriptTypes` (stable in Node 24) --
// no external transpiler, no tsc, no dependency. It also rewrites each
// relative `./foo.mts` import specifier to `./foo.mjs` so the copies
// resolve against each other as real browser ESM.
//
// This is the ONE build step this app has for its own code (house
// doctrine: zero-dep, no bundler). Run it whenever weiqi-kernel/src
// changes: `node scripts/build-kernel.mjs`.

import { readFileSync, writeFileSync, readdirSync, mkdirSync, existsSync } from "node:fs";
import { join, dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { stripTypeScriptTypes } from "node:module";

const SCRIPT_DIR = dirname(fileURLToPath(import.meta.url));
const APP_ROOT = resolve(SCRIPT_DIR, "..");
const KERNEL_SRC = resolve(APP_ROOT, "..", "weiqi-kernel", "src");
const OUT_DIR = resolve(APP_ROOT, "public", "js", "kernel");

if (!existsSync(KERNEL_SRC)) {
  console.error(`Kernel source not found at ${KERNEL_SRC}`);
  process.exit(1);
}

mkdirSync(OUT_DIR, { recursive: true });

const files = readdirSync(KERNEL_SRC).filter((f) => f.endsWith(".mts"));
let count = 0;

for (const file of files) {
  const srcPath = join(KERNEL_SRC, file);
  const source = readFileSync(srcPath, "utf8");

  // Strip TypeScript-only syntax (types, interfaces, `as const`, etc.),
  // preserving line/column positions with whitespace so any future stack
  // trace still lines up with the original .mts source.
  let stripped = stripTypeScriptTypes(source, { mode: "strip" });

  // Rewrite sibling-module import/export specifiers from .mts to .mjs so
  // the copies resolve against each other as real browser ESM. Only
  // touches "./foo.mts" style relative specifiers -- the kernel has no
  // other kind.
  stripped = stripped.replace(/(from\s+["']\.\/[\w-]+)\.mts(["'])/g, "$1.mjs$2");

  const outName = file.replace(/\.mts$/, ".mjs");
  writeFileSync(join(OUT_DIR, outName), stripped, "utf8");
  count++;
}

console.log(`Stripped ${count} kernel module(s) from ${KERNEL_SRC.replace(APP_ROOT, ".")} -> ${OUT_DIR.replace(APP_ROOT, ".")}`);
