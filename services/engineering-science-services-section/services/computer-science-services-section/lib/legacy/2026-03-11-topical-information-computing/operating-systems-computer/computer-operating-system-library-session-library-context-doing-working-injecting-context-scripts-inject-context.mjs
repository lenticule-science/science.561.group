#!/usr/bin/env node
// inject-context.mjs
//
// The general injecting-context skill. Given a payload describing what to
// inject and the hook event to emit through, formats the emission as
// Claude Code's hook protocol expects.
//
// Library use (preferred): import default; call emitContextInjection({
//   payload, hookEventName, write }).
//
// CLI use: provide a hook payload on stdin and --mode= flag. The payload's
// `_inject` field carries the context body to inject. Used as the entrypoint
// when no specialized detection is required.

import { resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

/**
 * Emit a context-injection through Claude Code's hook protocol.
 *
 * @param {object}   args
 * @param {string}   args.body            The reminder text (already formatted as prose).
 * @param {string}   args.hookEventName   "UserPromptSubmit" | "PreToolUse" | "Stop"
 * @param {function} [args.write]         Output writer; defaults to writing JSON to stdout.
 * @returns {object} The protocol object that was emitted.
 */
export function emitContextInjection({ body, hookEventName, write }) {
  if (typeof body !== 'string' || body.length === 0) {
    throw new Error('emitContextInjection: body required (non-empty string)');
  }
  const writer = typeof write === 'function' ? write : (s) => process.stdout.write(s);
  let emission;
  if (hookEventName === 'UserPromptSubmit') {
    emission = {
      hookSpecificOutput: {
        hookEventName: 'UserPromptSubmit',
        additionalContext: body,
      },
    };
  } else if (hookEventName === 'PreToolUse') {
    emission = {
      hookSpecificOutput: {
        hookEventName: 'PreToolUse',
        permissionDecision: 'deny',
        permissionDecisionReason: body,
      },
    };
  } else if (hookEventName === 'Stop') {
    emission = { decision: 'block', reason: body };
  } else {
    throw new Error(`emitContextInjection: unknown hookEventName "${hookEventName}"`);
  }
  writer(JSON.stringify(emission));
  return emission;
}

export default emitContextInjection;

// ----- CLI entrypoint -----

function parseArgs(argv) {
  const out = { mode: null };
  for (const a of argv.slice(2)) {
    if (a.startsWith('--mode=')) out.mode = a.slice('--mode='.length);
  }
  return out;
}

function readStdin() {
  return new Promise((res) => {
    let buf = '';
    process.stdin.setEncoding('utf8');
    process.stdin.on('data', (chunk) => { buf += chunk; });
    process.stdin.on('end', () => res(buf));
  });
}

async function main() {
  const { mode } = parseArgs(process.argv);
  const modeToEvent = {
    'user-prompt-submit': 'UserPromptSubmit',
    'pre-tool-use': 'PreToolUse',
    'stop': 'Stop',
  };
  const hookEventName = modeToEvent[mode];
  if (!hookEventName) {
    process.stderr.write('[inject-context] --mode required: user-prompt-submit | pre-tool-use | stop\n');
    process.exit(0);
  }
  let payload = {};
  try {
    const raw = await readStdin();
    if (raw && raw.trim()) payload = JSON.parse(raw);
  } catch (err) {
    process.stderr.write(`[inject-context] stdin parse failed: ${err.message}\n`);
    process.exit(0);
  }
  const body = typeof payload._inject === 'string' ? payload._inject : null;
  if (!body) process.exit(0);
  emitContextInjection({ body, hookEventName });
  process.exit(0);
}

if (resolve(fileURLToPath(import.meta.url)) === resolve(process.argv[1] ?? '')) {
  main();
}
