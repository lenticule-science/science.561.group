#!/usr/bin/env node
//
// Package-scoped Blueprint/Lean audit. Replaces the three hand-rolled parsers
// (blueprint-coverage.mjs, audit-blueprint-incidence.mjs,
// lean-blueprint-weld.mjs) with the independently packaged chart reader and
// lint helpers. Its sole package dependency is delivered through the local
// directory registry; no aggregate workspace installation is required.
//
// Output vocabulary: infography's BlueprintClaimGraph node `status` is
// "settled"|"frontier"|"unstated". The old hand-rolled scripts wrote
// "green"|"red"|"none" into sites/docs/coverage/blueprint-nodes.json, and
// scripts/audit-cross-surfaces.mjs and scripts/audit-frontier-information.mjs
// still read that file expecting exactly those strings (checking
// `node.status === "none"` and treating anything else as settled/open by
// vocabulary, not by parsing "settled"/"frontier"). To keep those two
// consumers working unmodified, this script preserves the OLD
// green/red/none vocabulary in blueprint-nodes.{json,tsv} and maps
// settled -> green, frontier -> red, unstated -> none. The findings/weld
// JSON emitted by this script uses infography's native
// settled/frontier/unstated vocabulary (no legacy consumer reads those
// fields), so it is not translated there.

import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join, relative, sep } from "node:path";

import {
  readLeanWorkspace,
  blueprintClaimGraphFindings,
  blueprintLeanWeldFindings,
} from "@red-cup-engineering/lean-blueprint-chart-service";

const root = process.cwd();
const failMode = process.argv.includes("--fail");
const outDir = join(root, "sites", "docs", "coverage");

const nodesJsonPath = join(outDir, "blueprint-nodes.json");
const nodesTsvPath = join(outDir, "blueprint-nodes.tsv");
const indexHtmlPath = join(outDir, "index.html");
const findingsJsonPath = join(outDir, "blueprint-findings.json");
const weldJsonPath = join(outDir, "lean-blueprint-weld.json");
const weldHtmlPath = join(outDir, "lean-blueprint-weld.html");

// Same real base labels as the old audit-blueprint-incidence.mjs.
const baseLabels = ["def:mark", "def:utterance", "def:articulating"];
const externalPrefixes = ["mathlib:"];
const lintOptions = { baseLabels, externalPrefixes };

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

function tsv(value) {
  return String(value ?? "").replace(/\t/g, " ").replace(/\r?\n/g, " ");
}

function statusToLegacy(status) {
  if (status === "settled") return "green";
  if (status === "frontier") return "red";
  return "none";
}

// Obsmetrologia's Blueprint nests \input{} three deep: content.tex declares
// \part{}/\chapter{} next to each \input, and the included chapter files
// themselves \input{} the leaf files that hold the actual claim nodes.
// Infography decodes each .tex file as an independent plate, so a leaf
// file's \part/\chapter context (declared only in its ancestor files) is
// invisible to blueprintClaimGraph's per-plate contextsByLine walk — every
// leaf-file node comes back with empty part/chapter/chapterLabel. This is a
// structural gap between obsmetrologia's nested-\input layout and
// infography's flat multi-plate model, not something the library can fix
// generically. To recover the old per-node part/chapter/chapterLabel
// fields for blueprint-nodes.json, walk the \input{} include tree from
// content.tex here — tracking only \part{}/\chapter{}/\label{} context,
// never claim-node syntax (\begin{theorem}, \uses{}, \leanok, etc., which
// stay fully delegated to infography's plate decoder).
const blueprintSourceRoot = join(root, "docs", "blueprint", "src");
const blueprintEntryFile = join(blueprintSourceRoot, "content.tex");
const chapterContextByFile = new Map();

function resolveTexInput(baseFile, rawInput) {
  let input = rawInput.trim();
  if (!input.endsWith(".tex")) input += ".tex";
  const fromSourceRoot = join(blueprintSourceRoot, input);
  if (existsSync(fromSourceRoot)) return fromSourceRoot;
  return join(dirname(baseFile), input);
}

function walkChapterContext(file, incomingContext) {
  if (!existsSync(file)) return;
  const text = readFileSync(file, "utf8");
  const lines = text.split(/\r?\n/);
  let context = { ...incomingContext };
  let awaitingChapterLabel = false;

  chapterContextByFile.set(rel(file), context);

  for (const line of lines) {
    const part = line.match(/\\part\{([^}]*)\}/);
    if (part) {
      context = { ...context, partTitle: part[1] };
      awaitingChapterLabel = false;
      continue;
    }

    const chapter = line.match(/\\chapter\{([^}]*)\}/);
    if (chapter) {
      context = { ...context, chapterTitle: chapter[1], chapterLabel: undefined };
      awaitingChapterLabel = true;
      continue;
    }

    if (awaitingChapterLabel) {
      const label = line.match(/^\s*\\label\{([^}]*)\}\s*$/);
      if (label) {
        context = { ...context, chapterLabel: label[1] };
        awaitingChapterLabel = false;
        continue;
      }
      if (line.trim() !== "") awaitingChapterLabel = false;
    }

    const input = line.match(/\\input\{([^}]*)\}/);
    if (input) {
      walkChapterContext(resolveTexInput(file, input[1]), context);
    }
  }
}

if (existsSync(blueprintEntryFile)) {
  walkChapterContext(blueprintEntryFile, {});
}

function chapterContextFor(sourceRelativePath) {
  return chapterContextByFile.get(sourceRelativePath) ?? {};
}

mkdirSync(outDir, { recursive: true });

const workspace = readLeanWorkspace(root);
const graph = workspace.texWorkspaceRead?.blueprintClaimGraph;
if (!graph) {
  console.error("No Blueprint TeX workspace found under docs/blueprint/src.");
  process.exit(1);
}
const declarationCatalog = workspace.declarationCatalog;

// ---------------------------------------------------------------------
// 1. blueprint-nodes.{json,tsv} + index.html — legacy consumer-facing
//    claim-site inventory, preserving the old field names and the old
//    green/red/none status vocabulary.
// ---------------------------------------------------------------------

const usesByLabel = new Map();
for (const edge of graph.edges) {
  const existing = usesByLabel.get(edge.from) ?? [];
  existing.push(edge.to);
  usesByLabel.set(edge.from, existing);
}

const legacyNodes = graph.nodes.map((node) => {
  const fallbackContext = chapterContextFor(node.source);
  return {
  part: node.part ?? fallbackContext.partTitle ?? "",
  chapter: node.chapter ?? fallbackContext.chapterTitle ?? "",
  chapterLabel: node.chapterLabel ?? fallbackContext.chapterLabel ?? "",
  section: node.section ?? "",
  subsection: node.subsection ?? "",
  kind: node.statementKind,
  title: node.title ?? "",
  label: node.id,
  lean: node.leanDeclarations.join(", "),
  status: statusToLegacy(node.status),
  uses: usesByLabel.get(node.id) ?? [],
  file: node.source,
  line: node.line,
  };
});

const nodeCounts = {
  nodes: legacyNodes.length,
  green: legacyNodes.filter((node) => node.status === "green").length,
  red: legacyNodes.filter((node) => node.status === "red").length,
  none: legacyNodes.filter((node) => node.status === "none").length,
  withLean: legacyNodes.filter((node) => node.lean).length,
  byKind: {},
  byPart: {},
  byChapter: {},
};

for (const node of legacyNodes) {
  nodeCounts.byKind[node.kind] = (nodeCounts.byKind[node.kind] ?? 0) + 1;
  nodeCounts.byPart[node.part || "(none)"] = (nodeCounts.byPart[node.part || "(none)"] ?? 0) + 1;
  nodeCounts.byChapter[node.chapter || "(none)"] = (nodeCounts.byChapter[node.chapter || "(none)"] ?? 0) + 1;
}

writeFileSync(
  nodesJsonPath,
  `${JSON.stringify({ sources: graph.sources, counts: nodeCounts, nodes: legacyNodes }, null, 2)}\n`,
  "utf8",
);

const tsvRows = [
  "part\tchapter\tchapter_label\tsection\tsubsection\tkind\ttitle\tlabel\tlean\tstatus\tuses\tfile\tline",
  ...legacyNodes.map((node) => [
    node.part,
    node.chapter,
    node.chapterLabel,
    node.section,
    node.subsection,
    node.kind,
    node.title,
    node.label,
    node.lean,
    node.status,
    node.uses.join(", "),
    node.file,
    node.line,
  ].map(tsv).join("\t")),
];
writeFileSync(nodesTsvPath, `${tsvRows.join("\n")}\n`, "utf8");

const chapterRows = Object.entries(nodeCounts.byChapter)
  .sort(([a], [b]) => a.localeCompare(b))
  .map(([chapter, count]) => {
    const chapterNodes = legacyNodes.filter((node) => (node.chapter || "(none)") === chapter);
    const green = chapterNodes.filter((node) => node.status === "green").length;
    const red = chapterNodes.filter((node) => node.status === "red").length;
    return `<tr><td>${html(chapter)}</td><td>${count}</td><td class="green">${green}</td><td class="red">${red}</td></tr>`;
  });

const nodeRows = legacyNodes.map((node) => `
<tr>
  <td>${html(node.part)}</td>
  <td>${html(node.chapter)}</td>
  <td>${html(node.section || node.subsection)}</td>
  <td>${html(node.kind)}</td>
  <td>${html(node.title)}</td>
  <td><code>${html(node.label)}</code></td>
  <td><code>${html(node.lean)}</code></td>
  <td class="${node.status === "green" ? "green" : node.status === "red" ? "red" : "none"}">${html(node.status)}</td>
  <td><code>${html(node.uses.join(", "))}</code></td>
  <td><code>${html(`${node.file}:${node.line}`)}</code></td>
</tr>`);

writeFileSync(indexHtmlPath, `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Obsmetrologia Blueprint claim-site coverage</title>
<style>
body{margin:0;background:#0e1116;color:#e6edf3;font:14px/1.5 system-ui,-apple-system,"Segoe UI",sans-serif}
header{padding:24px 28px;border-bottom:1px solid #2b323c;background:#11161d}
h1{margin:0 0 6px;font-size:22px}p{color:#8b949e;max-width:92ch}
main{padding:24px 28px}table{border-collapse:collapse;width:100%;margin:18px 0 32px}
th,td{border:1px solid #2b323c;padding:7px 9px;text-align:left;vertical-align:top}
th{background:#161b22;position:sticky;top:0}code{color:#d2dae6}.green{color:#3fb950}.red{color:#f85149}.none{color:#d29922}
a{color:#58a6ff}.stats span{display:inline-block;margin-right:14px}
</style>
</head>
<body>
<header>
<h1>Blueprint Claim-Site Coverage</h1>
<p>Read via <code>@emsenn/infography</code>'s Lean/TeX workspace reader from <code>docs/blueprint/src</code>. This is the incidence-carrier inventory: claim-site labels, Lean witnesses, status, and upstream edges.</p>
<p><a href="../index.html">Back to cockpit</a> | <a href="blueprint-nodes.tsv">Download TSV</a> | <a href="blueprint-nodes.json">Download JSON</a> | <a href="lean-blueprint-weld.html">Lean/Blueprint weld</a></p>
</header>
<main>
<p class="stats"><span>Total nodes: ${nodeCounts.nodes}</span><span>Green: ${nodeCounts.green}</span><span>Red: ${nodeCounts.red}</span><span>No status: ${nodeCounts.none}</span><span>With Lean witness: ${nodeCounts.withLean}</span></p>
<h2>Chapters</h2>
<table><thead><tr><th>Chapter</th><th>Nodes</th><th>Green</th><th>Red</th></tr></thead><tbody>
${chapterRows.join("\n")}
</tbody></table>
<h2>Claim Sites</h2>
<table><thead><tr><th>Part</th><th>Chapter</th><th>Section</th><th>Kind</th><th>Title</th><th>Label</th><th>Lean</th><th>Status</th><th>Uses</th><th>Source</th></tr></thead><tbody>
${nodeRows.join("\n")}
</tbody></table>
</main>
</body>
</html>
`, "utf8");

// ---------------------------------------------------------------------
// 2. blueprint-findings.json — pure graph-shape + Lean cross-reference
//    findings, via infography's blueprint lint helpers.
// ---------------------------------------------------------------------

const graphFindings = blueprintClaimGraphFindings(graph, lintOptions);
const weldFindings = blueprintLeanWeldFindings(graph, declarationCatalog, lintOptions);
const allFindings = [...graphFindings, ...weldFindings];

const findingCounts = {
  nodes: graph.nodes.length,
  findings: allFindings.length,
  errors: allFindings.filter((finding) => finding.severity === "error").length,
  warnings: allFindings.filter((finding) => finding.severity === "warning").length,
  byCode: {},
};
for (const finding of allFindings) {
  findingCounts.byCode[finding.code] = (findingCounts.byCode[finding.code] ?? 0) + 1;
}

writeFileSync(
  findingsJsonPath,
  `${JSON.stringify({ baseLabels, externalPrefixes, counts: findingCounts, findings: allFindings }, null, 2)}\n`,
  "utf8",
);

// ---------------------------------------------------------------------
// 3. lean-blueprint-weld.{json,html} — module/namespace-root rollup
//    stats, import-upstream-hints, and source-upstream-hints, built from
//    workspace.modules / workspace.declarationCatalog (structural, not a
//    hand-rolled Lean parser). The source-upstream-hints heuristic reads
//    raw declaration source text directly, which is a plain substring
//    scan, not a duplicate parser: infography does not structurally
//    expose declaration bodies.
// ---------------------------------------------------------------------

function rootOfName(name) {
  const parts = name.split(".");
  return parts[0] === "Obsmetrologia" ? (parts[1] ?? "(root)") : parts[0];
}

const moduleById = new Map(workspace.modules.map((module) => [module.id, module]));
const declarationByName = new Map(declarationCatalog.entries.map((entry) => [entry.name, entry]));

function isAdmitted(entry) {
  return entry.proofStatus === "admitted" || entry.proofStatus === "assumed";
}

function leanRefsForNode(node) {
  return node.leanDeclarations;
}

const nodeByLabel = new Map(graph.nodes.map((node) => [node.id, node]));
const blueprintLeanRefs = graph.nodes.flatMap((node) =>
  leanRefsForNode(node).map((lean) => ({ ...node, lean })),
);
const uniqueLeanRefs = new Map();
for (const node of blueprintLeanRefs) {
  if (!uniqueLeanRefs.has(node.lean)) uniqueLeanRefs.set(node.lean, []);
  uniqueLeanRefs.get(node.lean).push(node);
}

// Per-module rollup, grouped by declarations sharing that module id.
const moduleStats = new Map();
for (const module of workspace.modules) {
  moduleStats.set(module.id, {
    module: module.id,
    file: module.path ? rel(module.path) : "",
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

for (const entry of declarationCatalog.entries) {
  const stats = moduleStats.get(entry.module);
  if (!stats) continue;
  stats.declarations += 1;
  if (["theorem", "lemma"].includes(entry.kind)) stats.theoremLike += 1;
  if (["structure", "class", "inductive"].includes(entry.kind)) stats.dataLike += 1;
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
      claimSites: nodes.map((node) => ({ label: node.id, status: node.status, file: node.source, line: node.line })),
    });
    continue;
  }

  const stats = moduleStats.get(declaration.module);
  if (stats) {
    stats.blueprintRefs += nodes.length;
    stats.greenRefs += nodes.filter((node) => node.status === "settled").length;
    stats.redRefs += nodes.filter((node) => node.status === "frontier").length;
    if (isAdmitted(declaration)) stats.admittedRefs += nodes.length;
    for (const node of nodes) {
      stats.claimSites.push({
        label: node.id,
        status: node.status,
        kind: node.statementKind,
        title: node.title,
        lean,
        admitted: isAdmitted(declaration),
        file: node.source,
        line: node.line,
      });
    }
  }

  if (isAdmitted(declaration)) {
    admittedLeanRefs.push({
      lean,
      declaration: { file: moduleById.get(declaration.module)?.path ? rel(moduleById.get(declaration.module).path) : "", line: declaration.line, module: declaration.module },
      claimSites: nodes.map((node) => ({ label: node.id, status: node.status, file: node.source, line: node.line })),
    });
    for (const node of nodes) {
      if (node.status === "settled") {
        statusDrift.push({
          code: "green-admitted",
          lean,
          label: node.id,
          file: node.source,
          line: node.line,
          declarationFile: moduleById.get(declaration.module)?.path ? rel(moduleById.get(declaration.module).path) : "",
          declarationLine: declaration.line,
        });
      }
    }
  }
}

const admittedLabels = new Set(admittedLeanRefs.flatMap((row) => row.claimSites.map((site) => site.label)));
const admittedReachMemo = new Map();
function reachesAdmitted(label, stack = new Set()) {
  if (admittedLabels.has(label)) return true;
  if (admittedReachMemo.has(label)) return admittedReachMemo.get(label);
  if (stack.has(label)) return false;
  const node = nodeByLabel.get(label);
  if (!node) return false;
  stack.add(label);
  const reaches = (usesByLabel.get(label) ?? []).some((used) => reachesAdmitted(used, stack));
  stack.delete(label);
  admittedReachMemo.set(label, reaches);
  return reaches;
}

for (const node of blueprintLeanRefs) {
  if (node.status !== "frontier") continue;
  const declaration = declarationByName.get(node.lean);
  if (!declaration || isAdmitted(declaration)) continue;
  const declFile = moduleById.get(declaration.module)?.path ? rel(moduleById.get(declaration.module).path) : "";
  if (reachesAdmitted(node.id)) {
    redInheritedAdmitted.push({
      lean: node.lean,
      label: node.id,
      file: node.source,
      line: node.line,
      declarationFile: declFile,
      declarationLine: declaration.line,
    });
  } else {
    statusDrift.push({
      code: "red-settled",
      lean: node.lean,
      label: node.id,
      file: node.source,
      line: node.line,
      declarationFile: declFile,
      declarationLine: declaration.line,
    });
  }
}

const moduleClaimLabels = new Map();
for (const stats of moduleStats.values()) {
  moduleClaimLabels.set(stats.module, stats.claimSites.map((site) => site.label));
}

const reachabilityMemo = new Map();
function reachesLabel(from, target, stack = new Set()) {
  const key = `${from} ${target}`;
  if (reachabilityMemo.has(key)) return reachabilityMemo.get(key);
  if (from === target) return true;
  if (stack.has(from)) return false;
  stack.add(from);
  const reaches = (usesByLabel.get(from) ?? []).some((used) => reachesLabel(used, target, stack));
  stack.delete(from);
  reachabilityMemo.set(key, reaches);
  return reaches;
}
function reachesAnyLabel(from, targets) {
  return targets.some((target) => reachesLabel(from, target));
}

// import-upstream-hints — using workspace.modules[].imports directly.
const importUpstreamHints = [];
for (const node of graph.nodes) {
  const refs = leanRefsForNode(node).map((lean) => declarationByName.get(lean)).filter(Boolean);
  if (refs.length === 0) continue;

  for (const declaration of refs) {
    const module = moduleById.get(declaration.module);
    if (!module) continue;

    for (const imported of module.imports) {
      const importedClaims = moduleClaimLabels.get(imported) ?? [];
      if (importedClaims.length === 0) continue;
      if (reachesAnyLabel(node.id, importedClaims)) continue;

      importUpstreamHints.push({
        label: node.id,
        title: node.title,
        status: node.status,
        file: node.source,
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

// source-upstream-hints — the one place reading raw Lean source text
// directly, faithful to the old sourceEvidenceFor heuristic.
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
    nodes.map((node) => ({ label: node.id, title: node.title, status: node.status, file: node.source, line: node.line })),
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

  const relativeName = candidate.lean.replace(/^Obsmetrologia\./, "");
  const relativePattern = new RegExp(`(^|[^A-Za-z0-9_'.])${escapedRegex(relativeName)}([^A-Za-z0-9_']|$)`);
  if (relativePattern.test(source)) return relativeName;

  if ((shortNameCounts.get(candidate.short) ?? 0) === 1) {
    const shortPattern = new RegExp(`(^|[^A-Za-z0-9_'.])${escapedRegex(candidate.short)}([^A-Za-z0-9_']|$)`);
    if (shortPattern.test(source)) return candidate.short;
  }

  return "";
}

// Locate each declaration's source text: read its module file once, slice
// from its line to the next declaration's line in the same module.
const fileTextCache = new Map();
function fileTextFor(path) {
  if (!path) return "";
  if (!fileTextCache.has(path)) {
    fileTextCache.set(path, existsSync(path) ? readFileSync(path, "utf8") : "");
  }
  return fileTextCache.get(path);
}

const declarationsByModule = new Map();
for (const entry of declarationCatalog.entries) {
  const list = declarationsByModule.get(entry.module) ?? [];
  list.push(entry);
  declarationsByModule.set(entry.module, list);
}
for (const list of declarationsByModule.values()) {
  list.sort((a, b) => (a.line ?? 0) - (b.line ?? 0));
}

function codeSourceFor(entry) {
  const module = moduleById.get(entry.module);
  if (!module?.path || entry.line === undefined) return "";
  const text = fileTextFor(module.path);
  if (!text) return "";
  const lines = text.split(/\r?\n/);
  const siblings = declarationsByModule.get(entry.module) ?? [];
  const index = siblings.findIndex((candidate) => candidate === entry);
  const next = siblings[index + 1];
  const endLine = next?.line ? next.line - 1 : lines.length;
  return lines.slice((entry.line ?? 1) - 1, endLine).join("\n");
}

const sourceUpstreamHints = [];
const sourceHintKeys = new Set();
for (const node of graph.nodes) {
  const refs = leanRefsForNode(node).map((lean) => declarationByName.get(lean)).filter(Boolean);
  if (refs.length === 0) continue;

  for (const declaration of refs) {
    const codeSource = codeSourceFor(declaration);
    if (!codeSource) continue;

    for (const candidate of blueprintedLeanRefs) {
      if (candidate.lean === declaration.name) continue;
      const candidateLabels = candidate.claimSites.map((site) => site.label);
      if (candidateLabels.length === 0) continue;
      if (reachesAnyLabel(node.id, candidateLabels)) continue;

      const evidence = sourceEvidenceFor(codeSource, candidate);
      if (!evidence) continue;

      const key = `${node.id} ${candidate.lean}`;
      if (sourceHintKeys.has(key)) continue;
      sourceHintKeys.add(key);
      sourceUpstreamHints.push({
        label: node.id,
        title: node.title,
        status: node.status,
        file: node.source,
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

// Module/namespace-root rollups.
const moduleRoots = new Map();
const namespaceRoots = new Map();

function ensureRoot(map, rootName) {
  if (!map.has(rootName)) {
    map.set(rootName, {
      root: rootName,
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
  return map.get(rootName);
}

for (const entry of declarationCatalog.entries) {
  const moduleRootName = rootOfName(entry.module);
  const moduleRoot = ensureRoot(moduleRoots, moduleRootName);
  moduleRoot.declarations += 1;
  if (["theorem", "lemma"].includes(entry.kind)) moduleRoot.theoremLike += 1;
  if (["structure", "class", "inductive"].includes(entry.kind)) moduleRoot.dataLike += 1;

  const declRootName = rootOfName(entry.name);
  const namespaceRoot = ensureRoot(namespaceRoots, declRootName);
  namespaceRoot.declarations += 1;
  if (["theorem", "lemma"].includes(entry.kind)) namespaceRoot.theoremLike += 1;
  if (["structure", "class", "inductive"].includes(entry.kind)) namespaceRoot.dataLike += 1;
}

for (const stats of moduleStats.values()) {
  const rootName = rootOfName(stats.module);
  const moduleRoot = ensureRoot(moduleRoots, rootName);
  moduleRoot.modules += 1;
  moduleRoot.blueprintRefs += stats.blueprintRefs;
  moduleRoot.greenRefs += stats.greenRefs;
  moduleRoot.redRefs += stats.redRefs;
  moduleRoot.admittedRefs += stats.admittedRefs;
  if (stats.blueprintRefs > 0) moduleRoot.modulesWithRefs += 1;
}

for (const [lean, nodes] of uniqueLeanRefs) {
  const declaration = declarationByName.get(lean);
  if (!declaration) continue;
  const root = ensureRoot(namespaceRoots, rootOfName(declaration.name));
  root.blueprintRefs += nodes.length;
  root.greenRefs += nodes.filter((node) => node.status === "settled").length;
  root.redRefs += nodes.filter((node) => node.status === "frontier").length;
  if (isAdmitted(declaration)) root.admittedRefs += nodes.length;
}

const moduleRows = [...moduleStats.values()]
  .filter((module) => module.declarations > 0 || module.blueprintRefs > 0)
  .sort((a, b) => b.blueprintRefs - a.blueprintRefs || b.declarations - a.declarations || a.module.localeCompare(b.module));

const rootRows = [...moduleRoots.values()]
  .sort((a, b) => b.blueprintRefs - a.blueprintRefs || b.declarations - a.declarations || a.root.localeCompare(b.root));
const namespaceRootRows = [...namespaceRoots.values()]
  .sort((a, b) => b.blueprintRefs - a.blueprintRefs || b.declarations - a.declarations || a.root.localeCompare(b.root));

const weldCounts = {
  leanFiles: workspace.modules.length,
  declarations: declarationCatalog.entries.length,
  blueprintClaimSites: graph.nodes.length,
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

writeFileSync(weldJsonPath, `${JSON.stringify({
  counts: weldCounts,
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

writeFileSync(weldHtmlPath, `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Obsmetrologia Lean/Blueprint weld profile</title>
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
<p>Structural profile comparing Blueprint claim-site witnesses against Lean declarations, read via <code>@emsenn/infography</code>'s workspace reader. This is a coverage/weld diagnostic, not an API replacement.</p>
<p><a href="index.html">Claim-site coverage</a> | <a href="lean-blueprint-weld.json">Download JSON</a></p>
</header>
<main>
<p class="stats"><span>Lean files: ${weldCounts.leanFiles}</span><span>Parsed declarations: ${weldCounts.declarations}</span><span>Blueprint Lean refs: ${weldCounts.blueprintLeanRefs}</span><span>Unique refs matched: ${weldCounts.matchedUniqueLeanRefs}/${weldCounts.uniqueBlueprintLeanRefs}</span><span>Admitted refs: ${weldCounts.admittedUniqueLeanRefs}</span><span>Red inherited admitted: ${weldCounts.redInheritedAdmitted}</span><span>Status drift: ${weldCounts.statusDrift}</span><span>Source upstream hints: ${weldCounts.sourceUpstreamHints}</span><span>Import upstream hints: ${weldCounts.importUpstreamHints}</span></p>
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
<p>These refs may still be valid Lean declarations; <code>checkdecls</code> is authoritative. This section shows where the structural reader cannot weld a Blueprint witness to a cataloged declaration.</p>
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

// ---------------------------------------------------------------------
// Console summary + exit code.
// ---------------------------------------------------------------------

console.log(`Blueprint audit: ${nodeCounts.nodes} claim sites (${nodeCounts.green} green, ${nodeCounts.red} red, ${nodeCounts.none} none) -> ${rel(nodesJsonPath)}`);
console.log(`  findings: ${findingCounts.findings} (${findingCounts.errors} errors, ${findingCounts.warnings} warnings) -> ${rel(findingsJsonPath)}`);
console.log(`  weld: ${weldCounts.matchedUniqueLeanRefs}/${weldCounts.uniqueBlueprintLeanRefs} unique refs matched; ${weldCounts.admittedUniqueLeanRefs} admitted; ${weldCounts.redInheritedAdmitted} inherited; ${weldCounts.statusDrift} status drift -> ${rel(weldJsonPath)}`);

if (findingCounts.findings > 0) {
  for (const finding of allFindings) {
    const loc = finding.source ? `${finding.source}:${finding.line ?? "?"}` : "";
    const label = finding.nodeId ? ` ${finding.nodeId}` : "";
    console.log(`${finding.severity.toUpperCase()} ${finding.code} ${loc}${label}: ${finding.message}`);
  }
}

if (
  failMode
  && (findingCounts.errors > 0 || weldCounts.unmatchedUniqueLeanRefs > 0 || weldCounts.statusDrift > 0)
) {
  process.exitCode = 1;
}
