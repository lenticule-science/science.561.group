---
title: "Database Platform"
component-of: predicated-computing
---

# Database Platform

A subtheory of [predicated-computing](../../_index.md) specializing the substrate to *database use cases*: OLTP (transactional workloads), OLAP (analytical workloads), secondary indexes, query planning, materialized views, replica-read-vs-write split.

The parent substrate's [predication-graph store](../../objects/predication-graph-store.md) is structurally a graph database — predication cells are subject-predicate-object triples, traversal is the primary query primitive. This sub-theory specializes for substrates whose dominant use is data storage and query, adding the disciplines that database systems typically provide.

## What this subtheory adds

- **OLTP / OLAP distinction** — substrate-recorded designation of workload type, with corresponding optimization disciplines.
- **Secondary indexes** — beyond the parent's [index](../teaching/explanations/index.md), specific patterns for relational, document, and graph indexes.
- **Query planning** — how queries are optimized given available indexes and statistics.
- **Materialized views** — pre-computed query results, refreshed on substrate events.
- **Read replicas** — substrate-instances dedicated to reads, with eventual consistency vs the write-master.
- **Schema migrations** — beyond the parent's [schema-evolution](../teaching/explanations/schema-evolution.md), specific patterns for online schema changes.
- **Backup-and-restore at database scale** — large-content backup discipline beyond per-cell snapshot.

## What it inherits

Inherits everything from parent predicated-computing.

## When to use this vs. parent substrate

Per the parent's [predication-graph store](../../objects/predication-graph-store.md), the substrate is *already* a graph database. This sub-theory specializes for substrates whose use is *primarily* data-and-query — adding patterns like read-replica-split that aren't typical for general predicated-computing instances.

## Convention

Per the parent corpus's convention.

## Layout

- `concepts/` — database-discipline anchors.
- `objects/` — substrate-entity records for indexes, query plans, materialized views, replica configurations.
- `morphisms/` — operators for query planning, view materialization, replica synchronization.
- `theorems/` — engineering claims about database properties.

## Position

Database-platform composes with [distributed-coordination-platform](../distributed-coordination-platform/_index.md) (replicas may need consensus for strong consistency), with [web-server-platform](../web-server-platform/_index.md) (databases typically expose query APIs over HTTP), and with the parent's [transaction](../teaching/explanations/transaction.md) machinery (database transactions are the parent's transaction with database-specific patterns).
