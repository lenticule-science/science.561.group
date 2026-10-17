---
type: definition
class: substrate-entity
realizes: [materialized-view]
depends-on:
  - materialized-view
  - query-language
  - witness
  - predication-fibration
  - settling-associated-sheaf
  - settling-quiescence
  - hash-injectivity-under-canonical-form
  - bilattice
see-also:
  - query-plan-record
  - materialized-view-as-functorial-projection-cache
  - materialized-view-staleness-as-bigraded-h1-bound
  - refresh-materialized-view
  - query-planning-via-beck-chevalley
---

# Materialized view record

A **materialized view record** is the substrate-entity formal definition of a [materialized view](teaching/explanations/materialized-view.md): a pre-computed query result stored for fast access.

Per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md), the materialized view is not a bespoke caching primitive: it is a content-addressed cache on a projection functor $g^* : A_q \to A_p$ in the substrate's [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), keyed by the canonical hash of the *quiescent* base state restricted to the projection's source. This record is the substrate-content surface of that cache.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`source-query`** — the query whose result is materialized; structurally, the substrate-content witness of the projection functor $g^*$ that defines the view per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md).
- **`current-result`** — the materialized result content (substrate-content reference); structurally, the cache value $C(\kappa(v^*)) = g^*(v^*)$ at the most-recent refresh's quiescent base state $v^*$.
- **`current-key`** — the canonical hash $\kappa(v^*)$ of the base state at the most-recent refresh; the cache key. Per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), this hash uniquely determines $v^*$, so a key match guarantees a value match.
- **`refresh-policy`** — `on-write`, `periodic-N`, `on-demand`, or `section-gap-threshold-r`. The last is the *structurally canonical* policy per the math grounding below: refresh when the section-gap $|s_\Delta|$ exceeds threshold $r$ (per [materialized-view-staleness-as-bigraded-h1-bound](../theorems/materialized-view-staleness-as-bigraded-h1-bound.md), status: `sketch`).
- **`refresh-strategy`** — `full-recompute`, `incremental`. Per the math grounding, incremental refresh is the substrate's morphism realizing the canonical extension of $s_\Delta$ across the cover overlap (a Beck–Chevalley mate per [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md)).
- **`last-refreshed-at`** — substrate ordinal of last refresh; the witness ordinal at which $v^*$ was sampled.
- **`source-dependencies`** — references to substrate predications the view's source query reads (used for incremental refresh and cache invalidation); structurally, the base scope $S \subseteq A_q$ on which $g^*$ is defined.
- **`current-staleness`** — *derived* (not separately stored authoritative state) the section-gap $s_\Delta = g^*(v) \ominus_k g^*(v^*)$ on the affected region, computed cellwise via the [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md)'s $\leq_k$-difference. Per the math grounding, this is the *content-addressed* staleness measure; time-since-refresh is a proxy that breaks under non-uniform admission.
- **`closure-kind`** — `materialized-view`.

## Invariants

- **Substrate-recorded.** Per [self-representation](../../teaching/explanations/self-representation.md), the view's source-query, key, current-result, and refresh-policy are queryable.
- **Result-current-relative-to-key.** The cache invariant $C(\kappa(v^*)) = g^*(v^*)$ holds by construction per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md); no policy is required to maintain it.
- **Quiescent base.** The recorded `current-result` is $g^*(v^*)$ for some quiescent $v^*$, never for a mid-settling base value. Reads tolerating mid-settling base must be marked at the API surface as stale-tolerant; the substrate's audit machinery distinguishes them per the cited theorem's "Stale-tolerance is an explicit policy" clause.

## Math grounding

The materialized view record is the substrate-content surface of two composed predication-category facts: the *coherence* of the cache at quiescence (per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md), proved) and the *quantification* of staleness between quiescence points as an $H^0$ section-gap (per [materialized-view-staleness-as-bigraded-h1-bound](../theorems/materialized-view-staleness-as-bigraded-h1-bound.md), status: `sketch`). Each structural field maps to a fixed math role:

- **`source-query` ↔ projection functor $g^* : A_q \to A_p$.** The query's substrate-content witness is exactly the projection functor that defines the view; the view is determined by $g^*$ up to the substrate's canonical-form discipline.

- **`current-key` ↔ canonical hash $\kappa(v^*)$ of the quiescent base.** Per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), the hash uniquely determines $v^*$; per the cache-coherence theorem, a key match guarantees the recorded result equals re-computation. The substrate's invalidation discipline is therefore not result-invalidation but *re-keying-on-base-change*: if $\kappa(\mathrm{cl}(v_{\mathrm{current}})) \neq$ `current-key`, the cache lookup misses and refresh fires.

- **`current-result` ↔ cache value $C(\kappa(v^*)) = g^*(v^*)$.** The recorded result is the projection functor applied to the recorded quiescent base; per [settlement-determinism](../../../theorems/settlement-determinism.md), two refreshes of the same view on the same base produce byte-identical results, so federated views agree without coordination per [federation-convergence](../../../theorems/federation-convergence.md).

- **`current-staleness` ↔ $H^0$ section-gap $s_\Delta \in H^0(U_{v^*} \cap U_v, g_* \mathcal{F}_U)$.** Per [materialized-view-staleness-as-bigraded-h1-bound](../theorems/materialized-view-staleness-as-bigraded-h1-bound.md) (status: `sketch`), the substrate's staleness is structurally an $H^0$ section-gap on the projection's pushforward of the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md), with support bounded by $g(\Delta)^+$ per wavefront-locality (i.e., bounded by the projection of admitted cells closed under cascade — independent of base or view total size). The two-element cover $\{U_{v^*}, U_v\}$ comes from the refresh-time and current base values; the section-gap is the per-cell disagreement on the overlap.

- **`refresh-policy = section-gap-threshold-r` ↔ structural threshold on $|s_\Delta|$.** The structurally canonical policy is to refresh when the staleness section-gap exceeds threshold; this is content-addressed (federated peers compute the same $s_\Delta$) where time-based policies are not. Time-based policies are admissible but operate on a proxy that breaks under non-uniform admission per the cited sketch theorem's "What the theorem rules out" clause.

- **`refresh-strategy = incremental` ↔ canonical extension of $s_\Delta$ across the cover.** Per the sketch theorem, the $\delta^0 = 0$ vanishing of [wavefront-locality-via-cohomology-vanishing](../../../theorems/wavefront-locality-via-cohomology-vanishing.md) on the (un-pushed-forward) settling-associated sheaf is what licenses calling $s_\Delta$ refresh-resolvable: the section on the overlap extends canonically to a coherent state on the union, and the incremental refresh is the substrate's morphism that realizes that extension. Per [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md), the rewrite from full-recompute to incremental is a Beck–Chevalley square. The work is proportional to $|g(\Delta)^+|$, not view size.

## Position in the platform

Materialized view records are the substrate's *pre-computed-query registry*. Per [federation-convergence](../../../theorems/federation-convergence.md), views can be federated; per [streaming-replay-equivalence](../../../theorems/streaming-replay-equivalence.md), federated views converge. Per the math grounding, a materialized view is not a bespoke caching primitive but the substrate-content surface of the projection functor + content-addressed cache discipline that the predication fibration already supplies. A platform that ships a separate materialized-view subsystem on top of its query engine is duplicating substrate machinery the math identifies as one construction.
