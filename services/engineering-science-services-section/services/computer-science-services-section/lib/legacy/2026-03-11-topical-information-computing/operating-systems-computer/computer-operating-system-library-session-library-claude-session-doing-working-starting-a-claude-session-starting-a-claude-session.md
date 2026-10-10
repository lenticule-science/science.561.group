---
name: starting a Claude session
description: The starting-a-claude-session skill — reads the active character's surface files at the repository root in lawful order and prints them concatenated to stdout for Claude Code's SessionStart hook to inject.
specializing: claude-session
closure-position: process
operation-kind: query
hooks:
  - event: SessionStart
    command: node library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/session/library/claude-session/doing/working/starting-a-claude-session/scripts/start-a-claude-session.mjs
    description: Reads SOUL.md, identity.md, MEMORY.md, HEARTBEAT.md, DREAMS.md, TOOLS.md, USER.md, AGENTS.md at the repository root in lawful order and prints the concatenated markdown to stdout so Claude Code injects it into the session prompt.
contains:
  - SKILL.md
  - scripts/
composes: []
input-schema:
  type: object
  properties:
    root:
      type: string
      description: Override repository root. Default CWD; absolute paths honored.
  required: []
---

The skill record for `starting-a-claude-session`.
The operational body is in [`SKILL.md`](SKILL.md).

This skill is the sole `SessionStart` hook command for the installed character.
The agent `starter-of-a-claude-session` carries the hook cell that points Claude Code at this skill's script.

The injection order — SOUL, identity, MEMORY, HEARTBEAT, DREAMS, TOOLS, USER, AGENTS — is fixed at the script level rather than configurable, because it is the lawful order per [`code/structures/claude-session.md`](../../../../../code/structures/claude-session.md).
Changing the order would change what is mathematically true about the session's context; that change is a substrate edit (the `claude-session` structure record), not a parameter.
