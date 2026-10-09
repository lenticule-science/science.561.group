---
title: "Ledger"
aliases:
  - "Ledger"
  - "ledger-cli"
  - "Ledger CLI"
date-created: 2026-03-06T00:00:00
date-observed: 2026-08-27
keywords:
  - accounting
description: Ledger is a command-line, plain-text, double-entry accounting system.
---


Ledger is a command-line, plain-text,
[double-entry](../../../glossary/terms/double-entry-bookkeeping.md) accounting
system. The [project site](https://ledger-cli.org/) records that John Wiegley
began it in 2003 and distributes it under a BSD license.

## What It Does

Transaction data lives in human-readable journal files. Ledger parses those
files and generates command-line reports such as balances and registers. A
maintained book may include multiple files, generated imports, price data, and
directives; no single text file is necessarily the whole ledger.

The plain-text approach makes source journals readable, diffable, searchable,
and suitable for version control. Continued semantic use still depends on a
documented notation and compatible parser; human readability does not eliminate
format or migration obligations.

## Who It's For

Ledger exposes a command-line and text-journal workflow. That creates a training
and operations requirement; whether it is accessible depends on the interfaces,
importers, and review process built around it.

## How It Handles Double-Entry Bookkeeping

Ledger doesn't enforce a [chart of accounts](./chart-of-accounts.md) or prescribe account names; users define their own structure. Every transaction must balance — the sum of all postings in a transaction must equal zero. Ledger infers the amount of the last posting if it's omitted, but the transaction still balances internally. Accounts are created implicitly the first time they appear in a transaction.

## Strengths

- Data portability — it's just text files
- Version control integration (Git, Mercurial, etc.)
- Scriptable and composable with other command-line tools
- An open text format reduces dependence on one hosted data store
- Handles multiple currencies and commodities (stocks, crypto, physical goods)

## Limitations

- The core project does not provide a graphical bookkeeping workflow
- Its permissive, inferred structure requires deliberate account and review
  conventions
- No built-in invoicing or payroll

## Related Tools

Ledger is one member of the plain-text accounting ecosystem.
[Beancount](./beancount.md) and hledger use related journal concepts but have
their own syntax, booking, validation, and reporting behavior. Compatibility
must be tested against the actual constructs used rather than inferred from
their shared ancestry.

## Licensing and Cost

Ledger is open-source software under the BSD license described by its official
site. Adjacent hosting, support, and integration services have their own terms.
