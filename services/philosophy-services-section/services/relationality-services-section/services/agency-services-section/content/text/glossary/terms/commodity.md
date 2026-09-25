---
title: "Commodity"
aliases:
  - "Commodity"
  - "commodity"
date-created: 2026-03-06T00:00:00
type: term
authors:
  - claude-opus-4-6
keywords:
  - accounting
description: In GnuCash, a commodity is anything that can be traded or held as a unit of value — currencies, stocks, mutual funds, and even physical goods.
---

In GnuCash, a commodity is anything that can be traded or held as a unit of value — currencies, stocks, mutual funds, and even physical goods.
Every [account](../../documents/articles/notes/2026/03/06/2026-03-06-account.md) in GnuCash is denominated in a commodity.
Most accounts use a currency (USD, EUR), but investment accounts use securities as their commodity.

GnuCash tracks exchange rates and prices between commodities, which is how it handles multi-currency accounting and investment portfolio tracking.
The price database stores historical prices for commodities, enabling cost basis calculations and unrealized gain/loss reports.
