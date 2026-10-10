#!/usr/bin/env node

import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { join, relative, sep } from "node:path";
import { walkPosixPathsSync } from "@red-cup-engineering/filepath-services-section/walk-posix-paths";

const root = process.cwd();
const failMode = process.argv.includes("--fail");
const infomaterialRoot = join(root, "Infomaterial");
const coveragePath = join(root, "sites", "docs", "coverage", "blueprint-nodes.json");
const outDir = join(root, "sites", "docs", "coverage");
const jsonPath = join(outDir, "lean-blueprint-weld.json");
const htmlPath = join(outDir, "lean-blueprint-weld.html");

function rel(path) {
  return relative(root, path).replaceAll(sep, "/");
}

function html(value) {
  return String(value ?? "")
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;");
}

function walk(dir) {
  return walkPosixPathsSync({ root: dir, paths: "absolute", result: "paths", extensions: [".lean"] }).files;
}

function moduleNameFor(file) {
  const relativePath = rel(file).replace(/\.lean$/, "");
  return relativePath.replaceAll("/", ".");
}

function rootOfDecl(name) {
  const parts = name.split(".");
  return parts[0] === "Infomaterial" ? (parts[1] ?? "(root)") : parts[0];
}

function rootOfModule(name) {
  const parts = name.split(".");
  return parts[0] === "Infomaterial" ? (parts[1] ?? "(root)") : parts[0];
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
        i += 2;
      } else if (pair === "-/") {
        depth -= 1;
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

function leanRefsForNode(node) {
  return String(node.lean ?? "")
    .split(",")
    .map((value) => value.trim())
    .filter(Boolean);
}

function resolveNamespace(current, raw) {
  const name = raw.trim();
  if (!name) return current;
  if (name === "Infomaterial" || name.startsWith("Infomaterial.")) return name;
  return current ? `${current}.${name}` : name;
}

function resolveDeclName(currentNamespace, rawName) {
  const name = rawName.trim();
  if (name.startsWith("Infomaterial.")) return name;
  return currentNamespace ? `${currentNamespace}.${name}` : name;
}

const declPattern = /^\s*(?:@\[[^\]]*\]\s*)*(?:protected\s+|private\s+|noncomputable\s+|partial\s+|unsafe\s+|opaque\s+)*(inductive|structure|class|def|theorem|lemma|abbrev|instance|axiom|constant)\s+([A-Za-z_][A-Za-z0-9_'.]*(?:\.[A-Za-z_][A-Za-z0-9_'.]*)*)(?=\s|:|\(|:=|where|$)/;

const declarations = [];
const modules = new Map();

for (const file of walk(infomaterialRoot)) {
  const text = readFileSync(file, "utf8");
  const lines = text.split(/\r?\n/);
  const module = moduleNameFor(file);
  const imports = [];
  const namespaceStack = [];
  let currentNamespace = "";
  let inBlockComment = false;
  const fileDeclarations = [];

  for (let i = 0; i < lines.length; i += 1) {
    const lineNo = i + 1;
    let line = lines[i];

    if (inBlockComment) {
      if (line.includes("-/")) {
        line = line.slice(line.indexOf("-/") + 2);
        inBlockComment = false;
      } else {
        continue;
      }
    }

    while (line.includes("/-")) {
      const start = line.indexOf("/-");
      const end = line.indexOf("-/", start + 2);
      if (end >= 0) {
        line = `${line.slice(0, start)} ${line.slice(end + 2)}`;
      } else {
        line = line.slice(0, start);
        inBlockComment = true;
        break;
      }
    }

    const stripped = line.replace(/--.*$/, "");
    const importMatch = stripped.match(/^\s*import\s+([A-Za-z0-9_'.]+)\s*$/);
    if (importMatch) imports.push(importMatch[1]);

    const namespaceMatch = stripped.match(/^\s*namespace\s+([A-Za-z_][A-Za-z0-9_'.]*(?:\.[A-Za-z_][A-Za-z0-9_'.]*)*)\s*$/);
    if (namespaceMatch) {
      currentNamespace = resolveNamespace(currentNamespace, namespaceMatch[1]);
      namespaceStack.push(currentNamespace);
      continue;
    }

    if (/^\s*end\b/.test(stripped) && namespaceStack.length > 0) {
      namespaceStack.pop();
      currentNamespace = namespaceStack[namespaceStack.length - 1] ?? "";
      continue;
    }

    const declMatch = stripped.match(declPattern);
    if (declMatch) {
      const [, kind, rawName] = declMatch;
      const name = resolveDeclName(currentNamespace, rawName);
      const declaration = {
        name,
        kind,
        module,
        file: rel(file),
        line: lineNo,
        root: rootOfDecl(name),
        hasSorry: false,
        source: "",
        codeSource: "",
      };
      declarations.push(declaration);
      fileDeclarations.push(declaration);
    }
  }

  for (let i = 0; i < fileDeclarations.length; i += 1) {
    const declaration = fileDeclarations[i];
    const next = fileDeclarations[i + 1];
    const source = lines
      .slice(declaration.line - 1, next ? next.line - 1 : lines.length)
      .join("\n");
    declaration.source = source;
    declaration.codeSource = stripLeanComments(source);
    declaration.hasSorry = /(^|\n)\s*sorry\b|:=\s*(?:by\s+)?sorry\b/.test(source);
  }

  modules.set(module, {
    module,
    file: rel(file),
    imports,
    declarations: 0,
    theoremLike: 0,
    dataLike: 0,
    blueprintRefs: 0,
    greenRefs: 0,
    redRefs: 0,
    admittedRefs: 0,
    claimSites: [],
  });
}

const declarationByName = new Map();
for (const declaration of declarations) {
  declarationByName.set(declaration.name, declaration);
  const module = modules.get(declaration.module);
  module.declarations += 1;
  if (["theorem", "lemma"].includes(declaration.kind)) module.theoremLike += 1;
  if (["structure", "class", "inductive"].includes(declaration.kind)) module.dataLike += 1;
}

if (!existsSync(coveragePath)) {
  console.error("Missing coverage inventory; run `node scripts/blueprint-coverage.mjs` first.");
  process.exit(1);
}

const coverage = JSON.parse(readFileSync(coveragePath, "utf8"));
const nodeByLabel = new Map(coverage.nodes.map((node) => [node.label, node]));
const blueprintLeanRefs = coverage.nodes.flatMap((node) =>
  leanRefsForNode(node).map((lean) => ({ ...node, lean })),
);
const uniqueLeanRefs = new Map();

for (const node of blueprintLeanRefs) {
  if (!uniqueLeanRefs.has(node.lean)) uniqueLeanRefs.set(node.lean, []);
  uniqueLeanRefs.get(node.lean).push(node);
}

const unmatchedLeanRefs = [];
const admittedLeanRefs = [];
const statusDrift = [];
const redInheritedAdmitted = [];

for (const [lean, nodes] of uniqueLeanRefs) {
  const declaration = declarationByName.get(lean);
  if (!declaration) {
    unmatchedLeanRefs.push({
      lean,
      claimSites: nodes.map((node) => ({ label: node.label, status: node.status, file: node.file, line: node.line })),
    });
    continue;
  }

  const module = modules.get(declaration.module);
  module.blueprintRefs += nodes.length;
  module.greenRefs += nodes.filter((node) => node.status === "green").length;
  module.redRefs += nodes.filter((node) => node.status === "red").length;
  if (declaration.hasSorry) module.admittedRefs += nodes.length;
  for (const node of nodes) {
    module.claimSites.push({
      label: node.label,
      status: node.status,
      kind: node.kind,
      title: node.title,
      lean,
      admitted: declaration.hasSorry,
      file: node.file,
      line: node.line,
    });
  }

  if (declaration.hasSorry) {
    admittedLeanRefs.push({
      lean,
      declaration: {
        file: declaration.file,
        line: declaration.line,
        module: declaration.module,
      },
      claimSites: nodes.map((node) => ({
        label: node.label,
        status: node.status,
        file: node.file,
        line: node.line,
      })),
    });
    for (const node of nodes) {
      if (node.status === "green") {
        statusDrift.push({
          code: "green-admitted",
          lean,
          label: node.label,
          file: node.file,
          line: node.line,
          declarationFile: declaration.file,
          declarationLine: declaration.line,
        });
      }
    }
  }
}

const admittedLabels = new Set(
  admittedLeanRefs.flatMap((row) => row.claimSites.map((site) => site.label)),
);
const admittedReachMemo = new Map();
function reachesAdmitted(label, stack = new Set()) {
  if (admittedLabels.has(label)) return true;
  if (admittedReachMemo.has(label)) return admittedReachMemo.get(label);
  if (stack.has(label)) return false;
  const node = nodeByLabel.get(label);
  if (!node) return false;
  stack.add(label);
  const reaches = node.uses.some((used) => reachesAdmitted(used, stack));
  stack.delete(label);
  admittedReachMemo.set(label, reaches);
  return reaches;
}

for (const node of blueprintLeanRefs) {
  if (node.status !== "red") continue;
  const declaration = declarationByName.get(node.lean);
  if (!declaration || declaration.hasSorry) continue;
  if (reachesAdmitted(node.label)) {
    redInheritedAdmitted.push({
      lean: node.lean,
      label: node.label,
      file: node.file,
      line: node.line,
      declarationFile: declaration.file,
      declarationLine: declaration.line,
    });
  } else {
    statusDrift.push({
      code: "red-settled",
      lean: node.lean,
      label: node.label,
      file: node.file,
      line: node.line,
      declarationFile: declaration.file,
      declarationLine: declaration.line,
    });
  }
}

const moduleClaimLabels = new Map();
for (const module of modules.values()) {
  moduleClaimLabels.set(module.module, module.claimSites.map((site) => site.label));
}

const reachabilityMemo = new Map();
function reachesLabel(from, target, stack = new Set()) {
  const key = `${from}\u0000${target}`;
  if (reachabilityMemo.has(key)) return reachabilityMemo.get(key);
  if (from === target) return true;
  if (stack.has(from)) return false;
  const node = nodeByLabel.get(from);
  if (!node) return false;

  stack.add(from);
  const reaches = node.uses.some((used) => reachesLabel(used, target, stack));
  stack.delete(from);
  reachabilityMemo.set(key, reaches);
  return reaches;
}

function reachesAnyLabel(from, targets) {
  return targets.some((target) => reachesLabel(from, target));
}

const importUpstreamHints = [];
for (const node of coverage.nodes) {
  const refs = leanRefsForNode(node)
    .map((lean) => declarationByName.get(lean))
    .filter(Boolean);
  if (refs.length === 0) continue;

  for (const declaration of refs) {
    const module = modules.get(declaration.module);
    if (!module) continue;

    for (const imported of module.imports) {
      const importedClaims = moduleClaimLabels.get(imported) ?? [];
      if (importedClaims.length === 0) continue;
      if (reachesAnyLabel(node.label, importedClaims)) continue;

      importUpstreamHints.push({
        label: node.label,
        title: node.title,
        status: node.status,
        file: node.file,
        line: node.line,
        lean: declaration.name,
        module: declaration.module,
        importedModule: imported,
        candidateLabels: importedClaims.slice(0, 12),
        candidateCount: importedClaims.length,
      });
    }
  }
}

function shortNameOf(lean) {
  const parts = lean.split(".");
  return parts[parts.length - 1] ?? lean;
}

function escapedRegex(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

const claimSitesByLean = new Map();
for (const [lean, nodes] of uniqueLeanRefs) {
  if (!declarationByName.has(lean)) continue;
  claimSitesByLean.set(
    lean,
    nodes.map((node) => ({
      label: node.label,
      title: node.title,
      status: node.status,
      file: node.file,
      line: node.line,
    })),
  );
}

const shortNameCounts = new Map();
for (const lean of claimSitesByLean.keys()) {
  const short = shortNameOf(lean);
  shortNameCounts.set(short, (shortNameCounts.get(short) ?? 0) + 1);
}

const blueprintedLeanRefs = [...claimSitesByLean.keys()]
  .map((lean) => ({
    lean,
    declaration: declarationByName.get(lean),
    short: shortNameOf(lean),
    claimSites: claimSitesByLean.get(lean),
  }))
  .filter((candidate) => candidate.declaration)
  .sort((a, b) => b.lean.length - a.lean.length);

function sourceEvidenceFor(source, candidate) {
  const fullPattern = new RegExp(`(^|[^A-Za-z0-9_'.])${escapedRegex(candidate.lean)}([^A-Za-z0-9_']|$)`);
  if (fullPattern.test(source)) return candidate.lean;

  const relativeName = candidate.lean.replace(/^Infomaterial\./, "");
  const relativePattern = new RegExp(`(^|[^A-Za-z0-9_'.])${escapedRegex(relativeName)}([^A-Za-z0-9_']|$)`);
  if (relativePattern.test(source)) return relativeName;

  if ((shortNameCounts.get(candidate.short) ?? 0) === 1) {
    const shortPattern = new RegExp(`(^|[^A-Za-z0-9_'.])${escapedRegex(candidate.short)}([^A-Za-z0-9_']|$)`);
    if (shortPattern.test(source)) return candidate.short;
  }

  return "";
}

const sourceUpstreamHints = [];
const sourceHintKeys = new Set();
for (const node of coverage.nodes) {
  const refs = leanRefsForNode(node)
    .map((lean) => declarationByName.get(lean))
    .filter(Boolean);
  if (refs.length === 0) continue;

  for (const declaration of refs) {
    for (const candidate of blueprintedLeanRefs) {
      if (candidate.lean === declaration.name) continue;
      const candidateLabels = candidate.claimSites.map((site) => site.label);
      if (candidateLabels.length === 0) continue;
      if (reachesAnyLabel(node.label, candidateLabels)) continue;

      const evidence = sourceEvidenceFor(declaration.codeSource, candidate);
      if (!evidence) continue;

      const key = `${node.label}\u0000${candidate.lean}`;
      if (sourceHintKeys.has(key)) continue;
      sourceHintKeys.add(key);
      sourceUpstreamHints.push({
        label: node.label,
        title: node.title,
        status: node.status,
        file: node.file,
        line: node.line,
        lean: declaration.name,
        module: declaration.module,
        candidateLean: candidate.lean,
        candidateModule: candidate.declaration.module,
        evidence,
        candidateLabels: candidate.claimSites,
      });
    }
  }
}

const moduleRoots = new Map();
const namespaceRoots = new Map();
for (const declaration of declarations) {
  const moduleRootName = rootOfModule(declaration.module);
  if (!moduleRoots.has(moduleRootName)) {
    moduleRoots.set(moduleRootName, {
      root: moduleRootName,
      declarations: 0,
      theoremLike: 0,
      dataLike: 0,
      blueprintRefs: 0,
      greenRefs: 0,
      redRefs: 0,
      admittedRefs: 0,
      modulesWithRefs: 0,
      modules: 0,
    });
  }
  const moduleRoot = moduleRoots.get(moduleRootName);
  moduleRoot.declarations += 1;
  if (["theorem", "lemma"].includes(declaration.kind)) moduleRoot.theoremLike += 1;
  if (["structure", "class", "inductive"].includes(declaration.kind)) moduleRoot.dataLike += 1;

  if (!namespaceRoots.has(declaration.root)) {
    namespaceRoots.set(declaration.root, {
      root: declaration.root,
      declarations: 0,
      theoremLike: 0,
      dataLike: 0,
      blueprintRefs: 0,
      greenRefs: 0,
      redRefs: 0,
      admittedRefs: 0,
    });
  }
  const namespaceRoot = namespaceRoots.get(declaration.root);
  namespaceRoot.declarations += 1;
  if (["theorem", "lemma"].includes(declaration.kind)) namespaceRoot.theoremLike += 1;
  if (["structure", "class", "inductive"].includes(declaration.kind)) namespaceRoot.dataLike += 1;
}

for (const module of modules.values()) {
  const rootName = rootOfModule(module.module);
  if (!moduleRoots.has(rootName)) {
    moduleRoots.set(rootName, {
      root: rootName,
      declarations: 0,
      theoremLike: 0,
      dataLike: 0,
      blueprintRefs: 0,
      greenRefs: 0,
      redRefs: 0,
      modulesWithRefs: 0,
      modules: 0,
    });
  }
  const root = moduleRoots.get(rootName);
  root.modules += 1;
  root.blueprintRefs += module.blueprintRefs;
  root.greenRefs += module.greenRefs;
  root.redRefs += module.redRefs;
  root.admittedRefs += module.admittedRefs;
  if (module.blueprintRefs > 0) root.modulesWithRefs += 1;
}

for (const [lean, nodes] of uniqueLeanRefs) {
  const declaration = declarationByName.get(lean);
  if (!declaration) continue;
  const root = namespaceRoots.get(declaration.root);
  root.blueprintRefs += nodes.length;
  root.greenRefs += nodes.filter((node) => node.status === "green").length;
  root.redRefs += nodes.filter((node) => node.status === "red").length;
  if (declaration.hasSorry) root.admittedRefs += nodes.length;
}

const moduleRows = [...modules.values()]
  .filter((module) => module.declarations > 0 || module.blueprintRefs > 0)
  .sort((a, b) => b.blueprintRefs - a.blueprintRefs || b.declarations - a.declarations || a.module.localeCompare(b.module));

const rootRows = [...moduleRoots.values()]
  .sort((a, b) => b.blueprintRefs - a.blueprintRefs || b.declarations - a.declarations || a.root.localeCompare(b.root));
const namespaceRootRows = [...namespaceRoots.values()]
  .sort((a, b) => b.blueprintRefs - a.blueprintRefs || b.declarations - a.declarations || a.root.localeCompare(b.root));

const counts = {
  leanFiles: modules.size,
  declarations: declarations.length,
  blueprintClaimSites: coverage.counts.nodes,
  blueprintLeanRefs: blueprintLeanRefs.length,
  uniqueBlueprintLeanRefs: uniqueLeanRefs.size,
  matchedUniqueLeanRefs: uniqueLeanRefs.size - unmatchedLeanRefs.length,
  unmatchedUniqueLeanRefs: unmatchedLeanRefs.length,
  admittedUniqueLeanRefs: admittedLeanRefs.length,
  redInheritedAdmitted: redInheritedAdmitted.length,
  statusDrift: statusDrift.length,
  importUpstreamHints: importUpstreamHints.length,
  sourceUpstreamHints: sourceUpstreamHints.length,
};

mkdirSync(outDir, { recursive: true });
writeFileSync(jsonPath, `${JSON.stringify({
  counts,
  moduleRoots: rootRows,
  namespaceRoots: namespaceRootRows,
  modules: moduleRows,
  admittedLeanRefs,
  redInheritedAdmitted,
  statusDrift,
  unmatchedLeanRefs,
  importUpstreamHints,
  sourceUpstreamHints,
}, null, 2)}\n`, "utf8");

const rootHtmlRows = rootRows.map((row) => `
<tr>
  <td><code>${html(row.root)}</code></td>
  <td>${row.modules}</td>
  <td>${row.modulesWithRefs}</td>
  <td>${row.declarations}</td>
  <td>${row.theoremLike}</td>
  <td>${row.dataLike}</td>
  <td>${row.blueprintRefs}</td>
  <td class="green">${row.greenRefs}</td>
  <td class="red">${row.redRefs}</td>
  <td>${row.admittedRefs}</td>
</tr>`);

const moduleHtmlRows = moduleRows.map((row) => `
<tr>
  <td><code>${html(row.module)}</code></td>
  <td><code>${html(row.file)}</code></td>
  <td>${row.declarations}</td>
  <td>${row.theoremLike}</td>
  <td>${row.dataLike}</td>
  <td>${row.blueprintRefs}</td>
  <td class="green">${row.greenRefs}</td>
  <td class="red">${row.redRefs}</td>
  <td>${row.admittedRefs}</td>
  <td>${html(row.claimSites.map((site) => site.label).join(", "))}</td>
</tr>`);

const admittedRows = admittedLeanRefs.map((row) => `
<tr>
  <td><code>${html(row.lean)}</code></td>
  <td><code>${html(`${row.declaration.file}:${row.declaration.line}`)}</code></td>
  <td>${html(row.claimSites.map((site) => `${site.label} (${site.status})`).join(", "))}</td>
</tr>`);

const redInheritedRows = redInheritedAdmitted.map((row) => `
<tr>
  <td><code>${html(row.lean)}</code></td>
  <td><code>${html(row.label)}</code></td>
  <td><code>${html(`${row.file}:${row.line}`)}</code></td>
  <td><code>${html(`${row.declarationFile}:${row.declarationLine}`)}</code></td>
</tr>`);

const driftRows = statusDrift.map((row) => `
<tr>
  <td><code>${html(row.code)}</code></td>
  <td><code>${html(row.lean)}</code></td>
  <td><code>${html(row.label)}</code></td>
  <td><code>${html(`${row.file}:${row.line}`)}</code></td>
  <td><code>${html(`${row.declarationFile}:${row.declarationLine}`)}</code></td>
</tr>`);

const unmatchedRows = unmatchedLeanRefs.map((row) => `
<tr>
  <td><code>${html(row.lean)}</code></td>
  <td>${html(row.claimSites.map((site) => `${site.label} (${site.file}:${site.line})`).join(", "))}</td>
</tr>`);

const importUpstreamRows = importUpstreamHints.map((row) => `
<tr>
  <td><code>${html(row.label)}</code></td>
  <td><code>${html(row.lean)}</code></td>
  <td><code>${html(row.module)}</code></td>
  <td><code>${html(row.importedModule)}</code></td>
  <td>${html(row.candidateLabels.join(", "))}${row.candidateCount > row.candidateLabels.length ? html(`, ... (${row.candidateCount} total)`) : ""}</td>
  <td><code>${html(`${row.file}:${row.line}`)}</code></td>
</tr>`);

const sourceUpstreamRows = sourceUpstreamHints.map((row) => `
<tr>
  <td><code>${html(row.label)}</code></td>
  <td><code>${html(row.lean)}</code></td>
  <td><code>${html(row.candidateLean)}</code></td>
  <td><code>${html(row.evidence)}</code></td>
  <td>${html(row.candidateLabels.map((site) => `${site.label} (${site.status})`).join(", "))}</td>
  <td><code>${html(`${row.file}:${row.line}`)}</code></td>
</tr>`);

writeFileSync(htmlPath, `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Infomaterial Lean/Blueprint weld profile</title>
<style>
body{margin:0;background:#0e1116;color:#e6edf3;font:14px/1.5 system-ui,-apple-system,"Segoe UI",sans-serif}
header{padding:24px 28px;border-bottom:1px solid #2b323c;background:#11161d}
h1{margin:0 0 6px;font-size:22px}p{color:#8b949e;max-width:92ch}
main{padding:24px 28px}table{border-collapse:collapse;width:100%;margin:18px 0 32px}
th,td{border:1px solid #2b323c;padding:7px 9px;text-align:left;vertical-align:top}
th{background:#161b22;position:sticky;top:0}code{color:#d2dae6}.green{color:#3fb950}.red{color:#f85149}
a{color:#58a6ff}.stats span{display:inline-block;margin-right:14px}
</style>
</head>
<body>
<header>
<h1>Lean/Blueprint Weld Profile</h1>
<p>Source-derived profile comparing Blueprint claim-site witnesses against declarations parsed from <code>Infomaterial/</code>. This is a coverage/weld diagnostic, not an API replacement.</p>
<p><a href="index.html">Claim-site coverage</a> | <a href="lean-blueprint-weld.json">Download JSON</a></p>
</header>
<main>
<p class="stats"><span>Lean files: ${counts.leanFiles}</span><span>Parsed declarations: ${counts.declarations}</span><span>Blueprint Lean refs: ${counts.blueprintLeanRefs}</span><span>Unique refs matched: ${counts.matchedUniqueLeanRefs}/${counts.uniqueBlueprintLeanRefs}</span><span>Admitted refs: ${counts.admittedUniqueLeanRefs}</span><span>Red inherited admitted: ${counts.redInheritedAdmitted}</span><span>Status drift: ${counts.statusDrift}</span><span>Source upstream hints: ${counts.sourceUpstreamHints}</span><span>Import upstream hints: ${counts.importUpstreamHints}</span></p>
<h2>Roots</h2>
<table><thead><tr><th>Root</th><th>Modules</th><th>Modules with refs</th><th>Declarations</th><th>Theorem-like</th><th>Data-like</th><th>Blueprint refs</th><th>Green</th><th>Red</th><th>Admitted</th></tr></thead><tbody>
${rootHtmlRows.join("\n")}
</tbody></table>
<h2>Modules</h2>
<table><thead><tr><th>Module</th><th>File</th><th>Declarations</th><th>Theorem-like</th><th>Data-like</th><th>Blueprint refs</th><th>Green</th><th>Red</th><th>Admitted</th><th>Claim-sites</th></tr></thead><tbody>
${moduleHtmlRows.join("\n")}
</tbody></table>
<h2>Admitted Lean Witnesses</h2>
<p>Blueprint claim-sites backed by source declarations containing an admitted <code>sorry</code>. Red status is expected here; green status is drift.</p>
<table><thead><tr><th>Lean ref</th><th>Declaration</th><th>Claim-sites</th></tr></thead><tbody>
${admittedRows.join("\n")}
</tbody></table>
<h2>Red Nodes Inheriting Admitted Upstreams</h2>
<p>These nodes have sorry-free Lean witnesses, but remain red because their upstream dependency cone reaches an admitted frontier node.</p>
<table><thead><tr><th>Lean ref</th><th>Claim-site</th><th>Blueprint source</th><th>Lean source</th></tr></thead><tbody>
${redInheritedRows.join("\n")}
</tbody></table>
<h2>Status Drift</h2>
<p><code>green-admitted</code> means Blueprint marks a claim settled while the source declaration contains <code>sorry</code>. <code>red-settled</code> means Blueprint marks a claim open while its Lean witness is parsed as sorry-free.</p>
<table><thead><tr><th>Code</th><th>Lean ref</th><th>Claim-site</th><th>Blueprint source</th><th>Lean source</th></tr></thead><tbody>
${driftRows.join("\n")}
</tbody></table>
<h2>Unmatched Source Parser Refs</h2>
<p>These refs may still be valid Lean declarations; <code>checkdecls</code> is authoritative. This section shows where the source parser cannot weld a Blueprint witness to a parsed source declaration.</p>
<table><thead><tr><th>Lean ref</th><th>Claim-sites</th></tr></thead><tbody>
${unmatchedRows.join("\n")}
</tbody></table>
<h2>Source Upstream Hints</h2>
<p>Non-failing incidence hints derived from declaration source text. Each row means the Lean witness for a claim-site names another blueprinted Lean witness that the claim-site does not reach through <code>\\uses{}</code>.</p>
<table><thead><tr><th>Claim-site</th><th>Lean ref</th><th>Candidate upstream Lean ref</th><th>Source evidence</th><th>Candidate upstream claim-sites</th><th>Source</th></tr></thead><tbody>
${sourceUpstreamRows.join("\n")}
</tbody></table>
<h2>Import Upstream Hints</h2>
<p>Non-failing incidence hints. For each Blueprint claim-site with a Lean witness, this lists represented direct Lean imports whose claim-sites are not reached through <code>\\uses{}</code>. These are candidates for missing upstream edges, not automatic proof obligations.</p>
<table><thead><tr><th>Claim-site</th><th>Lean ref</th><th>Module</th><th>Imported represented module</th><th>Candidate upstream claim-sites</th><th>Source</th></tr></thead><tbody>
${importUpstreamRows.join("\n")}
</tbody></table>
</main>
</body>
</html>
`, "utf8");

console.log(`Lean/Blueprint weld: ${counts.matchedUniqueLeanRefs}/${counts.uniqueBlueprintLeanRefs} unique refs matched; ${counts.admittedUniqueLeanRefs} admitted; ${counts.redInheritedAdmitted} inherited; ${counts.statusDrift} status drift -> ${rel(jsonPath)}`);

if (failMode && (counts.unmatchedUniqueLeanRefs > 0 || counts.statusDrift > 0)) {
  for (const row of unmatchedLeanRefs) {
    console.error(`UNMATCHED ${row.lean}: ${row.claimSites.map((site) => `${site.label} at ${site.file}:${site.line}`).join(", ")}`);
  }
  for (const row of statusDrift) {
    console.error(`${row.code.toUpperCase()} ${row.label}: ${row.lean} at ${row.file}:${row.line}`);
  }
  process.exitCode = 1;
}
