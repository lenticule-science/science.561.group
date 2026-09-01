---
title: Trace Shuffle Count
tags:
  - trace
  - shuffle
  - combinatorics
layer: internal-theorem
status: plan
depends-on:
  - math/structure/trace-shuffle-class
claims:
  - type: operator
    judgement: |Reorder(T_n)| satisfies the Fibonacci recurrence
introduces: operator
part-of: relational-computer
computer-system-type: primitive
in-domain: science/relationality# Trace Shuffle Count

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
