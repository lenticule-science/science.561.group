import assert from "node:assert/strict";
import { spawn } from "node:child_process";
import { mkdtemp, readFile, readdir, rm } from "node:fs/promises";
import { tmpdir } from "node:os";
import { basename, join, relative } from "node:path";
import { fileURLToPath } from "node:url";

const packageDirectory = fileURLToPath(new URL("..", import.meta.url));

function run(command, args, cwd) {
  return new Promise((resolve, reject) => {
    const child = spawn(command, args, { cwd, stdio: ["ignore", "pipe", "pipe"] });
    let stdout = "";
    let stderr = "";
    child.stdout.on("data", (chunk) => { stdout += chunk; });
    child.stderr.on("data", (chunk) => { stderr += chunk; });
    child.on("error", reject);
    child.on("close", (code) => code === 0 ? resolve({ stdout, stderr }) : reject(new Error(`${command} ${args.join(" ")} exited ${code}: ${stderr || stdout}`)));
  });
}

async function mjsFiles(directory) {
  const entries = await readdir(directory, { withFileTypes: true });
  const nested = await Promise.all(entries.map(async (entry) => {
    const pathname = join(directory, entry.name);
    if (entry.isDirectory()) return mjsFiles(pathname);
    return entry.isFile() && entry.name.endsWith(".mjs") ? [pathname] : [];
  }));
  return nested.flat();
}

async function concreteExports(manifest, installedDirectory) {
  const exact = [];
  const patterns = [];
  for (const [subpath, target] of Object.entries(manifest.exports)) {
    const importTarget = typeof target === "string" ? target : target.import;
    assert.equal(typeof importTarget, "string", `export ${subpath} must provide an import target`);
    if (subpath.includes("*")) patterns.push({ subpath, target: importTarget });
    else exact.push({ subpath, target: importTarget });
  }
  for (const pattern of patterns) {
    const [prefix, suffix] = pattern.target.split("*");
    assert.notEqual(suffix, undefined, `pattern ${pattern.subpath} must include a target wildcard`);
    const root = join(installedDirectory, prefix);
    for (const pathname of await mjsFiles(root)) {
      const target = `./${relative(installedDirectory, pathname).replaceAll("\\\\", "/")}`;
      if (!target.startsWith(prefix) || !target.endsWith(suffix)) continue;
      const value = target.slice(prefix.length, target.length - suffix.length);
      exact.push({ subpath: pattern.subpath.replace("*", value), target });
    }
  }
  return exact.sort((left, right) => left.subpath.localeCompare(right.subpath));
}

export async function verifyPackageArtifact() {
  const manifest = JSON.parse(await readFile(join(packageDirectory, "package.json"), "utf8"));
  const scratch = await mkdtemp(join(tmpdir(), "articulating-package-artifact-"));
  try {
    const packed = JSON.parse((await run("npm", ["pack", "--json", "--ignore-scripts"], packageDirectory)).stdout);
    assert.equal(packed.length, 1, "npm pack must produce exactly one artifact");
    const tarball = join(packageDirectory, packed[0].filename);
    await run("npm", ["install", tarball, "--ignore-scripts", "--no-package-lock", "--registry", "https://registry.561.group"], scratch);
    const installedDirectory = join(scratch, "node_modules", ...manifest.name.split("/"));
    const installedManifest = JSON.parse(await readFile(join(installedDirectory, "package.json"), "utf8"));
    assert.deepEqual(installedManifest.exports, manifest.exports, "packed manifest must preserve declared exports");
    const exports = await concreteExports(installedManifest, installedDirectory);
    for (const exported of exports) {
      const specifier = exported.subpath === "." ? manifest.name : `${manifest.name}/${exported.subpath.slice(2)}`;
      const options = exported.target.endsWith(".json") ? { with: { type: "json" } } : undefined;
      await import(specifier, options);
    }
    return { package: manifest.name, version: manifest.version, exports: exports.map(({ subpath }) => subpath) };
  } finally {
    await rm(scratch, { recursive: true, force: true });
  }
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  process.stdout.write(`${JSON.stringify(await verifyPackageArtifact())}\n`);
}
