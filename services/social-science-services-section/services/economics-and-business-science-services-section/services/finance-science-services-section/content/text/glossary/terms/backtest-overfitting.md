---
name: "Backtest Overfitting"
date-created: 2026-09-05
aliases:
  - "backtest overfitting"
  - "backtest overfit"
description: "The tendency of a backtested strategy to appear more profitable than it will be live, from searching many variants until one looks good on the same data used to judge it."
references:
  harveyliuzhu2016:
    authors: ["Campbell R. Harvey", "Yan Liu", "Heqing Zhu"]
    title: "...and the Cross-Section of Expected Returns"
    publication: "Review of Financial Studies 29(1)"
    year: 2016
  baileylopezdeprado2014:
    authors: ["David H. Bailey", "Marcos López de Prado"]
    title: "The Deflated Sharpe Ratio: Correcting for Selection Bias, Backtest Overfitting, and Non-Normality"
    publication: "Journal of Portfolio Management 40(5)"
    year: 2014
---

**Backtest overfitting** is the inflation of a strategy's apparent historical performance that results from the strategy, its parameters, or its universe having been selected, tuned, or filtered using the very data later used to evaluate it. Because a researcher can try many rule variants, parameter values, entry and exit conditions, and asset universes, some variant will look profitable purely by chance even with no real underlying edge; the more variants tried, the more likely one clears any fixed statistical bar by luck alone.

Two standard defenses address this. **Multiple-testing correction** raises the statistical bar a claimed effect must clear in proportion to how many candidate effects were searched before it was found; Harvey, Liu and Zhu's review of the published factor literature (Harvey, Liu & Zhu 2016) argues that, given the number of factors tried across published finance research, a newly proposed factor should be held to a t-statistic threshold well above the conventional 2.0. The **deflated Sharpe ratio** (Bailey & López de Prado 2014) adjusts a strategy's measured [sharpe-ratio](./sharpe-ratio.md) downward for the number of independent trials effectively run to find it, and for the non-normality (skew, kurtosis) of its return distribution, to estimate the probability that the observed Sharpe ratio would occur by chance under a true Sharpe ratio of zero.

**Walk-forward validation** structures the check itself, rather than only correcting its statistics after the fact: a strategy is fit only on data chronologically before a given point and tested only on data strictly after it, repeated across rolling windows, so no parameter choice ever sees the data used to grade it. A walk-forward split must also purge and embargo observations near the train/test boundary when a feature's label depends on a forward-looking window, or information still leaks across the boundary despite the chronological ordering. See [alpha-research](./alpha-research.md) for where this validation sits in the research pipeline, and [live-versus-backtest-reconciliation](./live-versus-backtest-reconciliation.md) for the final check — comparing live results to the backtest itself — that catches overfitting a validation split did not.
