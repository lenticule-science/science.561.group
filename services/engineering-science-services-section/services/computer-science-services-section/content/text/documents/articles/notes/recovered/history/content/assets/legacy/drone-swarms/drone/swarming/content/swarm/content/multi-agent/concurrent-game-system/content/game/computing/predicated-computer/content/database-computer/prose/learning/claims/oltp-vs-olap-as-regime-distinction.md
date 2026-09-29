---
type: theorem
class: engineering-claim
status: proved
depends-on: [oltp-vs-olap, regime-classification-for-substrate, four-regime-dichotomy, scott-continuous-closure, closure-rule-language, predication-fiber-algebra, strict-regime-engineering-envelope, scott-continuous-regime-engineering-envelope, settling-convergence, transfinite-settling-convergence]
see-also: [transaction-isolation-as-knowledge-order-position, materialized-view-staleness-as-bigraded-h1-bound, query-planning-via-beck-chevalley, read-replica-eventual-consistency]
---

# OLTP and OLAP are the strict and Scott-continuous regimes specialized to data-and-query workloads

**Claim.** The [OLTP vs OLAP](teaching/explanations/oltp-vs-olap.md) workload classification is not a separate taxonomy — it is the substrate's [four-regime classification](../../../theorems/regime-classification-for-substrate.md) restricted to database use cases. Specifically:

- A pure-**OLTP** substrate runs in the **strict regime**: finite per-transaction footprint, finite closure ordinal $\kappa < \omega$ per cascade, $H^1 = 0$ on the per-transaction settling-associated sheaf.
- A pure-**OLAP** substrate runs in the **Scott-continuous regime**: the analytical query is a directed colimit over the substrate's evidence stream, $\kappa = \omega$, finitely-billable per finite prefix per [scott-continuity-as-checkpointability](../../../theorems/scott-continuity-as-checkpointability.md).
- An **HTAP** deployment is the substrate-pair $(E_{\text{strict}}, E_{\text{Scott}})$ of two regime-engines bound by a regime-respecting federation morphism $E_{\text{strict}} \to E_{\text{Scott}}$ shipping event-log content from the strict-regime engine into the Scott-continuous-regime engine's directed-colimit closure. Single-instance HTAP and multi-instance HTAP differ only in whether the federation is *internal to one substrate-instance* (two co-located engines sharing storage) or *across substrate-instances* (separate processes with replication); the regime-pair structure is the same.

The two substrate classes that database engineering treats as having "fundamentally different optimization profiles" are the two regimes whose engineering envelopes are *cohomologically tame* — the regimes in which $H^1$ vanishes and federation can ship endpoint state. This theorem makes a *positive* claim — that the OLTP/OLAP distinction *is* this regime distinction — and a *negative* design choice: the database-platform restricts attention to these two regimes. A substrate workload that requires the transfinite-bounded or aperiodic regimes (e.g., unbounded forward inference under universally-quantified schemas) is admissible at the predicated-computing level but falls outside the database-platform's scope as defined here. The restriction is a deliberate definitional bound on "database workload," not a derived consequence of the parent's regime classification.

## Why this holds

A database workload is characterized by two parameters of the substrate:

- **The rule-language fragment** of the substrate's [closure-rule system](../../../objects/closure-rule-system.md). OLTP transactions execute quantifier-free closure-rule cascades over the touched cells (referential-integrity checks, derived-column population, cache invalidation). OLAP queries execute aggregation-style closures over the data stream — sums, counts, group-bys — which are likewise quantifier-free but range over the *full* directed family of admitted facts.
- **The base finiteness** of the touched fiber. An OLTP transaction touches a finite, statically-bounded set of cells; per [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) finiteness, the cascade's closure ordinal lives in $< \omega$. An OLAP query ranges over the substrate's accumulated evidence; per [scott-continuous-closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/scott-continuous-closure.md), aggregation operators commute with the directed $\omega$-join, so $\kappa = \omega$.

Per the [four-regime dichotomy](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md):

- Quantifier-free + finite touched-base ⇒ strict regime ⇒ OLTP.
- Quantifier-free + infinite (directed-colimit) touched-base ⇒ Scott-continuous regime ⇒ OLAP.
- $\forall$-block rules over infinite domains ⇒ transfinite-bounded or aperiodic ⇒ *not* a database workload (this is the regime of unbounded inference / closure under universally-quantified schemas, not the regime of data storage and query).

The classification is exclusive at the per-cascade granularity. A substrate that mixes both at the deployment level — HTAP — physically separates the cascades by tagging each transaction or query with its regime and routing it to the substrate-instance whose engine envelope matches.

## Engineering consequence

- **The "OLTP optimizer" and "OLAP optimizer" are the strict-regime and Scott-continuous-regime engines.** Per [strict-regime-engineering-envelope](../../../theorems/strict-regime-engineering-envelope.md), the strict-regime engine has finite per-cascade fuel, point-snapshot persistence, and endpoint-state federation — exactly the OLTP optimizer's constitution. Per [scott-continuous-regime-engineering-envelope](../../../theorems/scott-continuous-regime-engineering-envelope.md), the Scott-continuous engine has finite-prefix-bounded fuel, prefix-checkpoint persistence, and directed-colimit federation — exactly the OLAP optimizer's constitution. A database engineer who tunes "OLTP knobs" vs "OLAP knobs" is choosing between regime envelopes.
- **Read replicas split along the regime boundary.** Per [read-replica-eventual-consistency](read-replica-eventual-consistency.md), the OLTP master and OLAP replicas form a [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md); the regime-respecting federation morphism is the directed-colimit injection from the strict-regime master into the Scott-continuous-regime replica. The replica-Mayer–Vietoris connecting homomorphism vanishes because both substrates are cohomologically tame.
- **Materialized views are the canonical regime-bridge.** Per [materialized-view-as-functorial-projection-cache](materialized-view-as-functorial-projection-cache.md), a materialized view is a content-addressed projection of strict-regime quiescent state into a Scott-continuous-regime aggregate. The view is the substrate-content witness of the regime morphism.
- **HTAP is not a third regime; it is a federated pair of regime-engines.** Whether the federation is *internal* to one substrate-instance (two co-located engines sharing storage) or *across instances* (separate processes with replication) is an implementation choice; both are pairs of regime-engines, neither is a free third envelope. A vendor claiming "HTAP-native single-instance" is offering internal federation, not regime escape.
- **Workload misclassification is detectable at admission.** Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), a transaction that declares itself OLTP but executes a $\forall$-block-style cascade (e.g., a full-table aggregation in a "transactional" handler) violates the substrate's strict-regime declaration and must either be re-routed or rejected.

## What the theorem rules out

- **A "third database workload class" within this theorem's scope.** Vendor labels like "real-time analytics," "stream processing," or "operational analytics" name HTAP federations or OLAP-with-bounded-prefix policies under this theorem — not new regimes. Per [four-regime-dichotomy](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), there are exactly four regimes; per the database-platform's definitional restriction above, two of them are in scope.
- **"Mixed-workload" optimization within a single substrate-instance without explicit regime declaration.** A substrate that handles both OLTP transactions and OLAP queries on the same instance without per-cascade regime tagging is operating in an under-specified envelope; the engine cannot consistently bound fuel or guarantee federation.
- **OLAP queries with universally-quantified inference cascades, within this theorem's scope.** An "OLAP query" that triggers a $\forall$-block closure over an infinite-cofinality entity space is not in the Scott-continuous regime; it has crossed into transfinite-bounded territory and falls outside the database-platform's scope as defined here. The predicated-computing parent admits such workloads; the database-platform delegates them.

## What the theorem requires

- The substrate is a conformant [predicated computer](../../../objects/predicated-computer.md) with a declared [regime-record](../../../objects/regime-record.md).
- Per-cascade rule-language fragment is statically determinable (the substrate can tell, before executing, whether a transaction's closure cascade is quantifier-free over a finite footprint).
- HTAP deployments declare both regime instances explicitly and the federation morphism between them.

## Position

This theorem grounds the database-platform's central workload distinction in the parent substrate's regime classification, removing the appearance that OLTP/OLAP is an ad hoc database-engineering taxonomy. Together with [transaction-isolation-as-knowledge-order-position](transaction-isolation-as-knowledge-order-position.md) (isolation as a $\leq_k$-position) and [materialized-view-staleness-as-bigraded-h1-bound](materialized-view-staleness-as-bigraded-h1-bound.md) (staleness as the canonically-refreshable $H^0$ section-gap on the projection's pushforward sheaf, licensed by the substrate's $H^1 = 0$ vanishing), it places three of the database-platform's central axes — workload class, isolation level, view freshness — into the predication-categories' regime / order / cohomology framework. The database-platform inherits its hardest engineering obligations as restrictions of substrate-level theorems, not as new commitments.
