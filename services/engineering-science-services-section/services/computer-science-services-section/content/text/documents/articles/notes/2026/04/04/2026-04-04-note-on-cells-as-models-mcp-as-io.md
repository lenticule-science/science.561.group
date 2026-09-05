---
title: Cells as Models and MCP as Universal I/O
description: Establishes cells as deterministic algebraic models and proposes MCP as a unified interface for accessing diverse model types within the system.
date-created: 2026-04-04
type: note
science-owner: computer-science-services-section
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
name: cells-as-models-mcp-as-io
keywords:
  - cells-as-models
  - mcp-universal-io
  - model-spectrum
  - algebraic-inference
  - sheaf-theory
specialization: idea
serves: endeavor-resource-planning
relates-to:
  - mcp-as-system-api
  - primitive-hierarchy
  - relational-architecture-grounding
  - dont-flatten-the-tower
---

## Captain's words (2026-04-04)

> MCP is like, the de facto I/O for anything we need, even internal systems, because that's where so much agentic stuff is going. You can see that with ECC2 but they're not really able to do it without fragile shit that we can avoid because of our better rigor.

> We haven't realized it but in some ways we have a LOT of models, like, cells are basically models, with just very limited "inference" that relies entirely on their algebra.

> Don't forget: FARS Obsidian plugin, local models like ollama.

## Cells as models

A cell (CDS) has the exact signature of a model:

```
apply : (CDS_cell, RTL_judgment) → Accept(canonical_judgment, refined_cds) | Reject(error)
```

Input → processing → output. The "inference" is deterministic algebraic closure:
- No hallucination (closure is exact or it rejects)
- No drift (same input always gives same output — deterministic)
- No training needed (the algebra IS the knowledge)
- Auditable (repair log records every step)

Every entity file with frontmatter validation is a micro-cell. When the harness runs `auto-record-events.js` and checks the state machine, that's CCE apply on a task-cell. When `compose()` merges two graphs, that's CCE merge. We already have ~11,000 cells. They're just very simple ones (single-attribute fibers).

## The model spectrum

| Model type | Inference | Accuracy | Cost | Example |
|-----------|-----------|----------|------|---------|
| Cell (algebraic) | Deterministic closure | Exact | ~Free | Frontmatter validation, graph queries |
| Rule engine | Forward chaining | Exact within rules | Cheap | State machine, consistency checks |
| Local LLM (ollama) | Statistical | Approximate | ~Free after install | Draft text, classification, triage |
| Cloud LLM (Claude) | Statistical | High quality | $$$ | Complex reasoning, writing, planning |

MCP unifies access to ALL of these. A tool call to `graph_query_attr` invokes a cell. A tool call to a local ollama server invokes an LLM. Same protocol. Same interface. The caller doesn't need to know which kind of model answered.

## MCP as universal I/O

ECC2 tries to make MCP the universal bus but relies on fragile patterns (health-check caching, reconnect commands, backoff timers). Our mathematical rigor avoids this:

- Every MCP tool call is an observation morphism (measurement of system state)
- Every tool response is a global section of the settled fiber
- Tool calls compose: the output of one tool is valid input to another (because both are sections of the same sheaf)
- Error handling is algebraic: CCE error codes, not HTTP status codes

Internal systems should also speak MCP:
- daemon → MCP (already: 561-datastore server)
- hooks → MCP (future: hooks query the graph via MCP instead of direct file reads)
- agents → MCP (already: dispatched agents can use MCP tools)
- web UI → MCP (future: browser connects via MCP WebSocket)
- local LLMs → MCP (future: ollama behind an MCP server)

## Don't forget

1. **FARS Obsidian plugin** — plan exists at `operations/command/endeavor/records/plans/consume-fars-substrate.md` or similar. Obsidian users get FARS capabilities through a plugin that speaks MCP to the 561-datastore server.

2. **Local models** — ollama, llama.cpp, or similar. Behind an MCP server. Used for cheap inference: triage classification, draft generation, quick lookups. The expensive LLM (Claude) handles complex reasoning; the local LLM handles bulk work.

3. **The model zoo is already here** — 11,000 entity-cells, each a micro-model. Making them proper CDS cells with RTL signatures would give us a massive algebraic model zoo alongside the statistical models.
