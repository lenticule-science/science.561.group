---
title: Detect Graph Cycles
id: detect-graph-cycles
role: operator
status: plan
inputs:
- id: edge-set
  alias: edges
outputs:
- id: recognition
  alias: cycle-witness
transformation:
- call
  - graph-cycle-search
  - edges
proof_refs:
- edge-set
- graph-cycle-search
description: Produces a recognition witness of a directed cycle in an Edge Set, or the bottom recognition if none exist.
---

# Proof
- Uses: graph cycle search over the edge set to produce a cycle witness or
  bottom.
- Shows that: cycle presence is captured as a recognition, enabling acyclicity
  checks.
---

Produces a recognition witness of a directed cycle in an
[Edge Set](./edge-set.md), or the bottom recognition if none exist.
Intended to be negated to assert acyclicity.

## Proof
- Uses: edge adjacency to search for back-edges via `graph-cycle-search`
  (depth-first or equivalent), emitting a recognition of the discovered cycle
  or bottom if none.
- Shows that: any returned witness certifies the presence of a cycle; absence
  (bottom) is the condition used by [`is-graph-acyclic`](./is-graph-acyclic.md).

## Earlier material

Produces a recognition witness of a directed cycle in an
[Edge Set](edge-set.md), or the bottom recognition if none exist.
Intended to be negated to assert acyclicity.
