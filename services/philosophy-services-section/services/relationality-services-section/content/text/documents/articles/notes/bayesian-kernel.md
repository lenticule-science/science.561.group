---
title: Bayesian Kernel
id: bayesian-kernel
role: structure
status: plan
proof_refs: []
description: Stochastic kernel that updates epistemic profiles in proportion to how recognitions survive observation collapses.
---



Stochastic kernel that updates epistemic profiles in proportion to how
recognitions survive observation collapses.

## Definition
- Carrier: transition map from an [Epistemic Profile](./epistemic-profile.md) to a
  probability/weighting over profiles, guided by the [Entropy Functional](./entropy-functional.md).
- Acts like a Markov kernel on recognitions: reweights and normalises according
  to observation likelihood.

## Invariants
- Normalisation: outgoing weights sum to one.
- Entropy monotonicity: expected entropy decreases under informative updates.
- Stability: kernel respects earned recognitions and collapses via nucleus.

## Proof
- Uses: epistemic profiles and entropy to define stochastic transitions.
- Shows that: Bayesian-style updates can be represented as kernels on earned
  recognition carriers.

## Earlier material

## Definition
- Carrier: transition map from an [Epistemic Profile](epistemic-profile.md) to a
  probability/weighting over profiles, guided by the [Entropy Functional](entropy-functional.md).
- Acts like a Markov kernel on recognitions: reweights and normalises according
  to observation likelihood.
