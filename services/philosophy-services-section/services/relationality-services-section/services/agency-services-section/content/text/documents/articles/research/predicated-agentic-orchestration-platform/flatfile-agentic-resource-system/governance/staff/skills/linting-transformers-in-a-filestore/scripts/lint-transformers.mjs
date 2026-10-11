#!/usr/bin/env node
// lint-transformers.mjs — lint all transformer entities in transformers/.
// Usage: node lint-transformers.mjs --filestore <root>

import { parseFrontmatter, checkUniversalRules, parseArgs }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync, readdirSync, existsSync } from 'node:fs';
import { resolve, join, relative, basename } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore) {
  process.stderr.write('Usage: lint-transformers.mjs --filestore <root>\n');
  process.exit(2);
}

const filestore = resolve(args.filestore);
const kindDir = join(filestore, 'transformers');

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
  const slug = basename(entityPath, '.md');
  const violations = [
    ...checkUniversalRules(keys, body, entityPath, filestore),
    ...(slug.endsWith('ing') ? [] : [`naming: slug "${slug}" does not end in -ing`]),
  ];
  if (violations.length > 0) {
    anyFail = true;
    const rel = relative(filestore, entityPath).replace(/\\/g, '/');
    for (const v of violations) process.stdout.write(`${rel}: FAIL: ${v}\n`);
  }
}

process.stdout.write(anyFail ? 'false\n' : 'true\n');
process.exit(anyFail ? 1 : 0);
