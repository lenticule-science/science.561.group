---
title: Indexed Categories
tags:
  - indexed-category
  - context
depends_on:
  - theorem/internal/context-adjoint-functors
  - theorem/internal/parametric-uniformity
operations:
  - name: base geometry
    symbol: B
    acts:
      - context-geometry
  - name: fibre category
    acts:
      - judge-profile
  - name: reindexing
    symbol: "(-)^*"
    acts:
      - reindexing
---
# Theorem (Indexed Categories)

The triple

- base: `IndexBase = ContextGeometry`,
- fibres: `FiberCategory = (JudgeProfile ProfileRecognitions)`,
- reindexing: `Reindexing = (SubstituteReducibility IndexBase)`,

forms an internal indexed category, encoded by `IndexedCategory`.

In particular:

1. Each context carries a fibre category of terms/judgements.
2. Each context morphism induces a reindexing functor between fibres.
3. Composition and identities in the base correspond to composition and
   identities of reindexing functors, up to the stabilizations already present
   in the calculus.

## Proof sketch

Follows from the substitution lemmas, typing judgements, and context recognition
structure already established (restricted here to the chosen recognitions).
Indexed
coherence rests on the same substitution and normalization laws used earlier for
preservation and progress.
