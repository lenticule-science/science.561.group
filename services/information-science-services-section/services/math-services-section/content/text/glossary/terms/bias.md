---
title: "Bias"
description: "Bias in statistics is a systematic error that causes estimates to deviate from the true [population](./population.md) parameter in a consistent direction. An estimator is biased if its expected value differs from the parameter it estimates: Bias(θ̂) = E[θ̂] − θ. A biased estimator consistently overestimates or underestimates, regardless of [sample](./sample.md) size."
aliases:
  - "bias"
  - "statistical bias"
date-created: 2026-01-01
tags: []
defines:
  - "Bias"
  - "statistical bias"
type: term
---

Bias in statistics is a systematic error that causes estimates to deviate from the true [population](./population.md) parameter in a consistent direction. An estimator is biased if its expected value differs from the parameter it estimates: Bias(θ̂) = E[θ̂] − θ. A biased estimator consistently overestimates or underestimates, regardless of [sample](./sample.md) size.

Bias enters at multiple stages. Sampling bias occurs when the sample does not represent the population (self-selection, convenience sampling, survivorship bias). Measurement bias occurs when the measurement process systematically distorts values. Estimation bias occurs when the statistical method itself introduces systematic error — using n rather than n − 1 in the [variance](./variance.md) formula, for example, produces a biased estimator.

An unbiased estimator has E[θ̂] = θ: on average, it hits the true value. However, unbiasedness is not always the most important property — a slightly biased estimator with lower [variance](./variance.md) may produce estimates closer to the truth in practice. The bias-variance tradeoff formalizes this: total error = bias² + variance, and the best estimator minimizes their sum, not bias alone.
