---
title: "Survey of Claude Code Harness Capabilities"
description: "Collects facts about Claude Code's hook system (settings.json lifecycle events, additionalContext injection, Stop-gate, hook variables and transports, plugin bundling) and the concrete changes they imply for the manifold's session wiring, citing prior-art memory systems that use the same hook shape."
date-created: 2026-06-20
keywords:
  - claude
  - harness
  - capability
  - hook
---


Date 2026-06-20.
Facts about Claude Code's hook system and the changes they imply for the manifold's session wiring.
Sources at the bottom.

## Claude Code hook facts

- Hooks are configured in `settings.json` under `hooks`, one entry per lifecycle event.
  The hook reads JSON on stdin (`session_id`, `transcript_path`, `cwd`, `hook_event_name`, `permission_mode`, `effort`, optional `agent_id`/`agent_type`) and writes JSON on stdout with exit 0.
- Context injection is `hookSpecificOutput.additionalContext` (JSON, exit 0).
  It is supported by SessionStart, UserPromptSubmit, PostToolUse, Stop, SubagentStop, and others.
  For SessionStart/UserPromptSubmit, raw stdout is also injected.
- A Stop-gate is `{"decision":"block","reason":"..."}
  ` on the Stop event.
  Exit 2 blocks with stderr as feedback (JSON ignored); other non-zero is non-blocking.
- Hook variables: `${CLAUDE_PROJECT_DIR}`, `${CLAUDE_PLUGIN_ROOT}`, `${CLAUDE_PLUGIN_DATA}` (and same-named env vars).
- Hook transport can be `command`, `http`, or `mcp_tool`.
  The manifold serves package-bins over HTTP, so a hook can POST to the running manifold instead of spawning node.
- Skills, slash commands, subagents, output styles, statusLine, MCP servers, LSP servers, and monitors can be bundled as a plugin (`.claude-plugin/marketplace.json`).

## Prior-art systems (do the same shape via hooks)

claude-mem, Continuous-Claude-v3, and contextstream all maintain cross-session memory through hooks: SessionStart injects prior context, UserPromptSubmit logs the prompt, PostToolUse compresses observations, Stop/SessionEnd writes a session summary, PreCompact saves a handoff.
This is the same pattern as the manifold's suit injection, operation ledger, and findings.

## Changes this implies for the repo

1. `inject-suit.mjs`: emit the `{"hookSpecificOutput":{...,"additionalContext":...}}
  ` JSON envelope instead of bare stdout.
2. Stop-gate: emit `{"decision":"block","reason":...}
  ` instead of exit-2.
3. Add a SessionEnd hook that settles a session summary and completes/hands off the session's potential work.
4. Add a PreCompact hook that calls `create-checkpoint`.
5. Put the gamification HUD in a `statusLine`, not in suit prose.
6. Package the harness as a Claude Code plugin.

## Sources

- Hooks reference: https://code.claude.com/docs/en/hooks
- Effective harnesses: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
- Plugins reference: https://code.claude.com/docs/en/plugins-reference
- claude-mem hooks: https://docs.claude-mem.ai/architecture/hooks
- Continuous-Claude-v3: https://github.com/parcadei/Continuous-Claude-v3
- contextstream: https://github.com/contextstream/claude-code
