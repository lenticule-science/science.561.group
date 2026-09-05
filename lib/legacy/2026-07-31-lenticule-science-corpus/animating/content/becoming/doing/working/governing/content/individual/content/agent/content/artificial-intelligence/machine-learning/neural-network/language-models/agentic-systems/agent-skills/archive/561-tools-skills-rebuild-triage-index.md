---

description: Rebuild the triage index from scratch — run after enrichment or classification changes
name: rebuild-triage-index
version: [0, 1]
runtime: mcp
triggers:
  - "rebuild triage index"
  - "reindex triage"
inputs: {}
outputs:
  success: boolean
  stats: object
region:
  reads: ["content/triage/"]
  writes: ["content/triage/"]
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---
Rebuild the triage index from scratch.

## MCP tool

`mcp__asr__rebuild_triage_index`

## When to use

Run after any batch enrichment, classification, or file reorganization
in `triage/`. The index is a cached JSON file at
`triage/.triage-index.json` that enables fast queries via
`query-triage-index`.
