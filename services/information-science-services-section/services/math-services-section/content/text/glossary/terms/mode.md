---
name: "Mode"
description: "The mode of a dataset is the value that appears most often. In the dataset {3, 5, 5, 7, 8, 5, 9}, the mode is 5 — it occurs three times, more than any other value. A dataset can have one mode (unimodal), two modes (bimodal), several modes (multimodal), or no mode at all (when every value occurs equally often)."
aliases:
  - "mode"
  - "modes"
date-created: 2026-01-01
tags: []
---

The mode of a dataset is the value that appears most often. In the dataset {3, 5, 5, 7, 8, 5, 9}, the mode is 5 — it occurs three times, more than any other value. A dataset can have one mode (unimodal), two modes (bimodal), several modes (multimodal), or no mode at all (when every value occurs equally often).

The mode is the simplest of the three classical measures of central tendency (alongside the [mean](./mean.md) and [median](./median.md)), and the only one that applies to categorical data. You cannot compute the mean or median of a collection of colors, but the most frequent color is perfectly well defined. If a shoe store sells more size-10 shoes than any other size, size 10 is the modal shoe size — a practically useful fact even though "average shoe size" might be 9.7, a size that does not exist.

For continuous data, the mode is the peak of the [distribution](./distribution.md) — the value where the probability density function $f(x)$ reaches its maximum. In a histogram, the mode corresponds to the tallest bar. A normal distribution has a single mode at its mean. But not all distributions are unimodal. A bimodal distribution has two distinct peaks, which often signals that the data come from two different subpopulations. If you measure the heights of a mixed group of adults without separating by sex, you may see two peaks — one around 165 cm and another around 178 cm — reflecting two overlapping distributions.

The mode has a weakness: it can be unstable. Small changes in the data — adding or removing a single observation, or shifting a bin boundary in a histogram — can move the mode to a completely different value. The mean and median are much more stable in this regard. The mode is also uninformative for uniform distributions (every value equally likely) and can be misleading for distributions with long tails, where the peak is far from where most of the probability mass sits.

For a symmetric distribution, mean, median, and mode all coincide. For a skewed distribution, they diverge in a characteristic pattern: the mode sits at the peak (where density is highest), the median sits in the middle (where cumulative probability reaches 50%), and the mean is pulled toward the long tail (by the extreme values). In Bayesian inference, the posterior mode — the parameter value with the highest [posterior](./posterior.md) density — is called the maximum a posteriori (MAP) estimate. It is one of several ways to summarize the posterior distribution as a single point, alongside the posterior mean and posterior median.

## Additional material from the Google Drive library

The mode of a dataset is the value that occurs most frequently. A dataset can be unimodal (one mode), bimodal (two modes), multimodal (several modes), or have no mode (all values occur equally often). The mode is the only measure of central tendency applicable to categorical data — you cannot compute a [mean](./mean.md) or [median](./median.md) of colors, but the most frequent color is well defined.

For continuous data, the mode is the peak of the [distribution](./distribution.md) — the value where the probability density function reaches its maximum. A bimodal distribution has two peaks and may indicate a mixture of two distinct subpopulations. The mode is easy to identify visually (the highest bar in a histogram) but can be unstable: small changes in data can shift the mode substantially.

The mode, median, and mean are the three classical measures of central tendency. For a symmetric distribution, all three coincide. For a skewed distribution, they diverge: the mode sits at the peak, the median in the middle, and the mean is pulled toward the tail. In Bayesian inference, the posterior mode (the maximum a posteriori estimate) is one way to summarize the [posterior](./posterior.md) distribution as a single value.
