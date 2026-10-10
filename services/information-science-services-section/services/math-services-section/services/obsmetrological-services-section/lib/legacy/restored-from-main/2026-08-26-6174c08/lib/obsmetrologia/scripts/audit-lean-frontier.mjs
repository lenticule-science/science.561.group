#!/usr/bin/env node

import { mkdirSync, readdirSync, readFileSync, writeFileSync } from "node:fs";
import { join, relative, sep } from "node:path";

const root = process.cwd();
const leanRoot = join(root, "Obsmetrologia");
const outDir = join(root, "sites", "docs", "coverage");
const jsonPath = join(outDir, "lean-frontier-audit.json");
const markdownPath = join(outDir, "lean-frontier-audit.md");
const failOnTrust = process.argv.includes("--fail-on-trust");

function rel(path) {
  return relative(root, path).replaceAll(sep, "/");
}

function walk(dir) {
  const out = [];
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const path = join(dir, entry.name);
    if (entry.isDirectory()) {
      out.push(...walk(path));
    } else if (entry.isFile() && entry.name.endsWith(".lean")) {
      out.push(path);
    }
  }
  return out;
}

function stripCommentCode(line, state) {
  let out = "";
  let i = 0;

  while (i < line.length) {
    const pair = line.slice(i, i + 2);

    if (state.blockDepth > 0) {
      if (pair === "/-") {
        state.blockDepth += 1;
        i += 2;
      } else if (pair === "-/") {
        state.blockDepth -= 1;
        i += 2;
      } else {
        i += 1;
      }
      continue;
    }

    if (pair === "--") break;
    if (pair === "/-") {
      state.blockDepth += 1;
      i += 2;
      continue;
    }

    out += line[i];
    i += 1;
  }

  return out;
}

const declarationPattern =
  /^\s*(?:@\[[^\]]*\]\s*)*(?:protected\s+|private\s+|noncomputable\s+|partial\s+|unsafe\s+)*(axiom|constant|opaque|theorem|lemma|def|abbrev|instance|inductive|structure|class)\s+([A-Za-z_][A-Za-z0-9_'.]*)/;

const sorrySites = [];
const trustSites = [];

for (const file of walk(leanRoot)) {
  const lines = readFileSync(file, "utf8").split(/\r?\n/);
  const commentState = { blockDepth: 0 };
  let currentDeclaration = null;

  for (let i = 0; i < lines.length; i += 1) {
    const lineNo = i + 1;
    const code = stripCommentCode(lines[i], commentState);
    const declaration = code.match(declarationPattern);

    if (declaration) {
      currentDeclaration = {
        kind: declaration[1],
        name: declaration[2],
        file: rel(file),
        line: lineNo,
      };

      if (["axiom", "constant", "opaque"].includes(declaration[1])) {
        trustSites.push({
          code: declaration[1],
          declaration: currentDeclaration,
          file: rel(file),
          line: lineNo,
          source: code.trim(),
        });
      }
    }

    if (/\bnative_decide\b/.test(code)) {
      trustSites.push({
        code: "native_decide",
        declaration: currentDeclaration,
        file: rel(file),
        line: lineNo,
        source: code.trim(),
      });
    }

    if (/\bsorry\b/.test(code)) {
      sorrySites.push({
        declaration: currentDeclaration,
        file: rel(file),
        line: lineNo,
        source: code.trim(),
      });
    }
  }
}

const counts = {
  leanFiles: walk(leanRoot).length,
  sorrySites: sorrySites.length,
  trustSites: trustSites.length,
  declarationsWithSorry: new Set(sorrySites.map((site) => site.declaration?.name ?? "(unknown)")).size,
};

mkdirSync(outDir, { recursive: true });
writeFileSync(
  jsonPath,
  `${JSON.stringify({ counts, sorrySites, trustSites }, null, 2)}\n`,
  "utf8",
);

const markdown = [
  "# Lean Frontier Audit",
  "",
  `- Lean files: ${counts.leanFiles}`,
  `- Sorry sites: ${counts.sorrySites}`,
  `- Declarations with sorry: ${counts.declarationsWithSorry}`,
  `- Hard trust surfaces: ${counts.trustSites}`,
  "",
  "## Sorry Sites",
  "",
  ...(sorrySites.length === 0
    ? ["None."]
    : sorrySites.map((site) => {
        const decl = site.declaration ? `${site.declaration.kind} ${site.declaration.name}` : "unknown declaration";
        return `- ${site.file}:${site.line} (${decl})`;
      })),
  "",
  "## Hard Trust Surfaces",
  "",
  ...(trustSites.length === 0
    ? ["None."]
    : trustSites.map((site) => {
        const decl = site.declaration ? `${site.declaration.kind} ${site.declaration.name}` : "unknown declaration";
        return `- ${site.file}:${site.line} ${site.code} (${decl})`;
      })),
  "",
];

writeFileSync(markdownPath, `${markdown.join("\n")}\n`, "utf8");

console.log(
  `Lean frontier audit: ${counts.sorrySites} sorry site(s), ${counts.trustSites} hard trust surface(s) -> ${rel(jsonPath)}`,
);

if (failOnTrust && trustSites.length > 0) {
  process.exitCode = 1;
}
