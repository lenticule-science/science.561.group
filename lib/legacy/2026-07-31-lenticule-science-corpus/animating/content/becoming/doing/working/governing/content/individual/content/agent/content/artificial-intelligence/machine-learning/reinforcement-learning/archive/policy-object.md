---
type: object
class: defined-structure
status: stable
depends-on:
  - teaching/explanations/policy.md
  - mdp.md
see-also:
  - value-function-object.md
  - ../morphisms/policy-improvement.md
  - ../morphisms/policy-gradient-step.md
references:
  - references/sutton-barto2018.md
---

# Policy object

The **policy object** is the formalization of the
[policy](teaching/explanations/policy.md) concept as a mathematical structure.

## Definition

A **policy** for an [MDP](mdp.md) $M = (S, A, P, R, \gamma)$ is a
measurable map $\pi : S \to \Delta(A)$ assigning to each state a
probability distribution over actions. The set of all policies for $M$
is denoted $\Pi(M)$.

## Subtypes

**Deterministic policy.** $\pi(s)$ is a Dirac mass on a single action
$a^*(s)$. Equivalent to a measurable map $S \to A$.

**Stochastic policy.** $\pi(\cdot \mid s)$ has positive mass on more
than one action.

**Tabular policy.** $S$ and $A$ finite; $\pi$ is stored as a $|S| \times
|A|$ matrix.

**Parameterized policy.** $\pi = \pi_\theta$ for parameter $\theta \in
\mathbb{R}^d$. Standard parameterizations include:

- **Softmax** (discrete actions): $\pi_\theta(a \mid s) \propto \exp(f_\theta(s, a))$
  for some feature function $f_\theta$.
- **Gaussian** (continuous actions): $\pi_\theta(\cdot \mid s) =
  \mathcal{N}(\mu_\theta(s), \Sigma_\theta(s))$.
- **Neural-network policy:** $f_\theta$ or $(\mu_\theta, \Sigma_\theta)$
  is implemented as a deep neural network. The standard regime in
  modern deep RL.

## Operations

The policy object supports two principal operations:

- **Sampling**: given $s$, draw $a \sim \pi(\cdot \mid s)$. Required at
  every environment step at deployment.
- **Log-probability evaluation**: given $(s, a)$, compute $\log
  \pi(a \mid s)$. Required for [policy-gradient
  steps](../morphisms/policy-gradient-step.md) and for
  [importance-sampling](../morphisms/importance-sampling.md)
  reweighting.

For parameterized policies, gradient computation $\nabla_\theta \log
\pi_\theta(a \mid s)$ is also required; this is the central quantity
appearing in the
[policy-gradient-theorem](../theorems/policy-gradient-theorem.md).

## Equivalence

Two policies are **value-equivalent** for an MDP if they have the
same value function from every state. Value-equivalence is weaker
than equality of the policy maps: stochastic policies that mix
between equally-good actions are value-equivalent to each other and
to a deterministic policy choosing any one of them.
