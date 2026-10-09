---
name: getting-the-name-of-this-thing
description: Returns the canonical name and kind of the entity the running 561 MCP server is bound to (the session's agent or character). Use when a skill needs to know who it's running on behalf of — for self-introspection, composition into other skills' arguments, or whoami-style debugging.
title: getting-the-name-of-this-thing
---

## Requirements

- Invocation context: the running 561 MCP server (the "this thing" in the skill name). The server is spawned with one of `AGENT_NAME` or `CHARACTER_NAME` in its environment.

## Steps

1. Read `process.env.CHARACTER_NAME`. If set, return `{name: basename(CHARACTER_NAME), kind: "character"}` — handles both slug and path-form character refs by taking the basename.
2. Otherwise read `process.env.AGENT_NAME`. If set, return `{name: AGENT_NAME, kind: "agent"}`.
3. If neither is set (no MCP server context), return `{name: null, kind: null}`.

## Outcomes

- The caller receives `{name, kind}` identifying the running server's bound entity.
- The skill does not read any files; it reports what the server was spawned with.
- A subsequent install (e.g., via `installing-a-character-as-a-claude-configuration`) does not change this skill's return value within the current session — Claude Code re-reads `.mcp.json` only on session restart or explicit MCP reconnect.
