#!/usr/bin/env node
// lint-skill.mjs — lint one skill entity (R9, R7/R10, R13 + kind check).
// Usage: node lint-skill.mjs --filestore <root> --entity <path>
// Kind: entity must be under governance/staff/skills/ or governance/staff/characters/*/skills/

import { parseFrontmatter, checkUniversalRules, parseArgs, printResult }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync } from 'node:fs';
import { resolve, relative, isAbsolute } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore || !args.entity) {
  process.stderr.write('Usage: lint-skill.mjs --filestore <root> --entity <path>\n');
  process.exit(2);
}

const filestore = resolve(args.filestore);
const entityPath = isAbsolute(args.entity) ? args.entity : resolve(filestore, args.entity);
const content = readFileSync(entityPath, 'utf8');
const { keys, body } = parseFrontmatter(content);

const rel = relative(filestore, entityPath).replace(/\\/g, '/');
const isInSkills = rel.startsWith('governance/staff/skills/') ||
  /^governance\/staff\/characters\/[^/]+\/skills\//.test(rel);
const kindViolations = isInSkills
  ? []
  : [`kind: entity is not under governance/staff/skills/ or characters/*/skills/ (found: ${rel})`];

printResult([
  ...checkUniversalRules(keys, body, entityPath, filestore),
  ...kindViolations,
]);
