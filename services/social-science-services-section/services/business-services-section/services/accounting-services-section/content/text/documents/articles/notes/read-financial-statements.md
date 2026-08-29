---
title: "Read Financial Statements"
description: Generate and interpret balance sheets, income statements, and cash flow reports. Use when reviewing financial position or period results.
date-created: 2026-03-06
keywords:
  - accounting
  - finance
runtime:
  invocation: inference
  tool: human
region:
  reads: ["content/domesticity/disciplines/accounting/"]
  writes: ["content/domesticity/disciplines/accounting/"]
dependencies:
- /domesticity/accounting/curricula/financial-statements.md
part-of: domesticity/disciplines/accounting
name: read-financial-statements
id: read-financial-statements
type: learn
authors:
- emsenn
---

Read financial statements as a connected set of entity-relative claims, not as
three independent scorecards. Begin by identifying the reporting entity,
period, accounting basis, currency, consolidation scope, and whether the
statements are audited, reviewed, compiled, or internal.

## Balance sheet

Confirm that assets equal liabilities plus equity, then inspect what makes the
equation balance. Review liquidity and restrictions of assets, measurement
bases, maturity and security of obligations, related-party balances, contra
accounts, and the composition of equity. Arithmetic balance cannot establish
that assets exist or liabilities are complete.

## Income statement

Identify the recognition policy, period, ordinary and unusual items, gross and
operating subtotals, and tax or owner-specific effects. Compare margins and
amounts across compatible periods, but distinguish price, volume, mix,
classification, and scope changes. Net income is not cash generated and is not
automatically distributable capacity.

## Cash-flow statement

Trace beginning cash to ending cash and understand the definition of cash and
cash equivalents used. Read operating, investing, and financing classifications
alongside the balance sheet and income statement. Positive operating cash flow
does not by itself prove future liquidity; upcoming maturities, restrictions,
commitments, volatility, and access to funding also matter.

## Cross-statement tests

- Ending cash should tie to the corresponding balance-sheet population.
- Period profit or loss should connect to the equity roll-forward after owner
  transactions and other recognized components are considered.
- Asset purchases, disposals, borrowing, repayment, and noncash transactions
  should explain changes between opening and closing balance sheets.
- Notes and supporting schedules should explain material aggregation,
  measurement uncertainty, commitments, contingencies, and related parties.

Trends and ratios are prompts for investigation. They become conclusions only
after the underlying definitions, comparability, and evidence are understood.
