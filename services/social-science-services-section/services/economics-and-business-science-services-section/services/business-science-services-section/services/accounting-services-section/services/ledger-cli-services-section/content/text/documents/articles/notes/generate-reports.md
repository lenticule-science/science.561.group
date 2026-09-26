---
title: "Generate Balance and Register Reports in Ledger"
aliases:
  - "Generate Balance and Register Reports in Ledger"
date-created: 2026-03-06T00:00:00
type: skill
authors:
  - claude-opus-4-6
keywords:
  - accounting
description: Ledger's balance and register commands are general report constructors.
introduces: skill
---


Ledger's `balance` and `register` commands are general report constructors. A
command result is defined by the loaded files, includes, automated and virtual
postings, query, dates, valuation options, price database, lot display, sorting,
and output format. Record those parameters when a report supports an accounting
decision or reconciliation.

**Balance report** — shows account totals:

```bash
ledger -f journal.ledger balance
```

This shows totals for the accounts admitted by the default query and loaded
configuration, with separate commodity totals unless valuation options convert
them. Narrow the population with account patterns:

```bash
ledger -f journal.ledger balance Expenses
ledger -f journal.ledger balance Assets:Checking
```

**Register report** — shows individual transactions:

```bash
ledger -f journal.ledger register Expenses:Food
```

This shows matching postings and a running total under the selected report
semantics. It is not an immutable journal export unless the query and transform
options are controlled.

**Common flags**:

- `--period "this month"` or `-p "2024/03"` — filter by date range
- `--monthly` or `-M` — group by month
- `--yearly` or `-Y` — group by year
- `--sort date` or `--sort amount` — change sort order
- `--depth N` — limit account hierarchy depth in balance reports
- `--empty` — show accounts with zero balance

**Income-and-expense activity view**:

```bash
ledger -f journal.ledger balance Income Expenses --period "2024"
```

**Asset-and-liability balance view**:

```bash
ledger -f journal.ledger balance Assets Liabilities
```

These commands select account classes but do not by themselves create complete
financial statements. Sign conventions, contra accounts, closing behavior,
equity articulation, current/noncurrent classification, cash-flow classes,
consolidation, notes, and the reporting basis remain outside the command name.

Ledger can emit text and structured report formats for downstream processing.
Prefer explicit queries and stable output formats over filtering human output
with text search, which can discard hierarchy, commodities, lot annotations,
and generated-posting distinctions. Reconcile any report used for close to its
source population and cutoff. The official [Ledger 3 manual](https://ledger-cli.org/doc/ledger3.html#Reporting-Commands)
defines current command and option behavior.

Ledger's two fundamental reports are `balance` and `register`.

This shows the balance of every account.
Narrow it with account patterns:

This shows every transaction that touches `Expenses:Food`, with a running total.

**Income statement** (income and expenses for a period):

**Net worth** (assets minus liabilities):

Reports go to stdout, so they can be piped to other tools: `ledger balance | grep Food`, redirected to files, or processed with scripts.
