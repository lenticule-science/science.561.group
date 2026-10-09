#!/usr/bin/env node
// make-filestore.mjs — initialize a new FARS filestore at a given root.
// Usage: node make-filestore.mjs --root <path> --name <slug> --description <text>

import { parseArgs } from '../../linting-utilities/scripts/linting-lib.mjs';
import { existsSync, writeFileSync, mkdirSync } from 'node:fs';
import { resolve, join } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.root || !args.name || !args.description) {
  process.stderr.write('Usage: make-filestore.mjs --root <path> --name <slug> --description <text>\n');
  process.exit(2);
}

const root = resolve(args.root);
const name = args.name.trim();
const description = args.description.trim();

const violations = [];
if (!name) violations.push('R9: --name must not be empty');
if (!description) violations.push('R9: --description must not be empty');

if (violations.length > 0) {
  for (const v of violations) process.stdout.write(`FAIL: ${v}\n`);
  process.stdout.write('false\n');
  process.exit(1);
}

const indexPath = join(root, '_index.md');
if (existsSync(indexPath)) {
  process.stdout.write(`FAIL: _index.md already exists at ${root}\n`);
  process.stdout.write('false\n');
  process.exit(1);
}

// Four mandatory directories (FOUR bilattice positions) plus working directories
const dirs = [
  'prose',
  'code',
  'governance',
  'theories',
  'structures',
  'transformers',
  'concepts',
  'claims',
  'questions',
  'work',
];

for (const dir of dirs) {
  const dirPath = join(root, dir);
  mkdirSync(dirPath, { recursive: true });
  process.stdout.write(`created: ${dir}/\n`);
}

const content = `---\nname: ${name}\ndescription: ${description}\n---\n`;
writeFileSync(indexPath, content, 'utf8');
process.stdout.write(`written: _index.md\n`);
process.stdout.write('true\n');
process.exit(0);
