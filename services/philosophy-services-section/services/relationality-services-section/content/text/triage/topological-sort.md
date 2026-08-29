---
title: Topological Sort
id: topological-sort
role: operator
status: plan
inputs:
- id: wiring-plan
  alias: plan
outputs:
- id: trace
  alias: ordering
transformation:
- return
  - ordering
proof_refs:
- wiring-plan
- trace
---

# Topological Sort

Performs a topological sort over the steps/edges of a [Wiring Plan](../structure/wiring-plan.md).

## Invariants
- Returns an ordering only when plan is acyclic; otherwise yields failure upstream.
- Purely reads the wiring plan edge relation.
