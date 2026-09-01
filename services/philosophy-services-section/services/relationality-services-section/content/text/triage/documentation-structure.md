---
title: Documentation Structure
keywords:
  - documentation
  - structure
layer: internal-theorem
status: plan
depends_on:
  - structure
---

There exists a relational structure in the sense of *Structure* whose points
are documentation artefacts and whose relations capture their dependencies.

Formally, let:

- `|D|` be the set of all documentation artefacts participating in the
  relational computer:
  - act documents in `docs/math/acts/`,
  - internal and external theorem documents in `docs/math/theorem/**`,
  - specifications in `docs/app/spec/`,
  - architecture documents in `docs/app/arch/`.
- For each declared dependency kind we choose a relation:
  - a binary relation `Dep ⊆ |D| × |D|` such that `(X, Y) ∈ Dep` when
    `Y` lists `X` in its `depends_on` field,
  - additional binary relations for other well‑typed references (e.g.,
    `Implements`, `Realises`) as we introduce them.

This data defines a relational structure `D = (|D|, Dep, …)` in the sense of
*Structure*: the underlying set is `|D|` and the distinguished relations are
the dependency relations between docs.
