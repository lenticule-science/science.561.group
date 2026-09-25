---
type: morphism
class: classical
status: active
depends-on:
  - teaching/explanations/model-based-rl.md
  - imagination.md
see-also:
  - ../objects/imagination-rollout.md
  - ../theorems/dyna-convergence.md
references:
  - references/sutton-dyna1991.md
  - references/hafner-dreamer2020.md
  - references/schrittwieser-muzero2020.md
title: Model-based policy improvement
description: Model-based policy improvement is the morphism
---

# Model-based policy improvement

**Model-based policy improvement** is the morphism

$$
\text{(policy, world model)} \;\longrightarrow\;
\text{(improved policy)}
$$

taking a policy and a world model and returning an improved policy
without consuming additional environment interaction. The improvement
is computed entirely from imagined trajectories under the model.

## Three principal forms

**Dyna-style value updates.** Sample state-action pairs from a
buffer; use the model to predict next state and reward; perform a
Bellman update on the value function. Repeat. The policy is
implicit in the value function (greedy or epsilon-greedy w.r.t.
$Q$). See [dyna-convergence](dyna-convergence.md).

**Backpropagation through imagined trajectories** (Dreamer). For
each seed state, run an imagination rollout under the current
policy. Compute discounted returns under the predicted reward.
Backpropagate the gradient of return through the trajectory back
into the policy parameters. Requires a differentiable model and a
differentiable policy. The dominant pattern in modern deep MBRL.

**Tree search with the model** (MuZero, AlphaZero). At each
real-world decision point, run a tree search using the model to
expand and evaluate nodes. The improved policy is the empirical
visit-count distribution at the root, used both as an action and
as a training target for the policy network.

## What "improvement" means

Each form has a slightly different notion of "improved":

- **Dyna.** The value function more closely approximates $V^\pi$
  for the current policy, or $V^*$ if value iteration is the
  update rule.
- **Imagination + backprop.** The expected return under the model
  along the imagined trajectory increases. This may or may not
  correspond to higher real-environment return — depends on
  model accuracy on the on-policy distribution.
- **Tree search.** The visit-count distribution concentrates on
  high-value actions according to the model. Stronger than the
  policy's current preferences if the search horizon allows.

## The fundamental risk

Model-based policy improvement improves policy under the
*model's* belief about the world. If the model is wrong on the
states the policy visits, the policy improves at the model's
fantasy and degrades on reality. This is the **model-exploitation**
failure mode, and it is the principal practical hazard of
imagination-based MBRL.

Mitigations are essentially all about constraining the policy
to the model's trust region: ensemble-disagreement penalties,
short rollouts with frequent re-grounding, conservatism penalties
on out-of-distribution actions. A well-engineered MBRL system
spends most of its complexity on this constraint, not on the
imagination itself.
