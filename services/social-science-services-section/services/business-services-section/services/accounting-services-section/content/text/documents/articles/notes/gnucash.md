---
title: "GnuCash"
aliases:
  - "GnuCash"
date-created: 2026-03-06T00:00:00
date-observed: 2026-08-27
keywords:
  - Accounting
---

# GnuCash

GnuCash is open-source accounting software implementing
[double-entry bookkeeping](../../../glossary/terms/double-entry-bookkeeping.md).
Its current [feature reference](https://gnucash.org/features.phtml) documents
desktop builds for Linux, macOS, and Windows, along with reconciliation,
scheduled transactions, reports, currencies, and small-business features.

## What It Does

GnuCash exposes the double-entry system directly — users see debits and credits,
accounts are organized in a hierarchical [chart of accounts](./chart-of-accounts.md),
and the software maintains a [ledger](../../../glossary/terms/ledger.md). It
supports multiple currencies, scheduled transactions, and basic invoicing.

## Who It's For

GnuCash exposes accounts, splits, reconciliation, and reports through a desktop
interface. Suitability depends on required collaboration, approvals, hosting,
imports, payroll, and jurisdiction-specific compliance—not only organization
size.

## How It Handles Double-Entry Bookkeeping

GnuCash represents transactions through splits across accounts and maintains
double-entry balance, including any system-generated balancing behavior its
configured workflow permits. Accounts carry types and can be arranged in a
customizable hierarchy. A saved transaction can still be misclassified,
duplicated, unsupported, or assigned to the wrong entity or period.

## Strengths

- Source-available desktop software and inspectable account splits
- Hierarchical accounts, reconciliation, reports, and scheduled transactions
- Multi-currency records and price information
- Files whose custody can remain with the operator

## Limitations

- The project documentation does not describe simultaneous multi-user editing
  as a supported operating model
- Bank imports depend on the institution, format, matching, and review process
- Business features do not by themselves supply jurisdiction-specific payroll,
  tax filing, approvals, or document-retention controls

## Licensing and Cost

The GnuCash application is free software under the license distributed with the
installed version. Hosting, support, quote sources, bank connectivity, and other
external services may have separate terms or costs.
