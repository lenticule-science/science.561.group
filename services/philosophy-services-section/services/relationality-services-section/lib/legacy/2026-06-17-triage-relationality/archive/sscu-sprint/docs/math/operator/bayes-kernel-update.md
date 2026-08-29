---
title: Bayes Kernel Update
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Applies a Bayesian kernel to reweight epistemic profiles given an observation.

## Definition
- Inputs: a [Bayesian Kernel](../structure/bayesian-kernel.md), an
  [Epistemic Profile](../structure/epistemic-profile.md), and an
  [Observation](../structure/observation.md).
- Output: updated [Epistemic Profile](../structure/epistemic-profile.md)
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
