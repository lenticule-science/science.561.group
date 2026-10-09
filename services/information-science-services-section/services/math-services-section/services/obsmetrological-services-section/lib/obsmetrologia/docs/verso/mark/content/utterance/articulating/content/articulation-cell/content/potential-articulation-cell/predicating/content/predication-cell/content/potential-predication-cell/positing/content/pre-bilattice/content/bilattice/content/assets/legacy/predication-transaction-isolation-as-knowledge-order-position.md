---
type: theorem
class: engineering-claim
status: sketch
depends-on: [transaction-isolation-level, knowledge-order, settling-quiescence, closure-driven-settling-monotonicity, settlement-via-closure-2-monad, predication-fiber-algebra, transaction-atomicity-via-closure-idempotence, four-bilattice]
see-also: [oltp-vs-olap-as-regime-distinction, materialized-view-staleness-as-bigraded-h1-bound, materialized-view-as-functorial-projection-cache, read-replica-eventual-consistency]
---

# The four SQL isolation levels are four canonical filter-strengths on the substrate's $\leq_k$-evidence accumulation, indexed by positions in the $\leq_k$-poset between $\bot_k$ and $\mathrm{cl}(v)$

**Claim (sketch).** Let a database transaction $T$ execute against a substrate predication scope whose value-domain is a [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md) $\mathbf{L}^{\bowtie}$ admitting the [knowledge order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) $\leq_k$. Per [closure-driven-settling-monotonicity](../../../../../../valuation/content/knowledge-least-valuation/settling/content/settling-monotonicity/references/closure-driven-settling-monotonicity.md), evidence accumulates $\leq_k$-monotonically; the substrate at each instant carries multiple $\leq_k$-positions simultaneously:

- $\bot_k$ — empty fiber (before any admission).
- $v_{\text{committed}}(t)$ — restriction to cells past their per-cell commit barrier (resolving cascade complete).
- $v_{\text{live}}(t) = v_{\text{committed}}(t) \vee_k v_{\text{in-flight}}(t)$ — committed evidence joined with in-flight admissions whose resolving cascade has not yet completed; satisfies $v_{\text{committed}}(t) \leq_k v_{\text{live}}(t)$ by $\vee_k$-monotonicity.
- $v_{\text{snapshot}} := v_{\text{committed}}(t_{\text{start}})$ — a frozen committed position pinned at $T$-start.
- $\mathrm{cl}(v)$ — the closure operator's fixed-point at quiescence per [settlement-via-closure-2-monad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-via-closure-2-monad.md).

These five positions form a $\leq_k$-poset (not a single linear chain): $\bot_k \leq_k v_{\text{snapshot}} \leq_k v_{\text{committed}}(t)$ and $\bot_k \leq_k v_{\text{committed}}(t) \leq_k v_{\text{live}}(t) \leq_k \mathrm{cl}(v)$, with $v_{\text{snapshot}}$ a time-frozen view on the committed-front line.

The four classical SQL isolation levels — read-uncommitted, read-committed, repeatable-read, serializable — are four canonical filter-strengths on which $\leq_k$-position the transaction's reads observe:

| SQL level | Read filter | Position observed | Forbidden anomaly |
|---|---|---|---|
| read-uncommitted | none | $v_{\text{live}}(t_{\text{read}})$ | (none — observes in-flight $\top_k$) |
| read-committed | drop in-flight | $v_{\text{committed}}(t_{\text{read}})$ | dirty read |
| repeatable-read | drop in-flight + pin at start | $v_{\text{snapshot}}$ | non-repeatable read |
| serializable | pin at quiescence | $\mathrm{cl}(v)$ | phantom read |

Ascending the SQL hierarchy is *strengthening the read-time filter*. Each level rules out the anomaly the next-weaker level allows: dirty reads vanish when in-flight evidence is filtered out; non-repeatable reads vanish when the position is pinned; phantom reads vanish when the position is the closure fixed-point so no later admission can change the predicate-extension.

## Why this is a sketch (not yet proved)

A clean proof requires:

1. **A precise definition of "in-flight" as a substrate predicate** on cells, not a folk description. The corpus has [predication-settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) and [closure-driven-settling-monotonicity](../../../../../../valuation/content/knowledge-least-valuation/settling/content/settling-monotonicity/references/closure-driven-settling-monotonicity.md) but no explicit "commit-barrier" predicate that distinguishes in-flight from committed cells. Defining it requires a per-cell witness on the cascade-completion event — content the substrate already records, but not yet packaged as a primary concept.

2. **A precise account of the snapshot freeze.** "Pinning $v_{\text{snapshot}} := v_{\text{committed}}(t_{\text{start}})$" is a substrate operation that captures a $\leq_k$-position and serves all reads in $T$ from it. Per multi-version concurrency control as the substrate's $\leq_k$-history (per the engineering consequence below), this is realizable, but the explicit MVCC-as-substrate-content theorem is not yet written.

3. **The bijection with SQL is a structural derivation, not just a labeling.** The argument that *exactly four* canonical filter-strengths exist and that *they correspond* to the SQL standard's four levels needs a uniqueness lemma: every well-defined read-filter on the $\leq_k$-poset that produces a coherent transaction reduces to one of the four positions. The argument is plausible — filters are determined by (a) whether in-flight is dropped, (b) whether the position is pinned at start, (c) whether quiescence is required — and these binary choices give four combinations, but the formal completeness argument is left to a refinement.

A status-`proved` version lands once these three ingredients are written out as separate lemmas.

## Why the sketch is structurally on the right track

The SQL standard defines isolation levels by the *anomalies they permit* — a negative characterization that doesn't explain why there are exactly four, why they form a hierarchy, or why some intermediate "level" between two of them does or doesn't exist. The $\leq_k$-position framing gives a positive characterization: each level is a substrate-recorded filter on which $\leq_k$-positions the reads observe, and the hierarchy is the strengthening of that filter.

Three structural matches:

**Read-uncommitted observes $v_{\text{live}}$, which may include $\top_k$.** Per the [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md), $\top_k$ is the bilattice value "evidence both for and against" — the position of in-flight contradictory predications. A dirty read is reading a value at $\top_k$ before the resolving cascade settles it; if resolution would have moved the cell to a definite truth value, the dirty read observed evidence the substrate later disowns. The bilattice's $\top_k$ value is structurally the warning the substrate flies for "do not act on this yet."

**Read-committed filters in-flight.** The committed front $v_{\text{committed}}(t)$ is the join restricted to cells past their commit barrier — cells whose closure cascade has terminated. Per $\leq_k$-monotonicity, $v_{\text{committed}}(t)$ is itself $\leq_k$-monotone in $t$; successive reads of the same cell can return advancing values, which is exactly the non-repeatable-read anomaly.

**Repeatable-read pins.** Pinning $v_{\text{snapshot}}$ is freezing a specific $\leq_k$-position; per $\leq_k$-monotonicity later positions are $\geq_k v_{\text{snapshot}}$, but the transaction's reads stay at the pinned position. Phantom reads remain because the snapshot's predicate-extension may not include cells admitted post-snapshot — pinning fixes the position, not the predicate-extension's growth.

**Serializable reads at $\mathrm{cl}(v)$.** Per [settling-quiescence](../../../../../../valuation/content/knowledge-least-valuation/settling/content/settling-quiescence/settling-quiescence.md), the closure fixed-point is the position past which no closure step changes the value; per [transaction-atomicity-via-closure-idempotence](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/transaction-atomicity-via-closure-idempotence.md), reads at this position are atomic in the categorical sense. No anomaly survives because every observable position is closure-stable.

## Engineering consequence

- **Isolation level is substrate-content, not a configuration knob.** Per [transaction-isolation-level](teaching/explanations/transaction-isolation-level.md), the level is recorded; per [witness](../../../objects/witness.md), each read produces a witness recording the $\leq_k$-position observed. The substrate's audit can replay reads and confirm the position discipline.
- **The SQL anomaly hierarchy is derived.** The relative ordering of the four levels (uncommitted weaker than committed weaker than repeatable weaker than serializable) is forced by the strengthening of the read-filter; the substrate need not separately stipulate which anomalies each level forbids.
- **Snapshot isolation is not a fifth level.** What database vendors call "snapshot isolation" is repeatable-read with the snapshot taken at a globally-consistent commit point. It refines the snapshot-pinning discipline, not the position-poset.
- **Multi-version concurrency control is the substrate's $\leq_k$-history.** A multi-version store materializes the $\leq_k$-evolution explicitly: each cell's history records the sequence of positions it has occupied. A transaction's read at $v_{\text{snapshot}}$ retrieves the cell's value at that historical position. Per [event-log](../../../objects/event-log.md), this history is already encoded; "MVCC" is the engineering name for replaying it to a chosen position.
- **Federation respects isolation.** Per [federation-convergence](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) and [read-replica-eventual-consistency](read-replica-eventual-consistency.md), a $\leq_k$-position pinned at one substrate-instance is the same position when read from any federated peer that has caught up to that point in the event log.
- **Read-your-own-writes is automatic at $\geq_k$ snapshot.** A transaction that reads at any position $\geq_k$ its own writes observes its writes by $\leq_k$-monotonicity. Under repeatable-read, the discipline is to make the transaction's *own* writes visible to its *own* reads even when the global snapshot is older — a per-transaction local advance from $v_{\text{snapshot}}$ to $v_{\text{snapshot}} \vee_k T_{\text{writes}}$.

## What the theorem rules out

- **Levels outside the four-position discipline.** A "level" that gives serializability without reaching $\mathrm{cl}(v)$, or forbids phantoms without pinning the predicate-extension, is structurally inconsistent — there is no $\leq_k$-position with those properties.
- **Read-uncommitted with anomaly-freedom.** A substrate that claims to read at $v_{\text{live}}$ while forbidding dirty reads is violating the structure: either it isn't actually reading at $v_{\text{live}}$ (it's at $v_{\text{committed}}$, hence higher level), or dirty reads are structurally possible.
- **Vendor "level X plus" extensions that aren't $\leq_k$-positions.** Vendor-specific levels like "read-committed with statement-level snapshots" are either positions-named-differently or substrate-discipline mistakes; the substrate's audit can determine which.

## What the theorem requires (to upgrade from sketch to proved)

- The substrate's value-domain is a [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md) with $\leq_k$ admitting per-cell pinning and snapshot capture.
- The substrate's [closure-rule system](../../../objects/closure-rule-system.md) generates a closure operator with a well-defined fixed-point per [settlement-via-closure-2-monad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-via-closure-2-monad.md).
- A primary commit-barrier predicate (ingredient 1) and an MVCC-as-substrate-content theorem (ingredient 2) are written.
- The four-position completeness lemma (ingredient 3) is stated and proved.

## Position

This sketch grounds the database-platform's transaction-isolation discipline in the predication-categories' knowledge-order. Together with [oltp-vs-olap-as-regime-distinction](oltp-vs-olap-as-regime-distinction.md) and [materialized-view-staleness-as-bigraded-h1-bound](materialized-view-staleness-as-bigraded-h1-bound.md), it positions the database-platform's three central operational axes — workload class, isolation level, view freshness — as derivations from substrate-level structure. The SQL standard's isolation hierarchy is recovered as a corollary; the forbidden-anomaly characterization is replaced by the positive read-filter characterization that explains why the hierarchy has exactly four canonical levels.
