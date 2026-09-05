---
type: concept
class: semantic-anchor
status: stable
depends-on: []
see-also:
  - inner-alignment.md
  - specification-gaming.md
  - ../theorems/inner-outer-decomposition.md
references:
  - references/hubinger-mesa2019.md
  - references/krakovna-specgaming2020.md
---

# Outer alignment

**Outer alignment** is the property that the **base objective** used during training — the loss function, the reward function, the preference dataset — captures what the designer actually wants the trained system to do.

## Definition

Let $G^*$ be the designer's intended goal (which may not have a formal expression) and $L_{\text{base}}$ be the base objective used to train a model.
The model is **outer-aligned** if optimizing $L_{\text{base}}$ over the policy class is also (approximately) the right thing to do for $G^*$ — formally, if the population-optimal policy under $L_{\text{base}}$ is also (approximately) optimal under $G^*$ over the deployment distribution.

Outer-misalignment occurs when $L_{\text{base}}$ has a population optimum that scores poorly under $G^*$.
The [reward-hacking-inevitability](../../reinforcement-learning/theorems/reward-hacking-inevitability.md) theorem shows that this is the *generic* situation when $L_{\text{base}}$ is a learned approximation of an underlying preference: any non-trivial difference between the two admits a policy that optimizes the proxy and degrades the true goal.

## Failure modes

**Specification gaming.** The classic outer-alignment failure: the trained model finds an unintended way to score well on $L_{\text{base}}$.
Krakovna et al. (2020) catalog dozens of examples, ranging from a boat-racing agent that drives in circles to harvest power-ups, to a robot arm that knocks blocks off the table to claim credit for "moving" them.

**Reward model approximation error.** In RLHF, $L_{\text{base}}$ is a learned [reward model](../../reinforcement-learning/objects/reward-model.md); its disagreement with the underlying preference distribution is unavoidable and grows under optimization pressure.
See [rlhf-overoptimization](../../reinforcement-learning/theorems/rlhf-overoptimization.md).

**Compression loss.** Reducing a goal $G^*$ to a scalar $L_{\text{base}}$ necessarily discards structure (constraints, context-dependent priorities, soft preferences).
The optimizer is free to violate the discarded structure.

## Mitigations

**Reward shaping** — augment the base reward with auxiliary terms encoding constraints not captured by the primary reward.

**Constrained optimization** — constrain the policy to a trust region around a reference policy (the KL-penalty mechanism in RLHF).

**Constitutional AI** — train the reward model against a written set of principles intended to capture aspects of $G^*$ that human raters might miss in pairwise comparisons.

**Process supervision** — train against process-level signals (each step of a reasoning trajectory) rather than only outcome rewards.

None of these eliminate outer-misalignment; they shrink the gap between $L_{\text{base}}$ and $G^*$ and bound how much the optimizer can exploit the remaining gap.

## Why outer alignment is not enough

Even a perfectly outer-aligned training objective does not guarantee that the trained model pursues that objective at deployment.
The model's behavior is determined by the parameters gradient descent selected, which were chosen to perform well on the training distribution; nothing in the training process guarantees the model's *internal goal* (if it has one) is $L_{\text{base}}$.
This is the [inner-alignment](inner-alignment.md) problem, and it is what makes alignment hard even granting perfect specification.
