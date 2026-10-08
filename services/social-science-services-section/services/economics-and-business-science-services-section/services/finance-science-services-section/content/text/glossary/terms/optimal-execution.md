---
name: "Optimal Execution"
date-created: 2026-09-05
aliases:
  - "optimal execution"
  - "execution algorithm"
description: "Almgren and Chriss's framework for scheduling a trade over time to minimize expected market-impact cost against the price risk of taking longer to trade."
references:
  almgrenchriss2000:
    authors: ["Robert Almgren", "Neil Chriss"]
    title: "Optimal Execution of Portfolio Transactions"
    publication: "Journal of Risk 3(2)"
    year: 2000
  perold1988:
    authors: ["André F. Perold"]
    title: "The Implementation Shortfall: Paper Versus Reality"
    publication: "Journal of Portfolio Management 14(3)"
    year: 1988
---

**Optimal execution** is the problem of scheduling a given order — buy or sell a stated quantity — over a chosen time horizon to minimize a combination of expected trading cost and the risk of adverse price moves while the order is still being worked. Almgren and Chriss's framework (Almgren & Chriss 2000) formalizes the trade-off explicitly: trading the whole order quickly minimizes exposure to price risk during execution but pays more expected [market-impact](./market-impact.md) cost, because a fast trade consumes more liquidity per unit time; trading it slowly reduces expected impact cost but leaves the unexecuted remainder exposed to price moves for longer. The framework produces an optimal trading trajectory as a function of the trader's own risk aversion, the asset's volatility, and the assumed impact model, rather than a single "right" execution speed independent of the trader's preferences.

**Implementation shortfall** (Perold 1988) is the standard way to measure execution quality after the fact: the difference between the return of a hypothetical "paper" portfolio that traded instantly at the price prevailing when the decision was made, and the return actually realized once market impact, spread, delay, and any unfilled quantity are accounted for. It is the execution-side analogue of [live-versus-backtest-reconciliation](./live-versus-backtest-reconciliation.md)'s comparison at the strategy level.

An execution algorithm is the practical instrument built from this theory — commonly a schedule such as VWAP (matching historical volume shares) or TWAP (spreading evenly over time) as simple benchmarks, or a cost-aware schedule derived directly from an Almgren-Chriss-style optimization — routed to a venue through the mechanics [market-microstructure](./market-microstructure.md) describes.
