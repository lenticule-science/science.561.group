---
title: Baseline Convergence Test
id: baseline-convergence
role: operator
status: plan
derived_from: acts/baseline-convergence
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Baseline Convergence Test

## Statement

The act [`baseline-convergence`](../acts/baseline-convergence.md) witnesses a
test that detects exactly when a trace tail collapses to the void.

## Definition
- Inputs: [Baseline Remainder](../structure/baseline-remainder.md), [Step Trace](../acts/step-trace.md) context.
- Outputs: updated [Baseline Remainder](../structure/baseline-remainder.md) indicating collapse to baseline.
- Behaviour: applies the act [Baseline Convergence](../acts/baseline-convergence.md) to check iterative reflex steps on a trace tail; if the iteration stabilizes against `Nothing`, the tail collapses to the baseline.

## Invariants
- Detects collapse without altering the trace tail unless convergence is witnessed.
- Resulting baseline remainder matches the earned convergence behaviour (indistinguishable from baseline).

## Proof
- Derived from: [Baseline Convergence](../acts/baseline-convergence.md).
- Shows that: comparing iterative reflex steps against `Nothing` on a trace tail yields a baseline remainder exactly when the tail collapses; uniqueness up to earned equivalence follows from the act.

Given the earned trace relation and the convergence act, this test is fixed up
to nucleus equivalence.
