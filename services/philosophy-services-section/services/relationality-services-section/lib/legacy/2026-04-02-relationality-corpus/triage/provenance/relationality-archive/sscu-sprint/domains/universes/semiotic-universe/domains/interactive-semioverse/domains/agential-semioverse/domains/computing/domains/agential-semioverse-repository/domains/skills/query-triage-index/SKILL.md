---
name: query-triage-index
description: Query the triage index for files matching filters — enrichment level, discipline, content type, or triage status
---

Query the triage index for files matching the given filters.

## MCP tool

`mcp__asr__query_triage_index`

## Filter values

- **enrichment**: `none`, `minimal`, `partial`, `complete`
- **discipline**: any discipline name (e.g., `mathematics`, `technology`)
- **content_type**: any semiotic-markdown type (e.g., `term`, `concept`, `text`)
- **status**: triage-status value (e.g., `raw`, `classified`, `promotable`, `superseded`)

## Prerequisite

The triage index must exist at `triage/.triage-index.json`. If missing,
run `rebuild-triage-index` first.
