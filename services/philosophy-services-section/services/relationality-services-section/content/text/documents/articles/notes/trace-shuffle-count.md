---
title: Trace Shuffle Count
keywords:
  - trace
  - shuffle
  - combinatorics
layer: internal-theorem
status: plan
claims:
  - type: operator
    judgement: "|Reorder(T_n)| satisfies the Fibonacci recurrence"
depends-on:
  - math/structure/trace-shuffle-class
description: Decomposition and free shuffle imply that Reorder(Tn) splits into reorderings beginning with a T{n-1} progress and those beginning with a T{n-2} progress, yielding the Fibonacci recurrence.
---
# Trace Shuffle Count

## Statement

The sizes of shuffle classes satisfy

```text
|Reorder(T_0)| = 1, |Reorder(T_1)| = 1,
|Reorder(T_n)| = |Reorder(T_{n-1})| + |Reorder(T_{n-2})| for n ≥ 2
```

so `|Reorder(T_n)| = F_n`.

## Proof sketch

Decomposition and free shuffle imply that `Reorder(T_n)` splits into reorderings
beginning with a `T_{n-1}` progress and those beginning with a `T_{n-2}`
progress, yielding the Fibonacci recurrence.

## Uniqueness

Given the earned shuffle classes, the count is determined.
