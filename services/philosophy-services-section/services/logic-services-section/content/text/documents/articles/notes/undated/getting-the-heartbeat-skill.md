---
name: getting-the-heartbeat
description: Reads HEARTBEAT.md at the repository root and returns its content. Use at session start to surface the potential character's standing-orientation checklist, or mid-session to re-read it.
title: getting-the-heartbeat
---

## Requirements

- A file at `HEARTBEAT.md` at the repository root (typically rendered there by `installing-a-character-as-a-claude-configuration` from the potential character's `doing/governing/characters/<slug>/HEARTBEAT.md`).
- Optionally, a `path` argument overriding the location (default: `HEARTBEAT.md` relative to CWD; absolute paths honored).

## Steps

1. Resolve the path: `path` from the argument if given, else `HEARTBEAT.md` relative to CWD.
2. Read the file as UTF-8.
3. Return `{ path, content }` where `path` is the resolved path and `content` is the file's full text.

## Outcomes

- The skill returns `{ path, content }` with the file's full text on success.
- The skill errors (no return) if the file does not exist at the resolved path.
