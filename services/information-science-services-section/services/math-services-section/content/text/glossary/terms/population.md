---
name: "Population"
aliases:
  - "population"
  - "populations"
date-created: 2026-01-01
tags: []
---

A population is the complete [set](./set.md) of individuals, items, or observations that a statistical study aims to describe. It is the thing you actually want to know about — the [sample](./sample.md) is just the means by which you learn. If a medical researcher wants to know whether a drug lowers blood pressure in adults, the population is all adults (or perhaps all adults with hypertension, depending on the research question). If a manufacturer wants to know the defect rate of its products, the population is every item produced.

Populations can be finite and concrete: all 1,200 students at a particular school, all 50 states in the United States, all light bulbs produced in a factory this month. They can also be conceptually infinite: all possible rolls of a die (the die could be rolled forever), all adults who could ever take the drug (including future patients). The distinction matters because infinite populations cannot be observed in full even in principle, making sampling and inference unavoidable.

Population parameters are numerical summaries of the entire population: the population [mean](./mean.md) $\mu$, the population [variance](./variance.md) $\sigma^2$, the population proportion $p$, and so on. These parameters are typically unknown — if you knew the mean blood pressure of all adults, you would not need a study. The goal of statistical inference is to estimate population parameters from sample statistics (the sample mean $\bar{x}$, sample variance $s^2$, etc.) and to quantify the uncertainty of those estimates through confidence intervals, p-values, or [posterior](./posterior.md) distributions.

A well-defined population requires clear membership criteria: who or what is included, and who or what is excluded. This sounds trivial but is often the hardest part of a study. "All adults" includes people of every age, nationality, and health status — is that really who you mean? "All adults with hypertension" requires a definition of hypertension (what blood pressure threshold?). Ambiguity about the population leads directly to ambiguity about what the study's conclusions mean and to whom they apply. The generalizability of a study — whether its results extend beyond the specific sample — depends on the match between the sample and the population it is intended to represent.

The mathematical relationship between population and sample is formalized through probability theory. Each observation in the sample is modeled as an independent random draw from the population (or more precisely, from the population's probability distribution). The [independence](./independence.md) assumption is what justifies the mathematical machinery of inference: the law of large numbers, the central limit theorem, and the formulas for standard errors all depend on it. When independence fails — as it does in clustered data, time series, or spatially correlated observations — the standard formulas can give misleading results, and more sophisticated methods are needed.

## Additional material from the Google Drive library

A population is the complete [set](./set.md) of individuals, items, or observations that a statistical study aims to describe. The population is what we want to know about; a [sample](./sample.md) is the subset we actually observe. The population may be finite (all students in a school) or conceptually infinite (all possible rolls of a die).

Population parameters — the [mean](./mean.md), [variance](./variance.md), proportions, and other summaries of the full population — are typically unknown and must be estimated from sample data. The goal of statistical inference is to draw conclusions about population parameters using sample statistics, together with a measure of uncertainty (confidence intervals, p-values, or [posterior](./posterior.md) distributions).

A well-defined population requires clear membership criteria: who or what is included, and who or what is excluded. Ambiguity about the population leads to ambiguity about what the statistical conclusions mean. The relationship between population and sample is formalized through probability theory: each sample is modeled as a random draw from the population, and the [independence](./independence.md) assumption justifies the mathematical machinery of inference.
