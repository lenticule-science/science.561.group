---
type: morphism
class: operator
status: stable
depends-on:
  - ../objects/policy-object.md
  - ../objects/trajectory.md
see-also:
  - ../theorems/policy-gradient-theorem.md
  - importance-sampling.md
references:
  - references/sutton-policy-gradient2000.md
  - references/sutton-barto2018.md
title: Policy-gradient step
description: A policy-gradient step updates the parameters of a parameterized policy $\pi\theta$ by stochastic gradient ascent on the performance objective $J(\theta) = \mathbb{E}{\tau \sim P{\pi\theta}}[G(\tau)]$.
---

# Policy-gradient step

A **policy-gradient step** updates the parameters of a parameterized
policy $\pi_\theta$ by stochastic gradient ascent on the performance
objective $J(\theta) = \mathbb{E}_{\tau \sim P_{\pi_\theta}}[G(\tau)]$.

## REINFORCE form

The basic score-function (REINFORCE) update, due to Williams (1992):

$$\theta \leftarrow \theta + \alpha \sum_t \nabla_\theta \log \pi_\theta(a_t \mid s_t) \cdot G_t,$$

where $G_t = \sum_{k \geq t} \gamma^{k-t} r_k$ is the return from
step $t$. Justified by the
[policy-gradient-theorem](policy-gradient-theorem.md):
the expected REINFORCE update direction is exactly $\nabla_\theta
J(\theta)$.

## Baselines and advantage

Subtracting a state-dependent baseline $b(s_t)$ from $G_t$ does not
change the expected gradient (because $\mathbb{E}_a[\nabla_\theta \log
\pi_\theta(a \mid s)] = 0$) but reduces variance. Standard choice:
$b(s_t) = \hat{V}^\pi(s_t)$, the current estimated value. The
resulting quantity $A_t = G_t - \hat{V}^\pi(s_t)$ is the **advantage**;
the update is the **advantage-actor-critic** (A2C) update.

## Trust-region and clipped variants

**Trust-region policy optimization** (TRPO; Schulman et al. 2015)
constrains the policy update to a KL-divergence ball around the
current policy, preventing destructively large steps.

**Proximal policy optimization** (PPO; Schulman et al. 2017) replaces
the hard KL constraint with a clipped surrogate objective:

$$L^{\text{PPO}}(\theta) = \mathbb{E}\!\left[\min\!\left(\rho_t(\theta) A_t,\ \mathrm{clip}(\rho_t(\theta), 1 - \epsilon, 1 + \epsilon) A_t\right)\right]$$

where $\rho_t(\theta) = \pi_\theta(a_t \mid s_t) / \pi_{\theta_{\text{old}}}(a_t \mid s_t)$
is the [importance ratio](importance-sampling.md). PPO is the
canonical RL algorithm in the RLHF pipeline (see
[RLHF](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/archive/teaching/explanations/rlhf.md)).

## Convergence

The REINFORCE update is an unbiased stochastic-gradient estimator;
under standard step-size and bounded-variance conditions, $\theta_t$
converges to a stationary point of $J$ with probability one.

It is **not** in general guaranteed to converge to a global optimum:
$J(\theta)$ is a non-convex function of $\theta$ for any non-trivial
policy class. This is the fundamental reason that policy-gradient
methods are best understood as local-search procedures rather than
global optimizers — and one of the structural reasons RLHF is
sensitive to initialization.
