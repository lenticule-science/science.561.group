---
title: "Flow\u2013Nucleus Commutation"
id: flow-nucleus-commutation
role: operator
status: plan
derived_from: acts/commute-flow-and-nucleus
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Flow–Nucleus Commutation

## Statement

Flow and nucleus commute on admissible morphisms: applying the nucleus before
or after flow yields the same stabilised recognition. The acts also witness the
adjunction between flow and nucleus on admissible morphisms.

## Definition
- Inputs: [Admissible Morphism](../structure/admissible-morphism.md).
- Outputs: commutation/adjunction witness (law) for flow/nucleus on admissible morphisms.
- Behaviour: enforces that `N ∘ F = F ∘ N` on admissible morphisms and that flow/nucleus form an adjoint pair, per the earned acts.

## Invariants
- Commutation holds: flow and nucleus can be reordered on admissible morphisms without changing the result.
- Adjunction holds: flow is left adjoint to nucleus on admissible morphisms, as witnessed by the earned acts.

## Proof
- Derived from: [Commute Flow and Nucleus](../acts/commute-flow-and-nucleus.md).
- Uses: [Admissible Morphism](../structure/admissible-morphism.md) to scope the commutation/adjunction.
- Shows that: the commutation and adjunction laws earned by the acts apply to admissible morphisms, fixing the flow–nucleus interaction up to earned equivalence.

Given these acts, the flow–nucleus commutation/adjunction is fixed up to earned
equivalence.
