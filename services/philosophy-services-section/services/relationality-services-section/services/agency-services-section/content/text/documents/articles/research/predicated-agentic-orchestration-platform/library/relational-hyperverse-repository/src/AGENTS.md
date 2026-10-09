---
title: src/AGENTS.md
description: src/ is the implementation department.
---
# src/AGENTS.md

`src/` is the implementation department.
Downstream of `math/`, `proof/`, `spec/`.
Read `spec/relational-machine.md` before working here — it is the architectural contract.

---

## Policies

- Implement what `spec/` describes.
  If src/ disagrees with a spec claim, the code is wrong.
- Before writing new code, find the spec file that governs it.
- Workflow logic belongs in cold storage (runbooks), not Python.
- Do not hardcode Unit kinds, department names, or routing rules in Python.
- Do not call an LLM for work that is deterministic.
  Use a runbook or a plain function.

---

## Scope

| Location | What lives there |
|----------|-----------------|
| `src/engine/` | The Relational Machine implementation |
| `src/engine/models/` | Unit model + kind-specific content models |
| `src/engine/loader.py` | Cold store → hot store (markdown → SQLite) |
| `src/engine/serializer.py` | Hot store → cold store (SQLite → markdown) |
| `src/engine/mcp_server.py` | Frontier: FastMCP + FastAPI entry point |
| `src/engine/runbook_executor.py` | Generic runbook step dispatcher |
| `src/engine/agents/` | PydanticAI agents for LLM decision points |
| `src/engine/graphs/` | LangGraph work coordinator graphs |
| `src/claude/` | Claude Code hooks and install scripts |
| `src/skills/` | Skills that operate on `src/` content |

---

## Permissions

- **Write freely:** `src/`
- **Read only:** `spec/`, `math/`, `proof/` (when a skill explicitly instructs it)
- **Never write:** `math/`, `proof/`, `spec/`

---

## Skills

| Skill | What it produces |
|-------|-----------------|
| `improve-src` | One src/ improvement work unit |
