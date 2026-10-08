---
type: morphism
class: operator
status: stable
depends-on:
  - ../objects/value-function-object.md
  - ../objects/trajectory.md
  - bellman-backup.md
see-also:
  - teaching/explanations/deadly-triad.md
  - ../theorems/q-learning-convergence.md
references:
  - references/sutton-barto2018.md
  - references/watkins-dayan1992.md
title: TD update
description: The temporal-difference update is a sample-based stochastic approximation of the bellman-backup.
---

# TD update

The **temporal-difference update** is a sample-based stochastic
approximation of the [bellman-backup](bellman-backup.md). Given a
transition $(s_t, a_t, r_t, s_{t+1})$ and a current value estimate
$V$:

**TD(0) update** for state-value:

$$V(s_t) \leftarrow V(s_t) + \alpha_t \cdot \delta_t, \qquad \delta_t = r_t + \gamma V(s_{t+1}) - V(s_t).$$

**Q-learning update** for action-value (off-policy):

$$Q(s_t, a_t) \leftarrow Q(s_t, a_t) + \alpha_t \cdot \big[r_t + \gamma \max_{a'} Q(s_{t+1}, a') - Q(s_t, a_t)\big].$$

**SARSA update** for action-value (on-policy):

$$Q(s_t, a_t) \leftarrow Q(s_t, a_t) + \alpha_t \cdot \big[r_t + \gamma\, Q(s_{t+1}, a_{t+1}) - Q(s_t, a_t)\big].$$

The quantity $\delta_t$ is the **TD error**.

## Why this works (tabular case)

The TD-update is a Robbins–Monro stochastic approximation step toward
the [bellman-backup](bellman-backup.md) target. Under the
Robbins–Monro conditions on the step size,

$$\sum_t \alpha_t = \infty, \qquad \sum_t \alpha_t^2 < \infty,$$

and infinite visitation of every state-action pair, the iterates
converge with probability one to the appropriate Bellman fixed
point: $V^\pi$ for TD(0) (under policy $\pi$), $Q^\pi$ for SARSA, $Q^*$
for Q-learning. This is the proof template for
[q-learning-convergence](q-learning-convergence.md).

## Bias and variance

Compared to Monte-Carlo updates (which use the full sampled return),
TD updates are:

- **Lower variance**: the bootstrap target $r_t + \gamma V(s_{t+1})$
  has lower variance than the full return $\sum_{k \geq t} \gamma^{k-t}
  r_k$.
- **Biased**: when $V$ is not yet correct, the bootstrap target is
  biased. The bias vanishes asymptotically only because $V$ converges
  to its fixed point.

## $n$-step and $\lambda$-return generalizations

**$n$-step TD**: bootstrap from the value $n$ steps in the future:

$$\delta_t^{(n)} = r_t + \gamma r_{t+1} + \dots + \gamma^{n-1} r_{t+n-1} + \gamma^n V(s_{t+n}) - V(s_t).$$

**TD($\lambda$)**: an exponentially-weighted average over all $n$-step
returns. Generalizes TD(0) ($\lambda = 0$) and Monte Carlo ($\lambda =
1$). Practical implementation uses **eligibility traces** to compute the
update online.

## Function approximation caveat

With function approximation, the TD update is *not* in general the
gradient of any objective; it is a **semi-gradient** method. This is
the analytic source of the [deadly-triad](../../../../glossary/concepts/deadly-triad.md)
divergence. True-gradient TD methods (gradient TD, emphatic TD) restore
convergence guarantees at the cost of additional algorithmic complexity.
