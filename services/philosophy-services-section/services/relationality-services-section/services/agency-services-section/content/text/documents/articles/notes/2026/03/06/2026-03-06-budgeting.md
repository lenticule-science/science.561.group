---
title: "Budgeting"
aliases:
  - "Budgeting"
id: accounting-lesson-budgeting
authors:
- emsenn
date-created: 2026-03-06
type: lesson
keywords:
  - accounting
  - finance
requires:
- /domesticity/accounting/curricula/financial-statements.md
teaches:
  - "Budgeting"
description: A budget is a plan expressed in numbers.
---

A budget is a plan expressed in numbers.
It sets expected income and spending for a future period and provides a standard against which actual results can be compared.

## Why budget

- Without a budget, you discover you overspent only after the money is gone.
- A budget forces explicit decisions: if housing takes 40% of income, that leaves 60% for everything else.
  The allocation is visible.
- Comparing budget to actual spending each period reveals patterns — categories that consistently run over, windfalls that mask structural deficits, seasonal variation you can plan for.

## Structure

A budget mirrors your chart of accounts.
For each expense and income account, set a monthly (or period-appropriate) target:

| Account                     | Monthly Budget |
|-----------------------------|---------------|
| Income:Salary               | 4,000.00      |
| Expenses:Housing:Rent       | 1,200.00      |
| Expenses:Food:Groceries     | 400.00        |
| Expenses:Food:Dining        | 100.00        |
| Expenses:Transport          | 150.00        |
| Expenses:Utilities          | 120.00        |
| Expenses:Insurance          | 200.00        |
| Expenses:Savings            | 500.00        |

The sum of budgeted expenses plus savings should not exceed budgeted income.

## Methods

- **Zero-based budgeting**: every dollar of income is assigned a purpose.
  At the end of the allocation, the remainder is zero.
  This forces full accounting of every spending decision.
- **Envelope method**: allocate fixed amounts to categories.
  When the envelope is empty, spending in that category stops until the next period.
  Works well for variable categories like food and entertainment.
- **Percentage-based**: allocate income by fixed percentages (e.g., 50% needs, 30% wants, 20% savings).
  Simple to maintain but less precise.

## Budget vs. actual

The value of a budget is in the comparison.
At period close, generate the income statement and compare each line to the budget:

- **Under budget**: the surplus can roll to savings or be reallocated.
- **Over budget**: identify why — one-time event or structural pattern?
  Adjust the budget or the spending accordingly.
- **Income variance**: if actual income differs from budgeted, the entire budget may need rescaling.

## In plain-text accounting

Beancount does not have native budgeting, but budgets can be maintained in a separate file (e.g., `budget-2025.beancount` or a plain CSV) and compared against actuals using reporting tools or scripts.
Fava supports budget visualization through plugins.
