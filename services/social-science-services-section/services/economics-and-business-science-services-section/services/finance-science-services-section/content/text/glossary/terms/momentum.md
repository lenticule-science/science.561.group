---
name: "Momentum"
date-created: 2026-08-27
aliases:
  - "momentum"
description: "Positive association between a return-ranking or trend signal and subsequent returns over a stated universe, formation window, and holding window."
references: {}
---

**Momentum** is a family of empirical return patterns and strategies in which stronger past performance is associated with stronger subsequent performance over a specified horizon.

**Cross-sectional momentum** ranks assets within a universe and compares or trades recent winners against recent losers. **Time-series momentum** compares each asset's own return or trend signal with a threshold and takes exposure in the signal's direction. The two designs answer different questions and can behave differently in the same market.

A momentum claim is incomplete without its universe, formation window, skip period, holding window, weighting, rebalance frequency, benchmark, and treatment of delistings and costs. Results can depend on liquidity, market regime, volatility scaling, shorting constraints, and data construction. Overlapping observations and repeated strategy searches can also make evidence appear stronger than it is.

Momentum strategies retain market and crash risk. Crowded positions can unwind together, and sharp reversals after extended trends can create losses larger than an average-return estimate suggests. Historical evidence is therefore a hypothesis about a defined implementation—not a timeless promise that “winners keep winning.”

See [short-term reversal](./short-term-reversal.md) for patterns whose sign differs at shorter horizons and [strategy capacity](./strategy-capacity.md) for scale-dependent execution.
