---
name: "Market Neutral"
date-created: 2026-09-05
aliases:
  - "market neutral"
  - "market neutrality"
description: "A portfolio-construction target holding approximately zero net exposure to a stated benchmark or factor while still expressing an active view."
references: {}
---

A **market-neutral** portfolio is constructed to hold approximately zero net exposure — typically zero [beta](./beta.md) against a stated benchmark — while still expressing an active view through the relative sizing of its long and short positions. The construction goal is that the portfolio's profit or loss should depend on the accuracy of its relative bets (which securities outperform which others) rather than on the direction of the overall market, so a market-neutral portfolio's expected return does not depend on whether the benchmark itself rises or falls.

Market neutrality is a constraint applied during [portfolio-construction](./portfolio-construction.md), not a property that emerges automatically from holding both long and short positions: a long-short portfolio with unequal dollar amounts on each side, or with longs and shorts of different average beta, can still carry substantial net market exposure despite being nominally "long-short." Achieving neutrality against more than one factor — market beta and a stated set of style factors together — requires the [risk-model](./risk-model.md) the construction process is built on to actually measure those exposures accurately.

[Statistical-arbitrage](./statistical-arbitrage.md) strategies are commonly, though not necessarily, constructed to be market-neutral; [delta-neutral](./delta-neutral.md) is the analogous construction goal specific to options and derivatives positions, holding net sensitivity to the underlying's price near zero rather than net exposure to a broad market benchmark.
