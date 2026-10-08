---
name: feedback_use-mcp-not-bash
description: Stop using bash to check crew status and dispatch work — use the MCP server tools instead
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: feedback_use-mcp-not-bash
---

Stop running ad hoc bash commands to check session status, run dispatch reports, or query events. The 561-datastore MCP server has tools for all of this: sessions_list, dispatch_report, run_command, channel, finance_report, etc.

**Why:** The captain noticed the first officer keeps doing manual bash checks instead of using the tools that were built for exactly this purpose. The MCP server IS the observation layer — using bash bypasses it.

**How to apply:** At session start, the MCP server loads. Use mcp__561-datastore__sessions_list instead of `mash-engine sessions`. Use mcp__561-datastore__dispatch_report instead of `node dispatch-work.js`. Use mcp__561-datastore__channel with channel="fleet" instead of grepping session status. If the MCP tool doesn't exist for something you need, add it to the server rather than falling back to bash.
