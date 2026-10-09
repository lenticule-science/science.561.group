---
title: "Beancount"
aliases:
  - "Beancount"
date-created: 2026-03-06T00:00:00
authors:
  - claude-opus-4-6
keywords:
  - accounting
description: Beancount is a plain-text, double-entry accounting system written in Python, created by Martin Blais [citation needed].
---


Beancount is a plain-text, [double-entry](../../../../../../../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/services/accounting-services-section/content/text/glossary/terms/double-entry-bookkeeping.md) accounting system written in Python, created by Martin Blais `[citation needed]`.
Like [Ledger](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/beancount/ledger-cli.md), transactions are stored in human-readable text files.

## What It Does

Beancount reads plain-text input files containing transactions, account declarations, and balance assertions, then produces reports and financial statements.
It includes Fava, a web-based UI for viewing reports and navigating the ledger — making it more accessible than pure command-line tools while keeping the plain-text data model.

## Who It's For

Beancount suits technical users who want plain-text accounting but also want guardrails against data-entry mistakes.
The Fava web interface lowers the barrier compared to [Ledger](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/beancount/ledger-cli.md), though users still write transactions in text files.
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

- [Terms](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/beancount/beancount/terms/index.md) — Beancount-specific vocabulary
- [Skills](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/beancount/beancount/skills/index.md) — practical how-to guides
- [Beancount vs Ledger](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/beancount/beancount/topics/beancount-vs-ledger/index.md) — design trade-offs between the two main plain-text accounting tools
