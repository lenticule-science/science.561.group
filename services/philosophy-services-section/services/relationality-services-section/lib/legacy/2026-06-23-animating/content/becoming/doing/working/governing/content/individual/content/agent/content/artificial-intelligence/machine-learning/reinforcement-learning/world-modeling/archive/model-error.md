---
type: object
class: classical
status: active
depends-on:
  - world-model.md
  - model-prediction.md
see-also:
  - ../theorems/model-error-compounds.md
  - ../theorems/sim-to-real-gap-bound.md
references: []
---

# Model error

**Model error** is the discrepancy between a world model's
predictions and what actually happens in the environment. It is
the central quantity controlling how useful a learned model is:
the model is only as valuable as its predictions are accurate
*on the states the policy actually visits*.

## Decomposition

Model error decomposes into:

- **Aleatoric.** Irreducible randomness in the environment. No
  model can eliminate this; the best a model can do is produce
  the correct distribution.
- **Epistemic.** Reducible-with-more-data uncertainty. The model
  doesn't know enough yet. Shrinks as data accumulates.
- **Approximation error.** The model class doesn't contain the
  true dynamics. Persists even with infinite data.
- **Distribution shift error.** The model is accurate on the
  training distribution but the policy visits a different
  distribution. The dominant failure mode in deep MBRL.

## Per-step versus accumulated

Per-step model error of $\epsilon$ does not stay at $\epsilon$
when chained. Under generic conditions, $H$-step rollout error
grows roughly as $\epsilon H$ (linear, optimistic case) or
$\epsilon \cdot e^{LH}$ (nonlinear, with Lyapunov exponent $L$).
This is the
[model-error-compounds](../theorems/model-error-compounds.md)
theorem and is the principal architectural constraint on
imagination-based methods. See also the
[sim-to-real-gap-bound](../theorems/sim-to-real-gap-bound.md)
which is essentially the same theorem applied to the simulator-
to-real-world distribution shift.

## Distributional vs pointwise

A model can have low pointwise error (its mean prediction is
close to truth) and still be a poor model if it is **overconfident**
— assigning low variance to predictions that are actually
uncertain. Overconfident learned models are extremely dangerous
in planning because they make the planner optimistic about
trajectories the model has not seen and cannot accurately predict.

Standard remediation:

- **Ensembles.** Train $N$ independent models; use their
  disagreement as an uncertainty estimate; treat states with high
  disagreement as outside the model's support.
- **Bayesian methods.** Maintain a posterior over model
  parameters; rollouts sample from the posterior; uncertainty
  is propagated.
- **Trust regions.** Restrict planning to states the model is
  confident about; re-plan when leaving the trust region.

## The accuracy-where-it-matters principle

A model does not need uniform accuracy. It needs accuracy on the
*on-policy state distribution* — the states the policy will visit
under the model. This is a fixed-point condition: improving the
policy changes which states matter, which can require re-training
the model on the new distribution. Failure to close this loop
causes the classic *deadly triad* in model-based RL: bootstrapping,
function approximation, and off-policy data interact catastrophically
when the model error on off-policy states is large.
