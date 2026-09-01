// Session ingress: resolve agent scope, install .mcp.json + CLAUDE.md, exec `claude`.

import { spawn } from 'node:child_process';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { installConfig } from '../../../hacking/serving/serving-skills-over-mcp/scripts/install-config.mjs';

const arg = process.argv.find(a => a.startsWith('--agent='));
if (!arg) {
  console.error('Usage: run.mjs --agent=<name>');
  process.exit(2);
}
const agentName = arg.slice('--agent='.length);

// Repo root: this script lives at
// library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/session/doing/working/starting-a-session/scripts/run.mjs
// → five levels up.
const here = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(here, '../../../../../..');

try {
  const result = await installConfig({ agentName, repoRoot });
  console.error(`[starting-a-session] agent=${agentName}, ${result.skills.length} skills in scope: ${result.skills.join(', ') || '(none)'}.`);
} catch (err) {
  console.error(`[starting-a-session] ${err.message}`);
  process.exit(2);
}

const child = spawn('claude', [], { stdio: 'inherit', cwd: repoRoot });
child.on('exit', code => process.exit(code ?? 0));
