---
name: "Dependency Splitting"
date-created: 2026-10-08
aliases:
  - "dependency splitting"
  - "recursive splits"
  - "cascading splits"
description: "A funding pattern in which each recipient of a payment forwards a stated share to the accounts it depends on, so one donation is divided down a dependency graph by weights each recipient sets."
references: {}
---

**Dependency splitting** routes a payment through a graph of accounts in which every account publishes a list of other accounts with weights; on receipt, it forwards each weight's share and keeps the remainder. A donor funds a few direct recipients, and the weights each recipient has chosen carry the money to the recipients' own dependencies, and onward.

In Drips the graph is stored as per-account splits receivers with weights out of 1,000,000, at most 200 receivers per account, and anybody may trigger the split of any account, so forwarding cannot be withheld by an intermediate recipient. The same call can be repeated until funds reach accounts whose splits are empty or immutable.

The pattern assumes recipients can name their real dependencies honestly and that cycles and self-dealing are harmless. It has no notion of work performed: weights are declarations, and any account can redirect its outgoing weights at any time, including toward itself or associates.
