---
title: "Write a Beancount Importer"
type: skill
keywords:
  - Accounting
authors:
  - claude-opus-4-6
date-created: 2026-03-06T00:00:00
---


An importer is an evidence adapter. It converts a source export into proposed
Beancount directives without pretending that transport, parsing, or a bank
description supplies the accounting judgment. The exact Python interfaces and
commands vary by Beancount generation, so implementation belongs against the
installed version and its official documentation.

The traditional `beancount.ingest` protocol organizes adapters around methods
such as:

1. `identify(file)` — returns `True` if this importer can handle the given file (based on filename, headers, or content).
2. `file_account(file)` — returns the account name this file belongs to (e.g., `Assets:Checking`).
3. `extract(file)` — parses the file and returns a list of Beancount directive objects (transactions).

- `identify(file)` decides whether the adapter recognizes the source format;
- `file_account(file)` identifies the source-side ledger account; and
- `extract(file, existing_entries)` proposes directives from the source.

That interface is only the transport shell. A controlled importer also needs
to:

1. preserve the original file and its source account, statement period, and
   retrieval identifier;
2. validate headers, encoding, dates, signs, currencies, decimal precision, and
   row completeness before producing entries;
3. derive a stable source-event identifier from source-controlled fields and
   reject duplicate identifiers across prior and current imports;
4. retain source descriptions without treating vendor text as proof of
   counterparty, expense, tax, project, or entity classification;
5. distinguish cleared date, initiated date, trade date, settlement date, and
   reporting cutoff where the source supplies them;
6. emit held or incomplete proposals when the counterpart account, recognition,
   valuation, or ownership judgment is missing; and
7. make re-import idempotent and correction behavior explicit.

The `!` flag can communicate that a transaction is pending review, but changing
it to `*` is not evidence that review occurred. Admission should retain who or
what applied which policy, the source identifier, and any exception resolution.

Where the installed toolchain provides the classic ingest commands, extraction
may be invoked along these lines:

```bash
bean-extract config.py bank_download.csv > proposed.beancount
```

Write to a staging file, inspect errors and the proposed diff, run duplicate and
policy controls, then admit accepted entries. Blindly appending extraction
output makes a repeated run a duplicate-posting mechanism. The official
[Beancount documentation index](https://beancount.github.io/docs/) links the
ingest and developer material; confirm the interface against the installed
version before implementing the adapter in Engineering.
