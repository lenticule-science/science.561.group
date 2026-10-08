---
name: "Oracle Divergence"
date-created: 2026-08-27
aliases:
  - "oracle divergence"
description: "A difference between a protocol's reference price and another relevant or executable market price caused by source, timing, methodology, or market-structure differences."
references: {}
---

**Oracle divergence** is a difference between the price a protocol uses and another price relevant to the same asset or position. There is no single context-free “true market price”: executable prices vary by venue, size, direction, time, liquidity, settlement terms, and currency.

Divergence can arise from reporting latency, averaging windows, stale or missing sources, thin markets, exchange outages, different quote currencies, market-hours mismatch, index construction, or deliberate [oracle manipulation](./oracle-manipulation.md). A protocol may continue to apply its designated reference correctly even when that reference differs materially from the price at which a user can hedge or sell.

The consequence depends on how the price is used. Divergence can change collateral value, borrowing capacity, margin, settlement, or a [liquidation](./liquidation.md) trigger. In a multi-venue hedge, one leg can be closed from movements in its reference price while the other remains open at a different executable price.

Controls include multiple independent sources, source and market-liquidity requirements, freshness checks, bounded update rates, circuit breakers, conservative collateral factors, market-hours rules, and procedures for degraded data. Each control trades responsiveness against resistance to noise or manipulation.
