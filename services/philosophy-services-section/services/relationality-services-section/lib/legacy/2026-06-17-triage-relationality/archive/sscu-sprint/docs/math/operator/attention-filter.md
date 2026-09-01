---
title: Attention Filter
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



Restricts epistemic states to those currently attended to by an agent.

## Definition
- Inputs: an [Epistemic Profile](../structure/epistemic-profile.md) and an
  attention focus (implicit or earned from context).
- Output: filtered [Epistemic Profile](../structure/epistemic-profile.md)
  containing only attended recognitions.
- Behaviour: apply an attention predicate to the epistemic recognitions.

## Invariants
- Monotone: attention filtering narrows possibilities.
- Compositional: sequential filters intersect attention sets.

## Proof
- Uses: [Epistemic Profile](../structure/epistemic-profile.md).
- Produces: filtered [Epistemic Profile](../structure/epistemic-profile.md).
- Shows that: attention can be modelled as a restriction on epistemic state.
