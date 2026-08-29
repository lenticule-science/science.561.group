---
title: "Standard Deviation"
aliases:
  - "standard deviation"
  - "standard deviations"
date-created: 2026-01-01
tags: []
defines:
  - "Standard Deviation"
  - "standard deviations"
type: term
---

The standard deviation measures how spread out a collection of values is from its [mean](./mean.md). It answers the question: on average, how far do individual observations fall from the center? A standard deviation of 0 means every value is identical — there is no spread at all. A small standard deviation means values cluster tightly around the mean. A large standard deviation means values are widely dispersed.

Consider two classes of students who both average 80 on a test. In one class, every student scores between 75 and 85 — the standard deviation is small (around 3). In the other, scores range from 40 to 100 — the standard deviation is large (around 20). The mean tells you the center; the standard deviation tells you how much the data scatter around that center.

Formally, the standard deviation $\sigma$ is the square root of the [variance](./variance.md): $\sigma = \sqrt{\mathrm{Var}(X)}$. The variance is the average squared deviation from the mean: $\mathrm{Var}(X) = E[(X - \mu)^2]$ for a random variable with mean $\mu$. Squaring the deviations ensures that values above and below the mean both contribute positively (a deviation of $-3$ matters just as much as a deviation of $+3$). Taking the square root at the end brings the result back to the original units. If heights are measured in centimeters, the variance is in centimeters squared — hard to interpret — but the standard deviation is in centimeters, directly comparable to the data.

For a normal [distribution](./distribution.md), the standard deviation has a particularly clean interpretation. About 68% of values fall within $\pm 1\sigma$ of the mean. About 95% fall within $\pm 2\sigma$. About 99.7% fall within $\pm 3\sigma$. This "68-95-99.7 rule" (also called the empirical rule) gives a quick way to interpret spread for any approximately normal dataset. If the mean height of adult men is 175 cm with a standard deviation of 7 cm, then roughly 95% of men are between 161 cm and 189 cm.

The sample standard deviation $s$ estimates the [population](./population.md) standard deviation $\sigma$ from observed data. It is computed as $s = \sqrt{\frac{1}{n-1} \sum_{i=1}^n (x_i - \bar{x})^2}$, using $n - 1$ in the denominator rather than $n$. This adjustment, called Bessel's correction (after Friedrich Wilhelm Bessel, who introduced it in the context of astronomical measurement errors), compensates for the fact that the sample mean $\bar{x}$ is closer to the sample data than the true population mean $\mu$ would be, which makes the naive divisor $n$ systematically underestimate the true variance.

Standard deviation is the most widely used measure of spread in science, engineering, and social science. It is the natural companion to the mean — together they summarize the center and width of a distribution. But like the mean, the standard deviation is sensitive to outliers: a single extreme value can inflate it substantially. For heavily skewed or outlier-prone data, robust alternatives like the interquartile range (the distance between the 25th and 75th percentiles) or the median absolute deviation may give a more representative picture of spread.

## Additional material from the Google Drive library

The standard deviation σ is the square root of the [variance](./variance.md): σ = √Var(X). It measures how spread out values are from the [mean](./mean.md) in the original units of measurement. A standard deviation of 0 means no spread (all values equal); a large standard deviation means values are widely dispersed.

For a normal [distribution](./distribution.md), the standard deviation determines the shape of the bell curve: about 68% of values fall within ±1σ of the mean, about 95% within ±2σ, and about 99.7% within ±3σ. This "68-95-99.7 rule" (or empirical rule) gives a quick way to interpret spread for approximately normal data.

The sample standard deviation s estimates the [population](./population.md) standard deviation. It is computed as s = √[(1/(n−1)) Σ (xᵢ − x̄)²], using n − 1 (Bessel's correction) rather than n to produce a less [biased](./bias.md) estimate. Standard deviation is preferred over variance for reporting because it has the same units as the data — if heights are measured in centimeters, the standard deviation is also in centimeters, while the variance is in centimeters squared.
