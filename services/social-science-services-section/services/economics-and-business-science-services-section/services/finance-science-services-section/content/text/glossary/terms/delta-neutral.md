---
title: "Delta-Neutral"
date-created: 2026-08-27
aliases:
  - "delta-neutral"
description: "A portfolio state whose first-order sensitivity to a specified underlying price is approximately zero at a stated time and set of market inputs."
references: {}
---

A portfolio is **delta-neutral** when the sum of its position deltas with respect to a specified underlying price is approximately zero. Delta measures the first-order change in portfolio value for a small change in that underlying, holding the model's other inputs fixed.

Neutrality is local and conditional. Options delta changes with price, time, volatility, rates, and dividends; even spot-and-futures hedges can drift through contract multipliers, basis changes, funding, and differing reference prices. A portfolio can be neutral to one underlying while exposed to another currency, volatility, interest rate, or cross-asset factor.

Maintaining neutrality usually requires rebalancing, which creates spreads, fees, market impact, taxes, and execution risk. Discontinuous price moves and nonlinear exposures such as gamma mean that a zero initial delta does not guarantee a zero realized gain or loss.

Delta-neutral constructions can isolate option volatility, [funding](./funding-rate.md), or a [basis](./basis-trade.md), but they retain liquidity, financing, counterparty, [liquidation](./liquidation.md), oracle, and operational risks. “Neutral” names one modeled sensitivity, not absence of risk.
