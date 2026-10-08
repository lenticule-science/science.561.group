---
name: loading-the-memories
description: Set-level mirror morphism. Source — Set(MemoryCell), the in-repo memory cell-set at `<$character>/doing/working/journaling/library/memory/library/<kind>/*.md`. Target — AutoMemoryMirror, the Claude Code auto-memory directory at `~/.claude/projects/<project-id>/memory/` populated with one mirror file per cell plus a regenerated MEMORY.md index. Fires at Claude Code SessionStart.
specializing: memory
title: loading-the-memories
---

The transformer's body is the Node ESM script at [scripts/loading-the-memories.mjs](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/archive/scripts/loading-the-memories.mjs); the Claude Code Skills surface is at [SKILL.md](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/archive/SKILL.md). Sibling transformers `loading-a-memory` (atomic per-cell) and `loading-the-memory` (structure-level one-shot) are queued but not built — the SessionStart hook only requires the set-level form.

## Predication-shape

- `reads-from(loading-the-memories, in-repo-memory-cells)` — the authoritative cells under `<$character>/doing/working/journaling/library/memory/library/<kind>/`.
- `writes-to(loading-the-memories, auto-memory-mirror)` — `~/.claude/projects/<project-id>/memory/`.
- `regenerates(loading-the-memories, MEMORY-md-index)` — one line per loaded memory, format `- [<Title>](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/archive/<auto-memory-filename>) — <description>`.
- `idempotent(loading-the-memories, true)` — running twice with no source changes yields the same auto-memory state.
- `fires-at(loading-the-memories, SessionStart)` — the Claude Code lifecycle event the hook is registered for.
