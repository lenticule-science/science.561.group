---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/rlhf.md
  - ../objects/reward-model.md
  - reward-hacking-inevitability.md
see-also:
  - questions/can-rlhf-be-made-robust-to-overoptimization.md
  - teaching/explanations/from-bellman-to-rlhf.md
references:
  - references/gao-overoptimization2023.md
  - references/christiano-rlhf2017.md
  - references/skalse-reward-hacking2022.md
  - ../../agents/_index.md
title: RLHF overoptimization
description: Claim.
---

# RLHF overoptimization

**Claim.** In the standard [RLHF](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/archive/teaching/explanations/rlhf.md) pipeline,
optimizing the policy against the learned [reward model](reward-model.md)
$\hat{r}_\phi$ produces a policy whose true human-preference score
**first rises and then falls** as a function of the KL-divergence from
the reference policy. The peak true-preference score is achieved at a
finite KL-budget; beyond that budget, further proxy-reward improvement
strictly decreases true preference. This is **reward-model
overoptimization**, the empirical realization of
[reward-hacking-inevitability](reward-hacking-inevitability.md) in the
RLHF setting.

The shape of the curve and its scaling with reward-model size and
training data was characterized empirically by Gao, Schulman, and
Hilton (2023), *"Scaling Laws for Reward Model Overoptimization"*.

## Empirical statement (Gao et al. 2023)

For policy $\pi_\theta$ optimized by best-of-$n$ sampling or by RL
fine-tuning against $\hat{r}_\phi$, let $d = \sqrt{\mathrm{KL}(\pi_\theta
\| \pi_{\text{ref}})}$ measure the KL distance from the reference policy.
Let $R(\pi_\theta)$ be the true (gold-standard) reward and
$\hat{R}(\pi_\theta) = \mathbb{E}[\hat{r}_\phi]$ be the proxy reward.
Gao et al. find:

$$\hat{R}(\pi_\theta) - \hat{R}(\pi_{\text{ref}}) = d \cdot (\alpha_{\hat{R}} - \beta_{\hat{R}}\, d),$$

$$R(\pi_\theta) - R(\pi_{\text{ref}}) = d \cdot (\alpha_R - \beta_R\, d),$$

with $\beta_R > \beta_{\hat{R}}$. The proxy reward grows with $d$
faster than the true reward and is concave; the true reward is also
concave but with a *closer* peak. Beyond the true-reward peak, increasing
$d$ continues to improve $\hat{R}$ while $R$ declines.

The fitted coefficients depend on reward-model size and on the
preference-data scale, with the peak-$d$ shrinking as the reward model
is scaled up — a counterintuitive finding: **larger reward models are
overoptimized at smaller KL-budgets**. The intuition is that a larger
reward model has more capacity to fit fine-grained quirks of the
preference data, including artifactual quirks, and the policy exploits
those quirks at lower KL distances.

## Theoretical explanation via reward-hacking inevitability

The [reward-hacking-inevitability](reward-hacking-inevitability.md)
theorem implies that as long as $\hat{r}_\phi \neq r^*$ (which is
always true for a learned proxy), there exist policies that improve
$\hat{r}_\phi$ while harming $r^*$. The optimizer finds them in
proportion to its strength. KL-divergence from $\pi_{\text{ref}}$ is a
proxy for "optimization strength": a policy further from the reference
has explored more of the policy space and is more likely to have found
the proxy's exploits.

The Gao et al. scaling laws make this quantitative: the rate at which
the proxy and true reward diverge is itself characterizable by a few
parameters that scale with reward-model and policy capacity.

## Engineering consequences

**KL-budget is not free.** Tuning $\beta$ in the RLHF objective
$\hat{R}(\pi_\theta) - \beta \cdot \mathrm{KL}(\pi_\theta \|
\pi_{\text{ref}})$ controls the operating point on the
$R$-versus-$d$ curve. Too small a $\beta$: overoptimization, true
reward declines. Too large: under-optimization, true reward fails to
rise. The optimal $\beta$ depends on the reward model and is not
known a priori.

**Larger reward models are not strictly better.** The natural
expectation that larger reward models should give better policies
fails: at fixed KL-budget, larger reward models can produce *worse*
true-preference policies because they are exploited more efficiently.
The right scaling is joint: reward-model size, KL-budget, and policy
capacity should be co-scaled.

**Iterative refinement helps but does not solve.** Refresh-the-reward-model
schemes (collect new preference data on outputs of the current policy,
retrain the reward model, repeat) chase a moving target. They can
delay overoptimization but, by [reward-hacking-inevitability](reward-hacking-inevitability.md),
cannot eliminate it.

**Propagation into agentic systems.** A deployed
[agent](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/agents/_index.md) backed by an RLHF-trained LLM was
trained somewhere on the $R$-versus-$d$ curve. If trained beyond the
peak, its behavior reflects reward-model artifacts (sycophancy,
formatted-answer bias, evaluator-pleasing patterns) that may interact
unpredictably with the agent's downstream tasks. This is one
mechanism by which RLHF training pathologies become production
agentic-system pathologies.

## Open question

Whether RLHF can be modified to *avoid* the overoptimization peak —
rather than to merely operate close to it — is an open question. See
[can-rlhf-be-made-robust-to-overoptimization](can-rlhf-be-made-robust-to-overoptimization.md).
