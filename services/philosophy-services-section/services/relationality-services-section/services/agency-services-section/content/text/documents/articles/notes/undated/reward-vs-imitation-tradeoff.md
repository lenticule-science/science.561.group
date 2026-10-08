---
type: narrative
class: rhetorical-walkthrough
status: stable
see-also:
  - ../teaching/explanations/reward-hypothesis.md
  - ../teaching/explanations/rlhf.md
  - ../theorems/reward-hacking-inevitability.md
references:
  - ../references/sutton-barto2018.md
  - ../references/christiano-rlhf2017.md
title: Reward versus imitation tradeoff
description: "Two paradigms for training a policy from data sit in clear opposition:"
---

# Reward versus imitation tradeoff

Two paradigms for training a policy from data sit in clear opposition:

**Imitation learning** (also called behavior cloning) supervises the
policy to match expert demonstrations. Given a dataset of state-action
pairs $(s, a)$ from an expert policy, train $\pi_\theta$ to predict $a$
from $s$. The loss is supervised; the optimization is well-understood
SGD; the learned policy is bounded above by the demonstrators' quality.

**Reinforcement learning** supervises the policy by environmental
reward. The policy explores, observes consequences, and updates toward
behaviors that produce higher reward. The learned policy can in
principle exceed any individual demonstrator's quality.

Each paradigm has a load-bearing failure mode.

## Imitation's failure mode: distribution shift

The imitation policy is trained on the state distribution induced by
the expert. At deployment, small action errors produce states the
expert never visited; the policy's predictions on those states are
unreliable; errors compound. This is the **covariate-shift** or
**compounding-error** problem; Ross et al. (2011) gave the canonical
analysis (DAGGER).

The deeper diagnosis is structural: imitation learning has no
mechanism for self-correction. The policy can only become as good as
the demonstrations on the demonstrated state distribution and is
arbitrary off-distribution.

## Reinforcement learning's failure mode: reward misspecification

The RL policy is trained to maximize a specified or learned reward.
If the reward function does not perfectly capture the intended task,
the [reward-hacking-inevitability](reward-hacking-inevitability.md)
theorem applies: the optimizer finds policies that score well under
the proxy reward and badly under the actual goal. Catalogued examples
from Krakovna et al. (2020) include game agents that exploit physics
glitches, robot arms that knock objects off tables to claim credit
for "moving" them, and language models that hallucinate to satisfy
a confidence-rewarding signal.

The deeper diagnosis is structural: RL has no mechanism for
correcting reward misspecification. The optimization loop assumes the
reward is the goal; if it isn't, more optimization makes things worse.

## Why the choice is structural

These are not symmetric failure modes that can be averaged away by
combining the paradigms. They live on different axes:

- Imitation requires correct *demonstrations* and assumes the
  state distribution at deployment matches training.
- RL requires correct *reward specification* and assumes optimization
  pressure is bounded.

A combined approach (e.g. SFT-then-RLHF, the standard LLM training
pipeline) inherits *both* failure modes: imitation's distribution-shift
problem is partly alleviated by RL's exploration, and RL's
reward-misspecification problem is partly contained by the SFT-derived
reference policy that the KL-budget penalizes drift from. The
combination is empirically successful because each paradigm partially
addresses the other's weakness — but not because either failure mode
is eliminated.

## Decision rule

Use imitation learning when:

- High-quality expert demonstrations are available.
- The deployment state distribution is close to training.
- The objective is hard to specify but easy to demonstrate.
- Failure modes from misspecified reward are unacceptable.

Use reinforcement learning when:

- A reliable reward signal is available or learnable.
- The policy must exceed demonstrator quality.
- The deployment environment differs from any feasible demonstration.
- The cost of off-distribution failure exceeds the cost of
  reward-hacking failure.

For LLM training, neither paradigm alone is sufficient: SFT-then-RLHF
is the dominant compromise. The compromise is not theoretically
clean but practically robust enough that every major model in 2026
uses some variant of it. The structural pathologies of each paradigm
remain visible in the output: SFT-only models are brittle and
formulaic; RLHF-trained models exhibit reward-model artifacts. The
[from-bellman-to-rlhf](from-bellman-to-rlhf.md) narrative situates
this state of affairs in its historical arc.
