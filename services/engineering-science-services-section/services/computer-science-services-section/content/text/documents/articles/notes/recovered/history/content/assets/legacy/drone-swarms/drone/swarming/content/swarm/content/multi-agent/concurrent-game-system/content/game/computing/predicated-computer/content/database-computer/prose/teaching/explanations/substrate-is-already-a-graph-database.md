---
type: narrative
status: current
introduces: [predication-graph-store, oltp-vs-olap]
discusses: [read-replica, materialized-view, query-planning, online-schema-change]
---

# The substrate is already a graph database

The most common confusion at the boundary between predicated-computing and database-platform is the question "where does the database go?" The instinct of an engineer used to building applications on top of relational databases is to look for the *layer* that holds the data — Postgres, MySQL, Mongo, Neo4j — and then ask how the predicated substrate sits next to it. The answer is that the substrate *is* the database. There is no layer underneath. The [predication-graph store](../../../objects/predication-graph-store.md) — subject-predicate-object cells with a witness chain — is structurally a graph database. The substrate's [federation-convergence](../../../theorems/federation-convergence.md) gives it CRDT-shaped replication. The substrate's [transaction](../../../teaching/explanations/transaction.md) discipline gives it ACID-or-BASE semantics depending on the cells touched. The substrate's [event log](../../../objects/event-log.md) is the WAL.

What database-platform adds is *not* a database. It is the *operational discipline* that a serious database deployment needs and that the substrate, as substrate, leaves open.

## What the parent leaves open

The parent characterizes the substrate at the level that lets it be many things — a small per-process store, a federated cluster, a flatfile vault. It commits to the cell shape, the closure machinery, the witness chain, the federation merge. It does not commit to:

- *How replication is partitioned.* The parent's federation is symmetric (any node can merge with any other). Database deployments typically have asymmetric topologies — one write-master, several read-replicas — for both throughput and operational reasons.
- *What gets cached and refreshed.* The parent has predication cells; it doesn't say which derived views should be pre-computed and on what cadence.
- *How queries are planned.* The parent has [closure-rule application](../../../morphisms/closure-rule-application.md) as the unit of computation. Multi-step queries against a large store need a planner that reasons about cost; the parent doesn't supply one.
- *How schema changes happen without downtime.* The parent has [schema-evolution](../../../teaching/explanations/schema-evolution.md) at the cell level. Production database deployments need the operational disciplines (online column add, online index build, multi-phase migration) that turn schema-evolution into a thing operations teams can actually do without scheduling outages.

These are the database-platform's contribution. Each is an operational discipline that any non-trivial database deployment will end up needing. The subtheory says: here is the canonical form of each, in the substrate's vocabulary, with the theorems that make the discipline sound.

## Why this is a specialization, not a layer

A *layer* would be a separate system — a relational database — sitting on top of the substrate, with the substrate playing the role of an event log or a backup target. A *specialization* is the substrate itself, operating under additional commitments that bind the substrate's existing discipline to a particular use.

The difference matters because layers introduce coordination problems the substrate already solved. If the database is a layer over the substrate, the database's WAL has to be reconciled with the substrate's witness chain; the database's replication has to be reconciled with the substrate's federation; the database's transaction log has to be reconciled with the substrate's event log. Two systems, two truths, and the engineering work is in the reconciliation.

A specialization avoids the reconciliation. There is one truth — the substrate. The database disciplines are *uses* of the substrate's existing structure, not separate structures. A read-replica is just another federated peer with a no-write policy. A materialized view is just substrate content with a refresh closure rule. An online schema change is just an additive predication-cell update with a forward-compatibility theorem. The substrate is the database; the subtheory characterizes the database use of the substrate.

## What this means for the engineer

When a predicated-computing engineer is told "we need a database for X," the right move is not to add a database to the architecture. The right move is to recognize that the substrate is the database, and to ask which database-platform disciplines the use case requires. A high-throughput read-heavy workload requires read-replicas, so the [read-replica](../teaching/explanations/read-replica.md) discipline applies. A reporting workload over the same data requires materialized views, so [materialized-view](../teaching/explanations/materialized-view.md) applies. A workload that will outgrow its initial schema requires online schema change, so [online-schema-change](../teaching/explanations/online-schema-change.md) applies. The architecture stays one system; the disciplines layer onto the substrate as operational commitments.

The engineering question becomes: which subset of database-platform disciplines does this use case need, and is the substrate operationally configured to provide them? Not: which database product do we put underneath?
