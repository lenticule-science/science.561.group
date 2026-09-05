---
name: mcp-quick-reference
date-created: 2026-04-04
description: One-line descriptions of all 561-datastore MCP tools available to Claude Code sessions
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---


Server: `561-datastore` v0.1.0
Source: `operations/engineering/fars/mcp-servers/datastore/server.js`
Config: `.mcp.json` (stdio transport)

## Available Tools

| Tool | Description |
|------|-------------|
| `graph_search` | Full-text search across knowledge graph entities (titles, descriptions, IDs, names). Returns up to 30 matches with type and path. |
| `graph_entity` | Retrieve all attributes for a single entity by numeric ID. Shows full detail for any knowledge graph entity. |
| `graph_stats` | Summary statistics for both knowledge graph and operations graph — entity counts, attribute counts, type distribution. |
| `graph_query_attr` | Find entities matching an exact attribute-value pair. Searches library, ops, or both graphs. |
| `sessions_list` | List all agent sessions from the operations graph, sorted newest first, with state and task summary. |
| `ledger_summary` | Double-entry operational ledger — account balances and the 10 most recent transactions. |
| `channel` | MUD-style activity feed filtered by audience: `bridge` (all activity), `fleet` (sessions), `engineering` (task events), `failures` (failed sessions/tasks). |

## Data Sources

- **Knowledge graph**: `knowledge-graph.json` (root) — 11,366 entities from library + operations frontmatter
- **Operations graph**: `operations/engineering/records/operations-graph.json` — 51 entities (41 sessions, 8 events, 2 transactions), 609 facts

## Usage Notes

- Both graphs reload on every tool call (always fresh data)
- Regenerate knowledge graph: `node operations/engineering/fars/agentic/tools/generate-library-graph.js`
- Entity IDs are numeric, assigned at graph generation time — they change when the graph is regenerated
- `graph_query_attr` is the most precise query tool; `graph_search` is best for exploration
- `channel` with `bridge` gives the broadest operational picture; `failures` is useful for debugging
