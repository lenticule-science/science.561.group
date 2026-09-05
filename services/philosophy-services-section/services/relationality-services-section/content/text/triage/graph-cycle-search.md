---
title: Graph Cycle Search
id: graph-cycle-search
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
  - graph-cycle-walk
  - edges
proof_refs:
- edge-set
- recognition
- graph-cycle-walk
---


Primitive cycle finder over an [Edge Set](../structure/edge-set.md) that
produces a recognition witness when a directed cycle exists, or bottom when
the graph is acyclic.

## Proof
- Uses: depth-first/back-edge detection over the directed edges.
- Shows that: cycle presence can be witnessed as a recognition for higher-level
  acyclicity predicates.
