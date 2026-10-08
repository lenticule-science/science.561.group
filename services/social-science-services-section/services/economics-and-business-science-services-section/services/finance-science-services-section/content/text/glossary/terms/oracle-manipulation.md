---
name: "Oracle Manipulation"
date-created: 2026-08-27
aliases:
  - "oracle manipulation"
  - "price oracle attack"
description: "A deliberate distortion of data or markets used by a protocol's price oracle in order to change collateral, settlement, or liquidation outcomes."
references: {}
---

**Oracle manipulation** is the deliberate distortion of a protocol's price input or of the market data from which that input is derived. The attacker seeks a favorable collateral valuation, borrowing limit, trade settlement, or [liquidation](./liquidation.md) outcome.

Attack paths include trading against a thin source market, concentrating activity inside an averaging window, compromising or bribing reporters, exploiting stale or fallback logic, changing governance-controlled configuration, and combining several individually valid inputs in an unsafe way. Manipulation differs from passive [oracle divergence](./oracle-divergence.md), although both can produce the same incorrect economic decision.

A time-weighted average price can make a short-lived spot distortion more expensive, but it is not a universal defense: a sustained attack can affect the average, and a long window can make the oracle dangerously slow. Robust design combines controls appropriate to the asset, such as independent sources, liquidity screens, freshness and deviation limits, conservative collateral parameters, borrow or position caps, circuit breakers, governance controls, and incident procedures.

Oracle safety is a property of the whole decision system, not merely of the feed contract. The source markets, transformations, update incentives, administrative permissions, and downstream risk parameters all belong in the threat model.
