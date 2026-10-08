---
name: "Statistical Arbitrage"
date-created: 2026-09-05
aliases:
  - "statistical arbitrage"
  - "stat arb"
  - "pairs trading"
description: "Market-neutral strategies that trade statistical relationships among related securities' prices, typically at high turnover and short holding periods."
references: {}
---

**Statistical arbitrage** ("stat arb") is a family of trading strategies that take offsetting long and short positions in related securities based on a statistical relationship between their prices — most classically, a **pairs trade** that buys one security and sells a historically correlated or cointegrated one when their price relationship diverges from its historical pattern, on the expectation that it will converge again. The strategies are typically constructed to be [market-neutral](./market-neutral.md), hedging out broad market exposure so the position's profit or loss depends primarily on the relative, not absolute, price move.

The approach generalizes beyond simple pairs to baskets of securities modeled jointly, often using [factor-model](./factor-model.md) residuals — the return left over after a security's factor exposures are subtracted — as the mean-reverting quantity actually traded, rather than raw prices. Because the exploited relationships are typically small and short-lived, statistical arbitrage strategies tend to run at high turnover and short holding periods, which puts [transaction-cost-model](./transaction-cost-model.md) and [market-impact](./market-impact.md) considerations, and the [strategy-capacity](./strategy-capacity.md) ceiling they impose, close to the center of whether a given stat-arb signal is actually tradeable at a given scale.

Renaissance Technologies is the most-cited example of a firm whose original strategies were statistical-arbitrage-style short-horizon signals across large numbers of instruments, though — as with any proprietary strategy — its specific current methods are not publicly disclosed and outside descriptions are reconstructions rather than primary disclosure.
