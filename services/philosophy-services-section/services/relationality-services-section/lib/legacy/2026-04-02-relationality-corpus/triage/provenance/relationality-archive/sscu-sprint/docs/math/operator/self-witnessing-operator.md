---
name: self-witnessing-operator
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



Generates recognitions that witness the profile witnessing itself; fixed points
approximate reflexive awareness.

## Definition
- Inputs: a [Reflexive Profile](../structure/reflexive-profile.md) and the
  [Nucleus](nucleus.md) operator.
- Output: updated [Reflexive Profile](../structure/reflexive-profile.md)
  containing self-witnessing recognitions.
- Behaviour: apply nucleus to self-referential recognitions to stabilise
  self-witnessing; iterate to approach fixed points.

## Invariants
- Reflexivity: results remain self-referential.
- Stability: fixed points represent stable self-awareness states.

## Proof
- Uses: [Reflexive Profile](../structure/reflexive-profile.md) and
  [Nucleus](nucleus.md).
- Produces: refined [Reflexive Profile](../structure/reflexive-profile.md).
- Shows that: self-witnessing is expressible within the earned logic/nucleus
  framework.
