---
name: getting the heartbeat
description: The getting-the-heartbeat skill — reads HEARTBEAT.md at the repository root and returns its content.
specializing: heartbeat
closure-position: process
operation-kind: query
contains:
  - SKILL.md
  - scripts/
composes: []
input-schema:
  type: object
  properties:
    path:
      type: string
      description: Override path to the heartbeat file. Default `HEARTBEAT.md` relative to CWD; absolute paths honored.
  required: []
title: getting the heartbeat
---

The skill record for `getting-the-heartbeat`. The operational body is in [`SKILL.md`](getting-the-heartbeat-skill.md).

This skill underwrites the `SessionStart` hook declared on `getter-of-the-heartbeat`: at session start the hook runs the skill's script directly, prints the heartbeat content to stdout, and Claude Code injects it into the session prompt. The skill is also MCP-invocable so a session can re-read the heartbeat mid-session after the principal edits it.
