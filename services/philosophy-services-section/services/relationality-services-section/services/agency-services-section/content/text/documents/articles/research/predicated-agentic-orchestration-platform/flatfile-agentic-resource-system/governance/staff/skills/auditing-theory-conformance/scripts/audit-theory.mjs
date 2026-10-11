#!/usr/bin/env node
// audit-theory.mjs — full conformance audit against theory-encoding.md.
//
// Usage:
//   node audit-theory.mjs [--root <path>] [--recurse] [--json]
//
// Defaults:
//   --root: 5 directories above this file (the FARS theory root)
//
// Rules checked:
//   R9      name and description present with non-empty string values
//   R7/R10  all other frontmatter keys must be transformer slugs in Ob(C)
//   R13     no H1 heading in the body
//   naming  transformer slugs should be gerunds (end in -ing); warning if not
//
// Exit codes: 0 = no errors, 1 = errors found, 2 = bad arguments

import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const ALWAYS_VALID = new Set(["name", "description"]);
const SKIP_DIRS = new Set(["node_modules", ".git"]);
const H1_RE = /^# /m;

// ---- argument parsing ----

function parseArgs(argv) {
  const args = { root: null, recurse: false, json: false, help: false };
  let i = 0;
  while (i < argv.length) {
    const a = argv[i];
    if (a === "--root") { args.root = argv[++i]; }
    else if (a === "--recurse") { args.recurse = true; }
    else if (a === "--json") { args.json = true; }
    else if (a === "--help" || a === "-h") { args.help = true; }
    else {
      process.stderr.write(`audit-theory: unknown argument: ${a}\n`);
      process.exit(2);
    }
    i++;
  }
  return args;
}

// ---- frontmatter parsing ----

function parseFrontmatter(text) {
  const m = text.match(/^---\r?\n([\s\S]*?)\r?\n---\r?\n?([\s\S]*)$/);
  if (!m) return { fm: null, body: text };
  return { fm: m[1], body: m[2] };
}

function extractKeys(fmText) {
  const keys = [];
  for (const line of fmText.split(/\r?\n/)) {
    const m = line.match(/^([a-zA-Z][a-zA-Z0-9_-]*):/);
    if (m) keys.push(m[1]);
  }
  return keys;
}

function extractScalarValue(fmText, key) {
  // Returns the string value for a top-level scalar key, or null if missing/block.
  const escaped = key.replace(/[-]/g, "\\-");
  const re = new RegExp(`^${escaped}:\\s*(.+)`, "m");
  const m = fmText.match(re);
  if (!m) return null;
  const v = m[1].trim();
  if (v === "" || v === "|" || v === ">" || v.startsWith("[") || v.startsWith("-")) return null;
  return v.replace(/^["']|["']$/g, "");
}

// ---- directory walking ----

function collectTransformerSlugs(root) {
  // Walk all transformers/ directories under root; collect .md basenames minus extension.
  const slugs = new Set();
  function walk(dir) {
    let entries;
    try { entries = fs.readdirSync(dir, { withFileTypes: true }); }
    catch { return; }
    for (const e of entries) {
      if (SKIP_DIRS.has(e.name)) continue;
      const full = path.join(dir, e.name);
      if (e.isDirectory()) {
        if (e.name === "transformers") {
          let tEntries;
          try { tEntries = fs.readdirSync(full, { withFileTypes: true }); }
          catch { continue; }
          for (const te of tEntries) {
            if (te.isFile() && te.name.endsWith(".md")) {
              slugs.add(te.name.slice(0, -3));
            }
          }
          // Do not recurse further into transformers/
        } else {
          walk(full);
        }
      }
    }
  }
  walk(root);
  return slugs;
}

function collectMdFiles(root, recurse) {
  const files = [];
  function walk(dir, depth) {
    let entries;
    try { entries = fs.readdirSync(dir, { withFileTypes: true }); }
    catch { return; }
    for (const e of entries) {
      if (SKIP_DIRS.has(e.name)) continue;
      const full = path.join(dir, e.name);
      if (e.isFile() && e.name.endsWith(".md")) {
        files.push(full);
      } else if (e.isDirectory()) {
        // In non-recurse mode, skip the theories/ subdirectory at depth > 0
        // (sub-theories are separate substrates with their own transformer sets)
        if (!recurse && depth > 0 && e.name === "theories") continue;
        walk(full, depth + 1);
      }
    }
  }
  walk(root, 0);
  return files;
}

function collectTransformerFiles(root) {
  // Returns { slug, path } for every file in a transformers/ directory.
  const transformers = [];
  function walk(dir) {
    let entries;
    try { entries = fs.readdirSync(dir, { withFileTypes: true }); }
    catch { return; }
    for (const e of entries) {
      if (SKIP_DIRS.has(e.name)) continue;
      const full = path.join(dir, e.name);
      if (e.isDirectory()) {
        if (e.name === "transformers") {
          let tEntries;
          try { tEntries = fs.readdirSync(full, { withFileTypes: true }); }
          catch { continue; }
          for (const te of tEntries) {
            if (te.isFile() && te.name.endsWith(".md")) {
              transformers.push({ slug: te.name.slice(0, -3), path: path.join(full, te.name) });
            }
          }
        } else {
          walk(full);
        }
      }
    }
  }
  walk(root);
  return transformers;
}

// ---- auditing ----

function auditFile(filePath, transformerSlugs) {
  const findings = [];
  let text;
  try { text = fs.readFileSync(filePath, "utf8"); }
  catch (e) {
    return [{ level: "error", rule: "io", file: filePath, message: `cannot read: ${e.message}` }];
  }

  const { fm, body } = parseFrontmatter(text);

  if (fm === null) {
    findings.push({ level: "error", rule: "R9", file: filePath, message: "no frontmatter block" });
    return findings;
  }

  const keys = extractKeys(fm);
  const nameVal = extractScalarValue(fm, "name");
  const descVal = extractScalarValue(fm, "description");

  // R9: name must be present and non-empty scalar
  if (!keys.includes("name")) {
    findings.push({ level: "error", rule: "R9", file: filePath, message: "missing key: name" });
  } else if (!nameVal) {
    findings.push({ level: "error", rule: "R9", file: filePath, message: "name: is empty or non-scalar" });
  }

  // R9: description must be present and non-empty scalar
  if (!keys.includes("description")) {
    findings.push({ level: "error", rule: "R9", file: filePath, message: "missing key: description" });
  } else if (!descVal) {
    findings.push({ level: "error", rule: "R9", file: filePath, message: "description: is empty or non-scalar" });
  }

  // R7/R10: all other keys must be transformer slugs
  for (const key of keys) {
    if (!ALWAYS_VALID.has(key) && !transformerSlugs.has(key)) {
      findings.push({
        level: "error",
        rule: "R7",
        file: filePath,
        message: `key "${key}" is not a transformer slug in Ob(C)`,
      });
    }
  }

  // R13: no H1 heading in body
  if (body && H1_RE.test(body)) {
    findings.push({ level: "error", rule: "R13", file: filePath, message: "body contains H1 heading" });
  }

  return findings;
}

function auditTransformerNaming(transformers) {
  // Warns on transformer slugs that do not end in -ing (not a gerund).
  const findings = [];
  for (const { slug, path: filePath } of transformers) {
    if (!slug.endsWith("ing")) {
      findings.push({
        level: "warning",
        rule: "naming",
        file: filePath,
        message: `transformer slug "${slug}" does not end in -ing — verify it is a gerund or rename`,
      });
    }
  }
  return findings;
}

// ---- output ----

function printText(allFindings, root, transformerSlugs) {
  const errors = allFindings.filter(f => f.level === "error");
  const warnings = allFindings.filter(f => f.level === "warning");

  const byFile = new Map();
  for (const f of allFindings) {
    if (!byFile.has(f.file)) byFile.set(f.file, []);
    byFile.get(f.file).push(f);
  }

  process.stdout.write(`audit-theory (root: ${root})\n`);
  process.stdout.write(`  transformers in Ob(C): ${transformerSlugs.size}  errors: ${errors.length}  warnings: ${warnings.length}\n\n`);

  for (const [file, fds] of [...byFile].sort((a, b) => a[0].localeCompare(b[0]))) {
    const rel = path.relative(root, file);
    process.stdout.write(`${rel}\n`);
    for (const f of fds) {
      const tag = f.level === "error" ? "error" : "warn ";
      process.stdout.write(`  [${tag}:${f.rule}] ${f.message}\n`);
    }
  }
}

// ---- main ----

function defaultRoot() {
  // Script lives at <root>/governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs
  return path.resolve(__dirname, "..", "..", "..", "..", "..");
}

const args = parseArgs(process.argv.slice(2));

if (args.help) {
  process.stdout.write(`audit-theory.mjs — conformance audit against theory-encoding.md

Usage:
  node audit-theory.mjs [--root <path>] [--recurse] [--json]

Options:
  --root <path>   Theory root (default: derived from script location)
  --recurse       Also audit sub-theories in theories/ directories
  --json          JSON output
  -h, --help      This help

Rules:
  R9      name and description present and non-empty
  R7/R10  non-(name|description) keys must be transformer slugs
  R13     no H1 heading in body
  naming  transformer slugs should be gerunds (end in -ing)

Exit: 0 = no errors, 1 = errors, 2 = bad arguments
`);
  process.exit(0);
}

const root = path.resolve(args.root ?? defaultRoot());
const transformerSlugs = collectTransformerSlugs(root);
const files = collectMdFiles(root, args.recurse);
const transformerFiles = collectTransformerFiles(root);

const allFindings = [];
for (const file of files) {
  allFindings.push(...auditFile(file, transformerSlugs));
}
allFindings.push(...auditTransformerNaming(transformerFiles));

if (args.json) {
  process.stdout.write(JSON.stringify({
    root,
    transformers: [...transformerSlugs].sort(),
    errors: allFindings.filter(f => f.level === "error").length,
    warnings: allFindings.filter(f => f.level === "warning").length,
    findings: allFindings,
  }, null, 2) + "\n");
} else {
  printText(allFindings, root, transformerSlugs);
}

process.exitCode = allFindings.some(f => f.level === "error") ? 1 : 0;
