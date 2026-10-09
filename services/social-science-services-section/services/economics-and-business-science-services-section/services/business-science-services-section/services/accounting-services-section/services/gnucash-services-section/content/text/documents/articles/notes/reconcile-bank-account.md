---
title: "Reconcile a Bank Account in GnuCash"
aliases:
  - "Reconcile a Bank Account in GnuCash"
date-created: 2026-03-06T00:00:00
type: skill
authors:
  - claude-opus-4-6
keywords:
  - accounting
description: Reconciliation in GnuCash marks the register population matched to a bank statement at a common cutoff and computes the remaining difference.
---

Reconciliation in GnuCash marks the [register](../../../glossary/terms/register.md)
population matched to a bank statement at a common cutoff and computes the
remaining difference. It is one control over cash completeness and existence;
it does not by itself establish that every item is authorized, correctly
classified, measured on the right basis, or recorded in the right period.

## Steps

1. Open the account register for the bank account.
2. Go to Actions > Reconcile.
3. Confirm that the prior reconciled opening balance agrees with the statement,
   then enter the statement date and ending balance.
4. Match statement and book activity in both directions. Compare dates,
   identifiers, payees, amounts, currency, and transaction substance rather than
   selecting rows merely to reach zero.
5. Explain every remaining item as a supported timing difference, book omission
   or error, source error, or unresolved difference. Post only supported book
   corrections.
6. When the matched population and explanations produce zero difference, finish
   the workflow. GnuCash marks the reconciled splits with `y`; retain the
   statement identifier and the open-item explanation outside that single
   status flag.

A zero difference is necessary but not sufficient because offsetting errors can
cancel. GnuCash exposes a Balance action that can create an orphan balancing
transaction; do not use it to erase an unexplained difference in controlled
books. The official GnuCash 5 [reconciliation guide](https://www.gnucash.org/docs/v5/C/gnucash-guide/chapter_txns.html#txns-reconcile1)
documents the interface, while the retained reconciliation record carries the
accounting explanation.
