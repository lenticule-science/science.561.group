/**
 * Project the upstream VaultMaze engine into browser-loadable ESM.
 *
 * `@red-cup-engineering/lantern-561-group` publishes `.mts`. A browser cannot
 * load that, and neither can a Cloudflare Worker, so the scheduling and
 * light-cone math has to reach the reader some other way. The house pattern —
 * `@lenticule-science/weiqi-web` does the same to its kernel — is to strip the
 * types at build time with Node's own stripper and ship the result. Upstream
 * stays the single source of truth: nothing here is a transliterated copy that
 * can quietly drift from the package it claims to mirror.
 */
import { mkdir, readFile, writeFile } from "node:fs/promises";
import { createRequire, stripTypeScriptTypes } from "node:module";
import { dirname, resolve } from "node:path";

const require = createRequire(import.meta.url);

/** The import closure of `lightcone`, in dependency order. */
export const ENGINE_MODULES = Object.freeze(["types", "srs", "stability", "lightcone"]);

function lanternSourceRoot() {
  return dirname(require.resolve("@red-cup-engineering/lantern-561-group/srs"));
}

/** Rewrite `./x.mts` specifiers to the `./x.mjs` files we are about to write. */
export function retargetSpecifiers(source) {
  return source.replaceAll(/(from\s+["'])(\.\/[a-z-]+)\.mts(["'])/gu, "$1$2.mjs$3");
}

export async function buildBrowserEngine(outputRoot) {
  const sourceRoot = lanternSourceRoot();
  await mkdir(outputRoot, { recursive: true });
  const written = [];
  for (const name of ENGINE_MODULES) {
    const source = await readFile(resolve(sourceRoot, `${name}.mts`), "utf8");
    const stripped = retargetSpecifiers(stripTypeScriptTypes(source, { mode: "strip" }));
    const path = resolve(outputRoot, `${name}.mjs`);
    await writeFile(path, stripped);
    written.push({ name, path, bytes: stripped.length });
  }
  return written;
}

if (import.meta.filename === process.argv[1]) {
  const written = await buildBrowserEngine(resolve(import.meta.dirname, "..", "public", "js"));
  for (const module of written) console.log(`${module.name}.mjs  ${module.bytes} bytes`);
}
