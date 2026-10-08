---
title: Ledger CLI
description: Ledger CLI is a plain-text accounting processor and reporting language.
---
# Ledger CLI

Ledger CLI is a plain-text accounting processor and reporting language. It
parses transactions, postings, directives, commodity prices, includes,
automated rules, and virtual postings, then constructs reports from queries and
options.

Its flexibility makes the report definition part of the accounting control
surface. Two commands over the same journal can legitimately produce different
populations when they differ in dates, account predicates, virtual or generated
postings, lot display, commodity conversion, price history, or valuation time.
Every retained report should therefore name its input files, cutoff, query,
valuation basis, and relevant flags.

Ledger supplies balancing and assertion mechanics but does not determine the
reporting entity, recognition basis, source completeness, lot-relief policy,
classification, or reconciliation evidence. In particular:

- quantity, historical cost, transaction price, and current value remain
  separate;
- the latest stored price is not automatically the relevant reporting price;
- automated transactions are derived postings, not source events;
- virtual postings form a separate analytic population; and
- account-class balance commands are not complete financial statements.

The [posting](../terms/posting.md), [directive](../terms/directive.md),
[automated transaction](../terms/automated-transaction.md), and [virtual
posting](../terms/virtual-posting.md) terms define these boundaries. The
official [Ledger 3 manual](https://ledger-cli.org/doc/ledger3.html) is the
syntax and option reference.
