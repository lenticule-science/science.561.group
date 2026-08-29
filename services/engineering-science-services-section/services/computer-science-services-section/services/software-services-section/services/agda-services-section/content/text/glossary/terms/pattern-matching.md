---
title: "pattern matching"
aliases:
  - "pattern matching"
  - "dependent pattern matching"
date-created: 2026-03-01T00:00:00
type: term
keywords:
  - Agda
defines:
  - "pattern matching"
  - "dependent pattern matching"
---

Pattern matching in Agda is dependent: when you match on a constructor, the type checker refines the types of all other variables in scope to reflect the information gained.

For example, matching a value of type `Vec A (suc n)` against the constructor `x ∷ xs` tells the checker that the length is `suc n`, and `xs` has type `Vec A n`. This refinement happens automatically and is checked for completeness — you must handle every constructor.

Agda's pattern matching also supports:

- **Dot patterns**: `.pattern` marks a value that is forced by other matches (no choice is needed).
- **Absurd patterns**: `()` marks a case that is impossible given the type constraints (e.g., matching on a proof of `0 ≡ suc n`).
- **With-abstraction**: the `with` keyword allows matching on an intermediate computation within a clause.

Dependent pattern matching is Agda's primary tool for both programming and proving. Where Lean uses [tactics](../../../../../lean-services-section/content/text/glossary/terms/tactic.md) to build proof terms, Agda proofs are written as pattern-matching definitions — each case in the match is a step in the proof.

## Related terms

- universe level — the stratification that prevents pattern matching from creating paradoxes
