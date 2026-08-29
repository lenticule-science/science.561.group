---
name: memory-write
description: A Write/Edit/MultiEdit tool call whose target path is under the character's auto-memory location. The PreToolUse-fireable event the routing-a-memory-write skill intercepts.
specializing: hook
runtime: claude-code
fires-on-event-name: PreToolUse
filters-by-target: under-auto-memory-location
---

A **memory-write** is a Write, Edit, or MultiEdit tool call whose target path is under `~/.claude/projects/<project-id>/memory/`. Claude Code's built-in auto-memory system produces such writes; the file at the target is meant to be loaded into the next session's prompt.

In the 561 repository, memory writes are routed: the in-repo location at `prose/journals/memory/<type>/<slug>.md` is the authoritative copy (under the resource-file rules and tracked in git), and the auto-memory location is populated from there at session start by the loading-the-character-memory skill.

A memory write to the auto-memory location is blocked by the routing-a-memory-write skill (installed as a PreToolUse hook) and redirected to the in-repo location.

## Characteristic predication-shape

- `is-tool-call-of(memory-write, {Write | Edit | MultiEdit})` — which Claude Code tool call triggered the event.
- `targets(memory-write, auto-memory-path)` — the auto-memory path the write was directed at.
- `should-route-to(memory-write, in-repo-path)` — the in-repo authoritative path the router redirects to.
- `decides(memory-write, {permit | block-with-routing})` — the two outcomes the router emits.
