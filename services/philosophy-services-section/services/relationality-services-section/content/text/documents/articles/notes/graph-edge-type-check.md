---
title: Graph Edge Type Check
id: graph-edge-type-check
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
- return
  - predicate
proof_refs:
- edge-set
- port-set
- recognition
description: Checks that every edge connects ports with identical carrier types.
---


Checks that every edge connects ports with identical carrier types.

## Invariants
- Predicate is top iff every edge endpoint pair has matching carrier types.
- Produces no side effects; purely checks graph/port data.
