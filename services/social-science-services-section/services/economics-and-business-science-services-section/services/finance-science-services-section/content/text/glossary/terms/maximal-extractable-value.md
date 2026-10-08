---
name: "Maximal Extractable Value"
date-created: 2026-08-27
aliases:
  - "maximal extractable value"
  - "MEV"
  - "miner extractable value"
description: "Value obtainable by choosing, excluding, or ordering transactions relative to a default ordering."
references: {}
---

**Maximal extractable value** (**MEV**) is value obtainable by controlling or influencing transaction inclusion and ordering relative to a default ordering. The term originated as *miner extractable value* but also applies to validators, sequencers, builders, searchers, and other actors in a transaction-supply chain.

MEV-producing mechanisms include arbitrage, [liquidation](./liquidation.md) competition, transaction back-running, censorship or delay, and sandwiching a user's trade between transactions that move the execution price against that user. Some MEV performs economically useful functions such as restoring price consistency or closing unhealthy loans; the distribution of its gains and costs can nevertheless be unequal.

An opportunity's gross value is not a searcher's net profit. Competition can move value to block producers or sequencers through priority fees, private-order-flow payments, failed transactions, auctions, or explicit revenue sharing. Network architecture determines who can observe pending orders and who has ordering authority, so access and concentration vary by chain and venue.

Users and protocols can reduce harmful exposure with bounded slippage, limit orders, batch or frequent auctions, private or encrypted order flow, fair-ordering rules, intent systems, liquidation auctions, and minimized information leakage. Every mechanism has tradeoffs in latency, execution certainty, transparency, and centralization.
