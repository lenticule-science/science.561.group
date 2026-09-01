---
name: adjunction-counit
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



Counit natural transformation for the flow–nucleus adjunction.

## Definition
- Inputs: a [Context](../structure/context.md).
- Outputs: counit map `epsilon: flow ∘ nucleus → Id` at that context.

## Invariants
- Natural in context.
- Satisfies the other triangle identity with the unit.

## Proof
- Uses: [Flow–Nucleus Adjunction](../structure/flow-nucleus-adjunction.md) to
  supply the counit.
- Shows that: counit maps exist and satisfy the adjunction laws.
