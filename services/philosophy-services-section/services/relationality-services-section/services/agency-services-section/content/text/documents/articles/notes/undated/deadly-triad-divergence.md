---
type: theorem
class: negative-result
status: proved
depends-on:
  - teaching/explanations/deadly-triad.md
  - ../morphisms/td-update.md
  - ../objects/value-function-object.md
see-also:
  - q-learning-convergence.md
references:
  - references/sutton-barto2018.md
title: Deadly-triad divergence
description: Theorem (Baird 1995; folklore).
---

# Deadly-triad divergence

**Theorem (Baird 1995; folklore).** There exists a finite MDP, a
linear function-approximation class, and a fixed off-policy data
distribution such that the linear semi-gradient TD update with constant
step size $\alpha > 0$ produces parameter iterates $w_t$ satisfying
$\|w_t\| \to \infty$ as $t \to \infty$.

In particular, the simultaneous presence of (i) function approximation,
(ii) bootstrapping, and (iii) off-policy data — the
[deadly-triad](../../../../glossary/concepts/deadly-triad.md) — is sufficient to break the
convergence guarantees of value-based RL even when each of (i), (ii),
(iii) is individually mild.

## Baird's counterexample

Baird's seven-state star MDP is the canonical witness. The MDP has 7
non-terminal states, 1 terminal state, and a single deterministic
action structure; rewards are zero everywhere; the optimal value
function is the zero function. The behavior distribution is uniform
over the 7 states; the target policy concentrates probability on one
particular transition. The function class is linear in 8 carefully
chosen features.

The linear semi-gradient TD update is

$$w_{t+1} = w_t + \alpha \cdot [\gamma\, \phi(s_{t+1}) - \phi(s_t)]^\top w_t \cdot \phi(s_t)$$

(zero-reward case). Direct computation: the expected update is
$\mathbb{E}[w_{t+1} \mid w_t] = (I + \alpha A) w_t$ for a matrix $A$
that, under Baird's data distribution, has a positive real eigenvalue.
Iterates grow geometrically along the corresponding eigenvector.

## Why this is structural, not a parameter-tuning issue

Smaller step size $\alpha$ slows divergence but does not prevent it: the
iteration is $(I + \alpha A) w_t$ with $A$ having a positive
eigenvalue, so for any $\alpha > 0$, $\|w_t\| \to \infty$ at rate
$(1 + \alpha \lambda)^t$.

The structural diagnosis: the semi-gradient update is *not* the
gradient of any objective. It treats the bootstrap target $\gamma
w^\top \phi(s_{t+1})$ as a constant when differentiating, even though
it depends on $w$. The expected update direction can therefore have a
positive component along its own direction (instability) rather than
being a descent direction for any Lyapunov function.

## Each pair-of-three is safe

- **Approximation + bootstrap, on-policy.** Tsitsiklis–Van Roy (1997)
  proved that linear TD(0) on-policy converges in expectation to the
  fixed point of the projected Bellman operator. The on-policy data
  distribution provides a Lyapunov function (the weighted sup-norm
  with stationary-distribution weights).
- **Approximation + off-policy, no bootstrap.** Monte-Carlo gradient
  methods are true gradients of the IS-reweighted objective and converge.
- **Bootstrap + off-policy, tabular.** [Q-learning convergence](q-learning-convergence.md)
  applies; tabular representation decouples updates between states.

## Convergent off-policy methods

The deadly-triad theorem motivated a research program to find
**convergent** off-policy linear-function-approximation algorithms.
**Gradient TD** (Sutton et al. 2009) and **emphatic TD** (Sutton et al.
2016) are the principal results: both restore convergence guarantees
under the deadly-triad conditions, at the cost of additional auxiliary
weights and a more delicate update. As of 2026 these methods are
theoretically established but rarely deployed in practice; the
deep-RL community continues to use semi-gradient methods stabilized
by engineering heuristics.

## Implication for deep RL

The theorem says modern deep-RL algorithms (DQN, off-policy actor-critic
variants) are operating in the regime where the basic update can
diverge. They do not because of:

- Replay-buffer mixing of behavior policies.
- Target networks (slow-updating bootstrap target).
- Gradient clipping.
- Careful step-size schedules.

These mitigations are empirical. There is no general convergence
guarantee for the deep-RL regime as of 2026. The
[can-rlhf-be-made-robust-to-overoptimization](can-rlhf-be-made-robust-to-overoptimization.md)
question is partly a question about whether the same engineering
mitigations transfer to the RLHF setting.
