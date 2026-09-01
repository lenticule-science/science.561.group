---
name: "Basis Trade"
date-created: 2026-08-27
aliases:
  - "basis trade"
description: "A paired spot-and-futures position whose return depends on the futures basis converging, net of financing, execution, margin, and settlement costs."
references: {}
---

A **basis trade** takes opposing positions in an asset and a derivative on that asset to isolate changes in the **basis**: the difference between the derivative price and the relevant spot or reference price.

In a cash-and-carry trade, the trader buys the asset and sells a dated futures contract. In a reverse cash-and-carry trade, the directions are reversed. If both legs remain open until a cash-settled or deliverable contract expires, the derivative and settlement reference converge by contract design. Before expiry, however, the basis can widen as well as narrow.

The trade's economic result is not the quoted basis alone. It is the convergence captured, plus income on either leg, less spot financing or borrow, derivative funding, trading fees, bid-ask spreads, custody and transfer costs, taxes, and any loss caused by imperfect sizing or settlement mismatch. Leverage adds mark-to-market and [liquidation](./liquidation.md) risk: a position can be economically hedged at expiry yet unable to survive the path to expiry.

The construction is therefore **directionally hedged**, not risk-free. It retains counterparty, venue, custody, margin, settlement-reference, execution, and operational risk. The perpetual-contract analogue is [funding-rate arbitrage](./funding-rate-arbitrage.md); unlike a dated future, a [perpetual future](./perpetual-future.md) has no contractual expiry forcing convergence.

Dated observations about venue access, yields, and account-size feasibility belong in research records rather than in this definition.

