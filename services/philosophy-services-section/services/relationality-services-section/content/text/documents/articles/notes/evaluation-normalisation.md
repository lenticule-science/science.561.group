---
title: Evaluation Normalisation
keywords:
  - evaluation
  - normalization
layer: internal-theorem
status: plan
depends_on:
  - math/structure/evaluation-state
  - math/operator/strong-normalization
  - math/operator/confluence
claims:
  - type: operator
    judgement: norm : EvalState ⇀ EvalState selects normal states when they exist
---
# Evaluation Normalisation

## Statement

There exists a partial operator

```text
norm : EvalState ⇀ EvalState
```

that selects the normal state reached by iterating `step` when strong
normalization applies.

## Definition

- Iterates `step` from an initial state; by strong normalization, a normal
  state is reached when the program is in the earned fragment.
- By confluence, this normal state is unique up to earned equivalence; `norm`
  selects it.

## Uniqueness

With `EvalState`, `step`, strong normalization, and confluence fixed, `norm` is
unique in the earned sense.
