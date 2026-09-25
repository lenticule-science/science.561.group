---
title: Parametricity
id: parametricity
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



## Definition
- Inputs: the indexed effect monad ([Effect Monad](./effect-monad.md)), coeffect comonad ([Coeffect Comonad](./coeffect-comonad.md)), and the naturality data that ties them together ([Natural Transformation](./natural-transformation.md)).
- Outputs: a [Module](./module.md) of relations stating that terms respect all reindexings and both modal actions uniformly.
- Behaviour: enforces that applying effect and coeffect along any base morphism yields indistinguishable behaviour in the relational model (uniformity across contexts); the resulting relation is carried as a module stable under reindexing.

## Invariants
- Reindexing-uniform: terms commute with all base morphisms via the effect/coeffect reindexing functors.
- Modal coherence: effect and coeffect actions commute where defined, maintaining relational equality under both modalities.

## Proof
- Uses: [Effect Monad](./effect-monad.md), [Coeffect Comonad](./coeffect-comonad.md), and [Natural Transformation](./natural-transformation.md) to define the modal actions and how terms move between them.
- Produces: [Module](./module.md) relations that remain fixed under every reindexing and modal action.
- Shows that: requiring terms to be invariant under these indexed monad/comonad actions yields the parametricity property as a calculus-level operator.

## Earlier material

## Proof
- Uses: [Effect Monad](effect-monad.md), [Coeffect Comonad](coeffect-comonad.md), and [Natural Transformation](../../../triage/natural-transformation.md) to define the modal actions and how terms move between them.
- Produces: [Module](../../../structure/module.md) relations that remain fixed under every reindexing and modal action.
- Shows that: requiring terms to be invariant under these indexed monad/comonad actions yields the parametricity property as a calculus-level operator.
