---
title: "Beancount"
aliases:
  - "Beancount"
date-created: 2026-03-06T00:00:00
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---


Beancount is a plain-text, [double-entry](../terms/double-entry-bookkeeping.md) accounting system written in Python, created by Martin Blais `[citation needed]`.
Like [Ledger](./ledger-cli.md), transactions are stored in human-readable text files.

## What It Does

Beancount reads plain-text input files containing transactions, account declarations, and balance assertions, then produces reports and financial statements.
It includes Fava, a web-based UI for viewing reports and navigating the ledger — making it more accessible than pure command-line tools while keeping the plain-text data model.

## Who It's For

Beancount suits technical users who want plain-text accounting but also want guardrails against data-entry mistakes.
The Fava web interface lowers the barrier compared to [Ledger](./ledger-cli.md), though users still write transactions in text files.
It's a good fit for individuals managing personal finances or small-business books who value data integrity.

## How It Handles Double-Entry Bookkeeping

Every transaction must balance.
Beancount differs from Ledger in philosophy: it's stricter about input validation, requires accounts to be explicitly opened (with an `open` directive) before use, enforces balance assertions, and rejects ambiguous entries.
This strictness catches errors at input time rather than in reports.
Accounts follow a required five-type hierarchy — Assets, Liabilities, Equity, Income, and Expenses.

## Strengths

- Strict validation catches errors early, before they propagate into reports
- Fava provides a usable web UI with charts, account views, and filtering
- Python ecosystem makes it straightforward to write importers and extensions
- Strong multi-currency and commodity support
- Plain-text data remains portable and version-controllable

## Limitations

- Smaller community than Ledger
- Requires Python as a dependency
- No direct invoicing support
- Writing transactions still requires editing text files manually

## Licensing and Cost

Beancount is licensed under the GPL v2 and is free to use.
There are no paid versions or commercial offerings.

## Contents

- [Terms](./beancount/terms/index.md) — Beancount-specific vocabulary
- [Skills](./beancount/skills/index.md) — practical how-to guides
- [Beancount vs Ledger](./beancount/topics/beancount-vs-ledger/index.md) — design trade-offs between the two main plain-text accounting tools
