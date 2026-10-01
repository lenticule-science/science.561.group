---
name: "Virtual Posting"
aliases:
  - "Virtual Posting"
  - "virtual posting"
date-created: 2026-03-06
authors:
  - claude-opus-4-6
keywords:
  - accounting
description: A virtual posting is a posting enclosed in parentheses () or square brackets [] that doesn't need to balance with the other postings in the transaction.
---


A virtual posting is a posting enclosed in parentheses `()` or square brackets `[]` that doesn't need to balance with the other postings in the transaction.
Virtual postings exist for budgeting and tracking purposes — they let users associate amounts with accounts without affecting the real double-entry balance.

Parenthesized postings `()` are fully virtual — they don't balance and don't affect any real account.
Bracketed postings `[]` are "balanced virtual" — they must balance with other bracketed postings in the same transaction but are separate from the real postings.

This is a Ledger-specific feature that doesn't exist in [Beancount](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/ledger-cli/content/beancount.md), which rejects any transaction that doesn't fully balance.
