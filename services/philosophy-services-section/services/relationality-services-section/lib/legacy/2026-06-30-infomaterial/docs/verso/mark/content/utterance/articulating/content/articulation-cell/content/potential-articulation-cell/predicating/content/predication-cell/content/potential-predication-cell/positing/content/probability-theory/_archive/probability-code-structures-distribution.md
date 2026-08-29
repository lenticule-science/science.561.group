---

title: "Distribution"
aliases:
  - "distribution"
  - "distributions"
  - "probability distribution"
date-created: 2026-01-01
tags: []
defines:
  - "Distribution"
  - "distributions"
  - "probability distribution"
---

A distribution describes the complete pattern of how a random variable's values are spread out — which values are possible and how probable each one is. It is the full picture of uncertainty about a quantity, rather than a single summary like the [mean](teaching/explanations/mean.md) or [median](teaching/explanations/median.md). Two datasets can have the same mean and very different distributions: the scores {50, 50, 50} and {0, 50, 100} both average to 50, but the distributions tell completely different stories about what to expect.

For a discrete variable — one that takes isolated values like 0, 1, 2, ... — the distribution is specified by a probability mass function $P(X = x)$ for each possible value $x$. A fair die has the distribution $P(X = k) = 1/6$ for $k = 1, 2, 3, 4, 5, 6$. A binomial distribution with $n$ trials and success [probability](teaching/explanations/probability.md) $p$ assigns $P(X = k) = \binom{n}{k} p^k (1-p)^{n-k}$ — the probability of exactly $k$ successes in $n$ independent trials.

For a continuous variable — one that can take any value in some range, like a height or a temperature — the distribution is specified by a probability density function $f(x)$. The density is not itself a probability (it can exceed 1 for narrow distributions), but the area under the curve over an interval $[a, b]$ gives the probability of falling in that interval: $P(a \leq X \leq b) = \int_a^b f(x) \, dx$. The total area under the density curve is always 1.

Named distributions formalize common patterns. The normal distribution (also called the Gaussian, after Carl Friedrich Gauss who used it extensively in *Theoria motus corporum coelestium*, 1809) is the symmetric bell curve characterized by its mean $\mu$ and [standard deviation](teaching/explanations/standard-deviation.md) $\sigma$. It arises naturally through the central limit theorem: the sum (or average) of many independent random influences tends toward a normal distribution regardless of the shape of the individual influences. This is why so many real-world measurements — heights, test scores, measurement errors — are approximately normal. The Poisson distribution models the count of rare events in a fixed interval (radioactive decays per minute, typos per page). The exponential distribution models waiting times between events (time until the next bus arrives, if buses arrive at a constant average rate).

Any distribution is fully characterized by its cumulative distribution function $F(x) = P(X \leq x)$, which gives the probability that the variable falls at or below $x$. The CDF is a nondecreasing function from 0 to 1 — it starts at 0 (nothing is below the lowest possible value) and approaches 1 (everything is eventually below some high enough value). Summary statistics — mean, median, [mode](teaching/explanations/mode.md), [variance](teaching/explanations/variance.md) — capture specific features of the distribution but not the whole shape. Two distributions with the same mean and variance can look very different: one might be bell-shaped, the other bimodal (two peaks) or heavily skewed. The shape itself — symmetry, skewness (lean to one side), kurtosis (heaviness of tails), number of modes — conveys information that no single summary can express.
