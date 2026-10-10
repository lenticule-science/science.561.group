---

title: "Variance"
aliases:
  - "variance"
  - "variances"
date-created: 2026-01-01
tags: []
---

The variance of a collection of values is the average squared deviation from the [mean](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/mean.md): Var(X) = (1/n) Σ (xᵢ − x̄)². It measures how spread out the values are — a variance of 0 means all values are identical, and larger variance means greater spread. The sample variance typically uses n − 1 in the denominator (Bessel's correction) to produce an unbiased estimator of the [population](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/population.md) variance.

Variance is measured in squared units of the original data, which can be hard to interpret directly. The [standard deviation](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/standard-deviation.md) σ = √Var(X) returns to the original units and is the more commonly reported measure of spread. For a normal [distribution](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/distribution.md), about 68% of values fall within one standard deviation of the mean and about 95% within two.

Variance decomposes additively for [independent](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/independence.md) random [variables](./variable.md): Var(X + Y) = Var(X) + Var(Y) when X and Y are independent. This [property](../../../../../humanities/theories/philosophy/terms/property.md) underlies the central limit theorem and the analysis of variance (ANOVA). Variance is connected to the mean through the identity Var(X) = E[X²] − (E[X])², relating the spread of a distribution to its first two moments.
