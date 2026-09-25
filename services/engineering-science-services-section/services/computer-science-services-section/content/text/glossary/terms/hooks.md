---
part-of:
  - claude-code

name: "Hooks"
description: "Shell commands that Claude Code executes at defined points in the tool-call lifecycle — deterministic automation outside the model's reasoning loop."
domain: claude-code
extends: event-driven-callback
requires: claude-code
acts-on: tool-call
governed-by: settings-json
enables:
  - validation
  - audit-logging
  - notification-routing
contrasts-with: claude-md
date-created: 2026-03-30
aliases:
  - Hooks
  - Claude Code Hooks
  - PreToolUse
  - PostToolUse
references:
  - id: anthropic-hooks-docs
    type: document
    title: Hooks reference
    author:
      - literal: Anthropic
    container-title: Claude Code Docs
    issued:
      - year: 2025
    URL: https://docs.anthropic.com/en/docs/claude-code/hooks
---

Hooks are shell commands that [Claude Code](claude-code.md) executes at defined points in the tool-call lifecycle. They run deterministically, outside the model's reasoning loop — the model does not decide whether to run a hook, cannot suppress a hook, and receives hook output as user-level feedback. This makes hooks the appropriate mechanism for safety guardrails, compliance logging, and automated workflows that must execute regardless of what the model decides.

The contrast with [CLAUDE.md](claude-md.md) is definitional: CLAUDE.md shapes model reasoning (advisory, probabilistic), while hooks execute shell commands on events (deterministic, mandatory).

Three event types are available:

- **PreToolUse** — fires after the model generates tool parameters but before execution. If the hook exits non-zero, the tool call is blocked and the error feeds back to the model. Use: rejecting dangerous commands, modifying parameters, gate-checking.
- **PostToolUse** — fires immediately after a tool completes successfully. Receives tool name, parameters, and result. Use: formatting output, triggering downstream actions, audit logging.
- **Notification** — fires when Claude Code needs user permission for a tool call or the input has been idle for 60+ seconds. Use: desktop alerts, Slack messages, custom routing.

PreToolUse and PostToolUse hooks use **matchers** — case-sensitive strings matched against tool names (e.g., `Bash`, `Edit`, `Write`). A hook with no matcher fires on every tool call of that event type.

Hooks are configured in `settings.json` at three scopes: user-level (`~/.claude/settings.json`, all projects), project-level (`.claude/settings.json`, version-controlled), and project-local (`.claude/settings.local.json`, gitignored). They are not configured in CLAUDE.md — they belong to the runtime, not the prompt.
