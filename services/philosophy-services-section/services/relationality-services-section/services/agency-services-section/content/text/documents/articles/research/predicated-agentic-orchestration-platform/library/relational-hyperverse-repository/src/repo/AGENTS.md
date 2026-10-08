---
title: src/repo/
description: Markdown + YAML runbooks + Python.
---
# src/repo/

The **relational-repository** engine.

Markdown + YAML runbooks + Python.
Runs the MCP server that exposes repository content and executes runbooks for agents.

## Stack

- Python 3.12
- FastMCP (MCP server)
- SQLite (read cache — loaded from markdown on startup)
- YAML runbook executor (no LLM required for process-type runbooks)

## Structure (planned)

```
src/repo/
  loader.py          # markdown → SQLite
  serializer.py      # SQLite → markdown (flush)
  runbook_executor.py
  mcp_server.py
  db.py
  models/
  paths.py
```

Currently lives at `src/engine/` — migration tracked in src/PLANS.md.
