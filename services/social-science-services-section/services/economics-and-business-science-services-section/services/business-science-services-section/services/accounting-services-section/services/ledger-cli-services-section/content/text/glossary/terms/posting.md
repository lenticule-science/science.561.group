---
title: "Posting"
aliases:
  - "Posting"
  - "posting"
date-created: 2026-03-06T00:00:00
type: term
authors:
  - claude-opus-4-6
keywords:
  - Accounting
defines:
  - "posting"
---

# Posting

A posting is an account-level component of a Ledger transaction. It can carry an
amount, commodity, cost, price, state, date, assertion, and metadata. Ordinary
posting values participate in transaction balance; virtual postings have
different rules.

```
2024/03/15 Grocery Store
    Expenses:Food:Groceries    \$52.47
    Assets:Checking
```

Here the omitted cash amount is inferred as the balancing USD value. In a
multi-commodity transaction, Ledger uses cost and price syntax to relate unlike
units; the raw commodity quantities do not themselves sum to zero.

A posting is a representation, not source evidence. A balanced transaction can
still use the wrong account, entity, quantity, cost, price, date, or
counterparty, and it can omit the economic event entirely. Retain a stable
source identifier and reconcile the resulting account populations.
