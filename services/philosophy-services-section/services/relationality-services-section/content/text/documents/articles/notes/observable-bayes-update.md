---
title: Observable Bayes Update
id: observable-bayes-update
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Typed probabilistic/Bayesian update operator as a combinator in the observable type system.
---



Typed probabilistic/Bayesian update operator as a combinator in the observable
type system.

## Definition
- Inputs: a [Bayesian Profile](./bayesian-profile.md), an
  [Observation](./observation.md), and observable operators from
  [Observable Typed Operator](./observable-typed-operator.md).
- Output: updated [Bayesian Profile](./bayesian-profile.md).
- Behaviour: compute likelihood via observable operators, reweight the profile,
  renormalise, and recompute entropy; enforce typing.

## Invariants
- Normalisation: probabilities sum to 1.
- Type safety: only well-typed updates allowed.
- Entropy monotonicity under informative updates.

## Proof
- Uses: observable algebra and typed rules to perform Bayesian update.
- Produces: posterior profile.
- Shows that: Bayesian updates can be expressed as typed observables.
