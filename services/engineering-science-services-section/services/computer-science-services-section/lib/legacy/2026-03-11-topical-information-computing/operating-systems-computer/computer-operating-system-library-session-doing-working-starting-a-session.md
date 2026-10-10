---
name: starting-a-session
description: Resolve an agent's scope and start a Claude Code session with the matching MCP surface.
---

This skill is the session ingress.
Run from the shell, not from inside a session.

## How to start a session

```
make start-session-with-agent AGENT=$name
```

The Makefile target invokes `scripts/run.mjs --agent=$name`, which: 1.
Imports `install-config.mjs` and writes `.mcp.json` + regenerates `CLAUDE.md` for the named agent.
2.
Execs `claude` in the current working directory, inheriting the parent environment.

The launched Claude Code session reads the freshly-written `.mcp.json`, spawns the `561` MCP server (`serving-skills-over-mcp/scripts/serve.mjs`), and presents the in-scope skills as MCP tools.

## Smoke-test procedure (manual; also serves as regression test)

1. From the repo root: `make start-session-with-agent AGENT=smoke-test`.
2. Confirm `.mcp.json` was written at the repo root with `AGENT_NAME: "smoke-test"`.
3. Confirm `CLAUDE.md` was regenerated and lists `getting-the-current-time` as the only in-scope skill.
4. Inside the spawned Claude session, run `/mcp` and confirm the `561` server is connected.
5. Ask Claude to call the `getting-the-current-time` tool.
  Confirm the result is `{ ts: "<some ISO 8601 string>" }`.
6. Exit the session.
  Inspect `code/logs/tool-uses/$(date +%Y-%m-%d).jsonl` and confirm the call was logged with all seven fields.

## Programmatic smoke-test (no Claude Code required)

`scripts/probe.mjs` (if present) spawns `serve.mjs` over stdio and exercises `tools/list` and `tools/call` directly.
Use this as the harness-level regression check.
