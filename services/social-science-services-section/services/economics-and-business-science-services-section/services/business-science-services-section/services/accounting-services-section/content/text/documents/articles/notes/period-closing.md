---
title: "Period Closing"
description: "A period close establishes a controlled reporting cutoff; closing entries are one possible implementation, not the close itself."
aliases:
  - "Period Closing"
  - "Closing the Books"
date-created: 2026-03-06
keywords:
  - accounting
  - finance
requires:
- /domesticity/accounting/curricula/financial-statements.md
- /domesticity/accounting/curricula/account-reconciliation.md
teaches:
  - "Period Closing"
id: accounting-lesson-period-closing
type: lesson
---

Closing a period means establishing a controlled reporting cutoff after
completeness, cutoff, measurement, classification, and reconciliation work has
been performed. A close is a process and a state. A closing entry is only one
possible implementation technique.

## Why close

- It gives reports a stable cutoff and makes later changes visible.
- It forces incomplete sources, unreconciled balances, valuation assumptions,
  accruals, deferrals, and classification questions to be resolved or disclosed.
- It separates the economic result of one period from another, whether the
  ledger uses explicit closing entries or report-time period boundaries.
- It produces controlled statements for management, compliance, tax work, or
  other review without implying that one internal close satisfies every
  external reporting requirement.

## Process

1. **Define the period and reporting basis.** State the cutoff, reporting
   currency, accounting basis, materiality judgments, and required outputs.
2. **Complete source intake and cutoff.** Account for transactions through the
   cutoff, including activity received later that belongs to the period.
3. **Reconcile control accounts.** Reconcile cash, custody, debt, receivables,
   payables, inventory, payroll, tax, and inter-entity accounts as applicable.
   An unresolved difference stays visible; it is not a balancing plug.
4. **Measure and classify.** Record supported accruals, deferrals,
   depreciation, impairment, foreign-exchange effects, lot relief, and other
   adjustments. Keep cost basis distinct from current market value.
5. **Review the ledger and statements.** Investigate unusual, duplicate,
   missing, or misclassified activity. Run balance and other assertions and
   retain the reports used for review.
6. **Authorize the close.** Record who closed which period, when, against which
   source and reconciliation worklist, and any disclosed exceptions.
7. **Control later change.** Post a dated adjusting or correcting entry with
   provenance. Reopen a closed period only under an explicit policy; never
   silently rewrite the accepted history.

## Period close versus closing entries

In a traditional manual ledger, closing entries transfer revenues and expenses
through an income-summary account into retained earnings and close owner
distributions directly to equity. This resets temporary account balances. The
[closing entry](../../../glossary/terms/closing-entry.md) describes that
mechanism.

A system can instead retain continuous revenue and expense history and create
periodic statements by filtering or summarizing at report time. In that system,
posting manual closing entries as well as applying report-time summarization can
double-close the result. The accounting requirement is correct period
presentation and controlled retained earnings, not ritual use of one mechanism.

## In Beancount

Beancount ledgers can retain continuous accounts and use report-time
summarization rather than explicit closing entries. Balance directives can make
reconciled expectations executable:

- Add a supported `balance` directive at the correct effective date for each
  amount the evidence reconciles.
- A `note` can identify the close, but it is not evidence that the close work
  occurred:

  ```
  2025-12-31 note Assets:Bank:Checking "Year-end close, reconciled"
  ```

The source register, reconciliation record, adjustment entries, and close
authorization carry the proof. The official [Beancount documentation](https://beancount.github.io/docs/)
describes the language's assertions and reporting behavior.

## Frequency and scope

- Operational books commonly close monthly, with additional quarter- and
  year-end work when reporting requires it.
- The appropriate cadence depends on decision needs, transaction volume,
  control risk, and external obligations.
- A managerial close, statutory close, and tax close may share evidence while
  applying different boundaries and measurement rules; none should silently
  stand in for the others.
