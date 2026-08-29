---
title: "Concentrated Liquidity"
date-created: 2026-08-27
aliases:
  - "concentrated liquidity"
  - "concentrated liquidity market maker"
  - "CLMM"
description: "An AMM design in which a liquidity provider allocates capital to a bounded price interval, concentrating fee exposure and inventory conversion within that interval."
references: {}
---

**Concentrated liquidity** lets an automated-market-maker liquidity provider choose a bounded price interval instead of supplying liquidity across the pool's entire price curve.

While the pool price is inside the interval, the position supplies both-sided liquidity and can earn its share of eligible trading fees. A narrower interval places more of a given amount of capital near the current price, increasing fee exposure per unit of capital if comparable trading passes through it. It also increases sensitivity to price movement and the likelihood that the position leaves its active range.

As price moves through the interval, the pool mechanically changes the position's inventory. At one boundary it becomes entirely one asset; at the other it becomes entirely the other. Outside the interval it stops supplying active liquidity and ordinarily stops accruing swap fees. If price later re-enters the interval, the existing position becomes active again without requiring withdrawal and re-minting, assuming the protocol and position remain otherwise unchanged.

The economic result equals fees and incentives minus [divergence loss](./impermanent-loss.md), transaction costs, rebalancing costs, financing, taxes, and protocol or token losses. Repositioning can restore active exposure but realizes a new inventory and cost basis; it does not erase the economics of the prior range. Advertised fee rates therefore are not position returns.
