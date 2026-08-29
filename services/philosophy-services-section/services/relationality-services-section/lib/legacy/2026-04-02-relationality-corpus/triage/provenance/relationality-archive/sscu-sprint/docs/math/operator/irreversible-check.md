---
name: irreversible-check
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



Checks whether a given flow step is reversible or irreversible per the flow law.

## Definition
- Inputs: a flow step in [Flow Context](flow-context.md) and
  [Reversible Flow Law](../structure/reversible-flow-law.md).
- Output: updated law witness indicating reversibility/irreversibility.
- Behaviour: evaluate entropy change and existence of inverse; classify.

## Invariants
- Correct classification: reversible iff entropy preserved and inverse exists.
- Stability: classification stable under equivalent flow presentations.

## Proof
- Uses: flow/entropy criteria.
- Produces: reversibility witness.
- Shows that: reversibility can be decided per step in alignment with entropy.
