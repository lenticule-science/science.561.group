---
name: "Transaction Cost Model"
date-created: 2026-09-05
aliases:
  - "transaction cost model"
  - "transaction cost analysis"
description: "An explicit model of the costs a trading strategy pays to implement its target positions: commissions, spread, and market impact."
references: {}
---

A **transaction cost model** estimates, before or during a backtest or a live trade, the costs a strategy will pay to move from its current positions to its target positions. Costs are usually split into **explicit costs** — commissions, exchange and clearing fees, and venue schedules such as [maker-taker-fee](./maker-taker-fee.md) arrangements — which are contractually known in advance, and **implicit costs** — the bid-ask spread paid to cross the market and [market-impact](./market-impact.md), the price move a trade itself causes — which must be estimated from a model rather than read off a fee schedule.

A transaction cost model is only useful if it is applied where it changes a decision: in [alpha-research](./alpha-research.md), a signal's measured edge should be reported net of a realistic cost estimate rather than gross, because the finding that institutional [short-term-reversal](./short-term-reversal.md) profits erode from "excessively trading in small cap stocks" is a transaction-cost finding specifically about cost scaling with trade size, not about the underlying signal weakening; in [portfolio-construction](./portfolio-construction.md), a cost model lets a strategy trade off turnover against expected marginal benefit rather than rebalancing to a theoretically optimal target regardless of cost; and in [optimal-execution](./optimal-execution.md), a cost model's market-impact component is exactly what an execution schedule is built to minimize.

Cost estimates scale very differently with trade size than with account size: a small account and a large institutional account can pay approximately the same proportional spread cost on an equivalent-sized trade, while their market-impact costs diverge sharply, because impact grows with the trade's size relative to available liquidity rather than with the trader's absolute capital. See [strategy-capacity](./strategy-capacity.md) for how this asymmetry sets the scale at which a given strategy's transaction costs stop being negligible.
