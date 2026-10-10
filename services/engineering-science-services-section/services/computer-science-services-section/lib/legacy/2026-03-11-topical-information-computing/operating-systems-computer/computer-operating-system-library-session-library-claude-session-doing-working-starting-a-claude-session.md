---
name: starting-a-claude-session
description: Reads the surface files at the repository root in order (SOUL, MEMORY, HEARTBEAT, DREAMS, TOOLS, USER, AGENTS) and prints them to stdout for Claude Code's SessionStart hook. Use as the SessionStart hook command.
---

## Requirements

- The surface files are at the repository root (hand-authored, or copied there by `installing-a-character-as-a-claude-configuration`).
  The script skips any file that's missing.
- Optional `root` argument (default CWD; absolute paths honored).

## Steps

1. Resolve the root: `root` from argument if given, else CWD.
2. For each file in this order — `SOUL.md`, `MEMORY.md`, `HEARTBEAT.md`, `DREAMS.md`, `TOOLS.md`, `USER.md`, `AGENTS.md` — read `<root>/<file>` if it exists.
3. Concatenate the files into a single markdown document.
  Add a divider before each section naming the source file.
4. Return `{ injected, content }` — the list of files read (in order) and the concatenated markdown.

## Outcomes

- Returns `{ injected, content }`; `content` is the concatenated markdown.
- Run as a CLI, prints `content` to stdout.
  Suitable as a SessionStart hook command.
- Missing surface files are skipped; `injected` lists only the files that were present.
- Exits 0 even when no surface files are found.
  The session opens without injected context.
