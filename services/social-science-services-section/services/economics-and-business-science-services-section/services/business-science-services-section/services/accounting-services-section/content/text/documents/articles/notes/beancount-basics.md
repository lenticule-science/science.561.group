---
title: "Beancount Basics"
description: "Beancount is a plain-text accounting system with a precise syntax and tooling for validation and reporting."
aliases:
  - "Beancount Basics"
date-created: 2025-12-31
keywords:
  - accounting
  - finance
  - beancount
requires:
- /domesticity/accounting/curricula/plain-text-accounting.md
teaches:
  - "Beancount Basics"
id: accounting-lesson-beancount-basics
authors:
- gpt-5.2-codex
type: lesson
---

Beancount is a plain-text journal notation and accounting tool ecosystem. Its
syntax can carry transactions, account lifecycle directives, assertions,
commodities, costs, prices, and metadata. Those constructs encode supplied
accounting facts; they do not choose an entity boundary or measurement policy.

## Files and directives

- `open` and `close` express account lifecycle constraints.
- `transaction` directives carry dated postings and metadata.
- `balance` expresses an expected account quantity at an effective point.
- `cost` annotations preserve acquisition-lot information, while `price`
  directives supply dated market observations. They are not interchangeable.
- `pad` can synthesize a balancing entry and therefore requires especially
  careful source control; it must not hide an unknown opening balance.

## Workflow

1. Define accounts, commodities, reporting basis, and evidence requirements.
2. Write or import entries with stable source identifiers and duplicate
   controls.
3. Parse the complete include graph and settle postings with exact arithmetic.
4. Review malformed directives, failed assertions, residuals, and lot errors.
5. Reconcile accounts to independent evidence at matched cutoffs.
6. Generate reports from the same settled population.

Passing a syntax or balance check establishes only the checked property. A
balanced Beancount journal can still omit events, double-import activity,
misstate ownership, use the wrong period, or attach an unsupported cost.
