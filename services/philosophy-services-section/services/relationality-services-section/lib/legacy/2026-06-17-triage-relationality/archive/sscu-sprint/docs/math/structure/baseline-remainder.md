---
title: Baseline Remainder
role: structure
derived_from: acts/baseline-limit
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition

- Carrier: the stabilized tail of a trace.
- Source: earned via [Baseline Limit](../acts/baseline-limit.md), using convergence of [Baseline Convergence](../acts/baseline-convergence.md) on [Tail Trace](../acts/tail-trace.md).

## Invariants
- Stability: tail remains fixed under further renewal/iteration.
- Compatibility: tail aligns with the earned baseline convergence behaviour.

## Proof
- Derived from: [Baseline Limit](../acts/baseline-limit.md).
- Shows that: applying baseline convergence to tail traces yields a stabilized remainder, unique up to earned equivalence.
