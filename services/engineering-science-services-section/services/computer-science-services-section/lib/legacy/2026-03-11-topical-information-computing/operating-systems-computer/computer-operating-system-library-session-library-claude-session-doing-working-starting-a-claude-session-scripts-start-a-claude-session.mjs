// starting-a-claude-session — reads surface files at the repository root in
// lawful order and concatenates them for Claude Code's SessionStart hook to
// inject.
//
// Module: default-exports async ({root?}) → {injected, content}
// CLI:    node start-a-claude-session.mjs [root]  — prints content to stdout.

import { readFileSync, existsSync } from 'node:fs';
import { resolve, isAbsolute, join } from 'node:path';
import { fileURLToPath } from 'node:url';

// The order the SessionStart hook reads surface files in at the repository
// root. identity.md is not in this list: the operator forbade the file as an
// invented convention; AI characters follow real-world specs.
const ORDER = [
  'SOUL.md',
  'MEMORY.md',
  'HEARTBEAT.md',
  'DREAMS.md',
  'TOOLS.md',
  'USER.md',
  'AGENTS.md',
];

export default async function startAClaudeSession({ root } = {}) {
  const repoRoot = root
    ? (isAbsolute(root) ? root : resolve(process.cwd(), root))
    : process.cwd();

  const injected = [];
  const chunks = [];
  for (const file of ORDER) {
    const p = join(repoRoot, file);
    if (!existsSync(p)) continue;
    injected.push(file);
    const body = readFileSync(p, 'utf8').replace(/\n+$/, '');
    chunks.push(`<!-- injected: ${file} -->\n\n${body}\n`);
  }

  const content = chunks.length === 0
    ? ''
    : chunks.join('\n---\n\n');

  return { injected, content };
}

if (resolve(fileURLToPath(import.meta.url)) === resolve(process.argv[1] ?? '')) {
  const [,, rootArg] = process.argv;
  try {
    const { content } = await startAClaudeSession(rootArg ? { root: rootArg } : {});
    if (content.length > 0) process.stdout.write(content);
  } catch (err) {
    process.stderr.write(`[start-a-claude-session] ${err.message}\n`);
    process.exit(1);
  }
}
