---
type: example
status: documented
instantiates: [read-replica, materialized-view, online-schema-change, query-planning, secondary-index]
---

# PostgreSQL as a database-platform realization

PostgreSQL is the canonical relational database whose operational discipline maps cleanly onto the database-platform subtheory's commitments. It is not a predicated computer in the strict substrate sense — its storage is row-oriented (heap tuples and B-tree indexes), not predication-cell-oriented — but its operator-level discipline is what this subtheory's morphisms and theorems are checked against. PostgreSQL serves as the discipline-witness against which the subtheory's abstract operational claims are tested.

## Mapping to subtheory structure

| Subtheory structure | PostgreSQL realization |
|---|---|
| [predication-graph-store](../../../objects/predication-graph-store.md) (parent) | Heap files + B-tree, GIN, GiST, BRIN indexes; not predication-cell-organized |
| [read-replica](teaching/explanations/read-replica.md) | Streaming replication via WAL shipping; physical replicas (full-cluster) and logical replicas (per-publication) |
| [read-replica-record](../objects/read-replica-record.md) | `pg_stat_replication` plus the configured `primary_conninfo` on the standby |
| [read-replica-eventual-consistency](../theorems/read-replica-eventual-consistency.md) | `synchronous_commit` modes (`off` / `local` / `remote_write` / `remote_apply`) tune the convergence-vs-latency point |
| [materialized-view](teaching/explanations/materialized-view.md) | `CREATE MATERIALIZED VIEW`; refresh via `REFRESH MATERIALIZED VIEW [CONCURRENTLY]` |
| [refresh-materialized-view](../morphisms/refresh-materialized-view.md) | The `REFRESH` command, optionally concurrent (locks-free against reads) |
| [secondary-index](teaching/explanations/secondary-index.md) | All non-primary indexes (B-tree, hash, GIN for composite/array, GiST for geometric, BRIN for clustered) |
| [online-schema-change](teaching/explanations/online-schema-change.md) | `CREATE INDEX CONCURRENTLY`; `ADD COLUMN ... DEFAULT NULL` (zero-downtime since pg11 even with default); `pg_repack` for non-online cases |
| [online-schema-change-zero-downtime](../theorems/online-schema-change-zero-downtime.md) | Verified by PostgreSQL's discipline: forward-additive changes (new column with default, new index, new table) hold the predicted no-block guarantee |
| [query-planning](teaching/explanations/query-planning.md) | The cost-based planner: cardinality estimates from `pg_statistic`, join-order search, plan caching for prepared statements |
| [plan-query](../morphisms/plan-query.md) | `EXPLAIN (FORMAT JSON, ANALYZE)`; the planner subsystem |
| [query-plan-record](../objects/query-plan-record.md) | The `EXPLAIN` JSON output; `auto_explain` log entries for production captures |

## Where the realization deviates from the subtheory

PostgreSQL's storage is not predication-cell-oriented, so the [predication-graph-store](../../../objects/predication-graph-store.md) commitment is not satisfied at the storage level. A predicated-computing realization that uses PostgreSQL as its substrate would need a triple-store layer over PostgreSQL (e.g., a single `cells (entity, predicate, value, witness, t)` table plus appropriate indexes) — at which point the operational discipline mapped above is inherited automatically, and what's added is the predication-cell discipline.

The witness-chain discipline ([witness](../../../objects/witness.md)) is partially realized by PostgreSQL's WAL (every committed change is durably logged with a sequence number), but PostgreSQL's WAL is not signed and not content-addressed; bringing it up to substrate discipline requires augmenting WAL records with witness signatures.

## What PostgreSQL contributes back to the subtheory

- The cost-based planner is the standard against which the [graph-vs-relational query reconciliation question](questions/graph-vs-relational-query-reconciliation.md) should be answered: any reconciliation that doesn't preserve PostgreSQL-class planning behavior on tabular workloads is operationally regressive.
- The MVCC discipline (multi-version concurrency control via tuple versioning + xmin/xmax visibility checks) is the realized-and-tested form of the substrate's transaction isolation. Substrate-level [transaction](../../teaching/explanations/transaction.md) discipline should reduce to MVCC-equivalent semantics under appropriate predication-cell encodings.
- Logical replication's per-publication granularity is the operationally-proven form of the [federation-convergence](../../../theorems/federation-convergence.md) selective-merge: a substrate can federate per-predicate (one publication per predicate-class) to bound replication cost.

## Reference

PostgreSQL Global Development Group. *PostgreSQL 16 Documentation*. https://www.postgresql.org/docs/16/. Particularly chapters 11 (Indexes), 26 (High Availability, Load Balancing, Replication), 14 (Performance Tips).
