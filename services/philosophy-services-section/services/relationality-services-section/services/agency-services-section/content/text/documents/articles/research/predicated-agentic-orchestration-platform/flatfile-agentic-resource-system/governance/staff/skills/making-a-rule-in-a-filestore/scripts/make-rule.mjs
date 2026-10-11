#!/usr/bin/env node
// make-rule.mjs — scaffold a new specification/rule entity in a filestore.
// Usage: node make-rule.mjs --filestore <root> --name <slug> --description <text>

import { parseArgs } from '../../linting-utilities/scripts/linting-lib.mjs';
import { existsSync, writeFileSync, mkdirSync } from 'node:fs';
import { resolve, join, relative } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore || !args.name || !args.description) {
  process.stderr.write('Usage: make-rule.mjs --filestore <root> --name <slug> --description <text>\n');
  process.exit(2);
}

const filestore = resolve(args.filestore);
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

const targetDir = join(filestore, 'governance', 'rules', 'specifications');
mkdirSync(targetDir, { recursive: true });
const targetPath = join(targetDir, `${name}.md`);

if (existsSync(targetPath)) {
  process.stdout.write(`FAIL: governance/rules/specifications/${name}.md already exists\n`);
  process.stdout.write('false\n');
  process.exit(1);
}

const content = `---\nname: ${name}\ndescription: ${description}\n---\n`;
writeFileSync(targetPath, content, 'utf8');
const rel = relative(filestore, targetPath).replace(/\\/g, '/');
process.stdout.write(`written: ${rel}\n`);
process.stdout.write('true\n');
process.exit(0);
