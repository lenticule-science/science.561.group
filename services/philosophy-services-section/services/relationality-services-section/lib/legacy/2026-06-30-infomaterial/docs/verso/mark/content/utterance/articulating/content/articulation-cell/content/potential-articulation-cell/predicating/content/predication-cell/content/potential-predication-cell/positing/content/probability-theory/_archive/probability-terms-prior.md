---
title: "Prior"
aliases:
  - "prior"
  - "prior probability"
  - "prior distribution"
date-created: 2026-01-01
type: term
tags: []
defines:
  - "Prior"
  - "prior probability"
  - "prior distribution"
---

A prior is a [probability](./probability.md) distribution P(H) that represents belief about a hypothesis H before observing any evidence. The prior encodes background knowledge, assumptions, or uncertainty about which hypotheses are plausible, and it is the starting point for Bayesian inference.

Bayes' theorem updates the prior using the [likelihood](./likelihood.md) to produce the [posterior](./posterior.md): P(H | E) = P(E | H) · P(H) / P(E). A strong prior (concentrated on specific hypotheses) takes more evidence to overcome; a weak or flat prior (spread across many hypotheses) lets the data dominate the posterior. The choice of prior is the main source of subjectivity in Bayesian statistics.

An uninformative prior attempts to express maximal ignorance — the uniform distribution over a finite set, or Jeffreys' prior for continuous parameters. A conjugate prior is one whose family is preserved by updating: a beta prior with a binomial likelihood yields a beta posterior, simplifying computation. As evidence accumulates, the influence of the prior diminishes and different priors converge to the same posterior — the data eventually overwhelms any prior.
