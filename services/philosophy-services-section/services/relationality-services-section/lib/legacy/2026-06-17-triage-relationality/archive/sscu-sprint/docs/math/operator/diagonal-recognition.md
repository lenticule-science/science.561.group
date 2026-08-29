---
title: Diagonal Recognition
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



Recognises self-application of recognitions (diagonal/self-reference) and seeks
fixed points.

## Definition
- Inputs: recognition `R` in the [Recognition Universe](../structure/recognition-universe.md).
- Output: base recognition representing `R` applied to itself, collapsed via
  [Nucleus](nucleus.md).
- Behaviour: form `R(R)`, apply nucleus to stabilise; fixed points indicate
  self-referential stability.

## Invariants
- Fixed points: `R(R)` that stabilises indicates self-consistency.
- Paradox control: nucleus prevents trivialisation.

## Proof
- Uses: recognition universe and nucleus.
- Produces: base recognition of self-application.
- Shows that: diagonal/self-reference can be represented safely.
