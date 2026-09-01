---
name: apply-state-transition
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



Applies a state transition to update a section.

## Definition
- Inputs: a [State Transition](../structure/state-transition.md).
- Output: updated [Hypertensor Section](../structure/hypertensor-section.md).
- Behaviour: run the transition’s flow rule to produce the target section.

## Invariants
- Admissibility: transition must respect flow/sheaf constraints.
- Compositional: sequential transitions compose associatively.

## Proof
- Uses: transition data to map source to target section.
- Produces: new section.
- Shows that: state updates are well-defined and compositional.
