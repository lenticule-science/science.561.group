#!/usr/bin/env node

import { readFileSync } from "node:fs";
import { walkPosixPathsSync } from "@red-cup-engineering/filepath-services-section/walk-posix-paths";
import { join, relative, sep } from "node:path";

const root = process.cwd();
const failMode = process.argv.includes("--fail");
const jsonMode = process.argv.includes("--json");
const maxArg = process.argv.find((arg) => arg.startsWith("--max="));
const maxFindings = maxArg ? Number(maxArg.slice("--max=".length)) : 200;

const chaptersRoot = join(root, "docs", "blueprint", "src", "chapters");
const baseLabels = new Set(["def:mark", "def:utterance", "def:articulating"]);
const externalPrefixes = ["mathlib:"];
const nodeKinds = ["definition", "theorem", "lemma", "proposition", "corollary", "example", "remark"];
const nodePattern = new RegExp(
  `\\\\begin\\{(${nodeKinds.join("|")})\\}([\\s\\S]*?)\\\\end\\{\\1\\}`,
  "g",
);

function rel(path) {
  return relative(root, path).replaceAll(sep, "/");
}

function walk(dir) {
  return walkPosixPathsSync({ root: dir, paths: "absolute", result: "paths", extensions: ['.tex'] }).files;
}

function lineForOffset(text, offset) {
  return text.slice(0, offset).split(/\r?\n/).length;
}

function firstMatch(text, pattern) {
  const match = text.match(pattern);
  return match ? match[1] : "";
}

function splitUses(raw) {
  return raw
    .split(",")
    .map((value) => value.trim())
    .filter(Boolean);
}

const nodes = new Map();
const duplicateLabels = [];

for (const file of walk(chaptersRoot)) {
  const text = readFileSync(file, "utf8");
  for (const match of text.matchAll(nodePattern)) {
    const [source, kind] = match;
    const label = firstMatch(source, /\\label\{([^}]+)\}/);
    const lean = firstMatch(source, /\\lean\{([^}]+)\}/);
    const uses = splitUses(firstMatch(source, /\\uses\{([^}]*)\}/));
    const status = source.includes("\\leanok")
      ? "leanok"
      : source.includes("\\notready")
        ? "notready"
        : "none";
    const node = {
      kind,
      label,
      lean,
      uses,
      status,
      file: rel(file),
      line: lineForOffset(text, match.index ?? 0),
    };

    if (!label) {
      duplicateLabels.push({
        code: "missing-label",
        severity: "error",
        file: node.file,
        line: node.line,
        message: `${kind} node has no label`,
      });
      continue;
    }

    if (nodes.has(label)) {
      const first = nodes.get(label);
      duplicateLabels.push({
        code: "duplicate-label",
        severity: "error",
        file: node.file,
        line: node.line,
        label,
        message: `duplicate label already defined at ${first.file}:${first.line}`,
      });
    }
    nodes.set(label, node);
  }
}

const findings = [...duplicateLabels];

function isExternal(label) {
  return externalPrefixes.some((prefix) => label.startsWith(prefix));
}

const reachMemo = new Map();
function reachesBase(label, stack = new Set()) {
  if (baseLabels.has(label)) return true;
  if (isExternal(label)) return true;
  if (reachMemo.has(label)) return reachMemo.get(label);
  if (stack.has(label)) return false;

  const node = nodes.get(label);
  if (!node) {
    reachMemo.set(label, false);
    return false;
  }

  stack.add(label);
  const reaches = node.uses.some((used) => reachesBase(used, stack));
  stack.delete(label);
  reachMemo.set(label, reaches);
  return reaches;
}

for (const node of nodes.values()) {
  const location = { file: node.file, line: node.line, label: node.label };

  for (const used of node.uses) {
    if (!nodes.has(used) && !isExternal(used)) {
      findings.push({
        ...location,
        code: "missing-upstream",
        severity: "error",
        message: `uses missing label ${used}`,
      });
    }
  }

  if (!baseLabels.has(node.label) && !isExternal(node.label) && node.uses.length === 0) {
    findings.push({
      ...location,
      code: "rootless-node",
      severity: "error",
      message: "non-base claim-site has no upstream uses edge",
    });
  }

  if (!baseLabels.has(node.label) && !isExternal(node.label) && !reachesBase(node.label)) {
    findings.push({
      ...location,
      code: "unglued-node",
      severity: "error",
      message: "claim-site has no dependency path back to mark/utterance/articulating",
    });
  }

  if (node.kind === "definition" && !baseLabels.has(node.label)) {
    findings.push({
      ...location,
      code: "overboxed-definition",
      severity: "warn",
      message: "Blueprint definition box outside primitive/generator base",
    });
  }

  if (node.kind !== "definition" && node.label.startsWith("def:")) {
    findings.push({
      ...location,
      code: "label-kind-mismatch",
      severity: "warn",
      message: `${node.kind} node uses def:* label`,
    });
  }

  if (node.status === "leanok" && !node.lean) {
    findings.push({
      ...location,
      code: "green-without-lean",
      severity: "error",
      message: "leanok node has no Lean witness",
    });
  }

  if (node.status === "none") {
    findings.push({
      ...location,
      code: "missing-status",
      severity: "error",
      message: "node is neither leanok nor notready",
    });
  }
}

const counts = {
  nodes: nodes.size,
  findings: findings.length,
  errors: findings.filter((finding) => finding.severity === "error").length,
  warnings: findings.filter((finding) => finding.severity === "warn").length,
  byCode: {},
  byKind: {},
  byStatus: {},
};

for (const finding of findings) {
  counts.byCode[finding.code] = (counts.byCode[finding.code] ?? 0) + 1;
}

for (const node of nodes.values()) {
  counts.byKind[node.kind] = (counts.byKind[node.kind] ?? 0) + 1;
  counts.byStatus[node.status] = (counts.byStatus[node.status] ?? 0) + 1;
}

if (jsonMode) {
  console.log(JSON.stringify({ baseLabels: [...baseLabels], counts, findings }, null, 2));
} else {
  console.log("Blueprint incidence audit");
  console.log(`  nodes:    ${counts.nodes}`);
  console.log(`  findings: ${counts.findings} (${counts.errors} errors, ${counts.warnings} warnings)`);
  console.log(`  base:     ${[...baseLabels].join(", ")}`);
  console.log("");
  for (const [code, count] of Object.entries(counts.byCode).sort()) {
    console.log(`  ${code}: ${count}`);
  }

  if (findings.length > 0) {
    console.log("");
    for (const finding of findings.slice(0, maxFindings)) {
      const loc = `${finding.file}:${finding.line}`;
      const label = finding.label ? ` ${finding.label}` : "";
      console.log(`${finding.severity.toUpperCase()} ${finding.code} ${loc}${label}: ${finding.message}`);
    }
    if (findings.length > maxFindings) {
      console.log(`... ${findings.length - maxFindings} more finding(s); rerun with --max=${findings.length} or --json`);
    }
  }
}

if (failMode && counts.errors > 0) {
  process.exitCode = 1;
}
