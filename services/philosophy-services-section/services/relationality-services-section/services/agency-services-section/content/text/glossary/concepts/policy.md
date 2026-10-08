---
type: concept
class: semantic-anchor
status: stable
see-also:
  - markov-decision-process.md
  - value-function.md
  - ../objects/policy-object.md
  - ../morphisms/policy-improvement.md
  - ../morphisms/policy-gradient-step.md
  - ../theorems/policy-gradient-theorem.md
references:
  - references/sutton-barto2018.md
title: Policy
description: A policy $\pi$ in reinforcement learning is the agent's rule for choosing actions.
---

# Policy

A **policy** $\pi$ in reinforcement learning is the agent's rule for
choosing actions. Formally, $\pi : S \to \Delta(A)$ is a stochastic
kernel from states to action distributions; $\pi(a \mid s)$ is the
probability of taking action $a$ in state $s$. Deterministic policies
are the special case where $\pi(\cdot \mid s)$ is a Dirac mass.

A policy is the agent's *strategy*; the value function is the
*evaluation* of that strategy. Two policies are equivalent if they
have the same value function from every state.

**Stationary vs. history-dependent.** A stationary policy depends only
on the current state; a history-dependent policy depends on the entire
state-action-reward sequence so far. The Markov property of an MDP
implies that for any policy there exists a stationary policy with the
same value, so without loss of generality one restricts attention to
stationary policies.

**Tabular vs. parameterized.** A tabular policy stores $\pi(a \mid s)$
explicitly for each state-action pair; this is feasible only when the
state space is small. A parameterized policy $\pi_\theta$ represents the
policy as a function with parameter vector $\theta$ (e.g. the weights
of a neural network); this is the only feasible representation for
state spaces too large to enumerate, and is the regime in which
modern deep RL operates.

**Optimal policy.** A policy $\pi^*$ is optimal if its value function
dominates that of every other policy: $V^{\pi^*}(s) \geq V^\pi(s)$ for
all $s$ and all $\pi$. The
[bellman-optimality](../../documents/articles/notes/undated/bellman-optimality.md) theorem
establishes that an optimal policy exists for any finite MDP and can
be recovered by greedification of the optimal value function.
