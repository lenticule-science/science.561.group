#!/usr/bin/env node
// audit-skills.mjs — audit all skill entities in a filestore.
// Handles both flat (skill.md) and directory-structured (skill/skill.md) layouts.
// Usage: node audit-skills.mjs --filestore <root>

import { parseFrontmatter, checkUniversalRules, parseArgs }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync, readdirSync, existsSync, writeFileSync, mkdirSync, statSync } from 'node:fs';
import { resolve, join, relative } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore) { process.stderr.write('Usage: audit-skills.mjs --filestore <root>\n'); process.exit(2); }

const filestore = resolve(args.filestore);
const skillsDir = join(filestore, 'governance', 'staff', 'skills');

const findings = [];
const files = [];

if (existsSync(skillsDir)) {
  for (const entry of readdirSync(skillsDir, { withFileTypes: true })) {
    if (entry.isFile() && entry.name.endsWith('.md') && !entry.name.startsWith('_')) {
      files.push(join(skillsDir, entry.name));
    } else if (entry.isDirectory()) {
      const named = join(skillsDir, entry.name, `${entry.name}.md`);
      if (existsSync(named)) files.push(named);
    }
  }
}

const entityCount = files.length;
for (const entityPath of files) {
  const { keys, body } = parseFrontmatter(readFileSync(entityPath, 'utf8'));
  const violations = checkUniversalRules(keys, body, entityPath, filestore);
  const rel = relative(filestore, entityPath).replace(/\\/g, '/');
  for (const v of violations) {
    process.stdout.write(`${rel}: FAIL: ${v}\n`);
    findings.push({ rel, violation: v });
  }
}

const anyFail = findings.length > 0;
const now = new Date();
const dateStr = now.toISOString().slice(0, 10);
const ts = now.toISOString().replace(/[:.]/g, '-').slice(0, 19);
const logDir = join(filestore, 'work', 'logs', dateStr);
mkdirSync(logDir, { recursive: true });

const reportName = `audit-skills-${ts}`;
const reportPath = join(logDir, `${reportName}.md`);
const relReport = relative(filestore, reportPath).replace(/\\/g, '/');

const findingsBody = findings.length > 0
  ? findings.map(({ rel, violation }) => `- ${rel}: ${violation}`).join('\n')
  : '(none)';

const reportContent = `---
name: ${reportName}
description: Audit of skill entities in ${filestore} on ${dateStr}.
---

Audited ${entityCount} skill ${entityCount === 1 ? 'entity' : 'entities'}. Filestore: \`${filestore}\`.

## Findings

${findingsBody}

## Result

${anyFail ? 'false' : 'true'}
`;

writeFileSync(reportPath, reportContent, 'utf8');
process.stdout.write(`report written: ${relReport}\n`);
process.stdout.write(anyFail ? 'false\n' : 'true\n');
process.exit(anyFail ? 1 : 0);
