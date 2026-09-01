---
title: Abstraction Theorem
id: abstraction-theorem
role: structure
status: plan
proof_refs: []
---



States that parametric relations imply contextual indistinguishability (a
relational Reynolds-style theorem).

## Definition
- Premise: two interpretations are related by all
  [Parametric Relations](./parametric-relation.md) compatible with
  [Parametric Uniformity](../../../triage/relationality/relationality-slop-2025-04/internal/parametric-uniformity.md).
- Conclusion: no context in the index base can distinguish them; they are
  observationally equivalent.

## Invariants
- Context insensitivity: parametric relatedness implies contextual equality.
- Stability: holds across all base morphisms and reindexings.

## Proof
- Uses: [Parametric Uniformity](../../../triage/relationality/relationality-slop-2025-04/internal/parametric-uniformity.md) and
  [Parametric Relation](./parametric-relation.md) to lift relational reasoning to
  contextual equivalence.
- Shows that: uniformity under all reindexings yields contextual
  indistinguishability.
