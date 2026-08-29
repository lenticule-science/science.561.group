---
title: Extract Graph Edges
id: extract-graph-edges
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

# Extract Graph Edges

Extracts the [Edge Set](../structure/edge-set.md) from a
[Connection Graph](../structure/connection-graph.md), capturing endpoint port
ids and carrier types.

## Proof
- Uses: edge data stored in the graph.
- Shows that: edges can be validated and checked for acyclicity separately from
  other graph data.
