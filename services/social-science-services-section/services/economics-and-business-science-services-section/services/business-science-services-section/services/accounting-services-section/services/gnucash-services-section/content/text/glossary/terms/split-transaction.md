---
title: "Split Transaction"
aliases:
  - "Split Transaction"
  - "split transaction"
  - "split"
date-created: 2026-03-06T00:00:00
type: term
authors:
  - claude-opus-4-6
keywords:
  - Accounting
defines:
  - "split transaction"
---

A split is GnuCash's account-level component of a transaction. Each split names
an account and carries an amount in that account's commodity plus a value in the
transaction currency. Every transaction is represented by splits; the
interface commonly calls an entry with more than two splits a “split
transaction.”

Multiple splits preserve the actual components of one economic event—for
example, an invoice, tax, fee, withholding, settlement clearing, and cash
effect—without collapsing them into a single net category. The split values
must balance in the transaction currency for a balanced
[double-entry](../../../../../../content/text/glossary/terms/double-entry-bookkeeping.md)
transaction. Different commodity amounts need not sum to zero as raw units.

Balance does not establish that the components belong to one event or that
their accounts, amounts, quantities, prices, and dates are correct. Inspect the
full split population, especially when the register displays only a summary.
