---
type: reference
class: theorem-paper
status: stable
title: Sutton, McAllester, Singh, Mansour 2000 — Policy Gradient Methods
description: Sutton, Richard S., David McAllester, Satinder Singh, and Yishay Mansour.
---

# Sutton, McAllester, Singh, Mansour 2000 — Policy Gradient Methods

Sutton, Richard S., David McAllester, Satinder Singh, and Yishay
Mansour. "Policy Gradient Methods for Reinforcement Learning with
Function Approximation." *Advances in Neural Information Processing
Systems* 12 (2000).

The paper that established the modern form of the **policy-gradient
theorem**: that the gradient of the expected return with respect to
the policy parameters can be written as an expectation over
state-occupancy and action distributions of $\nabla_\theta \log
\pi_\theta(a \mid s) \cdot Q^{\pi_\theta}(s, a)$, *without* a term
involving the gradient of the state distribution.

The cancellation of the state-distribution-gradient term is the key
result; it makes the gradient estimable from sampled trajectories
without differentiating through the unknown environment dynamics.
Williams's REINFORCE algorithm (1992) was the precursor in the
episodic case; the Sutton et al. paper generalizes to continuing
tasks with function approximation.

Cited by [policy-gradient-step](../notes/undated/policy-gradient-step.md)
and [policy-gradient-theorem](../notes/undated/policy-gradient-theorem.md).

This paper is the theoretical foundation of TRPO, PPO, A3C, SAC, and
essentially every subsequent policy-gradient algorithm — including
the PPO instances at the heart of modern [RLHF](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/archive/teaching/explanations/rlhf.md)
pipelines.
