---
type: theorem
class: engineering-claim
status: sketch
depends-on: [materialized-view, materialized-view-as-functorial-projection-cache, refresh-materialized-view, settling-quiescence, settling-monotonicity, bigraded-settling-cohomology, settling-associated-sheaf, replica-mayer-vietoris, wavefront-locality-via-cohomology-vanishing, predication-fibration]
see-also: [oltp-vs-olap-as-regime-distinction, transaction-isolation-as-knowledge-order-position, query-planning-via-beck-chevalley, secondary-index-as-alexandrov-cover]
---

# Materialized-view staleness is the canonically-refreshable $H^0$ section-gap on the projection's restricted settling-associated sheaf, with support bounded by wavefront-locality

**Claim (sketch).** Let $V$ be a [materialized view](teaching/explanations/materialized-view.md) over a substrate predication scope, defined by the projection functor $g^* : A_q \to A_p$ (per [materialized-view-as-functorial-projection-cache](materialized-view-as-functorial-projection-cache.md)). Let $v^*$ be the base value at the most recent [refresh](../morphisms/refresh-materialized-view.md), $v$ the current base value, and $\Delta := v \setminus v^*$ the cells admitted since the refresh. The view's *staleness* — the per-cell disagreement between the cached projection $g^*(v^*)$ and the would-be re-computation $g^*(v)$ — is exactly an $H^0$ section-gap

$$\sigma(V) \;\in\; H^0(U_{v^*} \cap U_v, \, g_* \mathcal{F}_U)$$

on the projection's pushforward of the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md), where $\{U_{v^*}, U_v\}$ covers the affected region. Per [wavefront-locality-via-cohomology-vanishing](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront-locality-via-cohomology-vanishing.md), the connecting homomorphism $\delta^0$ on the settling-associated sheaf is identically zero — and *that vanishing is the structural reason* the section-gap $\sigma(V)$ extends canonically to a coherent refresh action on $U_{v^*} \cup U_v$ with no merge obstruction. The support of $\sigma(V)$ is bounded by $g(\Delta)^+$ — the projection of cells admitted since refresh, closed under the cascade — *not* by the size of $A_q$ or $A_p$, which is the wavefront-locality bound.

This reverses the naive reading: staleness is not measured by an obstruction class but by the *gluing data itself*; the obstruction class vanishing is what licenses calling that gluing data a well-defined "staleness."

## Why this is a sketch (not yet proved)

A clean proof requires three ingredients we have but have not assembled in detail here:

1. **The pushforward sheaf is well-defined.** The projection $g^*$ on values induces a pushforward $g_* \mathcal{F}_U$ on the settling-associated sheaf. The proof needs to verify this pushforward is itself a sheaf in the same Grothendieck-site discipline as $\mathcal{F}_U$, so that Mayer–Vietoris applies. Per [predication-fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), pushforwards along projection functors preserve sheaf structure when the projection is itself a fibration morphism — which is the case for materialized-view projections per [materialized-view-as-functorial-projection-cache](materialized-view-as-functorial-projection-cache.md), but the explicit verification is left to a later refinement.

2. **The wavefront bound on $g_* \mathcal{F}_U$ is inherited from the bound on $\mathcal{F}_U$.** The parent theorem [wavefront-locality-via-cohomology-vanishing](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront-locality-via-cohomology-vanishing.md) gives the wavefront bound for $\mathcal{F}_U$ directly. Inheriting the bound for $g_* \mathcal{F}_U$ requires that the projection $g$ preserve affected-region support — which it does set-theoretically (the image of an affected cell is affected in the projection), but the precise argument that $g_*$ commutes with the Čech cocycle representative of the wavefront support requires an explicit cochain calculation.

3. **The bigrading interpretation.** The body discusses a $(0, 1)$-vs-$(1, 1)$ split per [bigraded settling cohomology](../../../../sheaf/content/settling-cohomology/content/bigraded-settling-cohomology/bigraded-settling-cohomology.md) — the first measuring "consistent staleness," the second measuring "inconsistency-induced disagreement." For the canonical $H^0$ gap formulation given in the headline, the bigrading lifts cleanly only after a per-bilattice-component decomposition of the gap section. The detailed bookkeeping is left for a follow-up.

A status-`proved` version of this theorem will land once the three ingredients are written out as separate lemmas in `theories/.../predication-categories/lemmas/` (or as supporting theorems in this database-platform).

## Why the sketch is structurally on the right track

The substrate state evolves $\leq_k$-monotonically per [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md). Between the refresh-time quiescent value $v^*$ and the current value $v$, the cell-set $\Delta$ has been admitted; per the closure-rule cascade these admissions induce, the affected region in $A_p$ is some $g(\Delta)^+$ — the closure of the projected delta under the cascade.

Form the two-element cover of the affected region:

- $U_{v^*} := \{$cells whose value the refresh-time projection $g^*(v^*)$ correctly determines$\}$.
- $U_v := \{$cells whose value the current projection $g^*(v)$ would determine$\}$.

The two sections agree outside the overlap $U_{v^*} \cap U_v$ — outside the affected region they are both equal to the unchanged projected value. On the overlap, they differ exactly on the cells where admissions in $\Delta$ have shifted the projected value. That per-cell disagreement is the section $s_\Delta \in H^0(U_{v^*} \cap U_v, g_* \mathcal{F}_U)$ — and *this is the staleness*.

Per [replica-mayer-vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/replica-mayer-vietoris.md), the cover induces a Mayer–Vietoris long exact sequence with connecting homomorphism $\delta^0 : H^0(U_{v^*} \cap U_v, g_* \mathcal{F}_U) \to H^1(U_{v^*} \cup U_v, g_* \mathcal{F}_U)$. Per [wavefront-locality-via-cohomology-vanishing](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront-locality-via-cohomology-vanishing.md) and [crdt-convergence-via-mayer-vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md), $\delta^0 = 0$ identically on the (un-pushed-forward) settling-associated sheaf. Modulo the pushforward verification (ingredient 1 above), $\delta^0(s_\Delta) = 0$ on $g_* \mathcal{F}_U$ — and that vanishing is the structural fact that makes the per-cell disagreement *refresh-resolvable*: the section on the overlap extends canonically to a coherent state on the union, and the refresh operation is exactly that extension.

So the cohomology story is the opposite of "staleness is an $H^1$ obstruction":

- The staleness *is* the $H^0$ section-gap on the overlap (concrete data: a list of cells with their old and new projected values).
- The $H^1 = 0$ vanishing of $\delta^0$ is what guarantees the section-gap *can be resolved* by a refresh, with no merge obstruction left over.

Stale views are coherently refreshable precisely because the substrate's wavefront-locality kills the $H^1$ obstruction — the cohomological vanishing is good news, and naming the gap by an $H^0$ section is the structurally correct framing.

## Engineering consequence

- **Staleness has a precise, content-addressed value.** The staleness is the explicit Čech 0-cocycle $s_\Delta$ on the overlap; the substrate computes it as $s_\Delta = g^*(v) \ominus_k g^*(v^*)$ on the affected region, where $\ominus_k$ is the $\leq_k$-difference (per [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md) structure). Two substrates that share the same base history compute the same staleness for the same view by content-addressing.
- **Staleness budgets are section-gap budgets.** A "freshness SLA" of the form *the view may lag base by at most $\epsilon$* is a bound on $|s_\Delta|$ — the number of disagreeing cells weighted by the bilattice's $\leq_k$-grade of disagreement. The substrate's refresh policy can declare a structural threshold (refresh when $|s_\Delta| \geq r$) rather than a temporal threshold (refresh every $T$ seconds); the structural threshold is content-stable across federation while the temporal one is not.
- **Incremental refresh is the canonical extension of $s_\Delta$.** Per the $\delta^0 = 0$ vanishing, $s_\Delta$ extends canonically to a coherent state on $U_{v^*} \cup U_v$. The incremental refresh is the substrate's morphism that realizes this extension; per [query-planning-via-beck-chevalley](query-planning-via-beck-chevalley.md), the rewrite is a Beck–Chevalley square. The work is proportional to $|g(\Delta)^+|$, not to substrate or view size, per the wavefront bound.
- **OLAP queries can declare per-query staleness tolerance.** Per [oltp-vs-olap-as-regime-distinction](oltp-vs-olap-as-regime-distinction.md), OLAP queries operate in the Scott-continuous regime and read at $v_{\text{snapshot}}$ rather than $\mathrm{cl}(v)$. Per [transaction-isolation-as-knowledge-order-position](transaction-isolation-as-knowledge-order-position.md), the snapshot is a $\leq_k$-position; the section-gap $s_\Delta$ between snapshot and current cache is the OLAP query's *acceptable* staleness budget. The query and the view's refresh policy can be co-designed against the same gap measure.
- **Federated views agree on staleness.** Per [read-replica-eventual-consistency](read-replica-eventual-consistency.md), federated peers compute the same $s_\Delta$ for the same view because the Čech section is content-addressed. Two replicas caught up to the same event-log position will report identical staleness without coordination.

## What the theorem rules out

- **Time-based staleness as the structural measure.** A staleness measure proportional to wall-clock time since refresh is a proxy that breaks when admission rate is non-uniform. Structural staleness is the section-gap on a content-addressed cover; time enters only through the witness timestamps recorded on $\Delta$, and only as secondary annotation.
- **Staleness measured on the view's output cardinality.** "The view returned $N$ rows last time and $M$ rows this time, so it's $|N - M|$ stale" conflates staleness with output size and gives wrong answers when admissions change values in place rather than adding rows. The structural staleness is on the per-cell section gap, not the cardinality difference.
- **Refresh policies decoupled from the section gap.** A refresh policy that ignores $s_\Delta$ — refreshing on a fixed schedule regardless of base activity, or on every base admission regardless of whether the projection is affected — wastes work in the second case and accepts unbounded staleness in the first. The structural refresh policy is *refresh when $|s_\Delta|$ exceeds threshold*.

## What the theorem requires (to upgrade from sketch to proved)

- The pushforward $g_* \mathcal{F}_U$ is a sheaf in the substrate's Grothendieck-site discipline. (Ingredient 1.)
- The wavefront bound for $\mathcal{F}_U$ inherits to $g_* \mathcal{F}_U$. (Ingredient 2.)
- The substrate is in the strict or Scott-continuous regime per [oltp-vs-olap-as-regime-distinction](oltp-vs-olap-as-regime-distinction.md), so wavefront-locality applies on each Scott-continuous prefix.
- Per [witness](../../../objects/witness.md), each admission records its cell-set, so $\Delta$ is computable as a substrate query against the event log between the refresh-time and current witnesses.

## Position

This sketch refines the database-platform's materialized-view discipline along the right structural axis: where [materialized-view-as-functorial-projection-cache](materialized-view-as-functorial-projection-cache.md) establishes the *coherence* of the cache *at* quiescence, this sketch quantifies the *staleness* of the cache *between* quiescence-points as an $H^0$ section-gap whose canonical refresh-resolvability is licensed by the parent's $H^1 = 0$ vanishing. Together with [oltp-vs-olap-as-regime-distinction](oltp-vs-olap-as-regime-distinction.md) and [transaction-isolation-as-knowledge-order-position](transaction-isolation-as-knowledge-order-position.md), the three contributions place the database-platform's freshness, isolation, and workload axes on the same predication-categories foundation. Upgrading this sketch to status `proved` is the next concrete step.
