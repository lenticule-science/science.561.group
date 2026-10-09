---
type: concept
class: transaction-discipline
depends-on: [transaction, knowledge-order, settling-quiescence, settling-monotonicity, predication-fiber-algebra]
see-also: [transaction-isolation-as-knowledge-order-position, oltp-vs-olap]
---

# Transaction isolation level

The *substrate-recorded read-filter strength that determines which $\leq_k$-position on the substrate's evidence-accumulation a transaction's reads observe*. Per [transaction-isolation-as-knowledge-order-position](../theorems/transaction-isolation-as-knowledge-order-position.md), the four classical SQL isolation levels are four canonical filter-strengths on the substrate's $\leq_k$-poset:

$$\bot_k \;\leq_k\; v_{\text{snapshot}} \;\leq_k\; v_{\text{committed}}(t) \;\leq_k\; v_{\text{live}}(t) \;\leq_k\; \mathrm{cl}(v)$$

The poset is *not* a single linear chain in time: $v_{\text{committed}}(t)$ and $v_{\text{live}}(t)$ both advance with $t$, while $v_{\text{snapshot}}$ is a time-frozen committed position. All five sit between $\bot_k$ and the closure fixed-point per [closure-driven-settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md).

The four levels:

- **read-uncommitted.** Read filter: none. The transaction observes $v_{\text{live}}(t_{\text{read}})$ — committed evidence joined with in-flight admissions whose resolving closure cascade has not yet completed. Per the [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md), $v_{\text{live}}$ may carry $\top_k$ cells where contradictory in-flight predications coexist. Reading at $\top_k$ is reading "we don't know yet which way this resolves"; if the resolving cascade later moves the cell to a definite truth value, the dirty read observed evidence the substrate later disowns. This is the "dirty read" anomaly.
- **read-committed.** Read filter: drop in-flight evidence. The transaction observes $v_{\text{committed}}(t_{\text{read}})$ — values past the per-cell commit barrier, i.e., cells whose closure cascade has terminated and is no longer at $\top_k$. Each read is at the *current* committed front; successive reads of the same cell may return $\leq_k$-advancing committed values. This is the "non-repeatable read" anomaly.
- **repeatable-read.** Read filter: drop in-flight + pin position at start. The transaction reads exclusively from $v_{\text{snapshot}} := v_{\text{committed}}(t_{\text{start}})$ for its duration. Subsequent commits by other transactions advance the global $v_{\text{committed}}(t)$ front past the snapshot, but the transaction's reads stay anchored. The "phantom read" anomaly remains because the snapshot's predicate-extension may not include cells admitted post-snapshot.
- **serializable.** Read filter: pin at quiescence. The transaction reads at the closure fixed-point $\mathrm{cl}(v)$ per [settling-quiescence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md). No further closure step changes the value the transaction observes; all anomalies vanish; the cost is that the transaction must be sequenced against the quiescence frontier.

Per [self-representation](../../teaching/explanations/self-representation.md), the isolation level of each transaction is substrate content — a predication on the [transaction-record](../../../objects/transaction-record.md). Per [witness](../../../objects/witness.md), each read produces a witness that records *which $\leq_k$-position* the read observed; auditors can replay the reads against the substrate's history and confirm the position discipline.

## Why this concept is structural, not conventional

The SQL standard defines isolation levels by the *anomalies they permit* (dirty read, non-repeatable read, phantom read). That definition is negative — it characterizes a level by what it doesn't prevent, not by what it is. The knowledge-order position gives a positive characterization: an isolation level is a substrate-recorded $\leq_k$-position from which the transaction reads. The anomalies are derived as the gap between the chosen position and $\mathrm{cl}(v)$.

This positive characterization extends the SQL hierarchy structurally. Levels between read-committed and repeatable-read (per-cell pinning vs. transaction-wide pinning) are intermediate $\leq_k$-positions; the SQL standard names only four canonical positions but the chain admits arbitrary refinements per the substrate's witness machinery.

## Composability with other database-platform constructs

- **Materialized views** (per [materialized-view](materialized-view.md)) are computed at $\mathrm{cl}(v)$ — serializable-equivalent reads. Per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md), the cache key is the canonical hash of the quiescent base.
- **Read replicas** (per [read-replica](read-replica.md)) advertise their replica-side $\leq_k$-position relative to the master via the replica-lag witness. A read at a lagged replica is structurally a read at an earlier $\leq_k$-position; the application's chosen isolation level determines whether that lag is admissible.
- **OLAP queries** (per [oltp-vs-olap](oltp-vs-olap.md)) typically run at repeatable-read or snapshot — the analytical query needs a stable $\leq_k$-position for its directed-colimit aggregation but does not need quiescence.

Per [federation-convergence](../../../theorems/federation-convergence.md), isolation-level positions are stable across federation: a snapshot $v_{\text{snapshot}}$ pinned at one substrate-instance is the same $\leq_k$-position when read at any federated peer that has caught up to that point in the event log.
