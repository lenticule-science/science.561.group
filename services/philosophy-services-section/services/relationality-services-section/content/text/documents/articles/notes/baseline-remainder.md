---
title: Baseline Remainder
id: baseline-remainder
role: structure
status: plan
derived_from: acts/baseline-limit
proof_refs: []
---



## Definition

- Carrier: the stabilized tail of a trace.
- Source: earned via [Baseline Limit](./baseline-limit.md), using convergence of [Baseline Convergence](./baseline-convergence.md) on [Tail Trace](./tail-trace.md).

## Invariants
- Stability: tail remains fixed under further renewal/iteration.
- Compatibility: tail aligns with the earned baseline convergence behaviour.

## Proof
- Derived from: [Baseline Limit](./baseline-limit.md).
- Shows that: applying baseline convergence to tail traces yields a stabilized remainder, unique up to earned equivalence.
