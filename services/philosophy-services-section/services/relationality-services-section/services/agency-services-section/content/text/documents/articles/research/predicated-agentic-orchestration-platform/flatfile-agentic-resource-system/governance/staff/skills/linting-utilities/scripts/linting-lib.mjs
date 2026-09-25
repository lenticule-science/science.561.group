// linting-lib.mjs — shared utilities for all FARS linting scripts.
// Exports: parseFrontmatter, getTransformerSlugs, checkUniversalRules, parseArgs, printResult.
// Only node: builtins used — no npm packages required.

import { existsSync, readdirSync, readFileSync } from 'node:fs';
import { resolve } from 'node:path';

const UNIVERSAL_KEYS = new Set(['name', 'description']);

// Parse YAML frontmatter from markdown content.
// Returns { keys: {key: value, ...}, body: '...' }.
export function parseFrontmatter(content) {
  const lines = content.split(/\r?\n/);
  if (lines[0].trim() !== '---') return { keys: {}, body: content };
  const end = lines.indexOf('---', 1);
  if (end === -1) return { keys: {}, body: content };
  const fmLines = lines.slice(1, end);
  const body = lines.slice(end + 1).join('\n');
  const keys = {};
  for (const line of fmLines) {
    const m = line.match(/^([\w-]+):\s*(.*)$/);
    if (m) keys[m[1]] = m[2].trim().replace(/^["']|["']$/g, '');
  }
  return { keys, body };
}

// Return Set of transformer slugs from <filestore>/transformers/*.md (filename stems).
export function getTransformerSlugs(filestore) {
  const tDir = resolve(filestore, 'transformers');
  if (!existsSync(tDir)) return new Set();
  return new Set(
    readdirSync(tDir)
      .filter(f => f.endsWith('.md') && !f.startsWith('_'))
      .map(f => f.slice(0, -3))
  );
}

// Check universal rules R9, R7/R10, R13. Returns array of violation strings.
export function checkUniversalRules(keys, body, _entityPath, filestore) {
  const violations = [];

  // R9: name and description required, non-empty strings
  if (!keys.name || keys.name === '')
    violations.push('R9: missing or empty "name" in frontmatter');
  if (!keys.description || keys.description === '')
    violations.push('R9: missing or empty "description" in frontmatter');

  // R9-smell: description must differ from name (identical value adds no predication)
  if (keys.name && keys.description &&
      keys.description.trim().toLowerCase() === keys.name.trim().toLowerCase())
    violations.push('R9-smell: "description" is identical to "name" — write a real description');

  // R7/R10: all keys beyond name/description must be transformer slugs
  const transformerSlugs = getTransformerSlugs(filestore);
  for (const key of Object.keys(keys)) {
    if (!UNIVERSAL_KEYS.has(key) && !transformerSlugs.has(key))
      violations.push(`R7/R10: frontmatter key "${key}" is not a transformer slug`);
  }

  // R13: no H1 heading in body
  for (const line of body.split(/\r?\n/)) {
    if (/^# /.test(line)) {
      violations.push(`R13: H1 heading in body: "${line.trim()}"`);
      break;
    }
  }

  return violations;
}

// Parse --key value pairs from an argv array.
export function parseArgs(argv) {
  const args = {};
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    if (a.startsWith('--')) {
      const key = a.slice(2);
      const next = argv[i + 1];
      args[key] = next && !next.startsWith('--') ? argv[++i] : true;
    }
  }
  return args;
}

// Print result and exit. violations=[] → prints 'true' and exits 0.
// violations non-empty → prints each as 'FAIL: ...' then 'false' and exits 1.
export function printResult(violations) {
  if (violations.length === 0) {
    process.stdout.write('true\n');
    process.exit(0);
  } else {
    for (const v of violations) process.stdout.write(`FAIL: ${v}\n`);
    process.stdout.write('false\n');
    process.exit(1);
  }
}
