---
title: Free Energy Typed Operator
id: free-energy-typed-operator
role: structure
status: plan
proof_refs: []
description: Typed combinator for evaluating free energy on thermodynamic/observable carriers.
---



Typed combinator for evaluating free energy on thermodynamic/observable carriers.

## Definition
- Operator: evaluation of [Free Energy Functional](./free-energy-functional.md)
  as a typed observable operator (alongside other observables in
  [Observable Typed Operator](./observable-typed-operator.md)).
- Domain: thermodynamic/observable states; codomain: recognition-valued result.

## Invariants
- Type safety: applied only to compatible observable carriers.
- Semantic correctness: respects free-energy combination `F = E - T·S` (or
  relational inequality) semantics.

## Proof
- Uses: free-energy functional within the observable typed framework.
- Shows that: free-energy evaluation fits the typed observable combinators.
