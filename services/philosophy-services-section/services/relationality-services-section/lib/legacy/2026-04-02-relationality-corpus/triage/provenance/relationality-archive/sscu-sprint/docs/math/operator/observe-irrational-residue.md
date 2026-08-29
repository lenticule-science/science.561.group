---
name: observe-irrational-residue
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Projects the stabilized residue from an [Irrational Mystery](../structure/irrational-mystery.md)
structure for use in other operators.

## Invariants
- Pure projection: does not mutate the source structure.
- Returned recognition is exactly the packaged residue.
