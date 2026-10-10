---
name: starting-a-session-with-character
description: Opens an interactive Claude Code session in a host directory using a named character whose configuration has already been installed there. Use when starting work as a character that lives in one repo and operating in a different host directory as that character.
---

## Requirements

- A `character` argument — the canonical character name (the basename of `<character>/<character>.md` under the source repo's `doing/governing/characters/`).
- A `host` argument — the directory to start the session in.
  May differ from the directory the character record lives in.
- The host directory already has the character installed: `.mcp.json` names the 561 MCP server with `env.
  CHARACTER_NAME = <character>`, and `CLAUDE.md` carries the generated character block.
  The byte-level install is the job of `installing-a-character-as-a-claude-configuration`; this skill assumes the install is in place.
- The `claude` CLI is on `PATH`.

## Steps

1. Confirm `<host>/.mcp.json` exists and its `mcpServers.
  561.env.
  CHARACTER_NAME` equals the `character` argument.
  If absent or mismatched, refuse and direct the caller to run `installing-a-character-as-a-claude-configuration` first.
2. Confirm `<host>/CLAUDE.md` exists.
  If absent, refuse with the same install pointer.
3. `chdir` to the host directory.
4. `exec` the `claude` CLI in the host directory with the parent environment inherited.
  The session opens; Claude Code reads `.mcp.json`, spawns `serve.mjs` with `CHARACTER_NAME` set, and the 561 MCP server resolves the character's `skills:` list into the registered tool surface.

## Outcomes

- `claude` is running in `<host>` with the 561 MCP server connected.
- The registered MCP tool surface is exactly the character's `skills:` generator set; helpers reached through `composes:` are validated but not registered.
- Tool calls in this session leave witnesses in `<source-repo>/code/logs/tool-uses/<YYYY-MM-DD>.jsonl` (via the server's appendToolUseLog call, anchored at the source-repo root because that's where `serve.mjs` was spawned).
- If the host directory was not installed, no session was started and the caller saw a clear pointer to the installer skill.
