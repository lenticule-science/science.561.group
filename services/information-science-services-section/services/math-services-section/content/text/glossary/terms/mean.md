---
name: "Mean"
aliases:
  - "mean"
  - "arithmetic mean"
  - "average"
date-created: 2026-01-01
tags: []
---

The arithmetic mean of a collection of values is their sum divided by their count: given values $x_1, x_2, \ldots, x_n$, the mean is $\bar{x} = (x_1 + x_2 + \cdots + x_n) / n$. If five students score 70, 80, 85, 90, and 100 on a test, the mean is $(70 + 80 + 85 + 90 + 100) / 5 = 85$. The mean answers "what is the typical value?" by giving every observation equal weight — each score pulls the mean toward itself by the same amount per unit.

This equal-weighting property has a precise geometric interpretation: the mean is the balance point. If you place equal weights on a number line at positions $x_1, \ldots, x_n$, the mean is the point where the line balances. Equivalently, the mean is the unique value $c$ that minimizes the sum of squared deviations $\sum (x_i - c)^2$. This minimization property connects the mean directly to [variance](./variance.md), least-squares regression, and much of classical statistics.

The sample mean $\bar{x}$ (computed from observed data) estimates the [population](./population.md) mean $\mu$ (the true average of the entire population). It is an unbiased estimator: if you were to take many [samples](./sample.md) and compute $\bar{x}$ each time, the average of all those $\bar{x}$ values would equal $\mu$ exactly. The law of large numbers guarantees that as the sample size grows, $\bar{x}$ converges to $\mu$ — larger samples give better estimates.

The mean has a well-known weakness: sensitivity to outliers. If one of those five test scores is changed from 100 to 1000, the mean jumps from 85 to 265 — a single extreme value dominates. The [median](./median.md), by contrast, barely moves. This sensitivity is not a flaw in all contexts (it reflects real information about the data) but it makes the mean misleading for heavily skewed distributions. Household income data, for instance, is almost always reported by median rather than mean, because a few extremely high incomes pull the mean far above what a typical household earns.

The arithmetic mean is not the only kind. The geometric mean $(\prod x_i)^{1/n}$ is appropriate when values multiply rather than add — for growth rates, ratios, and percentages. If an investment returns 10%, then -5%, then 20% over three years, the geometric mean of the growth factors $(1.10, 0.95, 1.20)$ gives the equivalent constant annual rate. The harmonic mean $n / \sum (1/x_i)$ is the right average for rates — if you drive 60 mph for one mile and 30 mph for one mile, your average speed is the harmonic mean (40 mph), not the arithmetic mean (45 mph). The weighted mean $\sum w_i x_i / \sum w_i$ assigns different importance to different observations, which matters whenever data points represent groups of different sizes.

In [probability](./probability.md) theory, the mean generalizes to the expected value of a random [variable](./variable.md). For a discrete random variable $X$, the expected value is $E[X] = \sum x_i \cdot P(X = x_i)$ — a weighted mean where the weights are probabilities. For a continuous random variable with density $f$, it is $E[X] = \int x \, f(x) \, dx$. The expected value may not correspond to any value the variable can actually take — the expected value of a fair die roll is 3.5, which no die can show — but it represents the long-run average over many independent trials.

## Additional material from the Google Drive library

The arithmetic mean of a collection of values x₁, x₂, ..., xₙ is their sum divided by their count: x̄ = (x₁ + x₂ + ... + xₙ) / n. The mean is a measure of central tendency — it answers "what is the typical value?" by balancing the contributions of all observations equally.

The sample mean x̄ estimates the [population](./population.md) mean μ. It is an unbiased estimator: on average across many [samples](./sample.md), x̄ equals μ. The mean is sensitive to outliers — a single extreme value can shift it substantially — unlike the [median](./median.md), which is resistant. The mean minimizes the sum of squared deviations, connecting it to [variance](./variance.md) and the method of least squares.

Other types of mean serve different purposes: the geometric mean (ⁿ√(x₁ · x₂ · ... · xₙ)) is appropriate for rates and ratios, the harmonic mean (n / (1/x₁ + 1/x₂ + ... + 1/xₙ)) for averaging rates, and the weighted mean assigns different importance to different observations. In [probability](./probability.md), the expected value E[X] = Σ xᵢ · P(xᵢ) generalizes the mean to random [variables](./variable.md).
