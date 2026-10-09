---
title: "Beancount"
aliases:
  - "Beancount"
date-created: 2026-03-06T00:00:00
date-observed: 2026-08-27
keywords:
  - accounting
description: Beancount is a Python-based plain-text, double-entry accounting system.
---


Beancount is a Python-based plain-text,
[double-entry](../../../glossary/terms/double-entry-bookkeeping.md) accounting
system. Its [official documentation](https://beancount.github.io/docs/) is the
authority for current syntax and behavior; like [Ledger](./ledger-cli.md), its
input journals are human-readable text files.

## What It Does

Beancount reads inputs containing transactions and directives such as account
opens, prices, and balance assertions, then exposes validated entries for
queries and reports. Fava is a separate web application built for Beancount
files; it is not part of the core accounting language.

## Who It's For

Beancount suits operators willing to maintain text journals and explicit account
semantics. Whether it fits personal or organizational books depends on import,
review, invoicing, payroll, access-control, and reporting requirements that the
core language does not supply by itself.

## How It Handles Double-Entry Bookkeeping

Beancount transactions must settle under its balancing and booking rules. Its
standard model validates account lifecycle directives, balance assertions,
commodities, and lot booking more explicitly than Ledger's default workflow.
The default account roots are Assets, Liabilities, Equity, Income, and Expenses.
These checks expose specified inconsistencies early; they do not establish
event completeness, ownership, recognition, or valuation.

## Strengths

- Explicit directives and booking rules make many assumptions inspectable
- Fava can provide a separate browser interface over Beancount files
- Importers and plugins can be implemented in the Python ecosystem
- Cost, price, lot, currency, and commodity constructs remain distinct
- Plain-text journals can be diffed and transported independently of one UI

## Limitations

- Requires Python as a dependency
- Core Beancount is not an invoicing, payroll, approval, or document-retention
  system
- Manual text editing is only one intake path; importers can generate entries,
  but generated entries still require review

## Licensing and Cost

The core project is open source. Confirm the license in the version actually
installed and evaluate separately licensed interfaces, plugins, and services on
their own terms.
