---
title: Evaluation Step
tags:
  - evaluation
  - reduction
layer: internal-theorem
status: plan
depends-on:
  - math/structure/evaluation-state
  - theorem/internal/substitution-discipline
  - theorem/internal/reduction-normalization-structure
claims:
  - type: operator
    judgement: step : EvalState ⇀ EvalState
introduces: operator
part-of: relational-computer
computer-system-type: primitive
in-domain: science/relationality# Evaluation Step

## Statement

There exists a partial operator

```text
step : EvalState ⇀ EvalState
```

that applies the earned primitive reduction to the focused term and updates the
evaluation state accordingly, using substitution discipline and reduction
structure.

## Definition by acts

- Applies the primitive step relation to the focused term.
- Uses substitution discipline to compute the new term.
- Returns a state with the same or updated frame per admissible frame
  operations from the evaluation-context structure.

## Uniqueness

Given `EvalState`, substitution discipline, and reduction structure, `step` is
fixed up to earned equivalence.
