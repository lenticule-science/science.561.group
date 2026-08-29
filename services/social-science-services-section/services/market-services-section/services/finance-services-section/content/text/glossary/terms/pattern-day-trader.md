---
title: "Pattern Day Trader"
date-created: 2026-08-27
aliases:
  - "pattern day trader"
  - "PDT"
  - "PDT rule"
description: "A US brokerage regulatory and account-policy classification historically based on repeated same-day round trips in a margin account."
references: {}
---

A **pattern day trader** (**PDT**) is a US brokerage classification historically associated with repeated **day trades** in a margin account. A day trade generally opens and closes the same security position on the same trading day, with detailed counting rules for partial fills, options, and position direction.

The classification has been tied to minimum equity, buying-power, margin-call, and restriction requirements. Exact thresholds, counting windows, exceptions, and consequences are legal and broker-implementation facts rather than properties of day trading itself.

The term should not be used as a universal explanation for why an order was rejected. Cash availability, settlement, options approval, security eligibility, house margin, [intraday margin](./intraday-margin.md), and risk controls can independently constrain same-day trading.

Because US margin rules and broker implementations can change, current applicability must be determined from primary regulatory material and the broker's live account documentation. Dated research records should preserve historical thresholds and transition dates; execution code should consume current account fields and rejection reasons rather than infer them from an old PDT count.
