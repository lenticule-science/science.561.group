---
name: claude-code
description: Anthropic's Claude Code CLI — a development-environment operating system for AI-assisted coding sessions. Provides session lifecycle hooks, an MCP client surface, an auto-memory subsystem, and a tool-use protocol.
specializing: operating-system
---

**Claude Code** is Anthropic's CLI tool that runs Claude as an agent in a host directory, hooking into session lifecycle events (SessionStart, Stop, PreToolUse, PostToolUse), exposing an MCP client surface that loads `.mcp.json`, maintaining an auto-memory subsystem at the user's home directory, and orchestrating tool use through a registered tool catalog. Specializes [operating-system](../../operating-system.md) as a development-environment OS — the runtime in which 561 sessions execute. The 561 OS interops with Claude Code by installing hooks via `.claude/settings.json`, registering MCP tools via `.mcp.json`, and rendering a project `CLAUDE.md`. Sub-structures under [library/](library/) name specific Claude Code events and subsystems.
