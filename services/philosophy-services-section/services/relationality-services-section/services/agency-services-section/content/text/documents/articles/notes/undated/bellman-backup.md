---
type: morphism
class: operator
status: stable
depends-on:
  - ../objects/value-function-object.md
  - ../objects/mdp.md
see-also:
  - ../theorems/bellman-optimality.md
  - policy-improvement.md
references:
  - references/bellman1957.md
  - references/sutton-barto2018.md
title: Bellman backup
description: The Bellman backup operator is the central operator of dynamic programming for MDPs.
---

# Bellman backup

The **Bellman backup operator** is the central operator of dynamic
programming for [MDPs](mdp.md). Two variants:

**Policy-evaluation operator** $T^\pi : B(S) \to B(S)$ for a fixed
policy $\pi$:

$$(T^\pi V)(s) = \sum_a \pi(a \mid s) \!\left[R(s, a) + \gamma \sum_{s'} P(s' \mid s, a)\, V(s')\right].$$

**Optimality operator** $T^* : B(S) \to B(S)$:

$$(T^* V)(s) = \max_a \!\left[R(s, a) + \gamma \sum_{s'} P(s' \mid s, a)\, V(s')\right].$$

Analogous operators on action-value functions $Q$ are defined
similarly.

## Contraction property

Both $T^\pi$ and $T^*$ are $\gamma$-contractions in the sup-norm on
$B(S)$:

$$\|T V - T V'\|_\infty \leq \gamma \|V - V'\|_\infty.$$

By the Banach fixed-point theorem, each operator has a unique fixed
point, $V^\pi$ and $V^*$ respectively, and iteration $V_{n+1} = T V_n$
from any starting point converges geometrically at rate $\gamma$.

This is the proof core of [bellman-optimality](bellman-optimality.md).

## Algorithmic forms

**Synchronous backup**: compute $T V$ for all $s \in S$ in a single
sweep using the *previous* iterate. Standard value iteration.

**Asynchronous backup**: update one $V(s)$ at a time, each using the
*current* values of other states. Converges to the same fixed point
under the weak condition that every state is updated infinitely often.

**Sample-based backup**: estimate the expectation over $s'$ from a
single sampled transition rather than computing it analytically. The
result is a stochastic approximation of $T V$; combined with appropriate
step sizes this gives [td-update](td-update.md) and ultimately Q-learning.

## Function approximation

When $V$ is replaced by a parameterized $\hat{V}_w$, the analog of
"applying $T$" is fitting $\hat{V}_w$ to targets $T \hat{V}_{w_{\text{old}}}$
by regression. This **fitted value iteration** does not enjoy the sup-norm
contraction property in general; the projected operator $\Pi T$ (where
$\Pi$ is the projection onto the function class) may not be a contraction
in any norm. This is the analytic origin of the [deadly
triad](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/archive/teaching/explanations/deadly-triad.md).
