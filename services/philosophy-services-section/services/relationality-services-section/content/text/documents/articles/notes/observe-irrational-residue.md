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
description: Projects the stabilized residue from an Irrational Mystery structure for use in other operators.
---


Projects the stabilized residue from an [Irrational Mystery](./irrational-mystery.md)
structure for use in other operators.

## Invariants
- Pure projection: does not mutate the source structure.
- Returned recognition is exactly the packaged residue.
