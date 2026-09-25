---
name: "Drawdown"
date-created: 2026-09-05
aliases:
  - "drawdown"
  - "maximum drawdown"
description: "The decline in a portfolio's value from a prior peak to a subsequent trough, and the maximum such decline over a track record."
references: {}
---

A **drawdown** is the decline in a portfolio's or strategy's value from a previous peak to a subsequent trough, expressed as a percentage of the peak value. **Maximum drawdown** — the largest such decline observed over a track record or backtest — is one of the most commonly reported risk statistics for a trading strategy, because it states directly the worst loss an investor holding through the full period would actually have experienced, in a way an average-volatility statistic such as the [sharpe-ratio](./sharpe-ratio.md)'s denominator does not.

Drawdown is closely related to, but distinct from, [risk-of-ruin](./risk-of-ruin.md): a drawdown is a realized or backtested historical fact about a specific track record, while risk of ruin is a forward-looking probability, under a stated model, that a wealth process reaches some failure boundary before its objective — an [absorbing-barrier](./absorbing-barrier.md), in the vocabulary this glossary uses for that boundary. A strategy can have a historically modest maximum drawdown and still carry a high forward risk of ruin if its historical sample happened not to include the scenario that would produce one.

Drawdown-based sizing rules — reducing or halting exposure after a drawdown of a stated size — are a common practical control layered on top of, rather than a replacement for, a stated position-sizing rule such as [kelly-criterion](./kelly-criterion.md) or its [fractional-kelly](./fractional-kelly.md) variant.
