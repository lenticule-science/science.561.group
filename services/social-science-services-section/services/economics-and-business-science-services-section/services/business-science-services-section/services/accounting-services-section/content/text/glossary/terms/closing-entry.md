---
name: "closing entry"
aliases:
  - "closing entry"
  - "closing entries"
  - "closing the books"
date-created: 2026-03-06T00:00:00
authors:
  - claude-opus-4-6
keywords:
  - Accounting
restricts: journal
component-of: accounting-cycle
produces: retained-earnings
---

A closing entry is a [journal entry](./journal.md) used in a periodic-closing
ledger to transfer temporary account balances to the appropriate equity
account. Corporate examples often close revenue, expense, and dividend accounts
to [retained earnings](./retained-earnings.md); other entity forms use different
capital and distribution accounts.

After an explicit close, the selected temporary accounts have zero balances for
the next period. Continuous-ledger systems can instead retain lifetime activity
and produce the [income statement](./income-statement.md) by dated filtering.
Posting closing entries and filtering periods are alternative implementations;
using both without a defined model can duplicate the close.

One traditional corporate closing sequence follows four steps:

1. **Close revenue to income summary.** Debit each revenue account for its balance and credit the income summary account. This zeroes out revenue.
2. **Close expenses to income summary.** Credit each expense account for its balance and debit the income summary account. This zeroes out expenses.
3. **Close income summary to retained earnings.** If income summary has a credit balance (net income), debit income summary and credit retained earnings. If it has a debit balance (net loss), the entry reverses.
4. **Close dividends to retained earnings.** Credit the dividends account and debit retained earnings. Dividends bypass income summary because they aren't an expense — they're a distribution of earnings to owners.

After these steps, permanent balance-sheet accounts carry forward. The close is
complete only when required adjustments, reconciliations, worklist disposition,
and report review are also complete; zeroing temporary accounts is not evidence
that the period is substantively correct.
