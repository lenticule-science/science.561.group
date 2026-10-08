---
type: theorem
class: classical
status: proved-with-conditions
depends-on:
  - ../objects/model-error.md
  - ../objects/imagination-rollout.md
see-also:
  - sim-to-real-gap-bound.md
  - ../morphisms/imagination.md
references:
  - references/hafner-dreamer2020.md
title: Model error compounds
description: Let $\hat{T}$ be a learned transition model of a true dynamics $T$ satisfying, for all $(s, a)$,
---

# Model error compounds

## Statement

Let $\hat{T}$ be a learned transition model of a true dynamics $T$
satisfying, for all $(s, a)$,

$$
d_{\mathrm{TV}}(\hat{T}(\cdot \mid s, a),\, T(\cdot \mid s, a)) \le \epsilon
$$

where $d_{\mathrm{TV}}$ is total variation distance. Let $\hat{p}_H$
and $p_H$ denote the distributions over $H$-step trajectories under
$\hat{T}$ and $T$ respectively, both starting from the same initial
state and following the same policy $\pi$. Then

$$
d_{\mathrm{TV}}(\hat{p}_H,\, p_H) \;\le\; \epsilon \cdot H.
$$

(The TV bound is, of course, capped at $1$; the inequality is
informative only while $\epsilon H \ll 1$.)

In the **nonlinear / chaotic** setting, an analogous *state-space*
bound holds for the deviation between the true and predicted
state trajectories: when the true dynamics has local Lyapunov
exponent $L > 0$ and the per-step state-prediction error is
bounded by $\delta$ in some metric on $S$, the trajectory
deviation grows roughly as

$$
\|s_H - \hat{s}_H\| \;\lesssim\; \delta \cdot e^{LH}
$$

— exponential growth in *state error* with horizon. This is a
distinct claim from the TV bound on trajectory distributions
above; mixing the two requires additional assumptions (e.g.
Lipschitz reward, bounded state space) to convert state
divergence to distributional discrepancy.

## Proof sketch

The linear bound is a standard simulation-lemma argument. Define
$\Delta_t = d_{\mathrm{TV}}(\hat{p}_t, p_t)$. By the data-processing
inequality and the triangle inequality applied stepwise,

$$
\Delta_{t+1} \le \Delta_t + \mathbb{E}_{s \sim p_t}\,
d_{\mathrm{TV}}(\hat{T}(\cdot \mid s, \pi(s)), T(\cdot \mid s, \pi(s))) \le \Delta_t + \epsilon.
$$

Iterating from $\Delta_0 = 0$ gives $\Delta_H \le \epsilon H$.

The exponential bound arises in chaotic systems where small state
perturbations grow exponentially under the true dynamics, so even
correctly-applied dynamics on a slightly-wrong state diverge
exponentially.

## Why it matters

This theorem is the principal architectural constraint on
imagination-based methods in MBRL. It implies:

- **Useful planning horizons are short** when the model has any
  meaningful error. A model with 1% per-step error gives ~10%
  trajectory-distribution error at $H=10$ but ~63% at $H=100$ in
  the linear regime, and far worse in chaotic regimes.
- **Re-planning helps.** Plan $H$ steps, execute one, re-plan from
  the actually-observed state. Each plan only sees $H$ steps of
  compound error, not the full task horizon.
- **Real grounding is essential.** Pure imagination without
  re-grounding diverges from reality. The Dreamer pattern (many
  short rollouts from many real seed states) keeps imagination
  on-distribution.
- **Ensemble disagreement signals horizon limit.** When ensemble
  predictions diverge by more than some threshold, the imagination
  has gone beyond the model's competence and should be truncated.

## Tightness

The linear TV bound is tight in the worst case (modulo the
$\le 1$ cap): there exist environments and learned models
achieving this rate while $\epsilon H \ll 1$. Many real
environments are gentler (locally contractive, well-conditioned),
giving sub-linear or constant error growth in practice. But no
algorithm relying on imagination can assume better than the worst
case without environment-specific structural assumptions.

A formal statement of the linear simulation-lemma form is given
by [kakade-langford2002](../../bibliographies/kakade-langford2002.md).

## Relation to sim-to-real

The
[sim-to-real-gap-bound](sim-to-real-gap-bound.md) is essentially
this theorem applied to the simulator-vs-reality discrepancy
rather than the learned-vs-true discrepancy. Mathematically the
same; substantively different in source.
