---
title: "Account Reconciliation"
aliases:
  - "Account Reconciliation"
id: accounting-lesson-account-reconciliation
authors:
- emsenn
date-created: 2026-03-06
type: lesson
keywords:
  - Accounting
  - Finance
requires:
- /domesticity/accounting/curricula/plain-text-accounting.md
teaches:
  - "Account Reconciliation"
---

Reconciliation is the process of confirming that the balance in your ledger matches the balance reported by an external source — a bank statement, a credit card statement, or a brokerage account.
It catches errors, missed transactions, and fraud.

## Why reconcile

- A ledger is only useful if it reflects reality.
  Reconciliation is the check.
- Missed transactions (automatic subscriptions, bank fees, interest) accumulate silently.
  Reconciliation finds them.
- Duplicate entries, wrong amounts, and mis-categorized transactions are caught when the ledger balance does not match the statement balance.

## Process

1. **Get the statement.** Download or retrieve the official balance and transaction list from the institution for the period.
2. **Compare balances.** Check the ledger balance for the account against the statement's ending balance as of the statement date.
3. **Identify discrepancies.** Walk through transactions in the statement and mark each one as present in the ledger.
  Flag any that are missing or differ in amount.
4. **Record missing transactions.** Add any transactions from the statement that are not in the ledger (bank fees, interest, automatic payments).
5. **Correct errors.** Fix wrong amounts, dates, or account assignments.
6. **Assert the balance.** In Beancount, add a `balance` directive on the statement date to lock in the reconciled balance:

   ```
   2025-01-31 balance Assets:Bank:Checking  1,234.56 USD
   ```

The Beancount checker will flag an error if the computed balance does not match, which means reconciliation is enforced on every validation run.

## Frequency

- Bank and credit card accounts: monthly, when statements arrive.
- Cash accounts: whenever the balance is countable.
- Investment accounts: quarterly or when statements are issued.

## Common sources of discrepancy

- Pending transactions that have not cleared.
- Bank fees or interest not yet recorded.
- Transactions entered with the wrong amount or date.
- Transactions recorded to the wrong account.
