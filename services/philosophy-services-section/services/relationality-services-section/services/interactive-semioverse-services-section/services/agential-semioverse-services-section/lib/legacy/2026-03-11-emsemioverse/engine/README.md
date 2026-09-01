---
title: Emsemioverse Engine
id: emsemioverse-engine-readme
kind: readme
authors: [gpt-5.2-codex]
date-created: 2026-01-02
---


The engine is a minimal runtime that loads skills from the library and exposes those skills over HTTP and MCP.
It does not own authorization, schema validation, or filesystem semantics; those are skills in the library.

## Layout

- `api/main.py` — FastAPI app wiring for HTTP + MCP.
- `api/app_state.py` — loads the library skill manifest.
- `api/skill_runner.py` — executes skills via their runtime entrypoints.
- `api/mcp_sdk_adapter.py` — MCP surface that mirrors HTTP skill execution.

## Configuration

Environment variables (prefixed or legacy) supported:

- `EMSEMIOVERSE_HOST` / `HOST` (default `0.0.0.0`)
- `EMSEMIOVERSE_PORT` / `PORT` (default `5000`)
- `EMSEMIOVERSE_LOG_LEVEL` / `LOG_LEVEL` (default `info`)

## Local run

- Prereqs: `python3` (optionally `direnv`).
- Install dependencies: `make setup` (creates `.venv`, installs backend).
- Start the API: `make run` (serves FastAPI + MCP at port 5000).
- Run tests: `make test`.

## Skill execution

- HTTP: `POST /api/v1/skills/{skill_id}/execute` with JSON body `{ "inputs": {...} }`.
- MCP: each skill is exposed as a tool with the same input schema.

The engine executes only skills defined in the library and returns the skill outputs directly.
