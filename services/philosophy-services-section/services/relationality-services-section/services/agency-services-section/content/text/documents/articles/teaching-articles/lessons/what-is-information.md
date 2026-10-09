---
title: "What is Information?"
type: "lesson"
date-created: 2025-12-30
description: A plain-language introduction to information and uncertainty.
---

A plain-language introduction to information and uncertainty.

Learning objectives

- What is Information?

## Assumed audience

- Reading level: general adult.

- Background: no math required.

- Goal: understand information as a measure of uncertainty.

## The core idea

Information is what reduces uncertainty. Before you observe an outcome, you face a set of possibilities. The observation narrows that set, and the amount of narrowing is the information gained. If you already know the outcome, the observation tells you nothing new. If the outcome surprises you, you gained information &ndash; and the rarer the outcome, the more information it carries.

Claude Elwood [Shannon](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/humanities/domains/general/domains/people/claude-shannon.md) formalized this idea in 1948, defining information not by the meaning of a message but by the degree to which the message resolves uncertainty about its source. This separates information from interpretation: a string of random digits can carry more information (in [Shannon](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/humanities/domains/general/domains/people/claude-shannon.md)&rsquo;s sense) than a sentence of prose, because the prose is constrained by grammar and vocabulary in ways that make each next character more predictable.

## A simple example

Consider a fair coin. Before the flip, you face two equally likely outcomes. The flip resolves that uncertainty, and the amount of information gained is one bit &ndash; the base unit of information, corresponding to one binary choice. Now consider a coin that always lands heads. Before the flip, you already know the outcome. The flip resolves no uncertainty, so it carries zero bits of information.

Between these extremes, a biased coin (say, 90% heads) carries less than one bit per flip, because the outcome is mostly predictable. The less predictable the source, the more information each observation provides. This relationship between probability and information content is the foundation on which the rest of information theory builds.

## Why this matters

Information theory provides a way to measure how much we learn from messages, data, or observations, independent of what the messages mean. This measurement underlies the design of communication systems, compression algorithms, and statistical inference methods. It also provides the vocabulary &ndash; bits, entropy, mutual information &ndash; that the rest of this curriculum uses to analyze how signals carry meaning through noisy channels.
