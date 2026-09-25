---
title: Depth First Search
id: depth-first-search
role: operator
status: plan
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
description: Performs a depth-first traversal over an Edge Set, producing a recognition of the traversal order with back-edge detection hooks.
---

# Proof
- Uses: adjacency over the edge set to traverse successors, marking visited and
  back-edges.
- Shows that: traversal order with back-edge hooks can be produced as a
  recognition, supporting cycle detection.
---

Performs a depth-first traversal over an [Edge Set](./edge-set.md),
producing a recognition of the traversal order with back-edge detection hooks.

## Proof
- Uses: adjacency in the edge set to explore successor edges, marking visited
  nodes and back-edges.
- Shows that: the traversal output can be consumed by cycle detection operators
  to witness cycles or confirm acyclicity.

## Earlier material

Performs a depth-first traversal over an [Edge Set](edge-set.md),
producing a recognition of the traversal order with back-edge detection hooks.
