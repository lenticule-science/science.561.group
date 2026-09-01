---
title: "Period Closing"
aliases:
  - "Period Closing"
  - "Closing the Books"
id: accounting-lesson-period-closing
authors:
- emsenn
date-created: 2026-03-06
type: lesson
keywords:
  - Accounting
  - Finance
requires:
- /domesticity/accounting/curricula/financial-statements.md
- /domesticity/accounting/curricula/account-reconciliation.md
teaches:
  - "Period Closing"
---

Closing the books at the end of a period — a month, a quarter, a year — means finalizing the records so that the period's financial statements are complete and reliable, and the next period starts clean.

## Why close

- Income and expense accounts accumulate over a period.
  Closing resets them so the next period starts at zero, and the net income flows into equity.
- Closing enforces a deadline for recording transactions.
  After the close, you do not go back and add to the prior period without a clear correction entry.
- It produces the final financial statements for the period, which you can use for budgeting, tax preparation, or review.

## Process

1. **Record all transactions for the period.** Ensure nothing is missing — check bank statements, receipts, and any pending items.
2. **Reconcile all accounts.** Every bank account, credit card, and cash account should be reconciled against its statement.
3. **Review and correct.** Check for mis-categorized transactions, duplicate entries, or unusual amounts.
4. **Generate financial statements.** Produce the balance sheet and income statement for the period.
  Review them for reasonableness.
5. **Close income and expense accounts.** In traditional bookkeeping, this means posting journal entries that zero out income and expense accounts and transfer the net to `Equity:Retained-Earnings`.
  In Beancount, this is handled automatically by reporting tools — income and expense accounts are reset per-period in reports without explicit closing entries.
6. **Archive.** If using plain-text files, commit the ledger to version control with a clear message marking the period close.

## In Beancount

Beancount does not require explicit closing entries for income and expense accounts.
The `bean-report` tool and Fava handle period boundaries in reports.
However, you should:

- Add `balance` directives for all reconciled accounts on the period-end date.
- Optionally add a `note` directive marking the close:

  ```
  2025-12-31 note Assets:Bank:Checking "Year-end close, reconciled"
  ```

## Frequency

- Monthly closing is sufficient for most domestic accounting.
- Year-end closing is essential for tax preparation.
