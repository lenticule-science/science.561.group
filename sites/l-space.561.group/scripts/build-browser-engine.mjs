/**
 * Project the upstream VaultMaze engine into browser-loadable ESM.
 *
 * `@red-cup-engineering/education-platform-service` supplies the browser modules. A browser cannot
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
import { build } from "esbuild";

const require = createRequire(import.meta.url);

/** The import closure of `lightcone`, in dependency order. */
export const ENGINE_MODULES = Object.freeze(["types", "srs", "stability", "lightcone"]);
export const CAIRN_BROWSER_MODULE = "room-index-search";
export const TUFTE_BROWSER_MODULE = "tufte-browser";

export async function cairnSearchSourcePath() {
  const siteRoot = resolve(import.meta.dirname, "..");
  const packageJson = JSON.parse(await readFile(resolve(siteRoot, "package.json"), "utf8"));
  const dependency = packageJson.dependencies?.["@red-cup-engineering/cairn"];
  const workspaceSource = typeof dependency === "string" && dependency.startsWith("file:")
    && dependency.endsWith("/cairn");
  if (dependency !== "0.1.0" && !workspaceSource) {
    throw new Error("L-Space must select the current workspace CAIRN source or a pinned CAIRN release");
  }
  return require.resolve("@red-cup-engineering/cairn/room-index-search");
}

function platformRuntimeRoot() {
  return dirname(require.resolve("@red-cup-engineering/education-platform-service/srs"));
}

export function tufteBrowserSourcePath() {
  return require.resolve("@red-cup-engineering/web-tufte-gui-services-section/browser");
}

/** Rewrite compiled platform specifiers to browser `.mjs` files. */
export function retargetSpecifiers(source) {
  return source.replaceAll(/(from\s+["'])(\.\/[a-z-]+)\.js(["'])/gu, "$1$2.mjs$3");
}

export async function buildBrowserEngine(outputRoot) {
  const sourceRoot = platformRuntimeRoot();
  await mkdir(outputRoot, { recursive: true });
  const written = [];
  for (const name of ENGINE_MODULES) {
    const source = await readFile(resolve(sourceRoot, `${name}.js`), "utf8");
    const stripped = retargetSpecifiers(stripTypeScriptTypes(source, { mode: "strip" }));
    const path = resolve(outputRoot, `${name}.mjs`);
    await writeFile(path, stripped);
    written.push({ name, path, bytes: stripped.length });
  }
  const searchSource = await readFile(await cairnSearchSourcePath(), "utf8");
  const searchPath = resolve(outputRoot, `${CAIRN_BROWSER_MODULE}.mjs`);
  await writeFile(searchPath, searchSource);
  written.push({ name: CAIRN_BROWSER_MODULE, path: searchPath, bytes: searchSource.length });
  const tuftePath = resolve(outputRoot, `${TUFTE_BROWSER_MODULE}.mjs`);
  await build({
    entryPoints: [tufteBrowserSourcePath()],
    bundle: true,
    format: "esm",
    minify: true,
    outfile: tuftePath,
    platform: "browser",
    target: "es2022",
  });
  const tufteSource = await readFile(tuftePath, "utf8");
  written.push({ name: TUFTE_BROWSER_MODULE, path: tuftePath, bytes: tufteSource.length });
  return written;
}

if (import.meta.filename === process.argv[1]) {
  const written = await buildBrowserEngine(resolve(import.meta.dirname, "..", "public", "js"));
  for (const module of written) console.log(`${module.name}.mjs  ${module.bytes} bytes`);
}
