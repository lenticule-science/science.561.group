---
type: question
class: open-problem
status: open
see-also:
  - ../objects/replay-buffer.md
  - ../morphisms/importance-sampling.md
  - teaching/explanations/deadly-triad.md
references:
  - references/sutton-barto2018.md
---

# Offline RL and distributional shift

**Offline reinforcement learning** is the regime in which the agent
is given a fixed dataset of transitions and must learn a policy
without further environment interaction. This is the practical
setting for many real-world applications (medical decision-making,
autonomous-driving fleet learning, recommendation systems with
expensive A/B tests).

The fundamental difficulty is **distributional shift**: the policy
the agent wants to evaluate (or deploy) differs from the policy that
generated the dataset. Off-policy techniques in principle handle
this, but their guarantees degrade rapidly as the policy difference
grows.

**Question.** What conditions on the dataset, policy class, and
algorithmic structure permit reliable offline policy learning without
catastrophic distributional shift, and is there a clean
characterization of when offline RL is provably superior to behavior
cloning?

## The structural problem

Online RL agents collect data on-policy, exploring around the current
policy and continuously updating. The exploration provides the
visitation needed for [q-learning-convergence](../theorems/q-learning-convergence.md)
and the on-policy data avoids the worst of the
[deadly-triad](teaching/explanations/deadly-triad.md).

Offline RL has neither feature. The dataset has finite support; any
policy improvement requires evaluating actions outside that support;
the value estimates for unsupported actions are arbitrary; optimizing
against them produces overoptimistic policies that fail at deployment.

This is structurally similar to the
[reward-hacking](../theorems/reward-hacking-inevitability.md) problem:
optimizing against a value function that is approximate off-support
finds policies that exploit the approximation rather than the
underlying value.

## Approaches

**Conservative Q-learning** (Kumar et al. 2020). Penalize the value
estimate for actions not in the dataset, biasing the policy toward
behaviors well-supported by the data.

**Policy constraints / behavior regularization** (BCQ, BRAC, AWR).
Constrain the learned policy to remain close to the behavior policy
in some divergence (KL, total variation). Limits how far off-support
the value estimates can go, at the cost of limiting policy
improvement.

**Decision Transformer and trajectory transformers** (Chen et al.
2021). Reformulate offline RL as supervised sequence modeling. Side-steps
the value-bootstrap problem by avoiding bootstrapping; trades off
the ability to extrapolate beyond the dataset.

**Implicit Q-learning** (Kostrikov et al. 2022). Use expectile
regression to fit only the value of in-distribution actions; avoid
the explicit max over actions that drives off-support overestimation.

## Open subquestions

**Q1.** Is there a sample-complexity bound for offline RL that is
strictly better than the corresponding bound for behavior cloning,
under specified conditions?

Known partial results (e.g. Yin–Wang 2021, Xie–Cheng–Agarwal 2021)
give such bounds under coverage assumptions; the gap to behavior
cloning under those assumptions is often surprisingly small.

**Q2.** What does "coverage" actually mean in high-dimensional state
spaces where exact coverage is impossible? Notions like concentrability,
single-policy concentrability, and effective coverage are competing
formalizations; none is universally accepted.

**Q3.** Does the answer differ for offline RLHF? An offline RLHF
dataset (preference comparisons collected once) is the standard
setting for LLM fine-tuning; the [reward
model](../objects/reward-model.md) is an offline-learned function. The
[overoptimization](../theorems/rlhf-overoptimization.md) phenomenon
is in part an offline-RL-distributional-shift phenomenon dressed in
RLHF clothing. Whether tools developed for one transfer to the other
is open.

## Connection to deployment

Most production RL deployments — recommendation, dialog, treatment
selection — are offline or near-offline. The classical online theorems
are therefore not directly applicable to most real systems. This
question is the practical version of "does any of this theory matter
for what we actually do." A clean resolution would have substantial
applied consequences.
