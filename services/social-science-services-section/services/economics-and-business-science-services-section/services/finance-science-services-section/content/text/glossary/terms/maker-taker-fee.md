---
name: "Maker-Taker Fee"
date-created: 2026-08-27
aliases:
  - "maker-taker fee"
  - "maker/taker fee"
description: "A venue fee schedule that distinguishes orders adding displayed or designated liquidity from orders removing it."
references: {}
---

A **maker-taker fee** schedule distinguishes an execution that adds eligible resting liquidity from one that removes it. The liquidity-adding side is the **maker**; the incoming order that executes against it is the **taker**.

A limit order is not automatically a maker order. A marketable limit order removes resting liquidity and is normally treated as taker flow. A nonmarketable order can rest and later receive maker treatment, subject to the venue's matching and fee rules.

Maker fees are often lower than taker fees and can be negative rebates, but the relationship is not universal. Some venues use inverted schedules, tiers, product-specific rates, or auctions with different classifications. Gross rebates also do not establish profitability: queue priority, fill probability, adverse selection, spread, inventory risk, cancellations, and market movement affect the result.

Trading systems should determine the applicable rate from the venue, product, account tier, order behavior, and execution record. Historical fee tables belong in dated operating data, because schedules and tiers can change independently of the financial concept.
