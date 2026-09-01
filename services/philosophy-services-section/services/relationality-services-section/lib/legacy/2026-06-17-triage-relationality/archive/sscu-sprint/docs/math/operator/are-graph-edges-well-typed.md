---
title: Are Graph Edges Well Typed
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---

# Graph Edges Well Typed?

Predicate asserting that every edge connects compatible ports from the
[Port Set](../structure/port-set.md).

## Proof
- Uses: [Edge Set](../structure/edge-set.md) endpoints and the [Port Set](../structure/port-set.md) typing/policy constraints to validate compatibility.
- Shows that: the resulting predicate witnesses edge well-typedness, required
  before acyclicity and wiring assembly.
