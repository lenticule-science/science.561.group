---
title: "Descriptive Statistics"
description: "Audience: beginners summarizing data. How to describe a column of numbers by its center and spread, which summary fits which data, and why a summary never replaces a plot."
aliases:
  - "Descriptive Statistics"
date-created: 2026-01-01
date-modified: 2026-09-27
keywords:
  - statistics
  - mean
  - median
  - standard-deviation
requires:
  - ../../../../glossary/terms/mean.md
  - ../../../../glossary/terms/median.md
  - ../../../../glossary/terms/variance.md
teaches:
  - "Descriptive Statistics"
id: statistics-lesson-descriptive
authors:
  - gpt-5.2-codex
  - claude-opus-5-5
type: explanation
article-kind: lesson
references:
  stevens1946:
    type: article-journal
    title: On the Theory of Scales of Measurement
    author:
      - family: Stevens
        given: S. S.
    container-title: Science
    volume: "103"
    issue: "2684"
    page: 677-680
    issued:
      date-parts:
        - [1946]
  anscombe1973:
    type: article-journal
    title: Graphs in Statistical Analysis
    author:
      - family: Anscombe
        given: F. J.
    container-title: The American Statistician
    volume: "27"
    issue: "1"
    page: 17-21
    issued:
      date-parts:
        - [1973]
  tukey1977:
    type: book
    title: Exploratory Data Analysis
    author:
      - family: Tukey
        given: John W.
    publisher: Addison-Wesley
    issued:
      date-parts:
        - [1977]
---

**You'll be able to:** summarize a column of data by its center and its
spread; choose the mean or the median for a given column; and explain why a
summary should be checked against a plot.

**Before you start:** the terms [mean](../../../../glossary/terms/mean.md),
[median](../../../../glossary/terms/median.md) and
[variance](../../../../glossary/terms/variance.md).

## A worked example first

A small library branch records its Saturday visitors for seven weeks:

    120, 135, 128, 142, 131, 126, 410

The seventh Saturday was the book sale.

- **Mean:** the sum, 1,192, divided by 7, is about 170.
- **Median:** sorted, the values are 120, 126, 128, 131, 135, 142, 410; the
  middle (fourth) value is 131.
- **Range:** 410 − 120 = 290.
- **Interquartile range (IQR):** the middle half of the data runs from the
  first quartile, 126, to the third, 142, so IQR = 16.

The mean says a typical Saturday brings 170 visitors; six of the seven
Saturdays brought fewer than 145. One unusual week pulled it up. The median,
131, and the IQR, 16, describe the ordinary Saturday; the range, 290, is
mostly the book sale.

## Center and spread

Descriptive statistics summarize data you have, without claiming anything
about data you don't. Two questions organize them:

- **Where is the center?** The **mean** (sum divided by count) uses every
  value and is pulled by extremes. The **median** (the middle value when
  sorted) resists extremes. The **mode** (the most common value) is the only
  center for categories.
- **How spread out is it?** The **range** (maximum minus minimum) depends on
  two values only. The **variance** is the mean squared distance from the
  mean; its square root, the **standard deviation**, is in the data's own
  units. The **IQR** is the spread of the middle half and, like the median,
  resists extremes.

Pair them: report the mean with the standard deviation, or the median with
the IQR. For skewed data or data with outliers, prefer the median and IQR.
John Tukey's **five-number summary** (minimum, first quartile, median, third
quartile, maximum), drawn as a box plot, shows both at once [@tukey1977].

## Which summaries a column allows

S. S. Stevens sorted measurements into four scales, each allowing more
operations than the last [@stevens1946]:

| Scale | Example | Center you can use |
|---|---|---|
| Nominal | Branch name | Mode |
| Ordinal | Satisfaction, 1 to 5 | Median, mode |
| Interval | Temperature in °F | Mean, median, mode |
| Ratio | Visitors, dollars | All, and ratios such as "twice as many" |

Averaging an ordinal rating treats the gaps between "poor" and "fair" and
between "good" and "excellent" as equal, which the scale doesn't promise.

## Always plot

In 1973 F. J. Anscombe published four small data sets with the same means,
variances, correlation and regression line, which look completely different
when plotted: one a straight line, one a curve, one a line with an outlier,
one a vertical stack with a single distant point [@anscombe1973]. Summaries
compress; plots show what was compressed away.

## Check yourself

1. Seven home prices are $180k, $195k, $200k, $210k, $220k, $230k and $2.1M.
   Which center describes a typical home, and why?
2. What's the median of 4, 9, 2, 7?
3. Why is a standard deviation easier to interpret than a variance?
4. Survey answers are "strongly disagree" to "strongly agree," coded 1 to 5.
   Which center is safest to report?
5. What did Anscombe's quartet show?

## Answers

1. The median, $210k. One very expensive home pulls the mean far above what
   the other six cost.
2. Sorted: 2, 4, 7, 9. With an even count, the median is the mean of the two
   middle values: (4 + 7) / 2 = 5.5.
3. It's in the same units as the data (visitors, dollars), while variance is
   in squared units.
4. The median (or the mode): the data are ordinal.
5. That data sets with identical summary statistics can have very different
   shapes, so data must be plotted as well as summarized.
