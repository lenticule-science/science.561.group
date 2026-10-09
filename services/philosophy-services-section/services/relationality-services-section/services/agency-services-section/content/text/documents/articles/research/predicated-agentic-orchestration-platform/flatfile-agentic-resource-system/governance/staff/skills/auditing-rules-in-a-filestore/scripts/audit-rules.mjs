#!/usr/bin/env node
// audit-rules.mjs — audit all specification/rule entities in a filestore.
// Usage: node audit-rules.mjs --filestore <root>

import { parseFrontmatter, checkUniversalRules, parseArgs }
  from '../../linting-utilities/scripts/linting-lib.mjs';
import { readFileSync, readdirSync, existsSync, writeFileSync, mkdirSync } from 'node:fs';
import { resolve, join, relative } from 'node:path';

const args = parseArgs(process.argv.slice(2));
if (!args.filestore) { process.stderr.write('Usage: audit-rules.mjs --filestore <root>\n'); process.exit(2); }

const filestore = resolve(args.filestore);
const kindDir = join(filestore, 'governance', 'rules', 'specifications');

const findings = [];
let entityCount = 0;

if (existsSync(kindDir)) {
  const files = readdirSync(kindDir)
    .filter(f => f.endsWith('.md') && !f.startsWith('_'))
    .map(f => join(kindDir, f));
  entityCount = files.length;
  for (const entityPath of files) {
    const { keys, body } = parseFrontmatter(readFileSync(entityPath, 'utf8'));
    const violations = checkUniversalRules(keys, body, entityPath, filestore);
    const rel = relative(filestore, entityPath).replace(/\\/g, '/');
    for (const v of violations) {
      process.stdout.write(`${rel}: FAIL: ${v}\n`);
      findings.push({ rel, violation: v });
    }
  }
}

const anyFail = findings.length > 0;
const now = new Date();
const dateStr = now.toISOString().slice(0, 10);
const ts = now.toISOString().replace(/[:.]/g, '-').slice(0, 19);
const logDir = join(filestore, 'work', 'logs', dateStr);
mkdirSync(logDir, { recursive: true });

const reportName = `audit-rules-${ts}`;
const reportPath = join(logDir, `${reportName}.md`);
const relReport = relative(filestore, reportPath).replace(/\\/g, '/');

const findingsBody = findings.length > 0
  ? findings.map(({ rel, violation }) => `- ${rel}: ${violation}`).join('\n')
  : '(none)';

const reportContent = `---
name: ${reportName}
description: Audit of rule entities in ${filestore} on ${dateStr}.
---

Audited ${entityCount} rule ${entityCount === 1 ? 'entity' : 'entities'}. Filestore: \`${filestore}\`.

## Findings

${findingsBody}

## Result

${anyFail ? 'false' : 'true'}
`;

writeFileSync(reportPath, reportContent, 'utf8');
process.stdout.write(`report written: ${relReport}\n`);
process.stdout.write(anyFail ? 'false\n' : 'true\n');
process.exit(anyFail ? 1 : 0);
