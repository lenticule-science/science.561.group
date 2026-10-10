#!/usr/bin/env node

import { existsSync, readdirSync, readFileSync } from "node:fs";
import { join, relative, sep } from "node:path";

const root = process.cwd();
const failMode = process.argv.includes("--fail");
const findings = [];

function rel(path) {
  return relative(root, path).replaceAll(sep, "/");
}

function add(relPath, message, line = null) {
  findings.push({ rel: relPath, line, message });
}

function read(path) {
  return readFileSync(path, "utf8");
}

function walk(dir, predicate) {
  const out = [];
  if (!existsSync(dir)) return out;
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const path = join(dir, entry.name);
    if (entry.isDirectory()) {
      if (entry.name === ".lake" || entry.name === ".git" || entry.name === "_archive") continue;
      out.push(...walk(path, predicate));
    } else if (entry.isFile() && predicate(path)) {
      out.push(path);
    }
  }
  return out;
}

function modulePathToFile(moduleName) {
  return join(root, ...moduleName.split(".")) + ".lean";
}

function fileToModule(path) {
  return rel(path).replace(/\.lean$/, "").replaceAll("/", ".");
}

function parseArray(text, key) {
  const match = text.match(new RegExp(`^${key}\\s*=\\s*\\[([^\\]]*)\\]`, "m"));
  if (!match) return [];
  return [...match[1].matchAll(/"([^"]+)"/g)].map((item) => item[1]);
}

function parseLeanStanzas(text, kind) {
  const header = `[[${kind}]]`;
  const stanzas = [];
  let current = null;
  for (const line of text.split(/\r?\n/)) {
    if (/^\s*\[\[.+\]\]\s*$/.test(line) && line.trim() !== header) {
      current = null;
      continue;
    }
    if (line.trim() === header) {
      current = {};
      stanzas.push(current);
      continue;
    }
    if (!current) continue;
    const match = line.match(/^\s*([A-Za-z0-9_.-]+)\s*=\s*"([^"]+)"/);
    if (match) current[match[1]] = match[2];
  }
  return stanzas;
}

function importLines(path) {
  const lines = read(path).split(/\r?\n/);
  const imports = [];
  for (let i = 0; i < lines.length; i += 1) {
    const match = lines[i].match(/^\s*import\s+([A-Za-z0-9_'.]+)\s*$/);
    if (match) imports.push({ module: match[1], line: i + 1 });
  }
  return imports;
}

for (const path of ["lean-toolchain", "lakefile.toml", "lake-manifest.json"]) {
  if (!existsSync(join(root, path))) add(path, "missing Lean project metadata file");
}

if (existsSync(join(root, "lean-toolchain"))) {
  const toolchain = read(join(root, "lean-toolchain")).trim();
  if (!/^leanprover\/lean4:v\d+\.\d+\.\d+$/.test(toolchain)) {
    add("lean-toolchain", `toolchain is not pinned to an exact Lean release: ${toolchain || "(empty)"}`);
  }
}

const lakefilePath = join(root, "lakefile.toml");
const lakefile = existsSync(lakefilePath) ? read(lakefilePath) : "";
const packageName = lakefile.match(/^name\s*=\s*"([^"]+)"/m)?.[1] ?? null;
const defaultTargets = parseArray(lakefile, "defaultTargets");
const leanLibs = parseLeanStanzas(lakefile, "lean_lib");
const leanExes = parseLeanStanzas(lakefile, "lean_exe");

if (!packageName) add("lakefile.toml", "missing package name");
if (leanLibs.length === 0) add("lakefile.toml", "no [[lean_lib]] declared");

for (const target of defaultTargets) {
  const declared = leanLibs.some((lib) => lib.name === target) || leanExes.some((exe) => exe.name === target);
  if (!declared) add("lakefile.toml", `default target ${target} is not declared as a lean_lib or lean_exe`);
}

const localRootNames = new Set();
const libraryRootModules = [];
const executableRootModules = [];

for (const lib of leanLibs) {
  if (!lib.name) {
    add("lakefile.toml", "lean_lib stanza without a name");
    continue;
  }
  localRootNames.add(lib.name.split(".")[0]);
  libraryRootModules.push(lib.name);
  const file = modulePathToFile(lib.name);
  if (!existsSync(file)) add(`${lib.name.replaceAll(".", "/")}.lean`, `declared lean_lib ${lib.name} has no root module file`);
}

for (const exe of leanExes) {
  if (!exe.name) add("lakefile.toml", "lean_exe stanza without a name");
  if (!exe.root) {
    add("lakefile.toml", `lean_exe ${exe.name ?? "(unnamed)"} has no root module`);
    continue;
  }
  executableRootModules.push(exe.root);
  localRootNames.add(exe.root.split(".")[0]);
  const file = modulePathToFile(exe.root);
  if (!existsSync(file)) add(`${exe.root.replaceAll(".", "/")}.lean`, `declared executable root ${exe.root} has no module file`);
}

const activeLeanFiles = [
  ...walk(root, (path) => path.endsWith(".lean")),
].filter((path) => {
  const r = rel(path);
  return !r.startsWith("docs/") && !r.startsWith(".lake/") && !r.startsWith("_archive/");
});

const moduleToFile = new Map();
for (const file of activeLeanFiles) {
  const moduleName = fileToModule(file);
  if (moduleToFile.has(moduleName)) {
    add(rel(file), `duplicate Lean module name also provided by ${rel(moduleToFile.get(moduleName))}`);
  } else {
    moduleToFile.set(moduleName, file);
  }
}

const importGraph = new Map();
for (const file of activeLeanFiles) {
  const moduleName = fileToModule(file);
  const imports = importLines(file);
  importGraph.set(moduleName, imports.map((item) => item.module).filter((item) => moduleToFile.has(item)));

  for (const item of imports) {
    const firstSegment = item.module.split(".")[0];
    if (localRootNames.has(firstSegment) && !moduleToFile.has(item.module)) {
      add(rel(file), `local import does not resolve to a checked Lean file: ${item.module}`, item.line);
    }
  }
}

const reachable = new Set();
const stack = [...libraryRootModules, ...executableRootModules].filter((moduleName) => moduleToFile.has(moduleName));
while (stack.length > 0) {
  const moduleName = stack.pop();
  if (reachable.has(moduleName)) continue;
  reachable.add(moduleName);
  for (const imported of importGraph.get(moduleName) ?? []) stack.push(imported);
}

for (const lib of leanLibs) {
  if (!lib.name) continue;
  const libRoot = lib.name.replaceAll(".", "/");
  for (const file of activeLeanFiles) {
    const r = rel(file);
    if (!(r === `${libRoot}.lean` || r.startsWith(`${libRoot}/`))) continue;
    const moduleName = fileToModule(file);
    if (!reachable.has(moduleName)) {
      add(r, `Lean library file is not reachable from declared root ${lib.name}`);
    }
  }
}

const executableRootDirs = new Set(executableRootModules.map((moduleName) => moduleName.split(".")[0]));

for (const file of activeLeanFiles) {
  const r = rel(file);
  if (executableRootDirs.has(r.split("/")[0])) continue;
  const inSomeLibrary = leanLibs.some((lib) => {
    if (!lib.name) return false;
    const libRoot = lib.name.replaceAll(".", "/");
    return r === `${libRoot}.lean` || r.startsWith(`${libRoot}/`);
  });
  if (!inSomeLibrary) {
    add(r, "active Lean file is outside any declared lean_lib root");
  }
}

if (findings.length === 0) {
  console.log(
    `Lean project audit: ok (${activeLeanFiles.length} checked Lean file(s), ${leanLibs.length} library root(s), ${leanExes.length} executable root(s))`,
  );
} else {
  console.log(`Lean project audit: ${findings.length} finding(s)`);
  for (const finding of findings) {
    const loc = finding.line == null ? finding.rel : `${finding.rel}:${finding.line}`;
    console.log(`${loc}: ${finding.message}`);
  }
}

if (failMode && findings.length > 0) {
  process.exitCode = 1;
}
