---

description: Pre-classify triage files by relevance to a focus using local LLM — reduces files the inference agent needs to read
name: mine-triage-relevance
version: [0, 1]
kind: operational
runtime: mcp
triggers:
  - "score triage relevance"
  - "pre-classify triage"
  - "relevance scan"
inputs:
  focus: string
  directory: string?
  threshold: number?
  limit: number?
  search_all: boolean?
outputs:
  count: number
  results: object[]
region:
  reads: ["content/triage/", "content/"]
  writes: []
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---
Pre-classify triage files by relevance to a focus topic.

## MCP tool

`mcp__asr__mine_triage_relevance`

## How it works

1. Reads the first ~500 words of each triage file
2. Sends to local ollama (qwen2.5:7b) for relevance scoring (0-3)
3. Applies quality penalties (slop directories get -2 penalty)
4. Returns files scoring >= threshold, sorted by relevance

## Quality metadata

Per-directory quality levels are defined in `triage/TRIAGE.md` and
hardcoded in `mine-triage-relevance.py`:

- **authored**: original writing by emsenn (no penalty)
- **curated**: collected/organized materials (no penalty)
- **imported**: brought from external sources (no penalty)
- **slop**: AI-generated content (-2 penalty)

## Relationship to mine-triage

This is the pre-classification step of the `mine-triage` skill. Use
this to identify which files are worth reading in full. The inference
agent then reads only the high-scoring files.
