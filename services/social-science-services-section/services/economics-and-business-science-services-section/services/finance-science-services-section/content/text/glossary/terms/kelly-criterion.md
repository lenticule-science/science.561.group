---
name: "Kelly Criterion"
date-created: 2026-08-27
aliases:
  - "kelly criterion"
  - "kelly formula"
description: "A position-sizing rule obtained by maximizing expected logarithmic wealth under a specified probability, payoff, and constraint model."
references: {}
---

The **Kelly criterion** selects a stake or portfolio allocation that maximizes expected logarithmic wealth under a specified model.

For a binary bet that wins with probability *p*, loses with probability *q = 1 − p*, pays net odds *b* per unit staked, and risks fraction *f* of wealth, expected log growth is

***p* log(1 + *bf*) + *q* log(1 − *f*)**.

When an interior favorable solution exists, maximizing this expression gives **f* = (bp − q) / b**. If the numerator is nonpositive and abstention is permitted, the long-only optimum is no bet. Constraints can clip or otherwise change the solution.

For a continuously rebalanced risky asset following a geometric-Brownian-motion model with excess drift *μ − r* and variance rate *σ²*, the unconstrained risky fraction is **(μ − r) / σ²**. This formula is model-specific; it is not a generic estimate from any sample mean and variance.

Kelly sizing is asymptotically growth-optimal under its assumptions, not uniquely optimal for every objective. It can have large drawdowns and is highly sensitive to estimated expected returns and probabilities. Multiple assets require their covariance and joint payoff structure; diversification can increase growth by reducing redundant risk, so Kelly does not imply concentration as a rule.

Real implementations must account for estimation uncertainty, discrete positions, leverage and margin, non-tradable wealth, changing opportunities, transaction costs, and tail events absent from the model. [Fractional Kelly](./fractional-kelly.md) deliberately reduces the modeled allocation to gain robustness and a less volatile wealth path.
