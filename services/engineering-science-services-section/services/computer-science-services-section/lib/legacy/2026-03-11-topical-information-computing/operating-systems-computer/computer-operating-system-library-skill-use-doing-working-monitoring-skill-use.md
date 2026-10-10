---
name: monitoring-skill-use
description: Observes in-session Skill tool invocations on PreToolUse and PostToolUse to maintain a volatile view of current skill usage. Use when reactive observation of skill invocations is needed beyond durable logging.
---

## Requirements

- Hook scripts wired into `.claude/settings.json::hooks` by `composing-a-claude-config`.

## Steps

1. `scripts/pre.mjs` fires on `PreToolUse` with matcher `Skill` as an extension point for in-flight observation.
  Currently a no-op stub.
2. `scripts/post.mjs` fires on `PostToolUse` with matcher `Skill` as an extension point for post-call observation.
  Currently a no-op stub.
3. Both scripts read stdin to avoid blocking the parent and exit 0.

## Outcomes

- The wiring is in place; concrete monitoring logic can be added by editing the two scripts without further configuration changes.
- Distinct from `logging-skill-use`, which produces durable EAVT records; monitoring is for volatile or reactive observation.
