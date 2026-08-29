---
title: "Impermanent Loss"
date-created: 2026-08-27
aliases:
  - "impermanent loss"
  - "divergence loss"
description: "The value difference between an AMM liquidity position and a stated hold benchmark caused by the pool's inventory rebalancing as relative prices change."
references: {}
---

**Impermanent loss**, more precisely called **divergence loss**, is the difference between the value of an automated-market-maker liquidity position and the value of a stated benchmark that holds the contributed assets outside the pool.

As relative prices change, an AMM mechanically sells some of the appreciating asset and acquires some of the depreciating asset. The liquidity provider therefore holds a different inventory from the hold benchmark. The difference exists economically while the position remains open; withdrawal does not create it. Withdrawal merely fixes the current inventory outside the pool. If relative prices retrace, the difference may shrink or disappear, which explains the historical word *impermanent* but does not make an open loss unreal.

The benchmark must be explicit: initial quantities held, periodically rebalanced holdings, or another portfolio can produce different comparisons. Fees and incentives are separate return components that may offset or exceed divergence loss, but they do not alter its definition.

For [concentrated liquidity](./concentrated-liquidity.md), the result also depends on the chosen interval and starting price. Narrow ranges change inventory more rapidly over a smaller price movement and can finish entirely in one asset at a boundary.
