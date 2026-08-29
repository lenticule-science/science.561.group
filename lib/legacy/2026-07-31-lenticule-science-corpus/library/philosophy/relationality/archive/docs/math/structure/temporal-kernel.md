---
title: Temporal Kernel
id: temporal-kernel
role: structure
status: plan
proof_refs: []
---


# Temporal Kernel

Kernel describing time evolution of recognitions (distinct from stochastic
Markov evolution).

## Definition
- Transition: time-indexed operator on recognitions driven by
  [Flow Context](../operator/flow-context.md) without probabilistic weighting.
- Purpose: model deterministic or schedulable time evolution.

## Invariants
- Semigroup property: kernels compose over time intervals.
- Flow compatibility: respects admissible flow/nucleus.

## Proof
- Uses: flow context to define deterministic evolution.
- Shows that: time kernels can be defined apart from stochastic kernels.
