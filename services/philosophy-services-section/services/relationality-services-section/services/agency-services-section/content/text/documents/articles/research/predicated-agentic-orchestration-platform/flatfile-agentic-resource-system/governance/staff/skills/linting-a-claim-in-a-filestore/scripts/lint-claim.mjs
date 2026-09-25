#!/usr/bin/env node
// lint-claim.mjs — lint one claim entity (R9, R7/R10, R13 + kind check).
// Usage: node lint-claim.mjs --filestore <root> --entity <path>

import { parseFrontmatter, checkUniversalRules, parseArgs, printResult }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync } from 'node:fs';
import { resolve, relative, isAbsolute } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore || !args.entity) {
  process.stderr.write('Usage: lint-claim.mjs --filestore <root> --entity <path>\n');
  process.exit(2);
}

const filestore = resolve(args.filestore);
const entityPath = isAbsolute(args.entity) ? args.entity : resolve(filestore, args.entity);
const content = readFileSync(entityPath, 'utf8');
const { keys, body } = parseFrontmatter(content);

const rel = relative(filestore, entityPath).replace(/\\/g, '/');
const kindViolations = rel.startsWith('claims/')
  ? []
  : [`kind: entity is not under claims/ (found: ${rel})`];

printResult([
  ...checkUniversalRules(keys, body, entityPath, filestore),
  ...kindViolations,
]);
