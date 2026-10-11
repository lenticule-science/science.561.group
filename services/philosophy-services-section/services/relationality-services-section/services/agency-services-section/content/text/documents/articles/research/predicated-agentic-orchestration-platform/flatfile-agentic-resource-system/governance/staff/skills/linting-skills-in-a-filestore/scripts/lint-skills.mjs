#!/usr/bin/env node
// lint-skills.mjs — lint all skill entities in governance/staff/skills/.
// Handles both flat (skill.md) and directory-structured (skill/skill.md) layouts.
// Usage: node lint-skills.mjs --filestore <root>

import { parseFrontmatter, checkUniversalRules, parseArgs }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync, readdirSync, existsSync, statSync } from 'node:fs';
import { resolve, join, relative, basename } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore) { process.stderr.write('Usage: lint-skills.mjs --filestore <root>\n'); process.exit(2); }

const filestore = resolve(args.filestore);
const skillsDir = join(filestore, 'governance', 'staff', 'skills');
if (!existsSync(skillsDir)) { process.stdout.write('true\n'); process.exit(0); }

// Collect skill entity files: flat .md or <dir>/<dir>.md (the named skill file inside a dir)
const files = [];
for (const entry of readdirSync(skillsDir, { withFileTypes: true })) {
  if (entry.isFile() && entry.name.endsWith('.md') && !entry.name.startsWith('_')) {
    files.push(join(skillsDir, entry.name));
  } else if (entry.isDirectory()) {
    const named = join(skillsDir, entry.name, `${entry.name}.md`);
    if (existsSync(named)) files.push(named);
  }
}

let anyFail = false;
for (const entityPath of files) {
  const { keys, body } = parseFrontmatter(readFileSync(entityPath, 'utf8'));
  const violations = checkUniversalRules(keys, body, entityPath, filestore);
  if (violations.length > 0) {
    anyFail = true;
    const rel = relative(filestore, entityPath).replace(/\\/g, '/');
    for (const v of violations) process.stdout.write(`${rel}: FAIL: ${v}\n`);
  }
}
process.stdout.write(anyFail ? 'false\n' : 'true\n');
process.exit(anyFail ? 1 : 0);
