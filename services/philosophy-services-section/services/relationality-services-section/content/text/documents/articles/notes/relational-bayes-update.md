---
title: Relational Bayes Update
id: relational-bayes-update
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Probabilistic/entropy-based update of a Bayesian profile.
---



Probabilistic/entropy-based update of a Bayesian profile.

## Definition
- Inputs: a [Bayesian Profile](./bayesian-profile.md) and an
  [Observation](./observation.md).
- Output: updated [Bayesian Profile](./bayesian-profile.md) with
  reweighted recognitions.
- Behaviour: reweight recognitions using the observation likelihood; renormalise
  and recompute entropy; optionally collapse with fixed-invariant semantics.

## Invariants
- Normalisation: posterior probabilities sum to 1.
- Entropy decrease: expected entropy does not increase under informative
  observations.

## Proof
- Uses: [Bayesian Profile](./bayesian-profile.md),
  [Observation](./observation.md), and
  [Entropy Functional](entropy-functional.md).
- Produces: updated [Bayesian Profile](./bayesian-profile.md).
- Shows that: Bayes-like updates fit within the relational epistemic framework.

## Earlier material

## Definition
- Inputs: a [Bayesian Profile](bayesian-profile.md) and an
  [Observation](../../../structure/observation.md).
- Output: updated [Bayesian Profile](bayesian-profile.md) with
  reweighted recognitions.
- Behaviour: reweight recognitions using the observation likelihood; renormalise
  and recompute entropy; optionally collapse with fixed-invariant semantics.

## Proof
- Uses: [Bayesian Profile](bayesian-profile.md),
  [Observation](../../../structure/observation.md), and
  [Entropy Functional](entropy-functional.md).
- Produces: updated [Bayesian Profile](bayesian-profile.md).
- Shows that: Bayes-like updates fit within the relational epistemic framework.
