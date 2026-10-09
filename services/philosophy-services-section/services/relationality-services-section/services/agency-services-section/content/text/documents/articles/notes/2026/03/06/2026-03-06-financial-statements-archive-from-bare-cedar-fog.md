---
title: "Financial Statements"
aliases:
  - "Financial Statements"
id: accounting-lesson-financial-statements
authors:
- emsenn
date-created: 2026-03-06
type: lesson
keywords:
  - accounting
  - finance
requires:
- /domesticity/accounting/curricula/double-entry.md
- /domesticity/accounting/curricula/chart-of-accounts.md
teaches:
  - "Financial Statements"
description: Financial statements are the reports generated from a ledger.
---

Financial statements are the reports generated from a ledger.
They answer three questions: what do you own and owe right now, how much did you earn and spend over a period, and where did the cash actually go.

## Balance sheet

The balance sheet (or statement of financial position) shows the accounting equation at a point in time:

    Assets = Liabilities + Equity

- **Assets**: what you own — cash, investments, property, receivables.
- **Liabilities**: what you owe — credit card balances, loans, mortgages.
- **Equity**: the difference — your net worth.

In domestic accounting, the balance sheet answers: if you paid off all debts right now, what would remain?

## Income statement

The income statement (or profit and loss statement) covers a period — a month, a quarter, a year:

    Net Income = Income − Expenses

- **Income**: salary, freelance payments, interest, gifts received.
- **Expenses**: rent, food, transport, insurance, subscriptions.

The bottom line — net income — tells you whether you lived within your means during the period.

## Cash flow

Cash flow tracks the actual movement of money into and out of accounts, regardless of when transactions are "earned" or "incurred."
For domestic accounting this is often the most practically useful report: it shows whether you will run out of cash before the next paycheck.

## In Beancount

Beancount's `bean-report` and Fava generate all three statements from the ledger automatically.
The balance sheet pulls from asset, liability, and equity accounts.
The income statement pulls from income and expense accounts.
Cash flow is derived from changes in asset accounts over a period.

## Reading the reports

- If liabilities are growing faster than assets, you are accumulating debt.
- If expenses consistently exceed income, you are drawing down savings.
- If cash flow is negative despite positive net income, check for large one-time purchases or timing mismatches.
