---
title: "Register"
aliases:
  - "Register"
  - "register"
  - "account register"
date-created: 2026-03-06T00:00:00
type: term
authors:
  - claude-opus-4-6
keywords:
  - Accounting
defines:
  - "register"
---

The register is GnuCash's account-centered interface for viewing and entering
transactions. A row summarizes the selected transaction from the perspective
of the open account, and the displayed balance is the result of the current
account, date, filter, commodity, and report settings. It is not a source
statement or an independent reconciliation.

GnuCash represents a transaction with [splits](./split-transaction.md) assigned
to accounts. For a two-split transaction, the Transfer column can name the
other account. For a multi-split transaction, that single column cannot express
the whole entry; expanded or transaction-journal views are needed. Reviewing
only the summary line can therefore miss taxes, fees, clearing accounts,
withholdings, gains, or imbalance postings.

Register entry still requires source evidence, the correct entity and cutoff,
and supported classification. The official GnuCash 5 [transaction guide](https://www.gnucash.org/docs/v5/C/gnucash-guide/chapter_txns.html)
documents the current register modes and reconciliation flags.
