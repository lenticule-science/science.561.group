---
title: Parametricity Typing Bridge
id: parametricity-typing-bridge
role: structure
status: plan
proof_refs: []
description: Integrates parametric relations/abstraction into the typed judgment system to ensure contextual equivalence for DSL optimizations.
---



Integrates parametric relations/abstraction into the typed judgment system to
ensure contextual equivalence for DSL optimizations.

## Definition
- Components: typing rules annotated with [Parametric Relation](./parametric-relation.md)
  obligations; appeal to [Abstraction Theorem](./abstraction-theorem.md) to infer
  contextual equivalence.
- Purpose: guarantee that well-typed, parametric terms are indistinguishable
  across contexts.

## Invariants
- Uniformity: typed terms respect all parametric relations.
- Contextual equivalence: parametric relatedness implies observational equality.

## Proof
- Uses: abstraction theorem to lift parametricity into typing.
- Shows that: typed derivations carry parametric guarantees for optimization and
  refinement in the DSL/ISA.
