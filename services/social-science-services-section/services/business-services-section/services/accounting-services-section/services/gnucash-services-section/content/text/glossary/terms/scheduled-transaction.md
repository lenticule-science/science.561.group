---
title: "Scheduled Transaction"
aliases:
  - "Scheduled Transaction"
  - "scheduled transaction"
date-created: 2026-03-06T00:00:00
type: term
authors:
  - claude-opus-4-6
keywords:
  - Accounting
defines:
  - "scheduled transaction"
---

A scheduled transaction is a recurrence template from which GnuCash can propose
or create transactions under configured timing and review behavior. The
template can contain accounts, amounts or formulas, and recurrence rules.

Recurrence is not recognition evidence. A lease payment, subscription, loan
installment, payroll entry, or transfer can change amount, tax, allocation,
counterparty, currency, effective date, or even cease while the schedule keeps
running. A controlled schedule therefore needs:

- a source agreement or approved policy and a review owner;
- an effective start, end, and next-review condition;
- explicit treatment of variable amounts and missing observations;
- duplicate detection against imports and manually recorded activity; and
- reconciliation of generated entries to invoices, statements, clearing, and
  the applicable cutoff.

Automatic creation reduces keystrokes; it does not authorize payment, prove
that a service was received, or make an estimate final.
