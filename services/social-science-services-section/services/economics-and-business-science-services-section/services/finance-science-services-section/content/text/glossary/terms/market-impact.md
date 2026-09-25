---
name: "Market Impact"
date-created: 2026-09-05
aliases:
  - "market impact"
  - "price impact"
description: "The price movement a trade itself causes by consuming available liquidity or revealing information, distinguished from the ambient bid-ask spread."
references:
  kyle1985:
    authors: ["Albert S. Kyle"]
    title: "Continuous Auctions and Insider Trading"
    publication: "Econometrica 53(6)"
    year: 1985
---

**Market impact** is the price movement a trade causes by being executed, as distinct from the spread cost every trade pays regardless of size. Market microstructure theory attributes impact to two related mechanisms: consuming the liquidity resting at the best available prices, which mechanically moves the price against the trader as an order walks through the order book, and revealing information, since a market maker facing an incoming order cannot immediately tell whether it comes from an informed trader (Kyle 1985) and defensively adjusts prices in response to order flow generally.

Kyle's model formalizes the second mechanism as a linear price-impact coefficient (often called "Kyle's lambda") relating the size of a trade to its permanent effect on price, under an assumption that an informed trader's flow cannot be told apart from noise trading at the moment of the trade. Empirical work across many markets has found that impact often grows roughly with the square root of trade size relative to average volume rather than linearly, a widely used approximate rule known as the square-root law of market impact.

Impact separates into a **temporary** component that reflects only the immediate liquidity consumed and decays as the market replenishes, and a **permanent** component that reflects new information the trade is taken to convey and does not decay. [Optimal-execution](./optimal-execution.md) schedules a trade over time specifically to trade off how much temporary impact a fast execution incurs against how much price risk a slow execution is exposed to while it waits.
