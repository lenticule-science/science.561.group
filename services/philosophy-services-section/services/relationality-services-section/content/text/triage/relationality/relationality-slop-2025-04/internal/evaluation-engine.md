---
title: Evaluation Engine
aliases:
  - Evaluation Engine
  - evaluation engine
date-created: "2026-03-04T00:00:00"
keywords:
  - evaluation
  - substitution
  - normalization
depends_on:
  - seed-evaluation-context
  - build-evaluation-context
  - seed-term
  - substitution-term
  - reduce
  - substitute-reducibility
  - normalize-strongly
  - ensure-confluence
---

# Theorem (Evaluation Engine)

The acts governing evaluation contexts, substitution, and normalization form a
coherent engine for executing relational terms.

1. **Context scaffolding.**
   `SeedEvaluationContext` and `BuildEvaluationContext` provide the inductive
   structure of evaluation frames.  They ensure that any reduction step can be
   reintroduced into a larger program without losing the witness trail.

2. **Term insertion.**
   `SeedTerm` and `SubstitutionTerm` embed terms inside those contexts and record
   substitutions explicitly, guaranteeing that every reduction is justified by an
   earned trace.

3. **Substitution discipline.**
   `SubstituteReducibility` (with the `SubstitutionTerm` act above) shows that
   substituting reducible terms preserves reducibility, so evaluation contexts
   remain well formed.

4. **Reduction behaviour.**
   `Reduce` captures the primitive step relation, while `NormalizeStrongly` and
   `EnsureConfluence` ensure that reductions terminate uniquely (up to the earned
   equivalences) when the hypotheses of the reducibility argument are met.

Together these acts witness that the relational calculus has a well-defined
evaluation engine: evaluation frames may be extended, substitutions are safe,
and every reduction converges to a unique normal form.  Future simulations can
cite this theorem rather than the individual acts when implementing interpreters
or runtime systems.
