#!/usr/bin/env node

import { existsSync, readdirSync, readFileSync } from "node:fs";
import { join, relative, sep } from "node:path";

const root = process.cwd();
const failMode = process.argv.includes("--fail");
const infomaterialRoot = join(root, "Infomaterial");

const expectedTopLevelDirs = [
  "Articulation",
  "Calculus",
  "Closure",
  "Cohomology",
  "Computing",
  "Dynamics",
  "Language",
  "Persistence",
  "Primitive",
  "Relational",
  "Site",
];

const expectedRootSpine = [
  "import Infomaterial.Primitive",
  "import Infomaterial.Articulation",
  "import Infomaterial.Language",
  "import Infomaterial.Calculus",
  "import Infomaterial.Site",
  "import Infomaterial.Closure",
  "import Infomaterial.Cohomology",
  "import Infomaterial.Dynamics",
  "import Infomaterial.Persistence",
  "import Infomaterial.Relational",
  "import Infomaterial.Computing",
];

const oldImportRoots = [
  "Mark",
  "Articulating",
  "Predicating",
  "Positing",
  "Settling",
  "Flow",
  "Gauge",
  "Algebra",
  "Order",
  "Real",
  "LinearAlgebra",
  "Probability",
  "Optimization",
  "DenseMatter",
  "Fluid",
  "Gaming",
  "Kinetic",
  "Liquid",
  "Material",
  "Plasma",
  "Quantum",
  "Reaction",
  "Spacetime",
  "Thermo",
];

const pathOnlyRoots = ["Primitive", "Articulation", "Language", "Calculus", "Dynamics"];

const findings = [];

function walk(dir) {
  const out = [];
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const path = join(dir, entry.name);
    if (entry.isDirectory()) {
      out.push(...walk(path));
    } else if (entry.isFile() && /\.(lean|md|tex|txt|mjs)$/.test(entry.name)) {
      out.push(path);
    }
  }
  return out;
}

function rel(path) {
  return relative(root, path).replaceAll(sep, "/");
}

const actualTopLevelDirs = readdirSync(infomaterialRoot, { withFileTypes: true })
  .filter((entry) => entry.isDirectory())
  .map((entry) => entry.name)
  .sort();

if (actualTopLevelDirs.join("\n") !== expectedTopLevelDirs.join("\n")) {
  findings.push({
    rel: "Infomaterial/",
    message: `top-level dirs are ${actualTopLevelDirs.join(", ")}; expected ${expectedTopLevelDirs.join(", ")}`,
  });
}

const rootImports = readFileSync(join(root, "Infomaterial.lean"), "utf8")
  .split(/\r?\n/)
  .filter((line) => line.startsWith("import Infomaterial"));

if (rootImports.join("\n") !== expectedRootSpine.join("\n")) {
  findings.push({
    rel: "Infomaterial.lean",
    message: "root imports are not the derivation spine",
  });
}

const oldImportRe = new RegExp(`^\\s*import\\s+Infomaterial\\.(${oldImportRoots.join("|")})(?=\\.|\\s|$)`);
const pathNamespaceRe = new RegExp(`^\\s*namespace\\s+Infomaterial\\.(${pathOnlyRoots.join("|")})(?=\\.|\\s|$)`);
const oldPathRe = new RegExp(`Infomaterial/(${oldImportRoots.join("|")})(/|\\.lean)`);

for (const file of walk(root)) {
  if (file.includes(`${sep}.lake${sep}`) || file.includes(`${sep}scripts${sep}tooling${sep}.lake${sep}`)) continue;
  const lines = readFileSync(file, "utf8").split(/\r?\n/);
  for (let i = 0; i < lines.length; i += 1) {
    const line = lines[i];
    if (oldImportRe.test(line)) {
      findings.push({ rel: rel(file), line: i + 1, message: `old import path: ${line.trim()}` });
    }
    if (pathNamespaceRe.test(line)) {
      findings.push({ rel: rel(file), line: i + 1, message: `path stratum used as namespace: ${line.trim()}` });
    }
    if (oldPathRe.test(line)) {
      findings.push({ rel: rel(file), line: i + 1, message: "old file path literal" });
    }
  }
}

for (const barrel of expectedRootSpine.map((line) => line.replace("import ", "").replaceAll(".", sep) + ".lean")) {
  if (!existsSync(join(root, barrel))) {
    findings.push({ rel: barrel.replaceAll(sep, "/"), message: "missing stratum barrel" });
  }
}

if (findings.length === 0) {
  console.log("Infomaterial packaging audit: ok");
} else {
  console.log(`Infomaterial packaging audit: ${findings.length} finding(s)`);
  for (const finding of findings) {
    const loc = finding.line == null ? finding.rel : `${finding.rel}:${finding.line}`;
    console.log(`${loc}: ${finding.message}`);
  }
}

if (failMode && findings.length > 0) {
  process.exitCode = 1;
}
