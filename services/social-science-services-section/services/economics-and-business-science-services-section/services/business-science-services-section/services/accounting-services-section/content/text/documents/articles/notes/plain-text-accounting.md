---
title: "Plain-Text Accounting"
description: "Plain-text accounting keeps ledgers in text files so they are versionable and auditable with standard tools."
aliases:
  - "Plain-Text Accounting"
date-created: 2025-12-31
keywords:
  - accounting
  - finance
  - plain-text-accounting
requires:
- /domesticity/accounting/curricula/double-entry.md
teaches:
  - "Plain-Text Accounting"
id: accounting-lesson-plain-text
authors:
- gpt-5.2-codex
type: lesson
---

Plain-text accounting represents journals and related directives in documented
text formats. Text improves inspectability, portability, diffing, and automation,
but it does not make a ledger complete, authorized, or auditable by itself.

## Why use it

- Journal changes can be reviewed with ordinary text and version-control tools.
- Deterministic parsers can produce repeatable settlement and reports from one
  explicit entry point.
- Open formats reduce dependence on a vendor-specific database or interface.
- Exact decimal or rational representations can preserve quantities that binary
  floating point would round.

These advantages introduce responsibilities. Confidential source documents and
credentials should not be committed merely because the journal is text. Merge
conflicts can create valid-looking but duplicated entries. Version history shows
that text changed; it does not establish approval, source authenticity, or
accounting correctness.

## Typical structure

- one entry point declaring included account, journal, price, and assertion
  files;
- a stable chart of accounts and commodity policy;
- dated transactions with source identifiers and duplicate keys;
- separate acquisition-cost and market-price facts;
- executable balance assertions tied to reconciliation cutoffs; and
- protected evidence custody outside the repository when the source is
  sensitive.

The maintained reporting application and the validator should consume the same
settled ledger. Otherwise a “clean” check can coexist with reports produced from
a different population.
