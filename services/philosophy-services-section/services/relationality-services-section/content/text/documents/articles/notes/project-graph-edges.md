---
title: Project Graph Edges
id: project-graph-edges
role: operator
status: plan
inputs:
- id: connection-graph
  alias: graph
outputs:
- id: edge-set
  alias: edges
transformation:
- return
- edges
proof_refs:
- connection-graph
- edge-set
---

# Proof
- Uses: edge declarations embedded in the connection graph.
- Shows that: edges can be extracted for downstream typing and acyclicity
  checks without extra primitives.
---
# Project Graph Edges

Projects the [Edge Set](./edge-set.md) from a
[Connection Graph](./connection-graph.md).

## Proof
- Uses: the edge declarations embedded in the connection graph.
- Shows that: edges can be extracted for downstream checks without primitive
  opcodes.
