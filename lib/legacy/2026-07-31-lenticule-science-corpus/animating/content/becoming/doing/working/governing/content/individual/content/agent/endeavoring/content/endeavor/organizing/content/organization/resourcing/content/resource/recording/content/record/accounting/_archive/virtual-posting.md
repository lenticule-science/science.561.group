---

title: "Virtual Posting"
description: "A virtual posting is a posting enclosed in parentheses `()` or square brackets `[]` that doesn't need to balance with the other postings in the transaction. Virtual postings exist for budgeting and tracking purposes — they let users associate amounts with accounts without affecting the real double-entry balance."
aliases:
  - "Virtual Posting"
  - "virtual posting"
date-created: 2026-03-06T00:00:00
keywords:
  - accounting
---

A virtual posting is a posting enclosed in parentheses `()` or square brackets `[]` that doesn't need to balance with the other postings in the transaction.
Virtual postings exist for budgeting and tracking purposes — they let users associate amounts with accounts without affecting the real double-entry balance.

Parenthesized postings `()` are fully virtual — they don't balance and don't affect any real account.
Bracketed postings `[]` are "balanced virtual" — they must balance with other bracketed postings in the same transaction but are separate from the real postings.

This is a Ledger-specific feature that doesn't exist in [Beancount](../../../beancount.md), which rejects any transaction that doesn't fully balance.
