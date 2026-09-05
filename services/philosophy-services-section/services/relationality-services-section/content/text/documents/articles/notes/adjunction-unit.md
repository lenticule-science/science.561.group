---
title: Adjunction Unit
id: adjunction-unit
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Unit natural transformation for the flow–nucleus adjunction.

## Definition
- Inputs: a [Context](./context.md).
- Outputs: unit map `eta: Id → nucleus ∘ flow` at that context.

## Invariants
- Natural in context.
- Satisfies one triangle identity with the counit.

## Proof
- Uses: [Flow–Nucleus Adjunction](./flow-nucleus-adjunction.md) to
  supply the unit.
- Shows that: unit maps exist and satisfy the adjunction laws.
