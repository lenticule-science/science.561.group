---
description: The Markdown-based memory layer in OpenClaw, consisting of durable workspace files plus plugin-backed search.
identity: openclaw-memory
name: OpenClaw Memory
date-created: 2026-03-09
date-modified: 2026-03-09
provenance:
  sources:
    - OpenClaw Memory
    - "Learn OpenClaw: Memory System"
---
OpenClaw memory is the Markdown-based memory layer in an OpenClaw
workspace. Its source of truth is written files on disk rather than
session-local model state.

## Structure

The official memory docs describe two default durable layers:

- `MEMORY.md` for curated long-term memory
- `memory/YYYY-MM-DD.md` for dated logs and running context

Memory search tools are provided by the active memory plugin, but the
files remain primary. Search augments retrieval; it does not replace
the underlying Markdown record.

The official docs also describe an experimental
[QMD](./qmd.md) backend for local-first retrieval over the same Markdown
files.

## Function

OpenClaw memory makes accumulation possible across sessions. It is what
turns repeated research, planning, or monitoring into a continuing
assistant relationship rather than a sequence of unrelated chats.

## Sources

- [Memory](https://docs.openclaw.ai/concepts/memory)
- [The OpenClaw Memory System](https://learnopenclaw.com/core-concepts/memory)
