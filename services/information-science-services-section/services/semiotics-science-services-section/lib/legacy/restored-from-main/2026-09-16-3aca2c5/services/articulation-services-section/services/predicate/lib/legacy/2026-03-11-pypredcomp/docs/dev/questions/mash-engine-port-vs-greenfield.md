---
title: "mash-engine port vs greenfield"
description: "Per-crate decision: port mash-engine code, write fresh, or hybrid."
kind: question
status: closed-out-of-scope
closed: 2026-05-03
closed-reason: "Captain directive 2026-05-03: ignore MASH, no port. PyPredComp only."
---


`mash-engine` has working Rust code for the algebra, the proof substrate, and a hub.
The agent decides per-crate whether to port directly, write fresh, or hybrid.

## Per crate

- **algebra** (the Belnap value): port directly.
  Small, well-tested, matches the spec.
- **proof** (the cascade / closure operator): probably port.
  The cascade structure carries over; rename to closure-engine; vocabulary translation per `references/vocabulary-translation.md`.
- **hub** (Unix-socket runtime): probably greenfield.
  The new runtime has different transport (HTTP / MCP / WebSocket); the hub-crate's design is dated.
- **sdk** (agent / projection traits): study; partial port.
  The trait design is informative; the new specs have a different surface.
- **library** (vocabularies, scenes, projections): selectively port test fixtures and vocabularies.
  The OQRA structure may not map directly.

## Captain's view

The captain may have stronger views on which crates have value.
Specifically:

- Is `mash-engine::proof::Semiotics` worth direct adaptation, or has the design moved on?
- The hub's storage layer — is it production-quality or scaffold?
- The test fixtures — which are vocabulary tests vs implementation-specific?

## Resolution

A plan-by-plan call.
The agent files this question if a specific crate's port is unclear.
