---
title: Observable Typed Operator
id: observable-typed-operator
role: structure
status: plan
proof_refs: []
---


# Observable Typed Operator

Typed combinators for numeric/observable structures (entropy, free energy,
probabilities) tied to the typed judgment system.

## Definition
- Operators: expectation, combination, entropy/free-energy evaluation derived
  from [Observable Algebra](../../../triage/relationality/relationality-slop-2025-04/internal/observable-algebra.md).
- Typing: rules in [Typed Judgment System](./typed-judgment-system.md) ensuring
  observables are applied to appropriate section types.

## Invariants
- Type safety: observable operations only applied to observables of correct type.
- Semantic alignment: results correspond to observable algebra semantics.

## Proof
- Uses: observable algebra and typing rules.
- Shows that: numeric/probabilistic combinators are type-directed and sound.
