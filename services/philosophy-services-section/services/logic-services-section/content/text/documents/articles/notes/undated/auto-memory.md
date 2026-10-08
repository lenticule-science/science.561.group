---
name: auto-memory
description: Claude Code's auto-memory subsystem — a persistent key/value store at $HOME/.claude/projects/<project>/memory/ that survives across sessions and is loaded into the session context at start.
specializing: claude-code

title: auto-memory
---

**Auto-memory** is Claude Code's persistent memory feature: a directory tree at `$HOME/.claude/projects/<project>/memory/` populated with type-stratified entries (user/feedback/project/reference) and indexed by a top-level `MEMORY.md`. Memory entries survive across sessions and are loaded into the session context at SessionStart. The 561 OS's policy is that memory writes go to the in-repo location (`prose/journals/memories/`); the auto-memory directory is treated as a derived mirror, kept in sync by [loading-the-character-memory](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/library/object/library/thing/library/system/library/agentic-systems/library/character/library/character-memory/doing/working/loading-the-character-memory) at session start. Specializes [claude-code](claude-code.md).
