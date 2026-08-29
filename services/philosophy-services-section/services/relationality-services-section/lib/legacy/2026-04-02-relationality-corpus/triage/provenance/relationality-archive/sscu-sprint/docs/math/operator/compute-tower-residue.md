---
name: compute-tower-residue
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Computes the residual recognitions lost when collapsing a tower to a lower
level.

## Definition
- Inputs: a [Modality Tower](../structure/modality-tower.md) (or similar tower)
  and a projection to a lower layer.
- Output: [Tower Residue](../structure/tower-residue.md) capturing recognitions
  discarded by the projection.
- Behaviour: compare recognitions before/after collapse; collect differences as
  residue.

## Invariants
- Soundness: residues exactly the recognitions not preserved.
- Monotonicity: deeper collapses accumulate residues.

## Proof
- Uses: tower projection structure.
- Produces: residue data.
- Shows that: lost information can be explicitly recorded.
