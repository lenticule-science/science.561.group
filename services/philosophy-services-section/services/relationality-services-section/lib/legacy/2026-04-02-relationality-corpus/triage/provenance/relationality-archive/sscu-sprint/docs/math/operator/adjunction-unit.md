---
name: adjunction-unit
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



Unit natural transformation for the flow–nucleus adjunction.

## Definition
- Inputs: a [Context](../structure/context.md).
- Outputs: unit map `eta: Id → nucleus ∘ flow` at that context.

## Invariants
- Natural in context.
- Satisfies one triangle identity with the counit.

## Proof
- Uses: [Flow–Nucleus Adjunction](../structure/flow-nucleus-adjunction.md) to
  supply the unit.
- Shows that: unit maps exist and satisfy the adjunction laws.
