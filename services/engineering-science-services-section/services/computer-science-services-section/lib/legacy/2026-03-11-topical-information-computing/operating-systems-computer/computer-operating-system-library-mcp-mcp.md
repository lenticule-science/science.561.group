---
name: mcp
description: A long-running server speaking the Model Context Protocol (JSON-RPC 2.0 over stdio or HTTP) that exposes the root 561 character surface's skills:G generator set as the tool surface visible to a Claude session.
specializing: computer-operating-system
realizes-standard: model-context-protocol
exposes: skill-generator-set
---

An **mcp** instance is a long-running server bound to the root 561 character surface at `561.md`.
It speaks the Model Context Protocol (JSON-RPC 2.0 over stdio or HTTP) and exposes the root character's `skills:` cell — the generator set $G$ of the character's capability — as the list of MCP tools the connecting Claude session sees.

## What is and is not exposed

Per [skill.md:52–54](../../../agentic-systems/library/skill/skill.md), a character's capability is the closure $\mathrm{cl}(G)$ of its generator set $G$ under the `composes` relation.
The MCP server exposes $G$ (the directly-invocable surface), not $\mathrm{cl}(G)$.
Helper skills reached only through transitive composition stay off the tool surface and are invoked by the parent skill's script.
The MCP server enforces this projection — its tool-list response includes only the slugs the character has named as $G$.

The harness validates the composition chains at startup before binding: if any skill in $G$ has a `composes` chain referencing an undefined skill, the server refuses to start.

## Wire layer

Per the published MCP specification (Anthropic, 2024), the wire format is JSON-RPC 2.0.
The 561 OS's mcp instance runs as a Node ESM process started by Claude Code per the repository-root `.mcp.json` config.
The binding reads the root `561.md` character surface directly.
Tool calls arrive as JSON-RPC `tools/call` requests; the server dispatches each to the named skill's body or returns the named skill's `SKILL.md` procedure when no unambiguous script body is declared.

## Distinguishing predication-shape

- `bound-to(mcp, 561)` — the root character surface whose skills:G is exposed.
- `transport(mcp, {stdio | http})` — wire transport in use.
- `exposes-skill(mcp, skill)` — one cell per skill in $G$.
  Sum equals the character's `skills:` cell.
- `started-at(mcp, iso8601)` and `pid(mcp, integer)` — runtime cells for the active server.
- `mcp-config-path(mcp, posix-path)` — path to the .mcp.json the server was launched from.

## Not synonymous with

- **Skill** — a skill is the categorical morphism record; the MCP server exposes skills as tools but is not itself a skill.
- **Tool** — a tool is the session-visible projection of a skill across the MCP boundary.
  The MCP server is the projector; the tool is its image.
