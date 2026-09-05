---
title: Subobject Classifier
id: subobject-classifier
role: structure
status: plan
derived_from: math/structure/relational-sheaf-topos
proof_refs: []
---



Logical carrier that classifies monomorphisms in the earned presheaf/sheaf
topos; provides truth values and characteristic maps.

## Definition
- Carrier: object `Omega` equipped with:
  - `true: 1 → Omega` (global truth),
  - For every mono `m: A → B`, a unique characteristic map `chi_m: B → Omega`
    such that `A` is the pullback of `true` along `chi_m`.
- Logical structure: operations induced from the
  [Relational Logic Algebra](./relational-logic-algebra.md) (meet/join/implication)
  acting on subobjects via sieves/recognitions.

## Invariants
- Classifier property: monos are in bijection with characteristic maps into
  `Omega`.
- Pullback stability: characteristic squares commute for any morphism.
- Truth values coincide with recognitions in the relational logic algebra.

## Proof
- Derived from: [Relational Sheaf Topos](../../../triage/relationality/relationality-slop-2025-04/external/relational-sheaf-topos.md) as the
  ambient category supporting subobjects.
- Uses: [Relational Logic Algebra](./relational-logic-algebra.md) to endow
  `Omega` with logical operations and to interpret characteristic maps as
  recognitions.
- Shows that: equipping the earned topos with `Omega` and `true` satisfying
  the classifier property yields a subobject classifier whose logical content
  is the relational logic algebra.
