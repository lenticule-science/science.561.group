---
title: Temporal Kernel
id: temporal-kernel
role: structure
status: plan
proof_refs: []
description: Kernel describing time evolution of recognitions (distinct from stochastic Markov evolution).
---



Kernel describing time evolution of recognitions (distinct from stochastic
Markov evolution).

## Definition
- Transition: time-indexed operator on recognitions driven by
  [Flow Context](./flow-context.md) without probabilistic weighting.
- Purpose: model deterministic or schedulable time evolution.

## Invariants
- Semigroup property: kernels compose over time intervals.
- Flow compatibility: respects admissible flow/nucleus.

## Proof
- Uses: flow context to define deterministic evolution.
- Shows that: time kernels can be defined apart from stochastic kernels.

## Earlier material

## Definition
- Transition: time-indexed operator on recognitions driven by
  [Flow Context](flow-context.md) without probabilistic weighting.
- Purpose: model deterministic or schedulable time evolution.
