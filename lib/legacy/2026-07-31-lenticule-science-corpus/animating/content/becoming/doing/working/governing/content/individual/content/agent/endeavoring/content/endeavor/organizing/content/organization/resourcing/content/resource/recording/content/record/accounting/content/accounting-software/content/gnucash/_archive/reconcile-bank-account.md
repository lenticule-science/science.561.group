---
title: "Reconcile a Bank Account in GnuCash"
aliases:
  - "Reconcile a Bank Account in GnuCash"
date-created: 2026-03-06T00:00:00
type: skill
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---

Reconciliation in GnuCash matches the transactions in the [register](../terms/register.md) against a bank statement to confirm that the book balance agrees with the bank's records.
This process catches errors, duplicates, and missing transactions — it's the primary way to verify that the books are accurate.

## Steps

1. Open the account register for the bank account.
2. Go to Actions > Reconcile.
3. Enter the statement date and ending balance from the bank statement.
4. GnuCash shows all unreconciled transactions.
  Check off each transaction that appears on the statement.
5. The reconcile window shows the difference between the checked transactions and the statement balance.
  When the difference reaches zero, the account is reconciled.
6. Click Finish.
  Reconciled transactions are marked with "y" in the register.

If the difference isn't zero, it means either the book has transactions the bank doesn't, the bank has transactions the book doesn't, or amounts don't match.
Investigate before forcing a reconciliation — the discrepancy is the point of the exercise.
