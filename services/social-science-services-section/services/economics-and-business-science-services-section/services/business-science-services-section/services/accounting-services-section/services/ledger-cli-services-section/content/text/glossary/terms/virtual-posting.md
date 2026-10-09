---
name: "Virtual Posting"
aliases:
  - "Virtual Posting"
  - "virtual posting"
date-created: 2026-03-06
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---


A virtual posting is a Ledger posting whose account name is enclosed in
parentheses `()` or square brackets `[]`. It belongs to a reporting layer that
can be excluded with `--real`, separate from the ordinary posting balance.

Parenthesized postings do not have to balance with other virtual postings.
Bracketed postings are balanced virtual postings and must balance within their
virtual group. Both can appear in reports unless report options exclude them,
so they can change analytic totals even though they do not change ordinary
account balances.

Virtual postings are useful for budgets, funds, or analytic dimensions, but
they create two populations that readers can easily confuse. Name whether a
report includes ordinary, virtual, balanced-virtual, and automatically
generated postings. Do not use an unbalanced virtual layer as a substitute for
a real liability, restriction, inter-entity balance, or reconciled control
account.

The official Ledger 3 [virtual-posting reference](https://ledger-cli.org/doc/ledger3.html#Virtual-postings)
defines their syntax and filtering behavior.
