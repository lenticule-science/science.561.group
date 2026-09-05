---

title: "Entropy and Surprise"
aliases:
  - "Entropy and Surprise"
date-created: 2025-12-30
description: A basic introduction to entropy as average surprise.
tags: []
requires:
- /information/curricula/what-is-information.md
teaches:
  - "Entropy and Surprise"
---


## Assumed audience

- Reading level: general adult.
- Background: basic arithmetic.
- Goal: understand entropy as average surprise.

## Surprise

A rare event is more surprising than a common event. Information theory quantifies this intuition: the surprise (or self-information) of an event with probability $p$ is $-\log_2(p)$ bits. An event with probability 1/2 carries 1 bit of surprise. An event with probability 1/8 carries 3 bits. An event that is certain ($p = 1$) carries 0 bits -- no surprise at all.

The logarithm makes surprise additive. If two independent events occur together, the total surprise equals the sum of their individual surprises. This additive [property](../../../../humanities/theories/philosophy/terms/property.md) is what makes the logarithmic definition natural rather than arbitrary: it matches the intuition that learning two independent facts should give you the combined information of each.

## Entropy

Entropy is the expected (average) surprise across all outcomes of a probability distribution. For a discrete source with outcomes $x_1, x_2, \ldots, x_n$ and probabilities $p_1, p_2, \ldots, p_n$, [Shannon](../../../../../references/people/claude-shannon.md) entropy is:

$$H = -\sum_{i=1}^{n} p_i \log_2 p_i$$

A fair coin has entropy of 1 bit: each flip is maximally uncertain between two outcomes. A biased coin (say, 90% heads) has entropy of about 0.47 bits, because most flips are predictable. Among all distributions over $n$ outcomes, the uniform distribution maximizes entropy -- it is the distribution about which you know the least.

Entropy can also be understood as a lower bound on compression. No lossless encoding can represent messages from a source using fewer than $H$ bits per [symbol](../../linguistics/theories/semiotics/terms/symbol.md) on average. This connects the abstract measure of uncertainty to a concrete engineering constraint.

## Why this matters

Entropy is the central quantity in information theory. It sets the minimum average code length for lossless compression, defines the baseline against which channel capacity and coding efficiency are measured, and provides the vocabulary for comparing how much uncertainty different sources, signals, and models carry. The rest of this curriculum builds on entropy as its foundational measure.
