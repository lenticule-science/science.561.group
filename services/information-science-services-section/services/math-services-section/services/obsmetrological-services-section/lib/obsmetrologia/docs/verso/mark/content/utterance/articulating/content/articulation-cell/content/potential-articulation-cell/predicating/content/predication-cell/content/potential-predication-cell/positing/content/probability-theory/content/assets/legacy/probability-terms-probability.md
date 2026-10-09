---
title: "Probability"
aliases:
  - "probability"
  - "probability measure"
date-created: 2026-01-01
type: term
tags: []
---

A probability is a [function](../../../objects/sets/terms/function.md) P that assigns a number between 0 and 1 to each [event](./event.md) in a [sample space](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/sample-space.md), satisfying the Kolmogorov axioms: P(Ω) = 1 for the full sample space Ω, P(A) ≥ 0 for every event A, and P is countably additive (the probability of a disjoint union of events equals the sum of their probabilities).

These axioms formalize probability as a measure on a σ-algebra of events. The number P(A) quantifies uncertainty: P(A) = 0 means A is impossible (or has measure zero), P(A) = 1 means A is certain (or almost sure), and values in between express degrees of plausibility. The interpretation of these numbers varies — frequentist (long-run proportion), Bayesian (degree of belief), or logical (degree of support) — but the mathematical structure is the same.

Probability connects to the [semiotic](../../../../linguistics/topics/semiotics/index.md) universe through the logic of partial information. In a [Heyting algebra](../../../objects/universes/semiotic-universe/terms/complete-heyting-algebra.md), truth values range between ⊥ (false) and ⊤ (true), and the ordering expresses entailment. A probability measure is a different way of grading truth: rather than a [lattice](../../../objects/posets/terms/lattice.md) ordering, it assigns a real number that respects the algebraic structure of events through additivity.
