---
title: Topological Order
role: operator
inputs:
- id: wiring-plan
  alias: plan
outputs:
- id: trace
  alias: ordering
transformation:
- call
  - topological-sort
  - plan
proof_refs:
- wiring-plan
- topological-sort
- trace
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Computes a topological ordering of steps in a [Wiring Plan](../structure/wiring-plan.md).
Fails if cycles remain.

## Invariants
- Ordering is valid only if the plan is acyclic; cycles surface as failures upstream.
- Pure read of plan edges; does not mutate the plan.
