---
name: stdio-mcp-server
description: An mcp specialized to speak the Model Context Protocol over stdio. The MCP server-form a Claude Code session connects to when launched against a repository whose .mcp.json names a stdio-transport server.
specializing: mcp
---

A **stdio-mcp-server** is an [mcp](../../mcp.md) whose wire transport is stdio.
The MCP specification admits two transports, stdio and HTTP; stdio is the one Claude Code uses when launching a server named in a project's `.mcp.json` config.
The server reads JSON-RPC requests from standard input and writes responses to standard output; the parent process (Claude Code) reads and writes those streams.

The 561 OS's running MCP server is a stdio-mcp-server.
It is instantiated by the [serving-a-stdio-mcp-server-to-a-claude-session-running-locally transformer](../../serving-a-stdio-mcp-server-to-a-claude-session-running-locally/) at session start, reads `561.md` for the active character's skill list, and stays running until the Claude Code session ends.
