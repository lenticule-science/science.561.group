---
title: src/service/
description: SQLite + PydanticAI + LangGraph + FastAPI/FastMCP.
---
# src/service/

The **relational-service-system** engine.

SQLite + PydanticAI + LangGraph + FastAPI/FastMCP.
Self-contained Docker image.
Implements the four-component relational machine architecture as a live service.

## Stack

- SQLite WAL (hot store)
- PydanticAI (typed LLM output at decision points)
- LangGraph (state machines for loop control and persistence)
- FastMCP + FastAPI (Frontier: MCP tools + HTTP endpoints)

## Four components

- `frontier/`           — I/O membrane, receives steps, advances history
- `normalization_kernel/` — applies σ∘Δ retraction, produces H*_t
- `observation_layer/`  — computes Γ(H*), emits newly settled sections
- State Store is SQLite itself

## Status

Not yet implemented.
Stubs exist.
Spec: spec/relational-machine.md.
