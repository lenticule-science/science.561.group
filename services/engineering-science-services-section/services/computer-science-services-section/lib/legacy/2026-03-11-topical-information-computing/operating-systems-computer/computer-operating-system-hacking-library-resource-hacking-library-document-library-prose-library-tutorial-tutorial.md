---
name: tutorial
description: A prose refinement for the Diátaxis first-encounter mode. Sentence positings address pedagogical-sequence cells — what the learner does first, what happens next, what to notice along the way — and require signposting at sequence boundaries.
derives-from:
  - prose.md
---

A tutorial is a [`prose`](prose.md) body whose addressing surface is the pedagogical sequence the learner will follow.
The mode commits the prose to the reader's question *I am new here; what should I do first*; admissible positings answer that question step by step.

## Admissible cells

The cells a tutorial addresses are predicates of the form *first-step-is*, *next-step-is*, *expected-output-at-step*, *what-to-notice-here*, *what-this-step-demonstrates*.
The subject is the tutorial's overall task; the object is the step or observation.

## Required structural positings

A tutorial must posit on:

- A *start-state* cell: what the learner has before beginning.
  Without this, the first step has no antecedent.
- An *end-state* cell: what the learner has accomplished by the end.
  Without this, the tutorial has no termination condition.
- Sequence-position cells at each step: which step this is, what came before, what comes next.
  The learner's working scope $w_0$ advances through these.

The lint manifest's `mode-coherence` check refuses tutorials missing any of the three.

## Inadmissible cells

A tutorial must not posit on:

- Open-ended exploratory cells (those belong in an [`explanation`](explanation.md)).
- Reference-table cells (those belong in a [`reference`](reference.md)).
- Procedural cells outside the tutorial's main sequence (those belong in a [`guide`](guide.md), which addresses standalone procedures rather than a first-encounter narrative).

## Position

The Diátaxis first-encounter mode.
The location for content that takes a learner from zero familiarity to a first working result.
Distinguished from a guide by the *first-encounter* commitment: a guide assumes the reader knows what they are trying to do; a tutorial does not.
