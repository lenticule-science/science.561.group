---
name: "Geometric Mean Maximization"
date-created: 2026-08-27
aliases:
  - "geometric mean maximization"
  - "growth-optimal investing"
description: "Choosing a policy to maximize long-run compound growth, commonly formulated as maximizing expected logarithmic wealth under repeated, sufficiently regular opportunities."
references: {}
---

**Geometric-mean maximization** or **growth-optimal investing** chooses a policy to maximize long-run compound wealth growth. In repeated stationary or ergodic models with integrable log returns, this is commonly expressed as maximizing expected log return per period.

The distinction from arithmetic expected return matters because wealth compounds multiplicatively. A strategy can have a high arithmetic mean while occasional large losses reduce or destroy its long-run geometric growth. For small returns, expected log return is approximately arithmetic mean minus one-half of variance, but that approximation is not exact for general distributions.

The [Kelly criterion](./kelly-criterion.md) gives a growth-optimal allocation for specified betting or asset models. There is no one Kelly fraction independent of the model: probabilities, payoffs, correlations, constraints, financing, and rebalancing determine the solution.

Growth optimality is an asymptotic objective, not a guarantee of leading over a finite horizon. It can tolerate severe interim drawdowns and is sensitive to estimation error. If wealth can reach zero with positive probability, expected log wealth is negative infinity under the usual formulation, excluding such policies from a finite optimum.

Practical use therefore requires an explicit wealth definition, horizon and repetition model, non-tradable capital treatment, constraints, and robust estimates. See [fractional Kelly](./fractional-kelly.md) and [risk of ruin](./risk-of-ruin.md).
