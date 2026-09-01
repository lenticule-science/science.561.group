---
title: Topos Structure
aliases:
  - Topos Structure
  - topos structure
keywords:
  - topos
  - logic
depends_on:
  - theorem/internal/sheaf-semantics
  - theorem/internal/statespace-geometry
operations:
  - name: finite limits
  - name: exponential
  - name: subobject classifier
---

# Theorem (Topos Structure)

The fixed profile category equipped with `FixedFiniteLimits`,
`FixedExponential`, and `FixedSubobjectClassifier` forms a Heyting-style topos
internally, recorded by `ProfileTopos`.

In particular:

1. It has finite limits and exponentials.
2. It has an internal logic given by fixed recognitions and negation.
3. Subobjects are classified by Ω, and morphisms into Ω correspond to fixed
   predicates.

## Proof sketch

The limit and exponential structure came from the function-term and lattice
operations; the classifier from negation and implication.  Their compatibility
follows from the recognition algebra already established and restricted to
`FixedProfileRecognitions`.
