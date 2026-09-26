---
id: formula
description: "A Formula is a well-formed syntactic expression that carries truth conditions — a term of type Prop in a logic. Distinguished from a term-denoting-individual by being truth-evaluable; distinguished from a Proposition by being syntactic rather than semantic."
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  logical-form: relational-universe
output: relational-universe
ast:
  prop-term:
    - logical-form:
        - truth-condition
        - interpretation-map

aliases:
  - Formula
---

# Formula

## What this is

A **Formula** (well-formed formula, wff) is a syntactic expression that can be true or false under an interpretation — a term of type **Prop** in a logic.

In first-order logic, formulas are built from terms and predicates:

- An atomic formula is P(t₁, …, tₙ) for a predicate P and terms t₁, …, tₙ, or an equation t₁ = t₂.
- Compound formulas are built by applying logical connectives (∧, ∨, ¬, ⇒) and quantifiers (∀, ∃) to simpler formulas.

A formula is distinct from a Term: a term denotes an individual; a formula expresses a truth condition. Terms appear inside formulas as arguments; formulas do not appear inside terms as sub-expressions (in classical first-order logic).

## The syntactic/semantic distinction

A Formula is a **syntactic** object — a string or tree built by formation rules, prior to any interpretation. Its semantic counterpart is a Proposition: the truth condition the formula expresses under a specific interpretation in a specific context.

The same formula can express different propositions under different interpretations. Conversely, different formulas can express the same proposition (they are logically equivalent). The formula is the inscription; the proposition is the meaning.

This parallels the term/value distinction: a Term is syntactic and denotes a value under an assignment; a Formula is syntactic and denotes a truth value under an interpretation.

## In this system

The RelationalHistoryFiberDoctrineLanguage has a single syntactic type: **Prop**. Every term of this language is a Formula in the logical sense — every term carries truth conditions and is interpreted as an element of a fiber Heyting algebra H_t.

This means the term/formula distinction collapses in the nuclear language: there are no terms of an individual-denoting type separate from propositions. The carrier H_t consists entirely of propositional content — every element is something that can be settled or unsettled under the nuclei σ_t and Δ_t.

A formula M of type Prop in RelationalHistoryFiberDoctrineLanguage:

- Has a denotation ⟦M⟧_t ∈ H_t under the interpretation at history t (an Application of the denotation map)
- Can be acted on by Saturate (σ_t) and Transfer (Δ_t)
- Settles to a fixed point ⟦M⟧_t ∈ H*_t when both nuclei leave it unchanged
- The settled formula corresponds to a stable Proposition — a claim that has passed nucleus evaluation

## Relation to Proposition

| | Syntactic | Semantic |
|---|---|---|
| Individual-denoting | Term | value in algebra A |
| Truth-evaluable | **Formula** | Proposition — element of H_t |

A Formula becomes a Proposition by interpretation: the denotation map ⟦-⟧_t takes the formula to an element of H_t, which is the proposition it expresses at history t.

## Open questions

- Whether there are individual-denoting terms in the relational universe that are not of type Prop — e.g., terms denoting histories, relations, or entities as individuals. If so, the term/formula distinction re-emerges at a higher level.
