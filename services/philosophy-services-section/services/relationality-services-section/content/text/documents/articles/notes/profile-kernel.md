---
title: Profile Kernel
id: profile-kernel
role: structure
status: plan
emerges_from: profile-kernel-step
proof_refs:
- profile-kernel-step
- profile-kernel-chain
- observation-kernel
- profile-tower
fields:
- name: step
  type: observation-kernel
  description: base kernel lifted through the profile tower.
- name: tower
  type: profile-tower
  description: profile tower over which the kernel evolves.
- name: chain
  type: profile-kernel-chain
  description: iterated application of the step along the tower.
- name: flow_nucleus
  type: flow-nucleus-adjunction
  description: compatibility data ensuring flow/nucleus commute with kernel action along the tower.
---


Flow–measure kernel lifted along the profile tower, evolving profiles of
recognitions via the observation kernel.

## Definition
- Step: earned by [Profile Kernel Step](./profile-kernel-step.md), lifting
  the [Observation Kernel](../../../triage/relationality/relationality-slop-2025-04/internal/observation-kernel.md) through the
  [Profile Tower](./profile-tower.md) to map a profile to its successor.
- Chain: [Profile Kernel Chain](./profile-kernel-chain.md) composes steps
  to yield an iterated profile-level stochastic chain.

## Invariants
- Compatibility: each step commutes with tower reconstruction; projecting to any
  layer matches the observation-kernel step on that layer.
- Markov property: future profiles depend only on the current profile via the
  earned kernel.
- Stationarity: fixed profiles correspond to [Fixed Chain](fixed-chain.md)
  states; mixing/ergodicity propagate along the chain when earned.
- Flow/nucleus stability: kernel action respects flow/nucleus laws along the tower.

## Proof
- Derived from: [Profile Kernel Step](./profile-kernel-step.md) and
  [Profile Kernel Chain](./profile-kernel-chain.md).
- Uses: [Observation Kernel](../../../triage/relationality/relationality-slop-2025-04/internal/observation-kernel.md) and
  [Profile Tower](./profile-tower.md) to define profile evolution.
- Shows that: lifting the observation kernel along the profile tower yields a
  well-defined profile stochastic chain compatible with tower projections and
  admitting fixed/mixing properties.
