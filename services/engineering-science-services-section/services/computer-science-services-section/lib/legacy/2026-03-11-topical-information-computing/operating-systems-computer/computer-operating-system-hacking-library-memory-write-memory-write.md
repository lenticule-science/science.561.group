---
name: memory write
description: A Write/Edit/MultiEdit tool call whose target path is under the character's auto-memory location.
---

A memory write is a Write, Edit, or MultiEdit tool call whose target path is under `~/.claude/projects/<project-id>/memory/`.
Claude Code's built-in auto-memory system produces such writes; the file at the target is meant to be loaded into the next session's prompt.

In the 561 repository, memory writes are routed: the in-repo location at `prose/journals/memory/<type>/<slug>.md` is the authoritative copy (under the resource-file rules and tracked in git), and the auto-memory location is populated from there at session start by [`loading-the-character-memory`](../../library/object/library/thing/library/system/library/agentic-systems/library/character/library/character-memory/doing/working/loading-the-character-memory/SKILL.md).

A memory write to the auto-memory location is blocked by [`routing-a-memory-write`](../../library/object/library/thing/library/system/library/operating-system/library/claude-code/library/auto-memory/library/memory-write/doing/working/routing-a-memory-write/SKILL.md) and redirected to the in-repo location.
