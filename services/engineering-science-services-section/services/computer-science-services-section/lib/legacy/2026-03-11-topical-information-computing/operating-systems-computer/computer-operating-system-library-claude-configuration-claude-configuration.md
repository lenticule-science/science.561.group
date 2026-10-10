---
name: claude-configuration
description: The bundle of files Claude Code reads from a project root to determine which character is bound, which MCP server to launch, which hooks to fire on which lifecycle events, and which tool permissions to apply.
specializing: computer-operating-system
realizes-standard: claude-code-settings
---

A **claude-configuration** is the bundle of records under a project root that a Claude Code session reads at start to determine its runtime configuration:

- `.claude/settings.json` (and `.claude/settings.local.json`) — the canonical settings file.
  Carries the active permissions, the per-event hook configurations (SessionStart, Stop, PreToolUse, PostToolUse, …), environment variable overrides, and bookkeeping.
  The schema for this file is fixed by the published Claude Code settings convention.
- `.mcp.json` at the project root — the MCP server bindings.
  Carries the `mcpServers` map naming the binary, the arguments, and the environment variables for each MCP server to launch.
  The 561 OS uses a single binding here pointing to the active character.
- `CLAUDE.md` at the project root — the always-loaded project surface (per Claude Code's CLAUDE.md convention).
  The 561 OS uses this as the character's session-start brief.
- The `installing-a-character-as-a-claude-configuration` skill writes all three from a character record.

## Why claude-configuration is one structure rather than three

The three byte-level files (settings.json, .mcp.json, CLAUDE.md) jointly install the character; none is sufficient alone.
The math forces them to be modeled as one structure with three byte-level realizations because the installer skill must write all three atomically (or leave the configuration in a partially-installed state, a precondition-check failure).
The structure carries the joint identity; the JSON Schema validates the joint shape.

## Distinguishing predication-shape

- `installs-character(claude-configuration, character)` — the character the configuration binds.
- `settings-path(claude-configuration, posix-path)` — typically `.claude/settings.json`.
- `mcp-config-path(claude-configuration, posix-path)` — typically `.mcp.json`.
- `claude-md-path(claude-configuration, posix-path)` — typically `CLAUDE.md`.
- `permissions-allow(claude-configuration, [tool-pattern])` — the allowed tool list.
- `hook(claude-configuration, hook-config)` — one cell per registered hook (event → handler).
- `installed-at(claude-configuration, iso8601)` — when the installer wrote the files.

## Not synonymous with

- **Character** — the character is the persistent agent record.
  The claude-configuration is the per-host installation of that character for one Claude Code project root.
- **MCP server** — the MCP server is the runtime process; the claude-configuration includes the .mcp.json that launches it, but the configuration is the bundle, not the process.
