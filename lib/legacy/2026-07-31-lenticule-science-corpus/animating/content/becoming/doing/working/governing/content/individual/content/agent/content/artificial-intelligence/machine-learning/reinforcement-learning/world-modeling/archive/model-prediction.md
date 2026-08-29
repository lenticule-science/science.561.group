---
type: object
class: classical
status: active
depends-on:
  - world-model.md
see-also:
  - imagination-rollout.md
  - model-error.md
  - ../theorems/model-error-compounds.md
references: []
---

# Model prediction

A **model prediction** is the output of applying a world model to
a state-action input: the predicted next state, predicted next
observation, predicted reward, or — chained — a multi-step
trajectory. It is the elementary unit of work a world model
performs.

## Forms

- **One-step state prediction.** $\hat{s}' = T(s, a)$ or
  $\hat{s}' \sim T(\cdot \mid s, a)$.
- **One-step observation prediction.** $\hat{o}' = O(\hat{s}')$
  composed with the transition.
- **Reward prediction.** $\hat{r} = R(s, a)$.
- **Multi-step rollout.** The composition $\hat{s}_{t+k} = T(T(\ldots
  T(s_t, a_t), \ldots), a_{t+k-1})$ — see
  [imagination-rollout](imagination-rollout.md).
- **Distributional prediction.** A probability distribution over
  outcomes, not just a point estimate, supporting uncertainty-aware
  downstream use.

## What predictions are evaluated against

A prediction is evaluated by comparing $\hat{s}'$ to the actually-
observed next state $s'$ (or, when the state is latent, comparing
$\hat{o}'$ to $o'$). The discrepancy is the
[model-error](model-error.md). Different metrics matter for
different downstream uses:

- **Likelihood.** $\log T(s' \mid s, a)$ — natural training
  objective, hard to interpret across scales.
- **Squared error / pixel MSE.** Convenient but poorly aligned
  with task-relevant accuracy.
- **Task return under planned policy.** The most decision-relevant
  metric: did the prediction lead to a good plan?

## The fundamental constraint

A single-step prediction with error $\epsilon$ chained $H$ steps
generically produces a trajectory whose error grows roughly as
$\epsilon \cdot H$ in the linearized setting and exponentially
in the nonlinear setting (see
[model-error-compounds](../theorems/model-error-compounds.md)).
This places a hard ceiling on the planning horizon achievable
with any imperfect model and motivates re-planning, ensemble
disagreement, and trust-region methods.
