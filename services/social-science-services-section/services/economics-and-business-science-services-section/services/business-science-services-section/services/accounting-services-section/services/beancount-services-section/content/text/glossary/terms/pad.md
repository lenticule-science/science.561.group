---
name: "Pad"
aliases:
  - "Pad"
  - "pad"
  - "pad directive"
date-created: 2026-03-06T00:00:00
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---


A `pad` directive authorizes Beancount to generate an adjustment that brings an
account to the quantity required by a following balance assertion. The named
offset account receives the other side. Padding is chiefly a conversion tool
for supported balances whose earlier transaction history is outside the
admitted ledger population.

```
2024-01-01 pad Assets:Checking Equity:Opening-Balances
2024-01-01 balance Assets:Checking  5000.00 USD
```

In this example, the generated adjustment uses `Equity:Opening-Balances` as the
offset. The amount must be supported by evidence at the opening cutoff. The
account name explains that the entry bridges a conversion boundary; it does
not prove that every unexplained difference is substantively owners' equity.

A pad can make an assertion pass while concealing missing activity, incorrect
ownership, the wrong cutoff, or a bad source amount. Do not use one as a routine
reconciliation plug. Retain the opening source, review the generated entry, and
record known transactions explicitly. For an established book, unexplained
differences remain unresolved until evidence identifies their cause.

The official [Getting Started with Beancount](https://beancount.github.io/docs/getting_started_with_beancount/)
guide documents padding mechanics; the accounting control over opening balances
is broader than those mechanics.
