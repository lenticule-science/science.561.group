---

title: "Chart of Accounts"
description: "A chart of accounts is the organized list of every account in a ledger. It determines what the books can describe: a well-designed chart makes reporting straightforward; a poorly designed one makes it impossible."
aliases:
  - "Chart of Accounts"
date-created: 2026-03-06
keywords:
  - accounting
  - finance
requires:
- /domesticity/accounting/curricula/double-entry.md
teaches:
  - "Chart of Accounts"
---

A chart of accounts is the organized list of every account in a ledger.
It determines what the books can describe: a well-designed chart makes reporting straightforward; a poorly designed one makes it impossible.

## Structure

- Accounts are grouped by type: assets, liabilities, equity, income, expenses.
- Within each type, accounts are organized hierarchically.
  In plain-text accounting this uses colon-separated names: `Assets:Bank:Checking`, `Expenses:Housing:Rent`, `Income:Salary`.
- The hierarchy should reflect how you actually want to see reports.
  If you need to know how much you spend on groceries versus dining out, those need separate accounts under `Expenses:Food`.

## Design principles

- **Start coarse, refine as needed.** Begin with broad categories and split them when you find yourself wanting a distinction the current chart cannot make.
  Do not pre-build a chart with fifty accounts you may never use.
- **Match your reporting needs.** If you file taxes, your expense categories should align with the categories on your tax forms.
  If you budget by category, your chart should match your budget categories.
- **Be consistent.** Use the same naming convention throughout.
  Decide on singular vs. plural, capitalization, and hierarchy depth and stick with it.
- **Separate accounts by institution.** Bank accounts, credit cards, and investment accounts should each be their own account so you can reconcile each one independently.

## Common domestic accounts

- `Assets:Bank:Checking`, `Assets:Bank:Savings` — liquid cash
- `Assets:Receivables` — money owed to you
- `Liabilities:CreditCard:Visa` — debts organized by instrument
- `Equity:Opening-Balances` — the offset account for initial balances
- `Income:Salary`, `Income:Freelance` — revenue sources
- `Expenses:Housing:Rent`, `Expenses:Food:Groceries`, `Expenses:Transport` — spending categories

## In Beancount

Each account must be opened with a directive before it can be used:

```
2024-01-01 open Assets:Bank:Checking USD
2024-01-01 open Expenses:Food:Groceries USD
```

Closing an account prevents further postings after the close date:

```
2025-06-30 close Assets:Bank:OldSavings
```
