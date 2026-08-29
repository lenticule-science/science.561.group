---
title: Topological Order
id: topological-order
role: operator
status: plan
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
---

# Topological Order

Computes a topological ordering of steps in a [Wiring Plan](./wiring-plan.md).
Fails if cycles remain.

## Invariants
- Ordering is valid only if the plan is acyclic; cycles surface as failures upstream.
- Pure read of plan edges; does not mutate the plan.
