---
name: relational-bayes-update
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



Probabilistic/entropy-based update of a Bayesian profile.

## Definition
- Inputs: a [Bayesian Profile](../structure/bayesian-profile.md) and an
  [Observation](../structure/observation.md).
- Output: updated [Bayesian Profile](../structure/bayesian-profile.md) with
  reweighted recognitions.
- Behaviour: reweight recognitions using the observation likelihood; renormalise
  and recompute entropy; optionally collapse with fixed-invariant semantics.

## Invariants
- Normalisation: posterior probabilities sum to 1.
- Entropy decrease: expected entropy does not increase under informative
  observations.

## Proof
- Uses: [Bayesian Profile](../structure/bayesian-profile.md),
  [Observation](../structure/observation.md), and
  [Entropy Functional](entropy-functional.md).
- Produces: updated [Bayesian Profile](../structure/bayesian-profile.md).
- Shows that: Bayes-like updates fit within the relational epistemic framework.
