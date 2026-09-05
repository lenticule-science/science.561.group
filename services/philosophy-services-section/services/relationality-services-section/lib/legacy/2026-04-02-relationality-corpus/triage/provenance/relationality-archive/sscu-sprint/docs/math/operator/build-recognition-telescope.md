---
name: build-recognition-telescope
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



Constructs a telescope of recognitions via successive nucleus collapses.

## Definition
- Inputs: a recognition and a sequence of collapse operations (e.g., nucleus,
  tower projections).
- Output: [Recognition Telescope](../structure/recognition-telescope.md).
- Behaviour: iteratively collapse and record each stage.

## Invariants
- Chain monotonicity: each stage is coarser/equal to previous.
- Stabilisation: telescope may stabilise at a fixed recognition.

## Proof
- Uses: nucleus/collapse steps on recognitions.
- Produces: telescope structure.
- Shows that: collapse progression can be systematically recorded.
