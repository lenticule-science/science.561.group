---
type: task
slug: "task:expose-fars-mcp-over-http"
title: "Expose `fars mcp` (verbs + skills) over HTTP so the Replit Integrations pane can connect"
status: needs-human
work-type: engineering
of-goal: null
priority: 4
estimated-effort-hours: 4
requires-capabilities:
  - compose
  - validate
requires-skills:
  - write-python
  - read-python
touches:
  - "operations/engineering/fars/src/fars/cli/mcp.py"
  - ".replit"
  - "replit.md"
depends-on: []
prompted-by: "decision:agentic-coordination-gap-analysis"
owned-by-office: "office:engineering"
assigned-to: null
---

# Task: expose `fars mcp` (verbs + skills) over HTTP

## Description

The Replit Integrations pane only accepts HTTP / streamable-http MCP servers (the configuration form wants a `baseUrl` plus optional auth headers; there is no field for a stdio command).
The current `fars mcp` runs over stdio only, which works for Claude Desktop / Cursor / other MCP-aware desktop clients but not for the Replit chat session that emsenn is using.
This blocks visibility of the substrate **and** the engineering skill packs simultaneously: the existing stdio MCP server already advertises **118 tools** (`corpus_<verb>` for ~38 verbs + `skill_<slug>` for ~80 skills), but none of them are reachable from the Replit agent until an HTTP transport exists.
This is the closure for the "MCP visibility" addendum at the bottom of [decision:agentic-coordination-gap-analysis](../../decisions/agentic-coordination-gap-analysis.md).

## Acceptance criteria

1. `fars mcp --transport http --port <N>` launches a streamable-http MCP server that exposes the **same** tool set as the existing stdio mode — both `corpus_<verb>` and `skill_<slug>` tools (verified by counting `tools/list` results against `fars list-verbs --json` + `fars skills list --json`).
2. A workflow named `fars-mcp-http` is registered in the Replit environment so the server starts on workspace open.
3. The server URL is reachable via the `$REPLIT_DEV_DOMAIN` proxy (verified with a `curl /health` round-trip).
4. `replit.md` documents the install procedure: copy the dev URL into the Replit Integrations pane, add the FARS server, accept the security scan.
  Documentation explicitly notes that connecting exposes both verbs and skills.
5. A new ai-agent personnel record (or extension of an existing one) is opened under `operations/command/group/personnel/` so `fars next --as personnel:<slug>` resolves to a coding-capable agent without falling back to `.fars/config.toml`.

## Provenance

This task closes the deferred follow-up explicitly listed in [decision:agentic-coordination-gap-analysis](../../decisions/agentic-coordination-gap-analysis.md) ("Replit visibility note").
It is also the first seed task of the work-orchestration hierarchy under `project:replit-sprint`, exercising the `type: task` record shape end-to-end so that `fars next` returns a real result during the demo of `decision:agentic-coordination-gap-analysis`.

## Notes

- The existing MCP server uses the `mcp` Python package's stdio transport.
  The same package supports streamable-http — the change is small (~60 lines: argparse flag, transport selection, port binding).
- The HTTP transport must respect Replit's host-restriction conventions (allow all hosts or trust `$REPLIT_DEV_DOMAIN`).
- Authentication: for the first pass, accept a single shared bearer token from a `FARS_MCP_TOKEN` environment variable; record it in the integrations pane as a custom header.
  (Per the environment-secrets skill — request the secret from the user, do not hand-edit `.env`.)
