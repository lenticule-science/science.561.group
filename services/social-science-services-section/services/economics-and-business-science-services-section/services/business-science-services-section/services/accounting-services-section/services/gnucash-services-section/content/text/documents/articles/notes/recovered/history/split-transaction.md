---

title: "Split Transaction"
description: "A split transaction in GnuCash is a transaction that posts to more than two accounts. All GnuCash transactions are internally represented as splits — even a simple two-account transaction has two splits. But the term \"split transaction\" typically refers to cases where a single transaction distributes its amount across multiple accounts."
aliases:
  - "Split Transaction"
  - "split transaction"
  - "split"
date-created: 2026-03-06T00:00:00
tags:
  - accounting
---

A split transaction in GnuCash is a transaction that posts to more than two accounts. All GnuCash transactions are internally represented as splits — even a simple two-account transaction has two splits. But the term "split transaction" typically refers to cases where a single transaction distributes its amount across multiple accounts.

For example, a paycheck deposit might split into gross pay (income), tax withholding (liability), retirement contribution (asset), and net deposit (asset). The total of all splits must balance to zero, enforcing [double-entry bookkeeping](../../../../../terms/double-entry-bookkeeping.md).
