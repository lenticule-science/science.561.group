#!/usr/bin/env node
// lint-transformer.mjs — lint one transformer entity (R9, R7/R10, R13 + kind + gerund check).
// Usage: node lint-transformer.mjs --filestore <root> --entity <path>

import { parseFrontmatter, checkUniversalRules, parseArgs, printResult }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync } from 'node:fs';
import { resolve, relative, basename } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore || !args.entity) {
  process.stderr.write('Usage: lint-transformer.mjs --filestore <root> --entity <path>\n');
  process.exit(2);
}

const filestore = resolve(args.filestore);
const entityPath = isAbsolute(args.entity) ? args.entity : resolve(filestore, args.entity);
const content = readFileSync(entityPath, 'utf8');
const { keys, body } = parseFrontmatter(content);

const rel = relative(filestore, entityPath).replace(/\\/g, '/');
const slug = basename(entityPath, '.md');

const kindViolations = [];
if (!rel.startsWith('transformers/'))
  kindViolations.push(`kind: entity is not under transformers/ (found: ${rel})`);
if (!slug.endsWith('ing'))
  kindViolations.push(`naming: transformer slug "${slug}" does not end in -ing (must be a gerund)`);

printResult([
  ...checkUniversalRules(keys, body, entityPath, filestore),
  ...kindViolations,
]);
