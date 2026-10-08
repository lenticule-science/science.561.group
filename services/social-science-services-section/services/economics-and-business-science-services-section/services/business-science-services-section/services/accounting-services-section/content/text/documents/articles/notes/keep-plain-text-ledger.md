---
title: "Keep Plain-Text Ledger"
description: Maintain a plain-text ledger with consistent account naming and balanced postings. Use when keeping books in text files.
date-created: 2025-12-31
keywords:
  - accounting
runtime:
  invocation: inference
  tool: llm
region:
  reads: ["content/domesticity/disciplines/accounting/"]
  writes: ["content/domesticity/disciplines/accounting/"]
dependencies:
- /domesticity/accounting/curricula/plain-text-accounting.md
part-of: domesticity/disciplines/accounting
name: keep-plain-text-ledger
id: keep-plain-text-ledger
type: learn
authors:
- gpt-5.2-codex
---

A plain-text ledger is maintainable when the text files are treated as an
accounting record, not merely as input that happens to parse.

## Record design

- Define the reporting entity, accounting basis, period, reporting currency,
  chart of accounts, and commodity rules before posting activity.
- Keep source evidence outside the journal when it contains confidential or
  bulky material, and connect each entry to that evidence with a stable,
  non-secret identifier.
- Record native quantities, acquisition costs, and dated market prices as
  distinct facts. Do not manufacture one coordinate from another.
- Split files by durable responsibility—such as chart, annual journal, prices,
  and assertions—while retaining one explicit entry point. File layout must not
  create multiple ledgers with unclear precedence.

## Posting and correction

Record each event once with its economic date, narration, balanced postings,
and required metadata. Imports need stable duplicate keys and a reviewable
mapping from source fields to accounts. When a posted interpretation changes,
use a dated correcting or adjusting entry rather than silently replacing closed
history. Version control records text changes, but it does not substitute for
accounting authorization or protected source custody.

## Operating controls

1. Parse and settle the complete entry-point file.
2. Review malformed entries, failed assertions, unbalanced commodities,
   unsupported residuals, and ambiguous lot relief.
3. Reconcile control accounts to statements, public custody observations, or
   subsidiary records at the same cutoff.
4. Produce statements from the same settled ledger used by validation.
5. Close a period only after supported adjustments and unresolved-item review.

Successful parsing establishes syntactic admissibility. Balanced postings
establish arithmetic coherence. Neither establishes ownership, completeness,
recognition, valuation, or correct classification; those properties require
evidence and accounting judgment.
