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

The register is GnuCash's primary interface for viewing and entering transactions within a single account.
It resembles a checkbook register — each row is a transaction showing date, description, transfer account, and amount.
The register displays the running balance for the account.

Under the hood, each entry in the register is one side of a [double-entry](../../terms/double-entry-bookkeeping.md) transaction; the "transfer account" column shows where the other side posts.
Users can switch between "basic ledger" (one line per transaction), "auto-split ledger" (expands the selected transaction to show all [splits](./split-transaction.md)), and "transaction journal" (shows all splits for every transaction) views.
