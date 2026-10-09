---
type: theorem
class: engineering-claim
status: proved
depends-on: [secondary-index, index-as-alexandrov-up-set, alexandrov-topology, predication-fiber-algebra, knowledge-order, scope-cover-via-grothendieck-site]
see-also: [query-planning-via-beck-chevalley, materialized-view-as-functorial-projection-cache]
---

# A secondary-index family is an Alexandrov cover of the queried fiber

**Claim.** Let $\{I_j\}_{j \in J}$ be the family of [secondary indexes](teaching/explanations/secondary-index.md) declared on a substrate predicate $p$. Per [index-as-alexandrov-up-set](../../index-as-alexandrov-up-set.md), each $I_j$ corresponds to an Alexandrov-open up-set $U_{I_j} \subseteq A_p$ in the [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) topology on the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). The family $\{U_{I_j}\}_{j \in J}$ is an **Alexandrov cover of the index-served region** $\bigcup_j U_{I_j} \subseteq A_p$. A query whose required-predication footprint sits inside $\bigcup_j U_{I_j}$ is **index-servable** — answerable by index lookups and unions, with no fallback table scan. A query whose footprint extends outside $\bigcup_j U_{I_j}$ requires either an additional secondary index or a sequential scan of the residual.

## Why this holds

Per [index-as-alexandrov-up-set](../../index-as-alexandrov-up-set.md), each secondary index $I_j$ is an up-set $U_{I_j}$ in $(A_p, \leq_k)_{\mathrm{Alex}}$. The union $\bigcup_j U_{I_j}$ is again an up-set (up-sets are closed under arbitrary union), hence Alexandrov-open.

A query's required-predication footprint $F \subseteq A_p$ is the up-set of predications whose values determine the query result. The query is index-servable when $F \subseteq \bigcup_j U_{I_j}$ — every predication needed by the query lies in some indexed up-set. The query plan reduces to:

1. Decompose $F$ as $F = \bigcup_j (F \cap U_{I_j})$ along the cover.
2. For each $j$, perform an index lookup on $I_j$ restricted to $F \cap U_{I_j}$.
3. Union the per-index results.

Per the Alexandrov topology's interaction with the [Grothendieck-site cover](../../scope-cover-via-grothendieck-site.md) on scopes, the union step is a colimit in the predication-presheaf category — coherent by the sheaf condition that [index-as-alexandrov-up-set](../../index-as-alexandrov-up-set.md) establishes.

When $F \not\subseteq \bigcup_j U_{I_j}$, the residual $F \setminus \bigcup_j U_{I_j}$ has no covering up-set in the index family. The residual must be served by either (a) a sequential scan (an *implicit* index $U = A_p$, the trivial cover), or (b) the introduction of a new secondary index $I_{j^*}$ whose up-set covers the residual.

## Engineering consequence

- **Index-coverage analysis is open-cover analysis.** The substrate's planner answers "does this query need a table scan?" by computing $F \setminus \bigcup_j U_{I_j}$. Empty residual ⇒ index-only plan; non-empty residual ⇒ scan-or-index decision.
- **Adding an index is refining a cover.** Per the Alexandrov topology, the family $\{U_{I_j}\} \cup \{U_{I_{j^*}}\}$ is a refinement; the substrate's index-creation operation refines the cover monotonically. Removing an index is an inverse coarsening (subject to no other dependent query losing coverage).
- **Index unions are sheaf colimits.** Per the sheaf-cohomology correspondence (Curry 2014) noted in [index-as-alexandrov-up-set](../../index-as-alexandrov-up-set.md), the per-index lookups glue along the cover via the sheaf condition; the union step is automatic and structurally sound. No deduplication discipline beyond the bilattice's $\vee_k$ join is needed.
- **Index-overlap is Mayer–Vietoris.** When $U_{I_j} \cap U_{I_k} \neq \varnothing$, results from both indexes overlap on the intersection. Per [trace-causality-via-mayer-vietoris-spans](../../trace-causality-via-mayer-vietoris-spans.md), the substrate handles the overlap with a Mayer–Vietoris-style reconciliation step that is structurally cohomology-free in the absence of inconsistent index entries (a $\leq_k$-monotone substrate guarantees consistency per [cache-coherence-via-functorial-projection](../../cache-coherence-via-functorial-projection.md)).
- **Cost-driven plan selection within a cover.** When multiple covers $\{U_{I_j}\}_J$ and $\{U_{I_k}\}_K$ both contain $F$, the planner picks by quantale cost (per [graded-dispatch-via-q-enriched-fusion](../../graded-dispatch-via-q-enriched-fusion.md)). The value is invariant; only the grade differs.

## What the theorem rules out

- **Index-served queries that miss part of the footprint.** A planner that returns an index-only result without proving $F \subseteq \bigcup_j U_{I_j}$ may silently omit predications. The substrate refuses; coverage is checked statically.
- **Indexes that aren't up-sets.** Per [index-as-alexandrov-up-set](../../index-as-alexandrov-up-set.md), only $\leq_k$-monotone indexes are admitted. A non-monotone "index" cannot enter the Alexandrov-cover discipline.
- **Index intersection used as a result.** The intersection $U_{I_j} \cap U_{I_k}$ is itself an up-set (Alexandrov-opens are closed under finite intersection), useful for selectivity-driven plan choice; it is not, however, the *result* of a query — the result is the union over the cover of the footprint.

## Position

This theorem refines the parent's [index-as-alexandrov-up-set](../../index-as-alexandrov-up-set.md) for the database-platform's specific concern with *families* of indexes and their joint coverage. Together with [query-planning-via-beck-chevalley](query-planning-via-beck-chevalley.md), it explains how the planner combines index-coverage analysis (this theorem) with rewrite soundness (Beck–Chevalley) to produce theorem-backed query plans.
