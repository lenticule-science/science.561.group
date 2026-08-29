---
title: "Aggregation"
date-created: 2026-03-29
type: term
defines:
  - "Aggregation"
  - "aggregated-by"
  - "aggregate"
requires: [morphism]
dual-of: decomposition
---

Aggregation is collecting many individual things into one summary. A ledger aggregates accounts — it gathers all the individual account records into a single organized whole. A sum aggregates numbers. A census aggregates individuals into a population count.

Aggregation loses detail in exchange for overview. The individual items still exist, but the aggregate shows only their combined shape. A good aggregation preserves the structure that matters and discards the structure that does not. A bad aggregation hides important differences behind a single number.

When this library uses `aggregated-by` as a predicate, the subject is the individual items and the object is what collects them together.
