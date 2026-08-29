---
title: Read Graph Edges
id: read-graph-edges
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

# Read Graph Edges

Extracts the [Edge Set](./edge-set.md) from a
[Connection Graph](./connection-graph.md), retaining endpoint port
ids and carrier types.

## Invariants
- Reads edge data without mutation; preserves ordering from the graph representation.
