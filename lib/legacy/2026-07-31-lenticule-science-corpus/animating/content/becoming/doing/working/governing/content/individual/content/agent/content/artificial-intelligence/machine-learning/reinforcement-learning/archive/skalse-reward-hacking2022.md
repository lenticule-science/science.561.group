---
type: reference
class: theorem-paper
status: stable
---

# Skalse et al. 2022 — Defining and Characterizing Reward Hacking

Skalse, Joar, Nikolaus Howe, Dmitrii Krasheninnikov, and David
Krueger. "Defining and Characterizing Reward Hacking." *Advances in
Neural Information Processing Systems* 35 (2022).

The paper that gave reward hacking its **first formal definition**
and characterized when a proxy reward function is **unhackable** with
respect to a true reward.

Definition (loose): a proxy reward $\hat{r}$ is **unhackable** for a
true reward $r^*$ if every policy improvement under $\hat{r}$ is also
a (weak) improvement under $r^*$.

Theorem (loose): under standard conditions on the MDP, $\hat{r}$ is
unhackable for $r^*$ if and only if $\hat{r}$ and $r^*$ induce the
same ordering on policies — equivalently, $\hat{r}$ is a positive
affine transformation of $r^*$ on the relevant trajectory
distributions.

The corollary is that any non-trivial difference between proxy and
true reward admits a policy that hacks the proxy. The
[reward-hacking-inevitability](../theorems/reward-hacking-inevitability.md)
theorem in this theory makes this precise.

The paper is the formal anchor for the modern alignment literature's
discussion of reward hacking. Earlier informal discussions (Amodei
et al. 2016, Krakovna et al. 2020) catalogued examples; this paper
provided the mathematical structure.

Cited by the [reward-hypothesis](teaching/explanations/reward-hypothesis.md)
concept, the [reward-model](../objects/reward-model.md) object, the
[reward-hacking-inevitability](../theorems/reward-hacking-inevitability.md)
and [rlhf-overoptimization](../theorems/rlhf-overoptimization.md)
theorems, and the [why-reward-hacking-happens](teaching/explanations/why-reward-hacking-happens.md)
narrative.
