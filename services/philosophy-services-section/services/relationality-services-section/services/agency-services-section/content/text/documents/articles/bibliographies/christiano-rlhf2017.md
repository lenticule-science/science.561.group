---
type: reference
class: empirical-paper
status: stable
title: Christiano et al. 2017 — Deep RL from Human Preferences
description: Christiano, Paul F., Jan Leike, Tom Brown, Miljan Martic, Shane Legg, and Dario Amodei.
---

# Christiano et al. 2017 — Deep RL from Human Preferences

Christiano, Paul F., Jan Leike, Tom Brown, Miljan Martic, Shane Legg,
and Dario Amodei. "Deep Reinforcement Learning from Human
Preferences." *Advances in Neural Information Processing Systems* 30
(2017).

The first end-to-end demonstration of training a deep-RL policy
against a learned reward model from human preference comparisons.
The paper showed that a small number of human comparisons (on the
order of $10^3$) was sufficient to train an Atari and MuJoCo policy
to behave according to subtle human preferences that would be
difficult to specify analytically.

The pipeline introduced in this paper — collect preference
comparisons, fit a reward model under a Bradley–Terry assumption,
optimize the policy against the reward model with a KL penalty — is
the structural template for all subsequent [RLHF](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/archive/teaching/explanations/rlhf.md)
work, including the InstructGPT (Ouyang et al. 2022) line that
became the dominant LLM training paradigm.

Cited by the [rlhf](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/archive/teaching/explanations/rlhf.md) concept, the
[reward-model](../notes/undated/reward-model.md) object, and the
[rlhf-overoptimization](../notes/undated/rlhf-overoptimization.md) and
[reward-hacking-inevitability](../notes/undated/reward-hacking-inevitability.md)
theorems.

The paper does not address overoptimization (it long predates Gao et
al. 2023) and presents the recipe optimistically. The structural
pathologies the technique inherits from the
[reward-hacking-inevitability](../notes/undated/reward-hacking-inevitability.md)
theorem are not visible in the toy environments the paper used; they
became visible at scale.
