---
title: "Volatility Risk Premium"
date-created: 2026-08-27
aliases:
  - "volatility risk premium"
description: "Compensation embedded in volatility-sensitive prices for bearing systematic volatility and tail risk, often measured by comparing risk-neutral and subsequently realized variance."
references: {}
---

The **volatility risk premium** is compensation investors require for bearing volatility and tail risk that cannot be eliminated costlessly. In option markets it is often studied as the difference between a risk-neutral expectation inferred from option prices and the variance subsequently realized by the underlying.

Terminology and sign conventions vary. “Implied volatility minus realized volatility,” “realized variance minus implied variance,” and returns to selling variance are related but not numerically interchangeable. Volatility is not variance, an option-implied figure depends on strike and maturity, and an ex-post realized measure is known only after the period ends.

A positive average premium to volatility sellers does not make short-volatility positions arbitrage. Sellers accept convex losses when realized moves or repricing exceed what was embedded in the premium. Returns are commonly negatively skewed: many limited gains can be interrupted by a large loss, margin demand, or forced deleveraging. Sample averages and Sharpe ratios can understate this tail exposure.

Measuring the premium requires specifying instrument, horizon, option surface or variance measure, sampling convention, transaction costs, collateral return, and treatment of jumps. [Premium selling](./premium-selling.md) is one way to obtain short-volatility exposure, but its result also includes directional, skew, term-structure, liquidity, and contract-specific risks.
