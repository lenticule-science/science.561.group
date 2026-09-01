---

title: "Posting"
description: "A posting is one line within a Ledger transaction that assigns an amount to an account. Every transaction contains at least two postings, and their amounts must sum to zero (enforcing [double-entry bookkeeping](../../../../../terms/double-entry-bookkeeping.md)). Ledger allows the last posting in a transaction to omit its amount — the software infers it from the balance."
aliases:
  - "Posting"
  - "posting"
date-created: 2026-03-06T00:00:00
keywords:
  - accounting
---

A posting is one line within a Ledger transaction that assigns an amount to an account.
Every transaction contains at least two postings, and their amounts must sum to zero (enforcing [double-entry bookkeeping](../../../../../terms/double-entry-bookkeeping.md)).
Ledger allows the last posting in a transaction to omit its amount — the software infers it from the balance.
Example:

```
2024/03/15 Grocery Store
    Expenses:Food:Groceries    \$52.47
    Assets:Checking
```

Here there are two postings: one debiting `Expenses:Food:Groceries` for \$52.47, and one crediting `Assets:Checking` for the balancing amount (-\$52.47), which Ledger infers.
