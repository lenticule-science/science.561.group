import { mkdir, readdir, readFile, writeFile } from "node:fs/promises";
import { stripTypeScriptTypes } from "node:module";
import path from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const kernelRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const sourceDirectory = path.join(kernelRoot, "src");

function browserModuleSource(source) {
  return stripTypeScriptTypes(source, { mode: "strip" }).replace(
    /(from\s+["'](?:\.\.?\/)[^"']*)\.mts(["'])/g,
    "$1.mjs$2",
  );
}

async function verifyBrowserKernel(outputDirectory) {
  const kernel = await import(pathToFileURL(path.join(outputDirectory, "index.mjs")).href);
  if (typeof kernel.Game !== "function") {
    throw new Error(`Browser kernel at ${outputDirectory} does not export Game`);
  }

  const game = new kernel.Game(9, "chinese");
  const moves = ["C3", "G7", "C7"];
  for (const move of moves) {
    const outcome = game.play(move);
    if (!outcome.ok) {
      throw new Error(`Browser kernel at ${outputDirectory} rejected ${move}: ${outcome.reason}`);
    }
  }
  if (game.history.length !== moves.length + 1) {
    throw new Error(`Browser kernel at ${outputDirectory} produced ${game.history.length} positions, expected ${moves.length + 1}`);
  }
}

/** Build the kernel's browser ESM projection into one static application's public directory. */
export async function buildBrowserKernel(outputDirectory) {
  const entries = await readdir(sourceDirectory, { withFileTypes: true });
  const sourceFiles = entries.filter((entry) => entry.isFile() && entry.name.endsWith(".mts"));
  if (sourceFiles.length === 0) {
    throw new Error(`No kernel source modules found in ${sourceDirectory}`);
  }

  const destination = path.resolve(outputDirectory);
  await mkdir(destination, { recursive: true });
  await Promise.all(sourceFiles.map(async ({ name }) => {
    const source = await readFile(path.join(sourceDirectory, name), "utf8");
    await writeFile(path.join(destination, `${name.slice(0, -4)}.mjs`), browserModuleSource(source), "utf8");
  }));
  await verifyBrowserKernel(destination);
  return { destination, moduleCount: sourceFiles.length };
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  const outputDirectory = process.argv[2];
  if (!outputDirectory) {
    throw new Error("usage: node build-browser-kernel.mjs <output-directory>");
  }
  const result = await buildBrowserKernel(outputDirectory);
  console.log(`Built and verified ${result.moduleCount} browser kernel modules in ${result.destination}`);
}
