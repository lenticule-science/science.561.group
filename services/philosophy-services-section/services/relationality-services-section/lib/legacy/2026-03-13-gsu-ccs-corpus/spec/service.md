---
id: service
description: "The relational-service-system: the SQLite + PydanticAI + LangGraph + FastAPI machine. Live runtime that ingests repository content and runs the four-component relational machine architecture as a Docker service."
---

# Service

The **relational-service-system** is one of the two machines in this project.

## What it is

A self-contained Docker service that ingests content from the
[relational-repository](repository.md) and runs the full four-component
relational machine architecture as a live, queryable system.

## Stack

- **Hot store:** SQLite WAL — live mirror of all Units
- **Typed LLM output:** PydanticAI — validated structured output at decision points
- **State machines:** LangGraph — loop control, persistence, termination
- **External interface:** FastMCP + FastAPI — MCP tools and HTTP endpoints
- **Target deployment:** Docker image with markdown volume mount

## Four components

See [relational-machine](relational-machine.md) for the full spec.

- **Frontier** (`src/service/frontier/`) — receives steps, advances history
- **State Store** — SQLite itself; holds H_t and H*_t
- **Normalization Kernel** (`src/service/normalization_kernel/`) — applies π_t = σ∘Δ
- **Observation Layer** (`src/service/observation_layer/`) — emits newly settled sections

## What it is NOT

The relational-service-system does not own the authoring of content. Markdown files,
YAML runbooks, and skills are authored in the [relational-repository](repository.md)
and imported into the service on startup.

## Status

Not yet implemented. Architecture specified in [relational-machine](relational-machine.md).
Implementation lives in `src/service/`.
