---
title: "Induces"
date-created: 2026-03-05T00:00:00
type: term
canonical-name: Induces
movement: I
draft-names:
  draft-1: "(implicit — 'the condition of what is something' requires sufficiency)"
  draft-3-PRE: "Induces"
  draft-3-foundations: "(implicit in residuated structure)"
  draft-11: "ImplyRecognition"
  draft-12: "Induce"
stability: high — present in all drafts, names vary
description: Residual implication.
---

Residual implication. What must be added to one recognition for another to be recognized. Not "if a then b" propositionally, but "what completes a for b."

## What it is

PRE: "Induces: residual implication; what must be added for sufficiency. Standard symbol: ⇒." Axiom 2: Includes(Together(a,b), c) iff Includes(a, Induces(b,c)).

PRE §3.4: "In this relational logic, truth is replaced by sufficiency. Induces(a,b) does not mean 'if a then b' in a propositional sense, but rather 'what must be added to a for b to be recognized.'"

Draft 12: "Induce(a,b) := max{x ∈ Sub(Y) | a ∧ x ≤ b}. The largest recognition x such that if we add x to a, the result is still within b."

Draft 11: ImplyRecognition, maps to PRE's Induces.

## Key properties

- Galois connection: Together(a, −) ⊣ Induces(a, −)
- Antitone in first argument, monotone in second
- Modus ponens: Includes(Together(a, Induces(a,b)), b)
- Negate defined via: Negate(a) = Induces(a, Bottom)
- Self-sufficiency: Includes(a, Induces(a,a))

## What it produces

The full Heyting algebra structure: (Rel, Together, Either, Induces, Negate, Top, Bottom). This is the complete logical system of the relational field, earned from Differentiate alone.

## Relationships

- Requires: Together, Includes (residuation is the adjunction between them)
- Defines: Negate (as special case Induces(a, Bottom))
- Earned by: the third step of Movement I
- Precedes: Iterate (which applies Induces to itself)
