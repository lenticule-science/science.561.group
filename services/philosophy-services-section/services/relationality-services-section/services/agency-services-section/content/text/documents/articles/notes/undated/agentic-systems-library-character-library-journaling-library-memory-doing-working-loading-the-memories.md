---
name: loading-the-memories
description: Mirrors the in-repo memories at <$character>/doing/working/journaling/library/memory/library/<kind>/ into the Claude Code auto-memory location at ~/.claude/projects/<id>/memory/ and regenerates the auto-memory MEMORY.md index. Runs as a SessionStart hook.
title: loading-the-memories
---

## Requirements

- Invocation from a Claude Code SessionStart hook (no matcher needed).
- CWD is the repository root (the standard hook invocation context). At this root the character is "561" per `561.md`, so the in-repo memory directory is `doing/working/journaling/library/memory/library/`.
- The in-repo memory directory may or may not exist; if absent, the script exits 0 with no action.

## Steps

1. Compute the project ID from CWD: `-<cwd>` with `/` replaced by `-`. This matches Claude Code's project-ID derivation.
2. Compute the auto-memory directory: `~/.claude/projects/<project-id>/memory/`. Create it if missing.
3. For each `<kind>` in `feedback`, `reference`, `user`, `project`: walk `<cwd>/doing/working/journaling/library/memory/library/<kind>/*.md`. For each file:
   - Slug is the filename without `.md`.
   - Auto-memory filename is `<kind>_<slug-with-hyphens-replaced-by-underscores>.md`.
   - Write the source file's content to `<auto-memory-dir>/<auto-memory-filename>` (overwrite).
   - Extract the frontmatter `description` field for the index entry.
4. Regenerate `<auto-memory-dir>/MEMORY.md`: one line per loaded memory, format `- [<Title>](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/archive/<auto-memory-filename>) — <description>` where `<Title>` is the slug with hyphens replaced by spaces and words capitalized.
5. Exit 0. Print a one-line summary to stderr: `[loading-the-memories] loaded N memories into <auto-memory-dir>`.

## Outcomes

- The auto-memory directory `~/.claude/projects/<project-id>/memory/` mirrors the in-repo memory.
- `MEMORY.md` in the auto-memory directory lists every loaded memory.
- The in-repo memory is not modified.
- If the in-repo memory directory does not exist, exits 0 with no action.
