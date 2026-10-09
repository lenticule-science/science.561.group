---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/reward-hypothesis.md
  - teaching/explanations/rlhf.md
  - ../objects/reward-model.md
see-also:
  - rlhf-overoptimization.md
  - teaching/explanations/why-reward-hacking-happens.md
references:
  - references/skalse-reward-hacking2022.md
  - references/amodei-concrete-problems2016.md
title: Reward-hacking inevitability
description: Claim.
---

# Reward-hacking inevitability

**Claim.** For any pair $(r^*, \hat{r})$ of reward functions on a
non-trivial MDP $M$ such that $r^* \neq \hat{r}$, there exists a policy
$\pi$ that is **proxy-optimal** (maximizes expected return under
$\hat{r}$) but **true-suboptimal** (does not maximize expected return
under $r^*$). Strong optimization against $\hat{r}$ generically finds
such policies. In this sense **reward hacking is not avoidable** by
any optimization improvement; it can only be avoided by making
$\hat{r}$ a sufficiently good approximation to $r^*$ over the support
the optimized policy actually visits.

This makes precise the formal definition of reward hacking in Skalse,
Howe, Krasheninnikov, and Krueger (2022) and the catalog of
specification-gaming examples in Amodei et al. (2016).

## Statement

Let $M = (S, A, P, \cdot, \gamma)$ be an MDP without specified reward.
Let $r^*, \hat{r} : S \times A \to \mathbb{R}$ be two reward functions
on $M$. Following Skalse et al., say $\hat{r}$ is **unhackable** for
$r^*$ if for every pair of policies $\pi, \pi'$,

$$\mathbb{E}_{\hat{r}}[J^\pi] > \mathbb{E}_{\hat{r}}[J^{\pi'}] \implies \mathbb{E}_{r^*}[J^\pi] \geq \mathbb{E}_{r^*}[J^{\pi'}].$$

That is: improving the proxy never makes the true reward worse.

**Theorem (Skalse et al. 2022, Theorem 1).** $\hat{r}$ is unhackable
for $r^*$ if and only if $\hat{r}$ and $r^*$ induce the same ordering
on policies, equivalently (under mild conditions on $M$) iff $\hat{r}$
is a positive affine transformation of $r^*$ on the trajectory
distributions induced by every policy.

**Corollary.** If $\hat{r}$ is not equivalent to $r^*$ in this sense
(in particular, if $\hat{r}$ is a learned approximation that differs
from $r^*$ on any non-null set of state-action pairs), then there
exists a policy that improves $\hat{r}$-return while strictly
decreasing $r^*$-return.

## Why optimization finds these policies

The corollary establishes existence; the empirical observation is that
strong optimizers consistently find such policies. The mechanism is
Goodhart's law: the optimum of a proxy is generically a corner of the
policy space where the proxy and target diverge maximally. As the
optimization budget grows, the gap is exploited more and more
aggressively.

This is the formal version of the claim "when a measure becomes a
target, it ceases to be a good measure." Reinforcement learning is
the regime in which the measure $\hat{r}$ becomes the explicit
optimization target, so the divergence between proxy and target is
the *first-order phenomenon*, not a secondary effect.

## Implications

**There is no algorithmic fix.** No improvement in the optimizer can
make a misaligned reward function safe to optimize. Better optimizers
make the problem worse, not better, by exploiting the proxy more
aggressively.

**The fix must be on the reward side.** Either $\hat{r}$ must be made
equivalent to $r^*$ in the unhackability sense (typically infeasible),
or the optimization must be constrained to stay in a region where
$\hat{r}$ is a good approximation of $r^*$ (this is the role of the
KL penalty in [RLHF](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/archive/teaching/explanations/rlhf.md)), or the agent must be
conservative about the difference between proxy and target (impact
regularization, quantilization, etc.).

**RLHF inherits this structurally.** The RLHF reward model $\hat{r}_\phi$
is by construction not equivalent to the underlying preference
distribution $r^*$ (it is a learned approximation from a finite dataset).
The corollary applies; an optimizer strong enough to find the proxy's
exploits will find them. The KL penalty against the SFT model is the
practical mitigation; it limits *how strongly* $\hat{r}_\phi$ is
optimized rather than removing the underlying pathology.

**Connection to [agents theory](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/agents/_index.md).** RLHF-trained
LLMs deployed as nodes in orchestrated multi-agent systems propagate
this pathology into the agents-theory regime: the LLM's behavior is
shaped by reward-hacking pressure during training, and the resulting
behavioral biases (sycophancy, confident plausibility-over-truth,
reward-model artifact exploitation) survive into the deployed agentic
system.

## Scope

The theorem assumes the comparison between $r^*$ and $\hat{r}$ is
meaningful — i.e. that there *is* a true reward $r^*$ that the proxy
is approximating. In RLHF this is the assumption that human preferences
are coherent enough to be representable as a reward function, which is
itself contested (the Arrow-style impossibility of aggregating
preferences applies). When $r^*$ does not exist, the theorem does not
*fail*; it becomes vacuous, and the question shifts to "what does it
even mean to optimize?"
