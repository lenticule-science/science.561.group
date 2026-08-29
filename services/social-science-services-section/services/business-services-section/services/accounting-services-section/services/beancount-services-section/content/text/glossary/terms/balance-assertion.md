---
title: "Balance Assertion"
aliases:
  - "Balance Assertion"
  - "balance assertion"
date-created: 2026-03-06T00:00:00
type: term
authors:
  - claude-opus-4-6
keywords:
  - Accounting
defines:
  - "balance assertion"
---

# Balance Assertion

A balance assertion is a directive that states an expected account quantity for
a commodity at a date. Beancount compares that expectation with the balance
computed from the admitted entries before the assertion takes effect and
reports a difference outside the applicable tolerance.

```
2024-03-31 balance Assets:Checking  1547.23 USD
```

This states an expected USD quantity for `Assets:Checking` at the assertion's
effective time. It should be connected to evidence at the same cutoff, such as
a reconciled statement balance. A mismatch establishes a contradiction between
the assertion and the selected ledger population. The cause may be a missing,
duplicate, mistimed, or misclassified posting; a wrong assertion; a population
or currency mismatch; or a tolerance issue.

A passing assertion is narrower than a reconciliation. Equal totals can contain
offsetting errors, and the assertion does not establish ownership, existence,
classification, historical cost, current value, or completeness of activity.
Use it after reconciling a source population, and retain the source identifier
and reconciliation record that explain why the expected quantity was accepted.

The [Ledger CLI](../../../../../ledger-cli-services-section/content/text/glossary/topics/ledger-cli.md)
also supports assertions, but syntax and evaluation behavior belong to the
exact tool version. The durable control principle is independent of the tool:
an executable expectation is useful only when it is tied to independent or
otherwise controlled evidence.

See the official [Beancount language syntax](https://beancount.github.io/docs/beancount_language_syntax/)
and [precision and tolerances](https://beancount.github.io/docs/precision_tolerances/)
references for evaluation details.
