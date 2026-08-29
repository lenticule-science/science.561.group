---
title: "Funding-Rate Arbitrage"
date-created: 2026-08-27
aliases:
  - "funding-rate arbitrage"
description: "A paired spot-and-perpetual position intended to isolate funding carry while limiting exposure to changes in the underlying asset's price."
references: {}
---

**Funding-rate arbitrage** commonly pairs a long spot position with a short [perpetual future](./perpetual-future.md) on the same asset. With matched quantities, changes in the underlying price offset approximately, while the short receives funding when the venue's [funding rate](./funding-rate.md) requires longs to pay shorts. The reverse construction may be used when shorts pay longs and the necessary borrow is available.

The position is better described as **delta-neutral carry** than as pure arbitrage. Its net return is funding received minus funding paid, trading fees, spreads, borrow and financing costs, transfers, collateral opportunity cost, taxes, and hedge maintenance. Funding can reverse sign; spot and perpetual quantities can drift apart; and the two legs can use different price references.

The margined leg may be [liquidated](./liquidation.md) before the hedge's economics recover. A liquidation leaves the surviving leg directionally exposed, often during the same volatility that broke the hedge. The construction also retains counterparty, custody, smart-contract, oracle, withdrawal, and venue-access risk.

Consequently, neither an observed funding rate nor its simple annualization establishes an expected return. Feasibility depends on the full return decomposition, operational controls, and enough liquidity and collateral to maintain both legs.
