---
title: Recognition Truth
id: recognition-truth
role: operator
status: plan
inputs:
- id: recognition
  alias: predicate
outputs:
- id: recognition
  alias: predicate
transformation:
- return
  - predicate
proof_refs:
- recognition
- recognition
---

# Recognition Truth

Determines whether a recognition predicate is top (true) or bottom (false) and
returns a recognition suitable for branching.

## Proof
- Uses: ordering on the recognition lattice.
- Shows that: truth detection is available as a primitive observation of
  recognitions.
