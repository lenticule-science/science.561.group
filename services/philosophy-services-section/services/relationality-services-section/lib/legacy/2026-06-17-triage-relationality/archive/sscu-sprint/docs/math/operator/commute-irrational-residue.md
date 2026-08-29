---
title: Commute Irrational Residue
role: operator
inputs:
- id: irrational-mystery
  alias: mystery
outputs:
- id: recognition
  alias: predicate
transformation:
- call
  - meet-recognition
  - mystery
    - collapse_witness
  - mystery
    - eigen_direction
proof_refs:
- irrational-mystery
- meet-recognition
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Produces a recognition witnessing that the irrational residue is compatible
with both collapse and its stabilized eigen-direction.

## Invariants
- Predicate is top iff collapse commutation and eigen alignment are both
  satisfied.
- Does not mutate the residue; purely checks the packaged witnesses.
