---
title: "Standard Deviation"
aliases:
  - "standard deviation"
  - "standard deviations"
date-created: 2026-01-01
type: term
tags: []
defines:
  - "Standard Deviation"
  - "standard deviations"
---

The standard deviation σ is the square root of the [variance](./variance.md): σ = √Var(X). It measures how spread out values are from the [mean](./mean.md) in the original units of measurement. A standard deviation of 0 means no spread (all values equal); a large standard deviation means values are widely dispersed.

For a normal [distribution](./distribution.md), the standard deviation determines the shape of the bell curve: about 68% of values fall within ±1σ of the mean, about 95% within ±2σ, and about 99.7% within ±3σ. This "68-95-99.7 rule" (or empirical rule) gives a quick way to interpret spread for approximately normal data.

The sample standard deviation s estimates the [population](./population.md) standard deviation. It is computed as s = √[(1/(n−1)) Σ (xᵢ − x̄)²], using n − 1 (Bessel's correction) rather than n to produce a less [biased](./bias.md) estimate. Standard deviation is preferred over variance for reporting because it has the same units as the data — if heights are measured in centimeters, the standard deviation is also in centimeters, while the variance is in centimeters squared.
