---
title: "Likelihood"
aliases:
  - "likelihood"
  - "likelihood function"
date-created: 2026-01-01
type: term
tags: []
---

The likelihood of a hypothesis H given observed evidence E is P(E | H) — the [probability](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/probability.md) of observing the evidence if the hypothesis were true. Likelihood is not itself a probability of the hypothesis; it is the probability of the data under the hypothesis, viewed as a [function](../../../objects/sets/terms/function.md) of H with E fixed.

Likelihood plays a central role in both frequentist and Bayesian statistics. In maximum likelihood estimation, the parameter value that maximizes the likelihood function is taken as the best estimate. In Bayesian inference, the likelihood is the updating factor in Bayes' theorem: [posterior](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/posterior.md) ∝ likelihood × [prior](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/prior.md), or P(H | E) ∝ P(E | H) · P(H).

The likelihood ratio P(E | H₁) / P(E | H₂) compares how well two hypotheses explain the same evidence, without requiring prior probabilities. This ratio is the basis of likelihood ratio tests in frequentist statistics and of Bayes factors in Bayesian model comparison.
