---

title: "Median"
aliases:
  - "median"
  - "medians"
date-created: 2026-01-01
tags: []
---

The median of a collection of values is the middle value when all values are arranged in order. Half the values fall below the median and half above — it splits the data into two equal halves. If you have five test scores (70, 80, 85, 90, 100), the median is 85, the third value. If you have six scores (70, 80, 85, 90, 95, 100), the median is the average of the third and fourth values: $(85 + 90)/2 = 87.5$.

The median is a measure of central tendency — like the [mean](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/mean.md), it tries to capture what is "typical" about a set of values. But it does so in a fundamentally different way. The mean balances contributions from all values equally, which makes it sensitive to extreme values: replace the 100 in the dataset above with 10,000 and the mean rockets upward. The median barely budges — it moves from 85 to 87.5. This robustness makes the median the preferred summary for skewed distributions.

Income data is the canonical example. In the United States, the mean household income is substantially higher than the median, because a small number of very high incomes pull the mean upward. The median gives a better sense of what a typical household earns. Similar situations arise with home prices, hospital lengths of stay, and any quantity where a few extreme values distort the average.

The median has a clean mathematical characterization: it is the value $c$ that minimizes the sum of absolute deviations $\sum |x_i - c|$. This parallels the mean, which minimizes the sum of *squared* deviations. The absolute-deviation criterion penalizes large errors less harshly than the squared-deviation criterion, which is why the median is less sensitive to outliers.

For a continuous [distribution](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/distribution.md) with cumulative distribution function $F$, the median is the value $m$ where $F(m) = 0.5$ — the point that divides the probability in half. In a symmetric distribution (like the normal), the mean and median coincide. In a skewed distribution, they separate: the mean is pulled toward the long tail, while the median stays closer to where most of the data actually are. The [mode](./mode.md) (the most frequent value or the peak of the density) typically lies on the other side of the median from the mean. This relationship — mode, median, mean arranged in order from the peak toward the tail — is a useful rule of thumb for understanding skewed data.
