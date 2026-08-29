---
title: "Conditional Probability"
aliases:
  - "conditional probability"
  - "conditional probabilities"
date-created: 2026-01-01
type: term
tags: []
defines:
  - "Conditional Probability"
  - "conditional probabilities"
---

The conditional probability of [event](./event.md) A given event B, written P(A | B), is the [probability](./probability.md) of A occurring given that B has occurred. It is defined as P(A | B) = P(A ∩ B) / P(B), provided P(B) > 0. Conditioning restricts the [sample space](./sample-space.md) to outcomes in B and rescales probabilities accordingly.

Conditional probability leads to Bayes' theorem: P(A | B) = P(B | A) · P(A) / P(B). This relates the probability of a hypothesis given evidence to the probability of evidence given the hypothesis, and is the foundation of Bayesian inference. The [prior](./prior.md) P(A) is updated by the [likelihood](./likelihood.md) P(B | A) to produce the [posterior](./posterior.md) P(A | B).

Two events are [independent](./independence.md) when conditioning changes nothing: P(A | B) = P(A), which is equivalent to P(A ∩ B) = P(A) · P(B). Conditional probability for more than two events gives rise to chains: P(A ∩ B ∩ C) = P(A) · P(B | A) · P(C | A ∩ B), a decomposition used in probabilistic graphical models and sequential reasoning.
