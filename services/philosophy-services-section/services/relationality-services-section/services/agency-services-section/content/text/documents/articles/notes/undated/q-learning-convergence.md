---
type: theorem
class: algorithmic-convergence
status: proved
depends-on:
  - ../morphisms/td-update.md
  - bellman-optimality.md
  - teaching/explanations/exploration-exploitation.md
see-also:
  - deadly-triad-divergence.md
references:
  - references/watkins-dayan1992.md
  - references/sutton-barto2018.md
title: Q-learning convergence
description: Theorem (Watkins–Dayan 1992).
---

# Q-learning convergence

**Theorem (Watkins–Dayan 1992).** Let $M$ be a finite [MDP](mdp.md)
with $\gamma \in [0, 1)$. Consider the tabular Q-learning iteration

$$Q_{t+1}(s_t, a_t) = (1 - \alpha_t(s_t, a_t))\, Q_t(s_t, a_t) + \alpha_t(s_t, a_t) \!\left[r_t + \gamma \max_{a'} Q_t(s_{t+1}, a')\right],$$

with $Q_t(s, a)$ unchanged for $(s, a) \neq (s_t, a_t)$. Suppose:

1. **Visitation.** Every state-action pair $(s, a)$ is updated infinitely
   often.
2. **Robbins–Monro step sizes.** For every $(s, a)$,
   $$\sum_t \alpha_t(s, a) = \infty, \qquad \sum_t \alpha_t(s, a)^2 < \infty.$$
3. **Bounded reward.** $|r_t| \leq R_{\max}$ almost surely.

Then $Q_t \to Q^*$ with probability one, where $Q^*$ is the optimal
action-value function of $M$.

## Proof sketch

The argument proceeds by stochastic-approximation analysis. Define
$\Delta_t(s, a) = Q_t(s, a) - Q^*(s, a)$. The update can be rewritten

$$\Delta_{t+1}(s_t, a_t) = (1 - \alpha_t)\, \Delta_t(s_t, a_t) + \alpha_t \cdot \!\left[r_t + \gamma \max_{a'} Q_t(s_{t+1}, a') - Q^*(s_t, a_t)\right].$$

The bracketed term has conditional expectation
$\gamma \mathbb{E}[\max_{a'} Q_t(s_{t+1}, a')] - \gamma \mathbb{E}[\max_{a'} Q^*(s_{t+1}, a')]$,
whose magnitude is at most $\gamma \|\Delta_t\|_\infty$ (the max is
$\gamma$-Lipschitz in $Q$). The bracketed term is therefore a
contraction-toward-$Q^*$ in expectation, plus mean-zero noise of
bounded variance.

The Tsitsiklis (1994) general theorem on asynchronous stochastic
approximation applies: under conditions (1)–(3), $\Delta_t \to 0$
almost surely. $\square$

## What the theorem does and does not say

**Does say.** Tabular Q-learning, with sufficient exploration and
correctly-decaying step sizes, converges to the optimal action-value
function with probability one regardless of the initial $Q_0$ and
regardless of the behavior policy used to generate transitions
(provided it satisfies the visitation condition).

**Does not say:**

- Anything about the *rate* of convergence. The proof gives no
  finite-time bound; a separate body of work (e.g. Even-Dar–Mansour 2003)
  produces sample-complexity bounds, generally polynomial in $|S|, |A|,
  1/(1 - \gamma), 1/\epsilon$.
- Anything about function approximation. The proof essentially uses
  the tabular representation: each $Q(s, a)$ is updated independently of
  the others, so noise in one entry does not contaminate the others. With
  function approximation, this independence fails.
- Anything about exploration. The visitation condition is *assumed*, not
  derived. Achieving infinite visitation requires an exploration scheme
  ($\varepsilon$-greedy with $\varepsilon \not\to 0$ too fast, or
  count-based bonuses, etc.) — see
  [exploration-exploitation](../../../../glossary/concepts/exploration-exploitation.md).

## Engineering consequences

**Tabular Q-learning works as advertised in finite MDPs.** When the
state space is small enough that a Q-table fits in memory, Q-learning
with $\varepsilon$-greedy exploration and step sizes $\alpha_t(s, a) =
1/(1 + n_t(s, a))$ (visit count) is a complete solution.

**The theorem is the historical anchor for the field.** Most subsequent
convergence results follow the same Tsitsiklis-style template:
contraction-in-expectation plus stochastic-approximation step sizes.

**The function-approximation regime requires entirely different
analysis.** See [deadly-triad-divergence](deadly-triad-divergence.md).
