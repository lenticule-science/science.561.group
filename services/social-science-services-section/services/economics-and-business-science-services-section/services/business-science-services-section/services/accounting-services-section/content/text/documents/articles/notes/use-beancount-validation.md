---
title: "Use Beancount Validation"
description: Validate a Beancount ledger and interpret common errors. Use when checking a plain-text accounting file.
date-created: 2025-12-31
keywords:
  - accounting
  - finance
  - beancount
runtime:
  invocation: inference
  tool: llm
region:
  reads: ["content/domesticity/disciplines/accounting/"]
  writes: ["content/domesticity/disciplines/accounting/"]
dependencies:
- /domesticity/accounting/curricula/beancount-basics.md
part-of: domesticity/disciplines/accounting
name: use-beancount-validation
id: use-beancount-validation
type: learn
authors:
- gpt-5.2-codex
---

Validation should run against the same complete entry point used for reporting.
A parser-only check is too weak, while a report generated from a different
ledger projection can appear correct without testing the maintained books.

## Validation sequence

1. Parse all included files and surface unreadable files, malformed directives,
   invalid dates, unknown accounts, and commodity-constraint violations.
2. Settle postings with exact arithmetic. Report unbalanced transactions,
   residuals, failed balance assertions, and ambiguous or insufficient lot
   relief without silently rounding them away.
3. Apply the book's evidence controls, including required source identifiers and
   duplicate keys. A balanced unsupported transaction remains unsupported.
4. Run account and commodity assertions at their stated effective cutoffs.
   Distinguish an assertion failure from a missing assertion.
5. Generate trial balance, statements, open lots, and valuation from the same
   settled result. Preserve missing cost or price as missing rather than
   substituting zero.
6. Correct source interpretation with dated entries and rerun the affected
   reconciliation. Do not edit an amount merely to silence a checker.

## Interpreting outcomes

Successful validation establishes only the properties actually checked. Syntax,
double-entry balance, account constraints, source-metadata presence, lot
settlement, and balance assertions are distinct controls. None by itself proves
event completeness, ownership, correct recognition, defensible valuation, or
period closure. The reconciliation record must retain unresolved differences
even when the ledger remains renderable.
