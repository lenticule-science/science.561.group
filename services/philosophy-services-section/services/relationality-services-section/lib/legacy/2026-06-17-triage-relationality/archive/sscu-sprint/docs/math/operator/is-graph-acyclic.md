---
title: Is Graph Acyclic
role: operator
inputs:
- id: edge-set
  alias: edges
outputs:
- id: recognition
  alias: predicate
transformation:
- let
- - cycles
  - - call
    - detect-graph-cycles
    - edges
- - return
  - - call
    - negate-recognition
    - cycles
proof_refs:
- edge-set
- detect-graph-cycles
 - negate-recognition
- recognition
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---

# Graph Acyclic?

Predicate over the [Recognition Carrier](../structure/recognition.md)
asserting that the [Edge Set](../structure/edge-set.md) has no directed cycles.
It detects cycles, then negates the cycle witness.

## Proof
- Uses: [Edge Set](../structure/edge-set.md) adjacency to detect cycle
  witnesses via `detect-graph-cycles`, then applies `negate-recognition` to
  assert acyclicity.
- Shows that: if detection yields no cycles, negation yields the top predicate;
  if cycles are present, the predicate captures the failure, enabling
  topological ordering preconditions in wiring plans.
