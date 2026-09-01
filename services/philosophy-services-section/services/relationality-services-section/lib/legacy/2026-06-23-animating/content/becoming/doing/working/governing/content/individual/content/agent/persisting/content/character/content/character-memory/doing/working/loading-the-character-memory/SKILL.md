---
name: loading-the-character-memory
description: Mirrors the in-repo memories at prose/journals/memories into the auto-memory location and regenerates the auto-memory MEMORY.md index. Use as a SessionStart hook so the auto-memory system finds the memories where it expects to read them.
---

## Requirements

- Invocation from a Claude Code SessionStart hook (no matcher needed).
- CWD is the repository root (the standard hook invocation context).
- The in-repo memory directory `<cwd>/prose/journals/memories/` exists, with per-type subdirectories `feedback/`, `reference/`, `user/`, `project/` as applicable.

## Steps

1. Compute the project ID from CWD: `-<cwd>` with `/` replaced by `-`.
  This matches Claude Code's project-ID derivation.
2. Compute the auto-memory directory: `~/.claude/projects/<project-id>/memory/`.
  Create it if missing.
3. For each `<type>` in `feedback`, `reference`, `user`, `project`: walk `<cwd>/prose/journals/memories/<type>/*.md`.
  For each file:
   - Slug is the filename without `.md`.
   - Auto-memory filename is `<type>_<slug-with-hyphens-replaced-by-underscores>.md`.
   - Write the source file's content to `<auto-memory-dir>/<auto-memory-filename>` (overwrite).
   - Extract the frontmatter `description` field for the index entry.
4. Regenerate `<auto-memory-dir>/MEMORY.md`: one line per loaded memory, format `- [<Title>](<auto-memory-filename>) — <description>` where `<Title>` is the slug with hyphens replaced by spaces and words capitalized.
5. Exit 0.
  Print a one-line summary to stderr: `[load-the-character-memory] loaded N memories into <auto-memory-dir>`.

## Outcomes

- The auto-memory directory `~/.claude/projects/<project-id>/memory/` mirrors the in-repo memory.
- `MEMORY.md` in the auto-memory directory lists every loaded memory and points at the per-memory files.
- The in-repo memory is not modified.
- If the in-repo memory directory does not exist, exits 0 with no action.
