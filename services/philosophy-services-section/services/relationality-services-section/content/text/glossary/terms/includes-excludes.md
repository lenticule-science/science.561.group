---
title: "Includes / Excludes"
date-created: 2026-03-05T00:00:00
type: term
canonical-name: Includes / Excludes
movement: I
draft-names:
  draft-1: "inclusion / exclusion (as conditions); including / excluding (as acts)"
  draft-3-PRE: "Includes / Excludes"
  draft-3-foundations: "(A ⊆ B in Fix(c)) / (A ∩ B = ∅)"
  draft-11: "OrderRecognition (for Includes)"
  draft-12: "Include / Exclude"
stability: high — present in all drafts
description: The two predicates that structure the field of recognition.
---

The two predicates that structure the field of recognition. Includes measures containment (one recognition subsumed by another). Excludes measures incompatibility (no shared recognition).

## What they are

PRE: "Includes(a,b) holds when ⟦a⟧ is contained within ⟦b⟧, that is, every mark recognized by a is recognized by b." Reflexive, transitive. "Excludes(a,b) holds when ⟦a⟧ and ⟦b⟧ share no common recognition." Symmetric, irreflexive.

Draft 1: "Inclusion: the condition of what is something. Exclusion: the condition of what is not something." These are the conditions (second element of the triad) produced by the first phase.

Foundations: Inclusion is ⊆ on Fix(c). Exclusion is empty intersection.

Draft 12: Inclusion as subobject ordering (m₁ ≤ m₂ iff ∃ i with m₁ = m₂ ∘ i). Exclusion as disjointness (pullback is empty).

## Properties

- Includes: reflexive, transitive → preorder
- Excludes: symmetric, irreflexive
- Cross-stability: if Includes(a,b) and Excludes(b,c), then Excludes(a,c)
- Together they form the "reflexive order" or "field of recognition"

## Relationships

- Produced by: Differentiate
- Ground for: Together, Either, Negate (operations defined in terms of Includes/Excludes)
- Ground for: Induces (residuation defined via Includes and Together)

## Note on naming

Draft 1 distinguishes acts (including/excluding) from conditions (inclusion/exclusion). PRE and draft 12 use verb forms (Includes/Excludes or Include/Exclude) for both. Draft 11 abstracts further to "OrderRecognition." The act/condition distinction from draft 1 may be the most precise.
