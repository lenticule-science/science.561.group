---
title: Project Graph Edges
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---

# Proof
- Uses: edge declarations embedded in the connection graph.
- Shows that: edges can be extracted for downstream typing and acyclicity
  checks without extra primitives.
---

Projects the [Edge Set](../structure/edge-set.md) from a
[Connection Graph](../structure/connection-graph.md).

## Proof
- Uses: the edge declarations embedded in the connection graph.
- Shows that: edges can be extracted for downstream checks without primitive
  opcodes.
