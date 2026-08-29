---

title: "Posterior"
aliases:
  - "posterior"
  - "posterior probability"
  - "posterior distribution"
date-created: 2026-01-01
tags: []
defines:
  - "Posterior"
  - "posterior probability"
  - "posterior distribution"
---

The posterior is what you believe after seeing the evidence. It is a [probability](./probability.md) distribution $P(H \mid E)$ over hypotheses $H$, updated from a [prior](./prior.md) distribution $P(H)$ in light of observed evidence $E$, using Bayes' theorem: $P(H \mid E) = P(E \mid H) \cdot P(H) / P(E)$. The prior captures what you believed before seeing data. The [likelihood](./likelihood.md) $P(E \mid H)$ captures how well each hypothesis explains the data. The posterior combines both into a single distribution that reflects everything you know.

A concrete example: a doctor believes, before any testing, that a patient has a 1% chance of a certain disease (the prior). The patient takes a test that is 95% accurate — it detects the disease 95% of the time in people who have it, and gives a false positive 5% of the time in people who don't. The patient tests positive. Bayes' theorem gives the posterior probability of disease as roughly 16%. The test result raised the probability dramatically (from 1% to 16%), but the posterior is still far from certainty — because the disease is rare, most positive tests come from the 99% of healthy people who occasionally trigger false positives. The posterior balances the strength of the evidence against the rarity of the condition.

The posterior is the central object of Bayesian inference. Everything a Bayesian statistician wants to know is extracted from the posterior distribution. Point estimates come from the posterior mean, posterior median, or posterior mode (the maximum a posteriori estimate). Credible intervals — the Bayesian analogue of confidence intervals — are ranges that contain a specified percentage of the posterior probability. Predictive distributions (what do we expect to see next?) are computed by integrating over the posterior. The posterior does not give a single answer; it gives a complete picture of remaining uncertainty.

A key property of the posterior is sequential coherence: today's posterior becomes tomorrow's prior when new evidence arrives. If you observe data $E_1$ and compute $P(H \mid E_1)$, then observe additional data $E_2$, you can update again: $P(H \mid E_1, E_2) \propto P(E_2 \mid H) \cdot P(H \mid E_1)$. The order does not matter — observing $E_1$ then $E_2$ gives the same posterior as observing $E_2$ then $E_1$. Each piece of evidence refines the distribution, and under regularity conditions, the posterior concentrates around the true parameter value as data accumulate. With enough evidence, the prior washes out and the data dominate.

This iterative updating structure connects to the [semiotic](../../../../linguistics/topics/semiotics/index.md) universe's [closure operators](../../teaching/explanations/closure-operator/index.md), which iteratively stabilize semantic values by incorporating new information until a [fixed point](../../teaching/explanations/fixed-point/index.md) is reached — the posterior is the Bayesian analogue of a fixed point under iterated evidence incorporation.
