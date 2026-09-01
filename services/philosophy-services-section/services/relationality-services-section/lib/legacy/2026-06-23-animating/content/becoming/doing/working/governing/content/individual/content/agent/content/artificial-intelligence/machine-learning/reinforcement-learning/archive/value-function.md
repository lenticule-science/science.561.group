---
type: concept
class: semantic-anchor
status: stable
see-also:
  - markov-decision-process.md
  - policy.md
  - ../objects/value-function-object.md
  - ../morphisms/bellman-backup.md
  - ../theorems/bellman-optimality.md
references:
  - references/bellman1957.md
  - references/sutton-barto2018.md
---

# Value function

The **value function** of a policy $\pi$ assigns to each state the
expected discounted return obtained by following $\pi$ from that state:

$$V^\pi(s) = \mathbb{E}_\pi\!\left[\sum_{t=0}^{\infty} \gamma^t R(s_t, a_t) \;\bigg|\; s_0 = s\right].$$

The **action-value function** (or Q-function) augments the value
function with an initial action choice:

$$Q^\pi(s, a) = \mathbb{E}_\pi\!\left[\sum_{t=0}^{\infty} \gamma^t R(s_t, a_t) \;\bigg|\; s_0 = s,\ a_0 = a\right].$$

Both functions satisfy a recursive Bellman equation:

$$V^\pi(s) = \sum_a \pi(a \mid s)\!\left[R(s, a) + \gamma \sum_{s'} P(s' \mid s, a)\, V^\pi(s')\right].$$

This recursion is the foundation of dynamic-programming algorithms
(value iteration, policy iteration) and of TD-learning algorithms
(SARSA, Q-learning).

**Optimal value function.** The optimal value function
$V^*(s) = \max_\pi V^\pi(s)$ satisfies the **Bellman optimality equation**:

$$V^*(s) = \max_a\!\left[R(s, a) + \gamma \sum_{s'} P(s' \mid s, a)\, V^*(s')\right].$$

By [bellman-optimality](../theorems/bellman-optimality.md), this
equation has a unique solution that can be computed by repeated
application of the [bellman-backup](../morphisms/bellman-backup.md)
operator.

**Approximation.** When $|S|$ is large, the value function cannot be
stored exactly and is approximated by a function class (linear
features, neural networks). Approximation breaks the contraction
properties on which exact-case convergence depends; this is one
horn of the [deadly-triad](deadly-triad.md).
