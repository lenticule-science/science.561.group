#!/usr/bin/env node
// lint-filestore.mjs — lint the filestore structure itself (identity + directory shape).
// Usage: node lint-filestore.mjs --filestore <root>

import { parseFrontmatter, getTransformerSlugs, parseArgs, printResult }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync, existsSync, readdirSync } from 'node:fs';
import { resolve, join } from 'node:path';

const CANONICAL_DIRS = new Set([
  'prose', 'code', 'governance', 'theories',
  'structures', 'transformers', 'claims', 'concepts', 'questions', 'work',
]);

const args = parseArgs(process.argv.slice(2));
if (!args.filestore) {
  process.stderr.write('Usage: lint-filestore.mjs --filestore <root>\n');
  process.exit(2);
}

const filestore = resolve(args.filestore);
const violations = [];

// Identity: _index.md must exist
const indexPath = join(filestore, '_index.md');
if (!existsSync(indexPath)) {
  violations.push('identity: _index.md is missing from filestore root');
  printResult(violations);
}

const content = readFileSync(indexPath, 'utf8');
const { keys, body } = parseFrontmatter(content);

// R9 on _index.md
if (!keys.name || keys.name === '')
  violations.push('R9: _index.md missing or empty "name"');
if (!keys.description || keys.description === '')
  violations.push('R9: _index.md missing or empty "description"');

// R13 on _index.md
for (const line of body.split(/\r?\n/)) {
  if (/^# /.test(line)) {
    violations.push(`R13: _index.md has H1 heading in body: "${line.trim()}"`);
    break;
  }
}

// R7/R10 on _index.md
const transformerSlugs = getTransformerSlugs(filestore);
const universalKeys = new Set(['name', 'description']);
for (const key of Object.keys(keys)) {
  if (!universalKeys.has(key) && !transformerSlugs.has(key))
    violations.push(`R7/R10: _index.md frontmatter key "${key}" is not a transformer slug`);
}

// Directory shape: only canonical dirs allowed at top level
const entries = readdirSync(filestore, { withFileTypes: true });
for (const e of entries) {
  if (!e.isDirectory()) continue;
  if (!CANONICAL_DIRS.has(e.name))
    violations.push(`directory-shape: unknown top-level directory "${e.name}"`);
}

printResult(violations);
