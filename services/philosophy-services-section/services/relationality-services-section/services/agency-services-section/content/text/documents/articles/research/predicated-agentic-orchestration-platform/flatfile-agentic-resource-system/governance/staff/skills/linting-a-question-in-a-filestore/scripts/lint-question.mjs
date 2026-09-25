#!/usr/bin/env node
// lint-question.mjs — lint one question entity (R9, R7/R10, R13 + kind check).
// Usage: node lint-question.mjs --filestore <root> --entity <path>

import { parseFrontmatter, checkUniversalRules, parseArgs, printResult }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync } from 'node:fs';
import { resolve, relative, isAbsolute } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore || !args.entity) {
  process.stderr.write('Usage: lint-question.mjs --filestore <root> --entity <path>\n');
  process.exit(2);
}

const filestore = resolve(args.filestore);
const entityPath = isAbsolute(args.entity) ? args.entity : resolve(filestore, args.entity);
const content = readFileSync(entityPath, 'utf8');
const { keys, body } = parseFrontmatter(content);

const rel = relative(filestore, entityPath).replace(/\\/g, '/');
const kindViolations = rel.startsWith('questions/')
  ? []
  : [`kind: entity is not under questions/ (found: ${rel})`];

printResult([
  ...checkUniversalRules(keys, body, entityPath, filestore),
  ...kindViolations,
]);
