---
name: "Beta"
date-created: 2026-09-05
aliases:
  - "beta"
description: "A coefficient measuring an asset's or portfolio's sensitivity to a benchmark or factor's return, the priced exposure a factor model explains."
references:
  sharpe1964:
    authors: ["William F. Sharpe"]
    title: "Capital Asset Prices: A Theory of Market Equilibrium under Conditions of Risk"
    publication: "Journal of Finance 19(3)"
    year: 1964
---

**Beta** is the sensitivity of an asset's or portfolio's return to the return of a benchmark or risk factor, estimated as the slope of a regression of the asset's return on the factor's return. In the Capital Asset Pricing Model (Sharpe 1964, developed concurrently by John Lintner and Jack Treynor), beta measures exposure to the market portfolio's excess return, and the model prices an asset's expected return as the risk-free rate plus beta times the market's expected excess return.

A beta of 1 moves with the benchmark; a beta above 1 amplifies its moves; a beta near 0 is largely insensitive to it; a negative beta moves opposite it. Beta is estimated over a sample and a horizon and is not a fixed physical constant of a security — it drifts as a firm's leverage, business mix, or market regime changes, and estimates over different lookback windows can disagree materially.

Multi-factor models ([factor-model](./factor-model.md)) generalize a single market beta into a vector of exposures to several priced factors; a portfolio's total risk decomposes into these priced betas plus the [alpha](./alpha.md) left unexplained by all of them. [Market-neutral](./market-neutral.md) portfolios are explicitly constructed to hold beta near zero against a stated benchmark while still carrying other exposures.
