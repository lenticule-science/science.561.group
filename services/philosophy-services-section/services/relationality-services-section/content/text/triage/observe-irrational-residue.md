---
title: Observe Irrational Residue
id: observe-irrational-residue
role: operator
status: plan
inputs:
- id: irrational-mystery
  alias: mystery
outputs:
- id: recognition
  alias: residue
transformation:
- return
  - mystery
    - residue
proof_refs:
- irrational-mystery
---


Projects the stabilized residue from an [Irrational Mystery](../structure/irrational-mystery.md)
structure for use in other operators.

## Invariants
- Pure projection: does not mutate the source structure.
- Returned recognition is exactly the packaged residue.
