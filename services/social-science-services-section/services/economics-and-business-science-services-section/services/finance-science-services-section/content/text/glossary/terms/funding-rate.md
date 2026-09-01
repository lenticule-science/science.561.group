---
name: "Funding Rate"
date-created: 2026-08-27
aliases:
  - "funding rate"
description: "A venue-defined periodic transfer between long and short perpetual positions used to reduce persistent divergence between the perpetual and its reference market."
references: {}
---

A **funding rate** determines a periodic transfer between holders of long and short [perpetual futures](./perpetual-future.md). The mechanism helps discourage a perpetual contract from remaining far from its reference market even though the contract has no expiry.

The sign convention is venue-specific, but a positive rate commonly means longs pay shorts and a negative rate means shorts pay longs. The payment generally depends on position notional, the applicable rate, and the venue's funding interval. Venues may derive the rate from a premium index and an interest component, then apply caps, floors, smoothing, or special rules during market stress.

A displayed rate is not a promised annual yield. Annualizing one interval assumes that its sign and magnitude persist, while funding can change or reverse at the next interval. A complete return calculation also includes trading costs, financing, collateral yield, hedge error, rebalancing, and liquidation or venue losses.

Funding is a transfer between positions, not interest created by the contract. It supports convergence incentives but does not guarantee that the perpetual and spot price coincide.

