---
name: "Alpha Research"
date-created: 2026-09-05
aliases:
  - "alpha research"
  - "signal research"
description: "The pipeline a quantitative fund runs to turn a candidate idea into a monitored, sized signal: hypothesis, feature, cross-validation, decay."
references:
  harveyliuzhu2016:
    authors: ["Campbell R. Harvey", "Yan Liu", "Heqing Zhu"]
    title: "...and the Cross-Section of Expected Returns"
    publication: "Review of Financial Studies 29(1)"
    year: 2016
---

**Alpha research** is the pipeline a quantitative fund runs to turn a candidate idea into a signal it is willing to size and trade. The standard stages are a stated **hypothesis** — an economic or behavioral mechanism that predicts a return pattern, not merely a correlation found by search — translated into a **feature**, a precisely defined, point-in-time-computable measurement ([point-in-time-data](./point-in-time-data.md)) built only from information that would actually have been available at the time of the forecast; **cross-validation** of the feature's predictive power on data withheld from its own discovery, typically walk-forward across chronological folds rather than randomly shuffled folds, because shuffling financial time series leaks future information into training; and ongoing **decay** monitoring ([alpha-decay](./alpha-decay.md)) once the signal is live, since a signal's measured edge is a property of a sample period and a crowd of traders that both change.

A hypothesis-first discipline is what separates research from [backtest-overfitting](./backtest-overfitting.md): a feature discovered by searching thousands of candidate transformations of the data until one appears profitable in-sample is a different epistemic object from a feature whose predicted sign and rough magnitude were stated before the confirming data was examined, even when the two features look identical on paper. Harvey, Liu and Zhu's review of the published factor literature (Harvey, Liu & Zhu 2016) argues the discipline should hold itself to a much higher statistical bar than a single-test analysis would suggest, precisely because so many candidate factors are tested across the field before one is published.

A signal that survives this pipeline still needs [portfolio-construction](./portfolio-construction.md) to turn it into position sizes, a [transaction-cost-model](./transaction-cost-model.md) to confirm it survives realistic costs, and [live-versus-backtest-reconciliation](./live-versus-backtest-reconciliation.md) once traded, to catch the gap between what the pipeline predicted and what actually happened.
