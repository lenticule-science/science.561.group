---
name: check-edge-typing
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
- call
  - graph-edge-type-check
  - edges
  - ports
proof_refs:
- edge-set
- port-set
- recognition
- graph-edge-type-check
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Validates that every edge in an [Edge Set](../structure/edge-set.md) connects
ports with matching carrier types from the [Port Set](../structure/port-set.md).
Returns a predicate recognition witnessing well-typedness (top if all edges are
compatible, otherwise a counterexample).

## Proof
- Uses: port carrier assignments to compare each edge’s source/target types via
  `graph-edge-type-check`.
- Shows that: wiring plans only proceed when every edge respects port typing.
