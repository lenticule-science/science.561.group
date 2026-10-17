---
type: concept
class: workload-classification
depends-on: [transaction, query-language, resource-budget]
see-also: [materialized-view, oltp-vs-olap-as-regime-distinction, transaction-isolation-level]
---

# OLTP vs OLAP

The *substrate-recorded distinction between transactional (OLTP) and analytical (OLAP) database workloads*, with corresponding optimization disciplines.

**OLTP (Online Transaction Processing):**

- **Workload shape.** Many small transactions, each touching few cells. Reads + writes interleaved. Latency-sensitive (sub-100ms typical).
- **Examples.** Account balance update, order placement, user profile change.
- **Optimization.** Indexes on frequently-queried fields; row-oriented storage; transactions per [transaction-atomicity](../../../theorems/transaction-atomicity.md); per-request consistency.

**OLAP (Online Analytical Processing):**

- **Workload shape.** Few large queries, each touching many cells. Mostly reads; aggregations / joins. Latency-tolerant (seconds-to-minutes acceptable).
- **Examples.** Sales-by-region report, monthly active users, anomaly detection.
- **Optimization.** Columnar storage; materialized views (per [materialized-view](materialized-view.md)); approximate query algorithms; eventual consistency between OLAP and OLTP.

A substrate-instance may serve one or both:

- **OLTP-only.** Optimize for transaction throughput.
- **OLAP-only.** Optimize for analytic-query throughput; may receive data from OLTP via [read-replica](read-replica.md) or change-data-capture.
- **HTAP (Hybrid Transactional / Analytical).** A pair of regime-engines (one strict, one Scott-continuous) bound by a regime-respecting federation morphism. The pair may be *internal* to one substrate-instance (two co-located engines sharing storage, with discipline to prevent OLAP queries from blocking OLTP transactions) or *across instances* (separate processes with replication). Single-instance HTAP is not a third regime; it is internal federation. Per [oltp-vs-olap-as-regime-distinction](../theorems/oltp-vs-olap-as-regime-distinction.md), there is no free third envelope.

Per [self-representation](../../teaching/explanations/self-representation.md), the workload classification is substrate content. Per [resource-budget](../../teaching/explanations/resource-budget.md), the substrate may have separate budgets for OLTP vs OLAP work, preventing analytical queries from starving transactional ones.

Per [federation-convergence](../../../theorems/federation-convergence.md), data flows from OLTP substrates to OLAP substrates as substrate content; the OLAP substrate's analyses are based on the federated content.

## Structural identification with the four-regime classification

Per [oltp-vs-olap-as-regime-distinction](../theorems/oltp-vs-olap-as-regime-distinction.md), the OLTP/OLAP distinction is the substrate's [four-regime classification](../../../theorems/regime-classification-for-substrate.md) specialized to data-and-query workloads, with the database-platform definitionally restricted to the two cohomologically-tame regimes. OLTP substrates run in the *strict regime* (closure ordinal $\kappa < \omega$, finite per-cascade footprint, $H^1 = 0$); OLAP substrates run in the *Scott-continuous regime* ($\kappa = \omega$, directed-colimit aggregation over the evidence stream); HTAP is the federated pair of the two regime-engines, internally or across instances. Workloads requiring transfinite-bounded or aperiodic regimes are admissible at the predicated-computing parent level but fall outside the database-platform's scope as defined here.
