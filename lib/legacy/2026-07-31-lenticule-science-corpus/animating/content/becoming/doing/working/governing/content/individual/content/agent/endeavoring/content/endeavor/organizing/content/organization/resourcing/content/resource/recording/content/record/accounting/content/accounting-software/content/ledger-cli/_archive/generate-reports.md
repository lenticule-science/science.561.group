---
title: "Generate Balance and Register Reports in Ledger"
aliases:
  - "Generate Balance and Register Reports in Ledger"
date-created: 2026-03-06T00:00:00
type: skill
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---


Ledger's two fundamental reports are `balance` and `register`.

**Balance report** — shows account totals:

```bash
ledger -f journal.ledger balance
```

This shows the balance of every account.
Narrow it with account patterns:

```bash
ledger -f journal.ledger balance Expenses
ledger -f journal.ledger balance Assets:Checking
```

**Register report** — shows individual transactions:

```bash
ledger -f journal.ledger register Expenses:Food
```

This shows every transaction that touches `Expenses:Food`, with a running total.

**Common flags**:

- `--period "this month"` or `-p "2024/03"` — filter by date range
- `--monthly` or `-M` — group by month
- `--yearly` or `-Y` — group by year
- `--sort date` or `--sort amount` — change sort order
- `--depth N` — limit account hierarchy depth in balance reports
- `--empty` — show accounts with zero balance

**Income statement** (income and expenses for a period):

```bash
ledger -f journal.ledger balance Income Expenses --period "2024"
```

**Net worth** (assets minus liabilities):

```bash
ledger -f journal.ledger balance Assets Liabilities
```

Reports go to stdout, so they can be piped to other tools: `ledger balance | grep Food`, redirected to files, or processed with scripts.
