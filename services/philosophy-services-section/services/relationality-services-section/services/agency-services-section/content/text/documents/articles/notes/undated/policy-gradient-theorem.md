---
type: theorem
class: algorithmic-foundation
status: proved
depends-on:
  - ../objects/policy-object.md
  - ../objects/trajectory.md
  - ../morphisms/policy-gradient-step.md
see-also:
  - teaching/explanations/rlhf.md
references:
  - references/sutton-policy-gradient2000.md
  - references/sutton-barto2018.md
title: Policy-gradient theorem
description: Theorem (Sutton–McAllester–Singh–Mansour 2000).
---

# Policy-gradient theorem

**Theorem (Sutton–McAllester–Singh–Mansour 2000).** Let $\pi_\theta$ be
a parameterized policy on a finite [MDP](mdp.md) $M$ with
$\gamma \in [0, 1)$. Assume $\pi_\theta(a \mid s)$ is differentiable in
$\theta$ for every $(s, a)$. Define the performance objective

$$J(\theta) = \mathbb{E}_{s_0 \sim \mu_0}[V^{\pi_\theta}(s_0)].$$

Then

$$\nabla_\theta J(\theta) = \mathbb{E}_{s \sim d^{\pi_\theta},\ a \sim \pi_\theta(\cdot \mid s)}\!\left[\nabla_\theta \log \pi_\theta(a \mid s) \cdot Q^{\pi_\theta}(s, a)\right]$$

where $d^{\pi_\theta}(s) = (1 - \gamma) \sum_t \gamma^t \Pr_{\pi_\theta}(s_t = s)$
is the (normalized) discounted state-occupancy distribution.

## Proof sketch

Differentiating $V^{\pi_\theta}(s) = \sum_a \pi_\theta(a \mid s) Q^{\pi_\theta}(s, a)$:

$$\nabla_\theta V^{\pi_\theta}(s) = \sum_a [\nabla_\theta \pi_\theta(a \mid s) \cdot Q^{\pi_\theta}(s, a) + \pi_\theta(a \mid s) \cdot \nabla_\theta Q^{\pi_\theta}(s, a)].$$

Expand $\nabla_\theta Q^{\pi_\theta}$ using $Q^{\pi_\theta}(s, a) =
R(s, a) + \gamma \sum_{s'} P(s' \mid s, a) V^{\pi_\theta}(s')$, noting
that $R$ and $P$ do not depend on $\theta$. This gives a recursion
involving $\nabla_\theta V^{\pi_\theta}$ at successor states. Unrolling
the recursion and collecting terms yields

$$\nabla_\theta J(\theta) = \sum_t \gamma^t \mathbb{E}\!\left[\sum_a \nabla_\theta \pi_\theta(a \mid s_t) \cdot Q^{\pi_\theta}(s_t, a)\right].$$

The crucial cancellation is that the term $\nabla_\theta Q^{\pi_\theta}$
*does not* contribute to $\nabla_\theta J$ — only the term that
differentiates $\pi_\theta$ does. Rewriting the inner sum using the
log-derivative trick $\nabla_\theta \pi_\theta(a \mid s) = \pi_\theta(a
\mid s)\, \nabla_\theta \log \pi_\theta(a \mid s)$ gives the stated
form. $\square$

## Why the theorem matters

The theorem provides an **unbiased Monte-Carlo estimator** of the
performance gradient that depends only on quantities the agent can
observe (sampled actions, sampled returns). In particular, it does not
require differentiating the unknown environment dynamics $P$. This is
what makes policy gradient practical: an agent that can sample from
$\pi_\theta$ and observe rewards can perform stochastic-gradient ascent
on $J(\theta)$ without ever learning a model of the environment.

The REINFORCE algorithm (Williams 1992) is the direct instantiation:
replace $Q^{\pi_\theta}(s_t, a_t)$ with the empirical return $G_t =
\sum_{k \geq t} \gamma^{k-t} r_k$ (an unbiased estimator) to get an
unbiased gradient estimate.

## Variance reduction via baselines

For any function $b(s)$ depending only on the state,
$\mathbb{E}_{a \sim \pi_\theta(\cdot \mid s)}[\nabla_\theta \log
\pi_\theta(a \mid s) \cdot b(s)] = b(s) \cdot \nabla_\theta
\sum_a \pi_\theta(a \mid s) = 0$. Subtracting $b(s)$ from $Q^{\pi_\theta}(s,
a)$ in the estimator therefore preserves unbiasedness and reduces
variance. The optimal baseline is approximately $V^{\pi_\theta}(s)$;
estimating it gives the actor-critic family.

## Limitations

**Local optimality only.** $J(\theta)$ is non-convex in $\theta$ for
non-trivial policy classes. The theorem gives an unbiased gradient
estimator; SGD on it converges to a stationary point under standard
conditions, not in general to a global maximizer.

**State-occupancy bias.** The expectation is over $d^{\pi_\theta}$, the
state-occupancy of the *current* policy. As $\theta$ changes,
$d^{\pi_\theta}$ changes, and the gradient estimator becomes biased if
the data is from a different policy. This is what motivates
trust-region and clipping mechanisms ([PPO, TRPO](policy-gradient-step.md)).
