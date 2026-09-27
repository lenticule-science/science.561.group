---
title: "Inference Basics"
description: "Audience: beginners learning to draw conclusions from samples. Confidence intervals, hypothesis tests and p-values, statistical power, and the two classic traps: correlation read as causation, and Simpson's paradox."
aliases:
  - "Inference Basics"
date-created: 2026-01-01
date-modified: 2026-09-27
keywords:
  - statistics
  - inference
  - confidence-interval
  - hypothesis-test
  - statistical-power
requires:
  - sampling-and-bias.md
  - descriptive-statistics.md
  - probability-overview.md
teaches:
  - "Inference Basics"
id: statistics-lesson-inference-basics
authors:
  - gpt-5.2-codex
  - claude-opus-5-5
type: explanation
article-kind: lesson
references:
  cohen1988:
    type: book
    title: Statistical Power Analysis for the Behavioral Sciences
    edition: "2"
    author:
      - family: Cohen
        given: Jacob
    publisher: Lawrence Erlbaum
    issued:
      date-parts:
        - [1988]
  simpson1951:
    type: article-journal
    title: The Interpretation of Interaction in Contingency Tables
    author:
      - family: Simpson
        given: E. H.
    container-title: Journal of the Royal Statistical Society, Series B
    volume: "13"
    issue: "2"
    page: 238-241
    issued:
      date-parts:
        - [1951]
  wasserstein-lazar2016:
    type: article-journal
    title: "The ASA Statement on p-Values: Context, Process, and Purpose"
    author:
      - family: Wasserstein
        given: Ronald L.
      - family: Lazar
        given: Nicole A.
    container-title: The American Statistician
    volume: "70"
    issue: "2"
    page: 129-133
    issued:
      date-parts:
        - [2016]
---

**You'll be able to:** read a confidence interval; state what a p-value does
and doesn't mean; explain statistical power; and recognize when a correlation
or an aggregate misleads.

**Before you start:** [Sampling and Bias](sampling-and-bias.md) and
[Descriptive Statistics](descriptive-statistics.md).

## A worked example first

A random sample of 400 county households finds 36 percent would use Sunday
library hours. The margin of error at 95 percent confidence is about
$1.96\sqrt{0.36 \times 0.64 / 400} \approx 0.047$, so the **confidence
interval** is roughly 31 to 41 percent. The library can say: "Between about
31 and 41 percent of households would use Sunday hours, by a method that
captures the true share 95 times in 100."

## Estimating: confidence intervals

**Inference** uses a sample to say something about a population, with the
uncertainty stated. A **confidence interval** is an estimate plus or minus a
margin of error. The confidence level (often 95 percent) describes the
method: across many samples, 95 percent of intervals built this way would
contain the true value. It isn't the probability that this particular
interval is right. Larger samples give narrower intervals: the margin shrinks
with the square root of the sample size, so quartering the margin takes
sixteen times the sample.

## Testing: hypotheses and p-values

A **hypothesis test** asks whether data are surprising under a default
assumption, the **null hypothesis** (for example, "Sunday hours don't change
weekly visits"). The **p-value** is the probability of results at least as
extreme as those observed, if the null were true. A small p-value says the
data sit poorly with the null.

The American Statistical Association's 2016 statement lists what p-values
don't do: they don't measure the probability that the hypothesis is true, or
the size or importance of an effect, and a conclusion shouldn't rest on
whether p crosses 0.05 alone [@wasserstein-lazar2016]. Report the effect size
and its interval alongside.

## Power

**Statistical power** is the probability that a test detects an effect of a
given size when the effect is real. Jacob Cohen's work made power analysis
standard: choose the smallest effect worth detecting, the significance level
and the power wanted (often 80 percent), and compute the sample size from
them [@cohen1988]. A study with low power can easily miss a real effect, so
"no significant difference" from a small study isn't evidence of no
difference.

## Two traps

**Correlation isn't causation.** Branches with more staff may have more
visitors because busy branches get more staff, not the reverse; a third
factor, such as the neighborhood's population, may drive both. Causal claims
need an experiment or a design that rules out the alternatives.

**Simpson's paradox.** A trend in every group can reverse when the groups are
combined [@simpson1951]. Suppose the share of Branch A's card holders who
visit on weekends rose this year among adults and among children, yet the
branch's overall share fell. That happens when the mix shifted: if A's card
holders are now mostly adults, who visit on weekends far less often than
children, the overall rate is pulled down even though each group's rate went
up. Always check whether a rate for the whole hides a change in mix.

## Check yourself

1. A poll reports 52 percent ± 3 points at 95 percent confidence. What range
   of values is plausible for the true share?
2. True or false: p = 0.03 means there's a 3 percent chance the null
   hypothesis is true.
3. A study of 20 people finds no significant effect of a new reading program.
   Why is this weak evidence that the program has no effect?
4. Ice cream sales and drownings rise together. What explains it?
5. How much larger must a sample be to halve the margin of error?

## Answers

1. From 49 to 55 percent.
2. False. It's the probability of data at least this extreme if the null
   were true, not the probability that the null is true.
3. With only 20 people, the test has low power: it could easily miss a real
   effect.
4. A third factor, hot weather, raises both.
5. Four times as large, because the margin shrinks with the square root of
   the sample size.
