---
title: Bayes Kernel Update
id: bayes-kernel-update
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Applies a Bayesian kernel to reweight epistemic profiles given an observation.
---



Applies a Bayesian kernel to reweight epistemic profiles given an observation.

## Definition
- Inputs: a [Bayesian Kernel](./bayesian-kernel.md), an
  [Epistemic Profile](./epistemic-profile.md), and an
  [Observation](./observation.md).
- Output: updated [Epistemic Profile](./epistemic-profile.md)
  reweighted and renormalised.
- Behaviour: evaluate observation likelihoods, apply kernel transition, and
  normalise via nucleus/entropy.

## Invariants
- Normalisation: resulting profile weights sum to one.
- Entropy: expected entropy decreases under informative observations.

## Proof
- Uses: Bayesian kernel mechanics plus observation evidence.
- Shows that: kernel-based Bayesian updates are realisable in the recognition
  framework.
