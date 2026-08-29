---
title: Task Parallelization
keywords:
  - concurrency
  - scheduling
layer: system
status: plan
depends_on:
  - system/structure/task-carrier
  - system/operator/task-precedence
  - math/operator/task-commutation
claims:
  - type: operator
    judgement: Parallel partitions finite task sets into commuting subsets consistent with Precedes
---
# Task Parallelization

## Statement

Given `Tasks` and `Precedes` from the scheduling structure and `Commute` from
task commutation, there is a partitioning operator

```text
Parallel : 𝒫_fin(Tasks) ⇀ list[set[Task]]
```

that assigns to each finite set of tasks a partition into subsets that:

- are pairwise commuting within each subset according to `Commute`, and
- are consistent with `Precedes` (no subset violates dependency order).

Executing tasks in parallel within each subset and respecting `Precedes`
yields the same observable outcome as any sequential execution consistent with
`Precedes`.

## Proof sketch

Use `Commute` to group commuting tasks; ensure each group respects `Precedes`.
By commutation and scheduling properties, any such grouping is behaviorally
equivalent.

## Uniqueness

Given `Tasks`, `Precedes`, and `Commute`, such partitions are determined up to
equivalent regrouping; the parallelization operator is fixed in the earned
sense.
