---
title: "Volatility Drag"
date-created: 2026-08-27
aliases:
  - "volatility drag"
  - "variance drag"
  - "leveraged ETF decay"
description: "The reduction in compound growth associated with return variability and the path dependence it creates in periodically reset leveraged exposure."
references: {}
---

**Volatility drag** is the reduction in compound growth caused by variability in periodic returns. For arithmetic returns (r_t), terminal wealth compounds as (prod_t(1+r_t)); gains and equal-percentage losses are asymmetric, so a volatile path can have lower geometric growth than a smoother path with the same arithmetic mean.

For small returns, expected log growth is approximately the arithmetic mean return minus one-half of return variance. This is an approximation whose adequacy depends on the return distribution and interval.

A daily-reset leveraged fund targets a multiple (k) of each day's return, so its pre-cost wealth follows (prod_t(1+k r_t)), subject to fund mechanics. It does not target (k) times the underlying's cumulative return over longer periods. The difference is path-dependent: choppy paths commonly hurt compound results, while sufficiently persistent trends can make compounding favorable relative to a naive multi-period multiple.

“Decay” is therefore not a fixed daily charge or a prediction that every leveraged fund must lose over time. Financing, management fees, tracking error, distributions, leverage changes, and extreme-return constraints are additional return components. Analysis should use the actual reset rule and full sequence of returns rather than applying a universal annual drag figure.
