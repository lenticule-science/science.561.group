---
name: claude-session-running-locally
description: A claude-session whose runtime process is a Claude Code instance on the operator's own machine. Distinguished from cloud-hosted sessions, remote-tunneled sessions, and other claude-session runtimes the corpus may admit.
specializing: claude-session
---

A **claude-session-running-locally** is a [claude-session](../../claude-session.md) where the Claude Code process is running on the operator's local machine, reading the repository directly from the local filesystem, with the MCP server launched as a local subprocess over stdio.

The 561 OS's daily-driver session is a claude-session-running-locally.
The MCP server it connects to is launched via the [serving-a-stdio-mcp-server-to-a-claude-session-running-locally transformer](../../../../../mcp/doing/working/serving-a-stdio-mcp-server-to-a-claude-session-running-locally/), which the operator-installed `.mcp.json` registers as a stdio subprocess.

Other claude-session sub-kinds will exist when the OS admits remote or cloud-hosted Claude Code runtimes; their MCP-server-side morphisms will differ accordingly.
