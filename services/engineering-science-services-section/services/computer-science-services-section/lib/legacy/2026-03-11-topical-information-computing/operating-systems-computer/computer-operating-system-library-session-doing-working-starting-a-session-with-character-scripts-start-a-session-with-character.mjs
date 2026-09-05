// Character-session ingress: call the canonical install skill to write
// .mcp.json + CLAUDE.md keyed to the named character, then exec `claude`.
//
// Install and start are separate verbs. The install body lives in the skill
// `installing-a-character-as-a-claude-configuration`; this launcher only
// invokes it and execs the session.

import { spawn } from 'node:child_process';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import installACharacterAsAClaudeConfiguration from '../../installing-a-character-as-a-claude-configuration/scripts/install-a-character-as-a-claude-configuration.mjs';

const arg = process.argv.find(a => a.startsWith('--character='));
if (!arg) {
  console.error('Usage: start-a-session-with-character.mjs --character=<slug-or-path>');
  process.exit(2);
}
const characterRef = arg.slice('--character='.length);

// Repo root: this script lives at
// library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/session/doing/working/starting-a-session-with-character/scripts/start-a-session-with-character.mjs
// → five levels up.
const here = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(here, '../../../../../..');

try {
  const result = await installACharacterAsAClaudeConfiguration({ character: characterRef, repoRoot });
  const agencyList = result.agencyEntries.map(e => e.agentName).join(', ') || '(none)';
  console.error(`[starting-a-session-with-character] installed character=${result.characterName} (ref=${result.characterRef}), agency=[${agencyList}], ${result.skills.length} skills in scope.`);
} catch (err) {
  console.error(`[starting-a-session-with-character] ${err.message}`);
  process.exit(2);
}

const child = spawn('claude', [], { stdio: 'inherit', cwd: repoRoot });
child.on('exit', code => process.exit(code ?? 0));
