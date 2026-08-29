---
title: Depth First Search
role: operator
inputs:
- id: edge-set
  alias: edges
outputs:
- id: recognition
  alias: traversal
transformation:
- return
- traversal
proof_refs:
- edge-set
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---

# Proof
- Uses: adjacency over the edge set to traverse successors, marking visited and
  back-edges.
- Shows that: traversal order with back-edge hooks can be produced as a
  recognition, supporting cycle detection.
---
# Depth First Search

Performs a depth-first traversal over an [Edge Set](../structure/edge-set.md),
producing a recognition of the traversal order with back-edge detection hooks.

## Proof
- Uses: adjacency in the edge set to explore successor edges, marking visited
  nodes and back-edges.
- Shows that: the traversal output can be consumed by cycle detection operators
  to witness cycles or confirm acyclicity.
