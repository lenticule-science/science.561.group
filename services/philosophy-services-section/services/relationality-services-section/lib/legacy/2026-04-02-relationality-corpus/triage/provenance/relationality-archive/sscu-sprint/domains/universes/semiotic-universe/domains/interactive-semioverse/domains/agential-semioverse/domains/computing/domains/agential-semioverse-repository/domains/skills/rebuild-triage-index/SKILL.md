---
name: rebuild-triage-index
description: Rebuild the triage index from scratch — run after enrichment or classification changes
---

Rebuild the triage index from scratch.

## MCP tool

`mcp__asr__rebuild_triage_index`

## When to use

Run after any batch enrichment, classification, or file reorganization
in `triage/`. The index is a cached JSON file at
`triage/.triage-index.json` that enables fast queries via
`query-triage-index`.
