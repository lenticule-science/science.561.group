#!/usr/bin/env node
// audit-filestore.mjs — composite audit of all entity kinds in a filestore.
// Usage: node audit-filestore.mjs --filestore <root>

import { parseFrontmatter, checkUniversalRules, parseArgs, getTransformerSlugs }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync, readdirSync, existsSync, writeFileSync, mkdirSync } from 'node:fs';
import { resolve, join, relative, basename } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore) { process.stderr.write('Usage: audit-filestore.mjs --filestore <root>\n'); process.exit(2); }

const filestore = resolve(args.filestore);
const allFindings = [];
const kindSummaries = [];

function auditKind(kindDir, label, extraCheck) {
  if (!existsSync(kindDir)) { kindSummaries.push({ label, count: 0 }); return; }
  const files = readdirSync(kindDir)
    .filter(f => f.endsWith('.md') && !f.startsWith('_'))
    .map(f => join(kindDir, f));
  kindSummaries.push({ label, count: files.length });
  for (const entityPath of files) {
    const { keys, body } = parseFrontmatter(readFileSync(entityPath, 'utf8'));
    const violations = checkUniversalRules(keys, body, entityPath, filestore);
    if (extraCheck) extraCheck(entityPath, violations);
    const rel = relative(filestore, entityPath).replace(/\\/g, '/');
    for (const v of violations) {
      process.stdout.write(`${rel}: FAIL: ${v}\n`);
      allFindings.push({ rel, violation: v });
    }
  }
}

function auditSkills() {
  const skillsDir = join(filestore, 'governance', 'staff', 'skills');
  if (!existsSync(skillsDir)) { kindSummaries.push({ label: 'skills', count: 0 }); return; }
  const files = [];
  for (const entry of readdirSync(skillsDir, { withFileTypes: true })) {
    if (entry.isFile() && entry.name.endsWith('.md') && !entry.name.startsWith('_')) {
      files.push(join(skillsDir, entry.name));
    } else if (entry.isDirectory()) {
      const named = join(skillsDir, entry.name, `${entry.name}.md`);
      if (existsSync(named)) files.push(named);
    }
  }
  kindSummaries.push({ label: 'skills', count: files.length });
  for (const entityPath of files) {
    const { keys, body } = parseFrontmatter(readFileSync(entityPath, 'utf8'));
    const violations = checkUniversalRules(keys, body, entityPath, filestore);
    const rel = relative(filestore, entityPath).replace(/\\/g, '/');
    for (const v of violations) {
      process.stdout.write(`${rel}: FAIL: ${v}\n`);
      allFindings.push({ rel, violation: v });
    }
  }
}

auditKind(join(filestore, 'structures'), 'structures');
auditKind(join(filestore, 'transformers'), 'transformers', (entityPath, violations) => {
  const slug = basename(entityPath, '.md');
  if (!slug.endsWith('ing')) violations.push('R-gerund: transformer slug must end in -ing');
});
auditKind(join(filestore, 'concepts'), 'concepts');
auditKind(join(filestore, 'claims'), 'claims');
auditKind(join(filestore, 'questions'), 'questions');
auditSkills();
auditKind(join(filestore, 'governance', 'rules', 'specifications'), 'rules');

const anyFail = allFindings.length > 0;
const now = new Date();
const dateStr = now.toISOString().slice(0, 10);
const ts = now.toISOString().replace(/[:.]/g, '-').slice(0, 19);
const logDir = join(filestore, 'work', 'logs', dateStr);
mkdirSync(logDir, { recursive: true });

const reportName = `audit-filestore-${ts}`;
const reportPath = join(logDir, `${reportName}.md`);
const relReport = relative(filestore, reportPath).replace(/\\/g, '/');

const totalEntities = kindSummaries.reduce((s, k) => s + k.count, 0);
const summaryLines = kindSummaries.map(({ label, count }) => `- ${label}: ${count}`).join('\n');
const findingsBody = allFindings.length > 0
  ? allFindings.map(({ rel, violation }) => `- ${rel}: ${violation}`).join('\n')
  : '(none)';

const reportContent = `---
name: ${reportName}
description: Composite audit of all entity kinds in ${filestore} on ${dateStr}.
---

Audited ${totalEntities} entities across ${kindSummaries.length} kinds. Filestore: \`${filestore}\`.

## Kind counts

${summaryLines}

## Findings

${findingsBody}

## Result

${anyFail ? 'false' : 'true'}
`;

writeFileSync(reportPath, reportContent, 'utf8');
process.stdout.write(`report written: ${relReport}\n`);
process.stdout.write(anyFail ? 'false\n' : 'true\n');
process.exit(anyFail ? 1 : 0);
