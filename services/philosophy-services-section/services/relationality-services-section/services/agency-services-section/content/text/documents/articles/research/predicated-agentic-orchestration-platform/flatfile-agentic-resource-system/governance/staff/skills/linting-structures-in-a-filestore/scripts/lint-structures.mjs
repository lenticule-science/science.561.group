#!/usr/bin/env node
// lint-structures.mjs — lint all structure entities in structures/.
// Usage: node lint-structures.mjs --filestore <root>

import { parseFrontmatter, checkUniversalRules, parseArgs }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync, readdirSync, existsSync } from 'node:fs';
import { resolve, join, relative } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore) {
  process.stderr.write('Usage: lint-structures.mjs --filestore <root>\n');
  process.exit(2);
}

const filestore = resolve(args.filestore);
const kindDir = join(filestore, 'structures');

if (!existsSync(kindDir)) {
  process.stdout.write('true\n');
  process.exit(0);
}

const files = readdirSync(kindDir)
  .filter(f => f.endsWith('.md') && !f.startsWith('_'))
  .map(f => join(kindDir, f));

let anyFail = false;
for (const entityPath of files) {
  const content = readFileSync(entityPath, 'utf8');
  const { keys, body } = parseFrontmatter(content);
  const violations = checkUniversalRules(keys, body, entityPath, filestore);
  if (violations.length > 0) {
    anyFail = true;
    const rel = relative(filestore, entityPath).replace(/\\/g, '/');
    for (const v of violations) process.stdout.write(`${rel}: FAIL: ${v}\n`);
  }
}

process.stdout.write(anyFail ? 'false\n' : 'true\n');
process.exit(anyFail ? 1 : 0);
