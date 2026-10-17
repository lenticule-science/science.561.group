---

title: "Likelihood"
aliases:
  - "likelihood"
  - "likelihood function"
date-created: 2026-01-01
tags: []
---

The likelihood of a hypothesis given observed data is the [probability](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/probability.md) of having observed that data if the hypothesis were true. It asks: how well does this hypothesis explain what we actually saw? If a coin is fair (hypothesis: $p = 0.5$), the probability of observing 8 heads in 10 flips is about 0.044. If the coin is biased ($p = 0.8$), the probability of that same outcome is about 0.302. The biased-coin hypothesis has higher likelihood — it makes the observed data more probable.

The critical distinction is that likelihood is *not* the probability of the hypothesis. It is the probability of the data *under* the hypothesis, viewed as a [function](../../../morphisms/function.md) of the hypothesis with the data held fixed. The notation $\mathcal{L}(\theta \mid x) = P(x \mid \theta)$ makes this explicit: the left side is the likelihood of parameter $\theta$ given data $x$; the right side is the probability of data $x$ given parameter $\theta$. They are the same number, but the conceptual roles are reversed. Probability looks forward (given the hypothesis, what data do we expect?), while likelihood looks backward (given the data, which hypothesis explains it best?).

Ronald Aylmer Fisher introduced the likelihood function and the principle of maximum likelihood in a series of papers beginning with "On the Mathematical Foundations of Theoretical Statistics" (*Philosophical Transactions of the Royal Society*, 1922). Fisher argued that the parameter value making the observed data most probable — the maximum likelihood estimate (MLE) — is the most defensible choice of estimate. Maximum likelihood estimation is now the dominant method in frequentist statistics: it applies to virtually any parametric model, and MLEs have desirable properties (consistency, asymptotic normality, efficiency) under broad conditions.

In Bayesian inference, the likelihood plays a different but equally central role. Bayes' theorem says [posterior](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/posterior.md) $\propto$ likelihood $\times$ [prior](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/prior.md), or $P(\theta \mid x) \propto P(x \mid \theta) \cdot P(\theta)$. The likelihood is the updating factor — it tells you how much to revise your prior beliefs in light of the evidence. A hypothesis with high likelihood gets boosted; one with low likelihood gets discounted. The prior encodes what you believed before seeing data; the likelihood encodes what the data say; the posterior combines them.

The likelihood ratio $P(x \mid H_1) / P(x \mid H_2)$ compares two hypotheses directly, without reference to priors. If the ratio is large, the data favor $H_1$; if small, they favor $H_2$. This ratio is the basis of likelihood ratio tests in frequentist statistics (used to decide between nested models) and of Bayes factors in Bayesian model comparison (which integrate the likelihood over the prior to compare models of different complexity).
