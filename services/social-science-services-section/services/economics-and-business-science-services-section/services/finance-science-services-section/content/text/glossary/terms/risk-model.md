---
name: "Risk Model"
date-created: 2026-09-05
aliases:
  - "risk model"
description: "A model of the covariance of asset returns, used to estimate portfolio risk and kept separate from the alpha model that forecasts returns."
references: {}
---

A **risk model** estimates the covariance structure of a set of assets' returns — how much each moves on its own and how much it moves together with the others — for use in [portfolio-construction](./portfolio-construction.md). Because directly estimating a full covariance matrix from history requires more independent return observations than are typically available for a large universe, most institutional risk models estimate covariance indirectly through a [factor-model](./factor-model.md): each asset's exposure to a small set of common factors is estimated, the factors' own covariance is estimated separately (a much smaller, better-conditioned problem), and asset-level covariance is reconstructed from the two.

A risk model is deliberately kept separate from the **alpha model** that forecasts expected returns, even though both can be built from factor exposures. The alpha model says what is expected to happen; the risk model says how uncertain and how correlated that expectation is. Conflating the two — for instance, treating a factor discovered for its return premium as automatically well-measured for risk purposes, or vice versa — is a documented source of portfolio-construction error, because a factor's estimated risk contribution and its estimated return contribution can be measured with very different precision from the same history.

Risk models are commonly checked out-of-sample by how well their forecast portfolio variance matches subsequently realized variance, a distinct validation question from whether an alpha model's forecast returns matched realized returns; a fund's [live-versus-backtest-reconciliation](./live-versus-backtest-reconciliation.md) ordinarily tracks both separately.
