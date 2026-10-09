---
title: "Sampling and Bias"
description: "Audience: beginners learning about data quality. How a sample stands for a population, the kinds of bias that break that link, and how large a sample needs to be."
aliases:
  - "Sampling and Bias"
date-created: 2026-01-01
date-modified: 2026-09-27
keywords:
  - statistics
  - sampling
  - bias
  - sample-size
requires:
  - ../../../../glossary/terms/sample.md
  - ../../../../glossary/terms/bias.md
teaches:
  - "Sampling and Bias"
id: statistics-lesson-sampling-bias
authors:
  - gpt-5.2-codex
  - claude-opus-5-5
type: explanation
article-kind: lesson
references:
  cochran1977:
    type: book
    title: Sampling Techniques
    edition: "3"
    author:
      - family: Cochran
        given: William G.
    publisher: Wiley
    issued:
      date-parts:
        - [1977]
---

**You'll be able to:** name the common kinds of sampling bias and spot them
in a design; tell a random sample from a convenience sample; and compute the
sample size needed to estimate a proportion.

**Before you start:** the terms [sample](../../../../glossary/terms/sample.md)
and [bias](../../../../glossary/terms/bias.md).

## A worked example first

A library wants to know what share of county residents would use Sunday
hours. Three plans:

1. Ask people in the library on Saturday.
2. Post a poll on the library's website.
3. Draw 400 addresses at random from the county's address list and mail a
   survey, following up with those who don't reply.

Plan 1 asks only people who already come on weekends: **selection bias**.
Plan 2 hears from whoever chooses to answer, who tend to feel strongly:
**voluntary response bias**. Plan 3 gives every household a known chance of
selection; its remaining risk is **nonresponse bias** if the households that
don't reply differ from those that do, which is why it follows up.

## Why random samples work

A **population** is everyone the question is about; a **sample** is those
actually measured. A sample stands for its population only if the way it was
chosen doesn't favor some members. In a **simple random sample**, every
member has the same chance of selection, so the sample's differences from the
population are due to chance alone, and chance can be measured. A
**convenience sample** (whoever is easy to reach) has no such guarantee, and
no calculation can repair it afterward: accurate arithmetic on a biased
sample gives a precise wrong answer.

Common biases:

- **Selection (coverage) bias:** the sampling frame leaves out part of the
  population.
- **Voluntary response bias:** people choose themselves.
- **Nonresponse bias:** those selected who don't respond differ from those
  who do.
- **Survivorship bias:** only cases that "survived" some filter are visible.
- **Measurement bias:** the question or instrument pushes answers one way.

## How large a sample

To estimate a proportion $p$ within a margin of error $e$, at a confidence
level whose critical value is $z$ (1.96 for 95 percent), William Cochran's
formula gives the sample size [@cochran1977]:

$$n = \frac{z^2 \, p(1 - p)}{e^2}$$

With no prior guess, use $p = 0.5$, which gives the largest $n$. For a margin
of ±5 percentage points at 95 percent: $n = 1.96^2 \times 0.25 / 0.05^2 \approx
384.2$, which rounds up to 385: sample sizes always round up, because rounding
down would miss the target margin. That's why Plan 3 drew 400. For a small population of size $N$, the
finite-population correction reduces it: $n_{\text{adj}} = n / (1 + (n - 1)/N)$.

A popular rule says "30 is enough." It isn't a sample-size rule: it's a rough
point at which the distribution of a sample *mean* often looks normal. It says
nothing about the margin of error you need.

## Check yourself

1. A gym surveys members about exercise habits and concludes most adults
   exercise weekly. What bias is this?
2. Why can't a larger convenience sample fix selection bias?
3. What sample size estimates a proportion within ±3 points at 95 percent
   confidence, with no prior guess?
4. Planes returning from missions show damage on the wings, so engineers
   propose armoring the wings. What bias might mislead them?

## Answers

1. Selection bias: gym members aren't representative of all adults.
2. Because the bias comes from who can be selected, not from how many; more
   of the same people repeats the same bias.
3. $1.96^2 \times 0.25 / 0.03^2 \approx 1{,}067.1$, rounded up to 1,068.
4. Survivorship bias: planes hit elsewhere (such as the engines) may not
   have returned, so the damage seen shows where planes can be hit and
   survive.
