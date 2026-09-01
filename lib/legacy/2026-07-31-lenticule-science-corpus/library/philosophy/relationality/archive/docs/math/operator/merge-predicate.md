---
title: Merge Predicate
id: merge-predicate
role: operator
status: plan
inputs:
- id: recognition-ring
  alias: left
- id: recognition-ring
  alias: right
outputs:
- id: recognition-ring
  alias: merged
transformation:
- return
  - merged
proof_refs:
- recognition-ring
---


Combines two recognition predicates (e.g., via lattice join/meet as appropriate
to the merge context).

## Proof
- Uses: recognition lattice/ring operations.
- Shows that: predicates can be combined while staying in the earned lattice.
