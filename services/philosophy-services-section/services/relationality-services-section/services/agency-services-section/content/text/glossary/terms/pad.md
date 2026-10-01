---

name: "Pad"
description: "A pad directive tells Beancount to insert an automatic transaction that brings an account's balance to the amount required by the next balance assertion. It's used to bridge gaps in the data — typically when starting to track an account that already has a balance, or when there's a period of unrecorded activity."
aliases:
  - "Pad"
  - "pad"
  - "pad directive"
date-created: 2026-03-06T00:00:00
keywords:
  - accounting
type: term
---

A pad directive tells Beancount to insert an automatic transaction that brings an account's balance to the amount required by the next balance assertion.
It's used to bridge gaps in the data — typically when starting to track an account that already has a balance, or when there's a period of unrecorded activity.

```
2024-01-01 pad Assets:Checking Equity:Opening-Balances
2024-01-01 balance Assets:Checking  5000.00 USD
```

This creates a transaction from `Equity:Opening-Balances` to `Assets:Checking` for whatever amount is needed to make the balance assertion pass.
The pad directive always names two accounts: the account being padded and the account that absorbs the offsetting entry.

Pads are intentionally limited — Beancount only allows one pad between two consecutive balance assertions for the same account.
This prevents hiding discrepancies behind automatic adjustments.
If there's more than one gap, the user has to investigate and record the actual transactions.
