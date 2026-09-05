---
title: "Negate"
date-created: 2026-03-05T00:00:00
type: term
canonical-name: Negate
movement: I
draft-names:
  draft-1: "(implicit in 'excluding')"
  draft-3-PRE: "Negate"
  draft-3-foundations: "¬ (involution on E with ¬(¬x) = x)"
  draft-11: "Negate"
  draft-12: "¬ (pseudocomplement)"
stability: high — name is stable across all drafts
---

Internal complement. What a distinction leaves unmarked. The operation that formalizes exclusion as a unary act on a single recognition.

## What it is

PRE: "Negate: internal complement; what a leaves unmarked. Standard symbol: ¬." Defined via residuation: Equal(Negate(a), Induces(a, Bottom)).

Foundations: An involution ¬ on E with ¬(¬x) = x. This is the formalization of negation as a set-level operation.

Draft 12: The pseudocomplement ¬m = largest n with m ∧ n = ⊥. Double negation: ¬¬m ≥ m (not necessarily equal — this is Heyting, not Boolean).

Draft 11: "Negate: recognition operator for negation." Maps to PRE's Negate.

## Key property

Negate(Negate(a)) Includes a, but not necessarily Equal(Negate(Negate(a)), a). This non-Boolean character is essential — it means the relational field admits genuine indeterminacy. Not every question has a determinate answer.

## Relationships

- Defined via: Induces and Bottom — Negate(a) = Induces(a, Bottom)
- Equivalent to: Excludes as a predicate — Excludes(a,b) iff Includes(a, Negate(b))
- Determines: the Heyting (not Boolean) character of the logic
