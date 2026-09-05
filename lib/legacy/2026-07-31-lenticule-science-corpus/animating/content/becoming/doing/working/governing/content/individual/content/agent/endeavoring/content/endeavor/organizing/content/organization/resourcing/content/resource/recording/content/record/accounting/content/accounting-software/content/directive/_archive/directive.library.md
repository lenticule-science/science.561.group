---

title: "Directive"
description: "A directive is any dated entry in a Beancount file. Unlike [Ledger](../../../ledger-cli.md), where directives are optional configuration, Beancount treats everything as a directive — transactions, account openings, balance assertions, price entries, and metadata all follow the same pattern: a date followed by a directive type."
aliases:
  - "Directive"
  - "directive"
  - "Beancount directive"
date-created: 2026-03-06T00:00:00
keywords:
  - accounting
---

A directive is any dated entry in a Beancount file.
Unlike [Ledger](../../../ledger-cli.md), where directives are optional configuration, Beancount treats everything as a directive — transactions, account openings, balance assertions, price entries, and metadata all follow the same pattern: a date followed by a directive type.

Core directives:

- `open` — declares an account.
  Accounts can't be used before they're opened.
- `close` — closes an account.
  No postings are allowed after this date.
- `txn` (or `*`) — a transaction with balanced postings.
- `balance` — asserts that an account's balance equals a specific amount on a date.
- `pad` — inserts an automatic balancing entry between two accounts.
- `price` — records a commodity price for a given date.
- `note` — attaches a text note to an account on a date.
- `document` — links a file (receipt, statement) to an account on a date.
- `event` — records a life event (e.g., address change) for tracking purposes.
- `commodity` — declares and configures a commodity.

The strict directive model means Beancount rejects anything it doesn't recognize, which catches typos and formatting errors at parse time rather than silently ignoring them.
