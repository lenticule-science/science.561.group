---
title: "QMD"
date-created: 2026-03-09T00:00:00
authors:
  - claude
date-updated: 2026-03-09T00:00:00
type: term
aliases:
  - "QMD"
  - "qmd"
keywords:
  - OpenClaw
  - MemorySystems
  - Retrieval
  - LocalFirst
description: "A local-first search sidecar that OpenClaw can use as an experimental memory backend."
defines:
  - "QMD"
cites:
  - "OpenClaw Memory"
---

QMD is a local-first search sidecar that OpenClaw can use as an
experimental memory backend. In this mode, Markdown remains the source
of truth while OpenClaw shells out to QMD for retrieval.

## Role

The official memory docs describe QMD as combining BM25, vectors, and
reranking over local Markdown-backed memory. OpenClaw can opt into it
with `memory.backend = "qmd"`.

## Scope

QMD is not OpenClaw's canonical memory store. It is a retrieval layer
that sits on top of files such as `MEMORY.md` and `memory/YYYY-MM-DD.md`
to improve search and recall.

## Sources

- [Memory](https://docs.openclaw.ai/concepts/memory)
