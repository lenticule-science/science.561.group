---
title: "Directive"
aliases:
  - "Directive"
  - "directive"
date-created: 2026-03-06T00:00:00
type: term
authors:
  - claude-opus-4-6
keywords:
  - Accounting
defines:
  - "directive"
---

# Directive

A directive is a non-transaction command in a Ledger file that controls how the file is interpreted.
Directives include:

- `account` — declares an account name (optional in Ledger, unlike [Beancount](../beancount.md) where it's required)
- `commodity` — declares a commodity and its display format
- `include` — includes another Ledger file, enabling modular file organization
- `alias` — creates a shorthand for an account name
- `tag` — declares metadata tags
- `year` / `Y` — sets a default year for date parsing

Directives don't represent financial data — they configure the parser and provide metadata.
Ledger is permissive about directives; most are optional and exist to add structure or catch typos through strict mode (`--strict` or `--pedantic` flags).
