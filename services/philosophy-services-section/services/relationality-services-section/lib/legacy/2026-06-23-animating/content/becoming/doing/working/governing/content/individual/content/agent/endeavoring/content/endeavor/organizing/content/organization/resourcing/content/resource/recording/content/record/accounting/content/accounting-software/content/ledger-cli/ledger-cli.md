---
title: "Ledger"
aliases:
  - "Ledger"
  - "ledger-cli"
  - "Ledger CLI"
date-created: 2026-03-06T00:00:00
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---

# Ledger

Ledger is a command-line, plain-text, [double-entry](../terms/double-entry-bookkeeping.md) accounting system created by John Wiegley `[citation needed]`.

## What It Does

Transaction data lives in human-readable text files that users edit directly.
Ledger parses these files and generates reports — balances, registers, budgets — from the command line.
It doesn't store data in a database or proprietary format; the text file *is* the ledger.

The plain-text approach means data is version-controllable (with Git, for instance), diffable, greppable, and independent of any particular software.
If Ledger disappeared tomorrow, the data would still be readable.

## Who It's For

Ledger appeals to programmers and technical users who are comfortable on the command line and prefer working with text files over GUIs.
Its flexibility makes it powerful for people who want full control over their accounting structure, but it's inaccessible to anyone unfamiliar with terminal-based workflows.

## How It Handles Double-Entry Bookkeeping

Ledger doesn't enforce a [chart of accounts](../terms/chart-of-accounts.md) or prescribe account names; users define their own structure.
Every transaction must balance — the sum of all postings in a transaction must equal zero.
Ledger infers the amount of the last posting if it's omitted, but the transaction still balances internally.
Accounts are created implicitly the first time they appear in a transaction.

## Strengths

- Data portability — it's just text files
- Version control integration (Git, Mercurial, etc.)
- Scriptable and composable with other command-line tools
- Zero vendor lock-in
- Handles multiple currencies and commodities (stocks, crypto, physical goods)

## Limitations

- No GUI — everything happens in the terminal and a text editor
- Steep learning curve, especially for users without command-line experience
- No built-in invoicing or payroll
- Community-maintained with infrequent releases

## Related Tools

Ledger isn't the only plain-text accounting tool.
[Beancount](./beancount.md) and hledger are related systems in the same ecosystem. hledger is a Haskell reimplementation of Ledger with stricter parsing and a web UI.
Beancount takes a different design approach, prioritizing strict input validation over Ledger's flexibility.

## Licensing and Cost

Ledger is licensed under the BSD license and is free to use.
There's no company behind it — it's an open-source project maintained by contributors.

## Contents

- [Terms](./ledger-cli/terms/index.md) — Ledger-specific vocabulary
- [Skills](./ledger-cli/skills/index.md) — practical how-to guides
- [Plain-Text Accounting](./ledger-cli/topics/plain-text-accounting/index.md) — the philosophy and ecosystem of text-file-based bookkeeping
