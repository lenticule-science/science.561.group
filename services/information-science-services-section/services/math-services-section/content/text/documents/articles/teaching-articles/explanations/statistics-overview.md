---
title: "Statistics Overview"
description: "Audience: beginners learning to summarize data. What statistics is for, the difference between describing data and inferring from it, and where the lessons in this section fit."
aliases:
  - "Statistics Overview"
date-created: 2026-01-01
date-modified: 2026-09-27
keywords:
  - statistics
requires:
  - ../../../../glossary/terms/sample.md
teaches:
  - "Statistics Overview"
id: statistics-lesson-overview
authors:
  - gpt-5.2-codex
  - claude-opus-5-5
type: explanation
article-kind: lesson
---

**You'll be able to:** say what statistics does, tell descriptive statistics
from inference, and choose which lesson to read next.

## A worked example first

A library system has every checkout record for the year. Asking "how many
books did the Eastside branch lend in March?" needs only counting: the
records are the whole population. Asking "how many county residents would
use a book locker at the train station?" can't be answered from checkout
records, and nobody can ask every resident. The library surveys a random
sample of 400 households and estimates the share, with a margin of error.

The first question is **descriptive**: it summarizes data in hand. The second
is **inferential**: it reasons from a sample to a population that wasn't
measured in full.

## What statistics does

Statistics is the discipline of learning from data when the data vary. It has
two main parts:

- **Descriptive statistics** summarize the data you have: centers, spreads,
  shapes, tables and plots. See [Descriptive Statistics](descriptive-statistics.md).
- **Inferential statistics** estimate properties of a population from a
  sample and state how uncertain the estimate is. See
  [Inference Basics](inference-basics.md).

Both depend on how the data were gathered. A biased sample defeats inference
no matter how careful the arithmetic. See
[Sampling and Bias](sampling-and-bias.md).

Statistics also rests on [probability](probability-overview.md), which models
the chance variation that sampling introduces, and on measurement: a column's
scale (nominal, ordinal, interval, ratio) decides which summaries it allows.
A data table itself has structure beyond its numbers, which
[From Data Tables to Concept Lattices](from-data-tables-to-concept-lattices.md)
extracts.

## Check yourself

1. Is "the average age of this year's library-card holders," computed from
   the card database, descriptive or inferential?
2. Why do statisticians use samples instead of measuring an entire
   population?
3. Why can careful calculations on a biased sample still mislead?

## Answers

1. Descriptive: the database holds the whole population in question.
2. Because measuring everyone is often impossible, slow or expensive, and a
   well-drawn random sample estimates population values with a known margin
   of error.
3. Because the sample doesn't represent the population, so an exact summary
   of it is an exact summary of the wrong group.
