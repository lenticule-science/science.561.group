---
name: reference
description: A prose refinement for the Diátaxis lookup mode. Sentence positings address lookup-stable cells — definitions, parameter lists, schema fields, API signatures, return values — and reject exploratory speculation.
derives-from:
  - prose.md
---

A reference is a [`prose`](prose.md) body whose addressing surface is a lookup table.
The mode commits the prose to the reader's question *I need to know the exact value of X*; admissible positings answer that question with stable, retrievable facts.

## Admissible cells

The cells a reference addresses are predicates of the form *has-type*, *has-signature*, *has-default-value*, *has-allowed-values*, *raises-when*, *returns*, *is-defined-as*.
The subject is the named entity (function, field, parameter, etc.); the object is the stable fact.

## Stability requirement

A reference's positings must be lookup-stable: the cell value should not change at the rate of conversational context.
A reference whose positings are valid only inside one ongoing dialogue is not a reference — it is a tutorial step or an explanation paragraph mislabeled.

## Inadmissible cells

A reference must not posit on:

- Exploratory speculation cells (those belong in an [`explanation`](explanation.md) or in a `question` record).
- First-encounter pedagogical-sequence cells (those belong in a [`tutorial`](tutorial.md)).
- Task-procedural cells (those belong in a [`guide`](guide.md)).
- Cells whose value is conditional on the reader's working state (a reference is read out of order; its cells must be valid at any entry point).

## Position

The Diátaxis lookup mode.
The location for content that supports random-access retrieval of stable facts.
A reader consulting a reference is not learning, not following a procedure, and not asking why — they are looking up an exact value.
The mode-coherence check refuses references whose cells do not support that use.
