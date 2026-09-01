---
title: "Posterior"
aliases:
  - "posterior"
  - "posterior probability"
  - "posterior distribution"
date-created: 2026-01-01
type: term
tags: []
---

The posterior is the [probability](./probability.md) distribution P(H | E) of a hypothesis H after observing evidence E. It is the result of updating the [prior](./prior.md) P(H) with the [likelihood](./likelihood.md) P(E | H) via Bayes' theorem: P(H | E) = P(E | H) · P(H) / P(E). The posterior combines prior belief and observed data into a single probability distribution.

The posterior is the central object of Bayesian inference: it summarizes everything known about the hypothesis given the prior and the evidence. Point estimates (the posterior mean, median, or mode), credible intervals, and predictive distributions are all derived from the posterior. As more evidence is observed, the posterior concentrates around the true parameter value (under regularity conditions).

Sequential updating is a key feature: today's posterior becomes tomorrow's prior when new evidence arrives. Each observation refines the distribution, and the order of observations does not matter — the same posterior results regardless of the sequence. This iterative structure mirrors the [semiotic](../../../../linguistics/topics/semiotics/index.md) universe's [closure operators](../../../concepts/closure-operator/index.md), which iteratively stabilize semantic values by incorporating new information until a [fixed point](../../../concepts/fixed-point/index.md) is reached.
