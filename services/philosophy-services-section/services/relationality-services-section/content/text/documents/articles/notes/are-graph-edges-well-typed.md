---
title: Are Graph Edges Well Typed
id: are-graph-edges-well-typed
role: operator
status: plan
inputs:
- id: edge-set
  alias: edges
- id: port-set
  alias: ports
outputs:
- id: recognition
  alias: predicate
transformation:
- let
  - witness
    - call
      - check-edge-typing
      - edges
      - ports
  - return
    - witness
proof_refs:
- edge-set
- port-set
- check-edge-typing
- recognition
description: Predicate asserting that every edge connects compatible ports from the Port Set.
---

# Graph Edges Well Typed?

Predicate asserting that every edge connects compatible ports from the
[Port Set](./port-set.md).

## Proof
- Uses: [Edge Set](./edge-set.md) endpoints and the [Port Set](./port-set.md) typing/policy constraints to validate compatibility.
- Shows that: the resulting predicate witnesses edge well-typedness, required
  before acyclicity and wiring assembly.
