#!/usr/bin/env node

import { existsSync, mkdirSync, readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { join, relative, sep } from "node:path";

const root = process.cwd();
const coveragePath = join(root, "sites", "docs", "coverage", "blueprint-nodes.json");
const outDir = join(root, "sites", "docs", "coverage");
const jsonPath = join(outDir, "cross-surface-audit.json");
const markdownPath = join(outDir, "cross-surface-audit.md");

const failOnBadBlueprint = process.argv.includes("--fail-on-bad-blueprint");
const failOnBadVerso = process.argv.includes("--fail-on-bad-verso");
const failOnUnblueprintedLean = process.argv.includes("--fail-on-unblueprinted-lean");

function rel(path) {
  return relative(root, path).replaceAll(sep, "/");
}

function walk(dir, predicate) {
  const out = [];
  if (!existsSync(dir)) return out;
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const path = join(dir, entry.name);
    if (entry.isDirectory()) out.push(...walk(path, predicate));
    else if (entry.isFile() && predicate(path)) out.push(path);
  }
  return out.sort((left, right) => left.localeCompare(right));
}

function moduleToPath(module) {
  return join(root, "docs", "verso", `${module.replaceAll(".", sep)}.lean`);
}

function pathToVersoModule(file) {
  return rel(file).replace(/^docs\/verso\//u, "").replace(/\.lean$/u, "").replaceAll("/", ".");
}

function firstLines(items, max = 40) {
  return items.slice(0, max).map((item) => `- ${item}`);
}

function stripLeanComments(text) {
  let out = "";
  let i = 0;
  let depth = 0;

  while (i < text.length) {
    const pair = text.slice(i, i + 2);

    if (depth > 0) {
      if (pair === "/-") {
        depth += 1;
        out += "  ";
        i += 2;
      } else if (pair === "-/") {
        depth -= 1;
        out += "  ";
        i += 2;
      } else {
        out += text[i] === "\n" ? "\n" : " ";
        i += 1;
      }
      continue;
    }

    if (pair === "/-") {
      depth = 1;
      out += "  ";
      i += 2;
      continue;
    }

    if (pair === "--") {
      while (i < text.length && text[i] !== "\n") {
        out += " ";
        i += 1;
      }
      continue;
    }

    out += text[i];
    i += 1;
  }

  return out;
}

function moduleNameFor(file) {
  return rel(file).replace(/\.lean$/u, "").replaceAll("/", ".");
}

function resolveNamespace(current, raw) {
  const name = raw.trim();
  if (!name) return current;
  if (name === "Obsmetrologia" || name.startsWith("Obsmetrologia.")) return name;
  return current ? `${current}.${name}` : name;
}

function resolveDeclarationName(currentNamespace, rawName) {
  const name = rawName.trim();
  if (name.startsWith("Obsmetrologia.")) return name;
  return currentNamespace ? `${currentNamespace}.${name}` : name;
}

function readLeanWorkspace(rootDir) {
  const files = walk(join(rootDir, "Obsmetrologia"), (file) => file.endsWith(".lean"));
  const rootFile = join(rootDir, "Obsmetrologia.lean");
  const sourceFiles = existsSync(rootFile) ? [rootFile, ...files] : files;
  const declarationPattern =
    /^\s*(?:@\[[^\]]*\]\s*)*(?:protected\s+|private\s+|noncomputable\s+|partial\s+|unsafe\s+)*(axiom|constant|opaque|inductive|structure|class|def|theorem|lemma|abbrev|instance)\s+([A-Za-z_][A-Za-z0-9_']*(?:\.[A-Za-z_][A-Za-z0-9_']*)*)(?:\.\{[^}]*\})?/u;
  const declarations = [];
  const modules = sourceFiles.map((file) => ({ module: moduleNameFor(file), path: file }));
  const admitted = new Set();

  for (const file of sourceFiles) {
    if (statSync(file).size > 1024 * 1024) continue;
    const lines = stripLeanComments(readFileSync(file, "utf8")).split(/\r?\n/u);
    const namespaceStack = [];
    let currentDeclaration = null;

    for (let i = 0; i < lines.length; i += 1) {
      const line = lines[i];
      const namespace = line.match(/^\s*namespace\s+([A-Za-z_][A-Za-z0-9_'.]*)\s*$/u);
      if (namespace) {
        namespaceStack.push(resolveNamespace(namespaceStack.at(-1) ?? "", namespace[1]));
        continue;
      }
      if (/^\s*end(?:\s+[A-Za-z_][A-Za-z0-9_'.]*)?\s*$/u.test(line) && namespaceStack.length > 0) {
        namespaceStack.pop();
        continue;
      }

      const declaration = line.match(declarationPattern);
      if (declaration) {
        currentDeclaration = {
          kind: declaration[1],
          name: resolveDeclarationName(namespaceStack.at(-1) ?? "", declaration[2]),
          module: moduleNameFor(file),
          file: rel(file),
          line: i + 1,
        };
        declarations.push(currentDeclaration);
      }

      if (/\bsorry\b/u.test(line) && currentDeclaration?.kind.match(/^(theorem|lemma)$/u)) {
        admitted.add(currentDeclaration.name);
      }
    }
  }

  const theoremEntries = declarations.filter((entry) => entry.kind === "theorem" || entry.kind === "lemma");

  return {
    modules,
    declarationCatalog: { entries: declarations },
    theoremSpine: {
      entries: theoremEntries,
      admitted: [...admitted].sort((left, right) => left.localeCompare(right)),
    },
  };
}

function collectBlueprint() {
  if (!existsSync(coveragePath)) {
    throw new Error("Missing Blueprint coverage. Run `node scripts/blueprint-coverage.mjs` first.");
  }
  const coverage = JSON.parse(readFileSync(coveragePath, "utf8"));
  const nodes = coverage.nodes ?? [];
  const leanRefs = [];
  const badNodes = [];

  for (const node of nodes) {
    if (!node.label) badNodes.push({ code: "missing-label", node });
    if (node.status === "none") badNodes.push({ code: "missing-status", node });
    const refs = String(node.lean ?? "")
      .split(",")
      .map((value) => value.trim())
      .filter(Boolean);
    for (const lean of refs) {
      leanRefs.push({
        lean,
        label: node.label,
        status: node.status,
        file: node.file,
        line: node.line,
      });
    }
  }

  return { coverage, nodes, leanRefs, badNodes };
}

function collectVerso(leanNames, moduleNames) {
  const rootFile = join(root, "docs", "verso", "ObsmetrologiaManual.lean");
  const rootText = readFileSync(rootFile, "utf8");
  const importedModules = [...rootText.matchAll(/^import\s+(ObsmetrologiaManual(?:\.[A-Za-z_][A-Za-z0-9_']*)*)/gmu)]
    .map((match) => match[1]);
  const includedModules = [...rootText.matchAll(/\{include\s+\d+\s+(ObsmetrologiaManual(?:\.[A-Za-z_][A-Za-z0-9_']*)*)\}/gu)]
    .map((match) => match[1]);
  const allPageFiles = walk(join(root, "docs", "verso", "ObsmetrologiaManual"), (file) => file.endsWith(".lean"));
  const allPageModules = allPageFiles.map(pathToVersoModule);
  const imported = new Set(importedModules);
  const included = new Set(includedModules);

  const missingImportedFiles = importedModules
    .filter((module) => !existsSync(moduleToPath(module)))
    .sort((left, right) => left.localeCompare(right));
  const includesWithoutImport = includedModules
    .filter((module) => !imported.has(module))
    .sort((left, right) => left.localeCompare(right));
  const missingIncludedFiles = includedModules
    .filter((module) => !existsSync(moduleToPath(module)))
    .sort((left, right) => left.localeCompare(right));
  const unimportedGoverningPages = allPageModules
    .filter((module) => !imported.has(module))
    .filter((module) => !module.startsWith("ObsmetrologiaManual.Part"))
    .sort((left, right) => left.localeCompare(right));
  const importedNotIncluded = importedModules
    .filter((module) => module !== "ObsmetrologiaManual.DocSetup")
    .filter((module) => !included.has(module))
    .sort((left, right) => left.localeCompare(right));

  const declarationRefs = [];
  const missingDeclarationRefs = [];
  const moduleRefs = [];
  const leanRefPattern = /\bObsmetrologia(?:\.[A-Za-z_][A-Za-z0-9_']*)+\b/gu;

  for (const file of allPageFiles.concat(rootFile)) {
    const lines = readFileSync(file, "utf8").split(/\r?\n/u);
    for (let i = 0; i < lines.length; i += 1) {
      const line = lines[i];
      if (/^\s*import\s+/u.test(line)) continue;
      if (/^\s*open\s+/u.test(line)) continue;
      const seen = new Set();
      for (const match of line.matchAll(leanRefPattern)) {
        const name = match[0];
        if (name.startsWith("ObsmetrologiaManual.") || seen.has(name)) continue;
        seen.add(name);
        if (moduleNames.has(name)) {
          moduleRefs.push({ name, file: rel(file), line: i + 1 });
          continue;
        }
        const ref = { name, file: rel(file), line: i + 1 };
        declarationRefs.push(ref);
        if (!leanNames.has(name)) missingDeclarationRefs.push(ref);
      }
    }
  }

  return {
    rootFile: rel(rootFile),
    allPageModules,
    importedModules,
    includedModules,
    declarationRefs,
    moduleRefs,
    missingImportedFiles,
    includesWithoutImport,
    missingIncludedFiles,
    unimportedGoverningPages,
    importedNotIncluded,
    missingDeclarationRefs,
  };
}

const workspace = readLeanWorkspace(root);
const workspaceSource = "Obsmetrologia Lean source audit";
const directLeanWorkspace = workspace;
const declarations = workspace.declarationCatalog.entries;
const leanNames = new Set(declarations.map((entry) => entry.name));
const moduleNames = new Set(workspace.modules.map((entry) => entry.module));
const theoremNames = new Set(workspace.theoremSpine.entries.map((entry) => entry.name));
const blueprint = collectBlueprint();
const blueprintLeanNames = new Set(blueprint.leanRefs.map((ref) => ref.lean));

const missingBlueprintRefs = [...blueprintLeanNames]
  .filter((name) => !leanNames.has(name))
  .sort((left, right) => left.localeCompare(right));
const settledBlueprintStatuses = new Set(["green", "leanok"]);
const admittedLeanNames = new Set(directLeanWorkspace.theoremSpine.admitted);
const blueprintedAdmittedSettled = [...new Set(blueprint.leanRefs
  .filter((ref) => settledBlueprintStatuses.has(ref.status))
  .map((ref) => ref.lean)
  .filter((name) => admittedLeanNames.has(name)))]
  .sort((left, right) => left.localeCompare(right));
const unblueprintedTheorems = [...theoremNames]
  .filter((name) => name.startsWith("Obsmetrologia."))
  .filter((name) => !blueprintLeanNames.has(name))
  .sort((left, right) => left.localeCompare(right));

const verso = collectVerso(leanNames, moduleNames);

const badBlueprintCount = blueprint.badNodes.length + missingBlueprintRefs.length + blueprintedAdmittedSettled.length;
const badVersoCount =
  verso.missingImportedFiles.length
  + verso.includesWithoutImport.length
  + verso.missingIncludedFiles.length
  + verso.unimportedGoverningPages.length;

const counts = {
  leanModules: workspace.modules.length,
  leanDeclarations: declarations.length,
  leanTheorems: theoremNames.size,
  blueprintNodes: blueprint.nodes.length,
  blueprintLeanRefs: blueprint.leanRefs.length,
  uniqueBlueprintLeanRefs: blueprintLeanNames.size,
  missingBlueprintRefs: missingBlueprintRefs.length,
  blueprintedAdmittedSettled: blueprintedAdmittedSettled.length,
  unblueprintedTheorems: unblueprintedTheorems.length,
  versoPages: verso.allPageModules.length,
  versoRootImports: verso.importedModules.length,
  versoRootIncludes: verso.includedModules.length,
  unimportedGoverningVersoPages: verso.unimportedGoverningPages.length,
  versoModuleRefs: verso.moduleRefs.length,
  versoLeanRefs: verso.declarationRefs.length,
  missingVersoLeanRefs: verso.missingDeclarationRefs.length,
};

const report = {
  kind: "obsmetrologia.cross-surface-audit",
  producedBy: `${workspaceSource} plus Obsmetrologia surface parsers`,
  counts,
  blueprint: {
    badNodes: blueprint.badNodes,
    missingBlueprintRefs,
    blueprintedAdmittedSettled,
    unblueprintedTheorems,
  },
  verso,
};

mkdirSync(outDir, { recursive: true });
writeFileSync(jsonPath, `${JSON.stringify(report, null, 2)}\n`, "utf8");

const md = [
  "# Cross-Surface Audit",
  "",
  `Lean topology is read through \`${workspaceSource}\`; Blueprint and Verso are parsed with Obsmetrologia-specific surface rules.`,
  "",
  "## Counts",
  "",
  `- Lean modules: ${counts.leanModules}`,
  `- Lean declarations: ${counts.leanDeclarations}`,
  `- Lean theorem/lemma spine: ${counts.leanTheorems}`,
  `- Blueprint nodes: ${counts.blueprintNodes}`,
  `- Unique Blueprint Lean refs: ${counts.uniqueBlueprintLeanRefs}`,
  `- Unblueprinted Lean theorem/lemma declarations: ${counts.unblueprintedTheorems}`,
  `- Verso pages: ${counts.versoPages}`,
  `- Verso root imports/includes: ${counts.versoRootImports}/${counts.versoRootIncludes}`,
  `- Verso module refs ignored as declaration refs: ${counts.versoModuleRefs}`,
  `- Verso Lean refs: ${counts.versoLeanRefs}`,
  "",
  "## Failing Checks",
  "",
  `- Bad Blueprint nodes: ${blueprint.badNodes.length}`,
  `- Missing Blueprint Lean refs: ${missingBlueprintRefs.length}`,
  `- Settled Blueprint refs still admitted in Lean: ${blueprintedAdmittedSettled.length}`,
  `- Missing Verso imports/includes/files: ${verso.missingImportedFiles.length + verso.includesWithoutImport.length + verso.missingIncludedFiles.length}`,
  `- Unimported governing Verso pages: ${verso.unimportedGoverningPages.length}`,
  "",
  "### Missing Blueprint Lean Refs",
  "",
  ...(missingBlueprintRefs.length === 0 ? ["None."] : firstLines(missingBlueprintRefs)),
  missingBlueprintRefs.length > 40 ? `- ... ${missingBlueprintRefs.length - 40} more` : "",
  "",
  "### Settled Blueprint Refs Still Admitted In Lean",
  "",
  ...(blueprintedAdmittedSettled.length === 0 ? ["None."] : firstLines(blueprintedAdmittedSettled)),
  blueprintedAdmittedSettled.length > 40 ? `- ... ${blueprintedAdmittedSettled.length - 40} more` : "",
  "",
  "## Gripe Lists",
  "",
  "### Unblueprinted Lean Theorems/Lemmas",
  "",
  ...firstLines(unblueprintedTheorems),
  unblueprintedTheorems.length > 40 ? `- ... ${unblueprintedTheorems.length - 40} more` : "",
  "",
  "### Verso Lean References Missing From Declaration Catalog",
  "",
  ...(verso.missingDeclarationRefs.length === 0
    ? ["None."]
    : firstLines(verso.missingDeclarationRefs.map((ref) => `${ref.file}:${ref.line} ${ref.name}`))),
  verso.missingDeclarationRefs.length > 40 ? `- ... ${verso.missingDeclarationRefs.length - 40} more` : "",
  "",
  "### Imported Verso Modules Not Included By The Root Document",
  "",
  ...(verso.importedNotIncluded.length === 0 ? ["None."] : firstLines(verso.importedNotIncluded)),
  verso.importedNotIncluded.length > 40 ? `- ... ${verso.importedNotIncluded.length - 40} more` : "",
  "",
].filter((line) => line !== "");

writeFileSync(markdownPath, `${md.join("\n")}\n`, "utf8");

console.log(
  `Cross-surface audit: ${counts.uniqueBlueprintLeanRefs}/${counts.leanTheorems} Lean theorem refs blueprinted; `
  + `${counts.unimportedGoverningVersoPages} unimported governing Verso page(s); `
  + `${counts.missingVersoLeanRefs} missing Verso Lean ref(s) -> ${rel(jsonPath)}`,
);

if (
  (failOnBadBlueprint && badBlueprintCount > 0)
  || (failOnBadVerso && badVersoCount > 0)
  || (failOnUnblueprintedLean && unblueprintedTheorems.length > 0)
) {
  process.exitCode = 1;
}
