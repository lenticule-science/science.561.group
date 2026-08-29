---
name: normalize-irrational-residue
role: operator
inputs:
- id: irrational-mystery
  alias: mystery
outputs:
- id: recognition
  alias: normalized
transformation:
- let
  - step
    - call
      - imply-recognition
      - mystery
        - residue
      - mystery
        - eigen_direction
  - normalized
    - call
      - meet-recognition
      - step
      - mystery
        - residue
  - return
    - normalized
proof_refs:
- irrational-mystery
- imply-recognition
- meet-recognition
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Tightens an irrational residue against its eigen-direction by taking the
implication from the current residue to the stabilized direction and meeting
it back with the residue.

## Invariants
- Output recognition is at most as strong as the original residue and aligned
  with the eigen-direction.
- Leaves the underlying structure untouched; produces a normalized predicate
  for downstream use.
