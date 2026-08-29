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

A directive is a Ledger journal command that changes parsing, declarations,
validation, inclusion, aliases, defaults, or other processing behavior. Some
directives also carry price or other financially relevant data, so “not a
transaction” does not mean “does not affect a report.” Examples include:

- `account` — declares an account name (optional in Ledger, unlike [Beancount](../../../../../beancount-services-section/content/text/glossary/topics/beancount.md) where it's required)
- `commodity` — declares a commodity and its display format
- `include` — includes another Ledger file, enabling modular file organization
- `alias` — creates a shorthand for an account name
- `tag` — declares metadata tags
- `year` / `Y` — sets a default year for date parsing

The loaded directive population is part of the book's semantics. An `include`
can add or omit whole populations; an alias can change account selection; a
default year can change dates; commodity declarations can change display and
validation; automated rules can generate postings. Preserve deterministic
include resolution and review directive changes with the reports they affect.

Ledger can infer undeclared accounts and commodities in permissive modes, while
stricter modes can require more declarations. Neither mode establishes that a
declared account or commodity has the correct accounting meaning. The official
[Ledger 3 command-directive reference](https://ledger-cli.org/doc/ledger3.html#Command-Directives)
defines the installed syntax.
