---
name: routing a claude stop
description: Blocks a Claude Code Stop event when today's per-turn diary entry has not yet been appended for the current turn.
specializing: claude-stop
closure-position: process
operation-kind: guard
hooks:
  - event: Stop
    command: node library/object/library/thing/library/system/library/operating-system/library/claude-code/library/claude-stop/doing/working/routing-a-claude-stop/scripts/route-a-claude-stop.mjs
    description: Permits or blocks a Stop event based on whether today's diary file carries an entry timestamped after the most recent user prompt.
---

Body in [`SKILL.md`](SKILL.md).

Runs as a Claude Code `Stop` hook. The hook is the enforcement mechanism for the per-turn diary practice — the writing itself is done by [`writing-a-diary-entry`](../writing-a-diary-entry/SKILL.md), which the block instruction names as the tool to call.

The hook reasons over the session transcript and today's diary file directly; it keeps no state of its own between invocations, so its decision is a pure function of those two artifacts. The `stop_hook_active` flag from Claude Code's Stop payload is honored as the loop-breaker: once a block has fired and Claude has continued, a subsequent Stop is permitted regardless.
