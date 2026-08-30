---
title: "Chart of Accounts"
aliases:
  - "Chart of Accounts"
id: accounting-lesson-chart-of-accounts
authors:
- emsenn
date-created: 2026-03-06
type: lesson
keywords:
  - Accounting
  - Finance
requires:
- /domesticity/accounting/curricula/double-entry.md
teaches:
  - "Chart of Accounts"
---


A chart of accounts is the governed set of accounts available to a ledger. It
determines which economic distinctions are explicit in postings and which must
be supplied through metadata, subsidiary records, or later presentation.

## Structure

- Accounts are grouped by type: assets, liabilities, equity, income, expenses.
- Within each type, accounts are organized hierarchically. In plain-text
  accounting this uses colon-separated names: `Assets:Bank:Checking`,
  `Expenses:Housing:Rent`, `Income:Salary`.
- Hierarchy should support durable statement and reconciliation distinctions.
  Counterparty, project, location, tax category, and responsibility center may
  be better represented as dimensions than as separate accounts.

## Design principles

- **Start from required distinctions.** Create the control, statement,
  restriction, related-party, and measurement separations required from the
  first posting. Add analytic detail when it supports a recurring decision or
  control; arbitrary minimalism can be as damaging as account proliferation.
- **Map, rather than collapse, reporting bases.** Tax, financial, managerial,
  and budget classifications may differ. Maintain explicit mappings instead of
  forcing one chart label to answer every purpose.
- **Be consistent.** Use the same naming convention throughout. Decide on
  singular vs. plural, capitalization, and hierarchy depth and stick with it.
- **Separate accounts by institution.** Bank accounts, credit cards, and
  investment accounts should each be their own account so you can reconcile
  each one independently.

## Illustrative accounts

- `Assets:Bank:Checking`, `Assets:Bank:Savings` — liquid cash
- `Assets:Receivables` — money owed to you
- `Liabilities:CreditCard:Visa` — debts organized by instrument
- `Equity:Opening-Balances` — a controlled migration account for supported
  opening positions, not a permanent plug for unexplained differences
- `Income:Services`, `Income:Interest` — distinct recognized income categories
- `Expenses:Occupancy:Rent`, `Expenses:Transport` — recurring expense categories

## Beancount implementation example

In Beancount's standard model, an account is opened before use:

```
2024-01-01 open Assets:Bank:Checking USD
2024-01-01 open Expenses:Food:Groceries USD
```

A close directive states the date after which postings are not admitted by the
corresponding validation model:

```
2025-06-30 close Assets:Bank:OldSavings
```
