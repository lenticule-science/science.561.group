#!/usr/bin/env node

import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join, relative, sep } from "node:path";

const root = process.cwd();
const sourceRoot = join(root, "dev", "docs", "src");
const entryFile = join(sourceRoot, "content.tex");
const outDir = join(root, "sites", "docs", "coverage");
const tsvPath = join(outDir, "blueprint-nodes.tsv");
const jsonPath = join(outDir, "blueprint-nodes.json");
const htmlPath = join(outDir, "index.html");

const nodeKinds = new Set([
  "definition",
  "theorem",
  "lemma",
  "proposition",
  "corollary",
  "example",
  "remark",
]);

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

function resolveInput(baseFile, rawInput) {
  let input = rawInput.trim();
  if (!input.endsWith(".tex")) input += ".tex";
  const sourceRelative = join(sourceRoot, input);
  if (existsSync(sourceRelative)) return sourceRelative;
  return join(dirname(baseFile), input);
}

const nodes = [];
const included = [];

function parseFile(file, incomingContext) {
  const text = readFileSync(file, "utf8");
  const lines = text.split(/\r?\n/);
  const context = { ...incomingContext };
  included.push(rel(file));

  let active = null;

  function closeNode(endLine) {
    const source = active.lines.join("\n");
    const status = source.includes("\\leanok")
      ? "green"
      : source.includes("\\notready")
        ? "red"
        : "none";
    nodes.push({
      part: context.partTitle,
      chapter: context.chapterTitle,
      chapterLabel: context.chapterLabel,
      section: context.sectionTitle,
      subsection: context.subsectionTitle,
      kind: active.kind,
      title: active.title,
      label: firstMatch(source, /\\label\{([^}]+)\}/),
      lean: firstMatch(source, /\\lean\{([^}]+)\}/),
      status,
      uses: splitUses(firstMatch(source, /\\uses\{([^}]*)\}/)),
      file: rel(file),
      line: active.startLine,
      endLine,
    });
    active = null;
  }

  for (let i = 0; i < lines.length; i += 1) {
    const line = lines[i];
    const lineNo = i + 1;

    if (active) {
      active.lines.push(line);
      if (line.includes(`\\end{${active.kind}}`)) closeNode(lineNo);
      continue;
    }

    const part = line.match(/\\part\{([^}]*)\}/);
    if (part) {
      context.partTitle = part[1];
      continue;
    }

    const chapter = line.match(/\\chapter\{([^}]*)\}/);
    if (chapter) {
      context.chapterTitle = chapter[1];
      context.chapterLabel = firstMatch(line, /\\label\{([^}]+)\}/);
      context.sectionTitle = "";
      context.subsectionTitle = "";
      continue;
    }

    if (!context.chapterLabel) {
      const standaloneChapterLabel = line.match(/^\s*\\label\{([^}]*)\}\s*$/);
      if (standaloneChapterLabel) {
        context.chapterLabel = standaloneChapterLabel[1];
        continue;
      }
    }

    const section = line.match(/\\section\{([^}]*)\}/);
    if (section) {
      context.sectionTitle = section[1];
      context.subsectionTitle = "";
      continue;
    }

    const subsection = line.match(/\\subsection\{([^}]*)\}/);
    if (subsection) {
      context.subsectionTitle = subsection[1];
      continue;
    }

    const input = line.match(/\\input\{([^}]*)\}/);
    if (input) {
      parseFile(resolveInput(file, input[1]), context);
      continue;
    }

    const begin = line.match(/\\begin\{([^}]*)\}(?:\[([^\]]*)\])?/);
    if (begin && nodeKinds.has(begin[1])) {
      active = {
        kind: begin[1],
        title: begin[2] ?? "",
        startLine: lineNo,
        lines: [line],
      };
      if (line.includes(`\\end{${active.kind}}`)) closeNode(lineNo);
    }
  }
}

parseFile(entryFile, {
  partTitle: "",
  chapterTitle: "",
  chapterLabel: "",
  sectionTitle: "",
  subsectionTitle: "",
});

const counts = {
  nodes: nodes.length,
  green: nodes.filter((node) => node.status === "green").length,
  red: nodes.filter((node) => node.status === "red").length,
  none: nodes.filter((node) => node.status === "none").length,
  withLean: nodes.filter((node) => node.lean).length,
  byKind: {},
  byPart: {},
  byChapter: {},
};

for (const node of nodes) {
  counts.byKind[node.kind] = (counts.byKind[node.kind] ?? 0) + 1;
  counts.byPart[node.part || "(none)"] = (counts.byPart[node.part || "(none)"] ?? 0) + 1;
  counts.byChapter[node.chapter || "(none)"] = (counts.byChapter[node.chapter || "(none)"] ?? 0) + 1;
}

mkdirSync(outDir, { recursive: true });

writeFileSync(
  jsonPath,
  `${JSON.stringify({ source: rel(entryFile), included, counts, nodes }, null, 2)}\n`,
  "utf8",
);

const tsvRows = [
  "part\tchapter\tchapter_label\tsection\tsubsection\tkind\ttitle\tlabel\tlean\tstatus\tuses\tfile\tline",
  ...nodes.map((node) => [
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
writeFileSync(tsvPath, `${tsvRows.join("\n")}\n`, "utf8");

const chapterRows = Object.entries(counts.byChapter)
  .sort(([a], [b]) => a.localeCompare(b))
  .map(([chapter, count]) => {
    const chapterNodes = nodes.filter((node) => (node.chapter || "(none)") === chapter);
    const green = chapterNodes.filter((node) => node.status === "green").length;
    const red = chapterNodes.filter((node) => node.status === "red").length;
    return `<tr><td>${html(chapter)}</td><td>${count}</td><td class="green">${green}</td><td class="red">${red}</td></tr>`;
  });

const nodeRows = nodes.map((node) => `
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

writeFileSync(htmlPath, `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Infomaterial Blueprint claim-site coverage</title>
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
<p>Extracted recursively from <code>${html(rel(entryFile))}</code>. This is the incidence-carrier inventory: claim-site labels, Lean witnesses, status, and upstream edges.</p>
<p><a href="../index.html">Back to cockpit</a> | <a href="blueprint-nodes.tsv">Download TSV</a> | <a href="blueprint-nodes.json">Download JSON</a></p>
</header>
<main>
<p class="stats"><span>Total nodes: ${counts.nodes}</span><span>Green: ${counts.green}</span><span>Red: ${counts.red}</span><span>No status: ${counts.none}</span><span>With Lean witness: ${counts.withLean}</span></p>
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

console.log(`Blueprint coverage: ${counts.nodes} nodes -> ${rel(outDir)}`);
