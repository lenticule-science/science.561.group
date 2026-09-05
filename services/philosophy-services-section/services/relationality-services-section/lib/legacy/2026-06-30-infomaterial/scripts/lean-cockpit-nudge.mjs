#!/usr/bin/env node
// PreToolUse(Bash) nudge: when a shell command does Lean work the `lean-lsp` MCP
// server answers directly, inject a reminder to use the LSP instead. Advisory only —
// it never blocks the call and exits 0 on any error, so it can't break tooling.
//
// Wired in .claude/settings.json under hooks.PreToolUse (matcher "Bash").

import process from 'node:process';

function read(stream) {
  return new Promise((resolve) => {
    let data = '';
    stream.setEncoding('utf8');
    stream.on('data', (c) => (data += c));
    stream.on('end', () => resolve(data));
    stream.on('error', () => resolve(''));
  });
}

try {
  const raw = await read(process.stdin);
  const evt = JSON.parse(raw || '{}');
  if ((evt.tool_name || '') !== 'Bash') process.exit(0);
  const cmd = String(evt.tool_input?.command || '');

  // Each rule: a test on the command, and the LSP tool to point at.
  const rules = [
    {
      re: /\blake\s+build\b/,
      msg: 'use `mcp__lean-lsp__lean_diagnostic_messages` (single file, instant, no restart) for per-edit error checks; reserve `make build` for the whole-tree gate.',
    },
    {
      re: /#print\s+axioms|\blake\s+exe\b/,
      msg: 'use `mcp__lean-lsp__lean_verify` (fully-qualified decl name) for the axiom set, or the `make check` honesty gate.',
    },
    {
      re: /\b(grep|rg|findstr)\b[^|]*\.lean\b/,
      msg: 'use `mcp__lean-lsp__lean_local_search` to find a declaration, or `lean_diagnostic_messages` / `lean_file_outline` to inspect a file.',
    },
  ];

  const hit = rules.find((r) => r.re.test(cmd));
  if (!hit) process.exit(0);

  const out = {
    hookSpecificOutput: {
      hookEventName: 'PreToolUse',
      additionalContext:
        `[lean cockpit] Doing Lean via the shell. ${hit.msg} ` +
        'See lean/CLAUDE.md "The cockpit". (This is the call you were told to stop making.)',
    },
  };
  process.stdout.write(JSON.stringify(out));
} catch {
  // never break a tool call
}
process.exit(0);
