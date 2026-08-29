---
title: Graph Cycle Walk
id: graph-cycle-walk
role: operator
status: plan
inputs:
- id: edge-set
  alias: edges
outputs:
- id: recognition
  alias: cycle-witness
transformation:
- return
  - cycle-witness
proof_refs:
- edge-set
- recognition
---

# Graph Cycle Walk

Performs cycle detection over an [Edge Set](../structure/edge-set.md), emitting
a recognition witness of a directed cycle or bottom if none.

## Invariants
- Detects presence/absence of directed cycles in the edge set.
- Yields a recognition witness; pure read of edge data.
