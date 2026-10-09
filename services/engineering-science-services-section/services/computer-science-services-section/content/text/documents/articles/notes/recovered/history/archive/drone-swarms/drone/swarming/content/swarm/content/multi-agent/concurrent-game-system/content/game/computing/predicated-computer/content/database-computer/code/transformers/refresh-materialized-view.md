---
type: morphism
class: data-access-operation
realizes: [materialized-view]
depends-on:
  - materialized-view-record
  - query-language
  - witness
  - predication-fibration
  - settling-associated-sheaf
  - settling-quiescence
  - hash-injectivity-under-canonical-form
  - replica-mayer-vietoris
  - bilattice
see-also:
  - plan-query
  - materialized-view-as-functorial-projection-cache
  - materialized-view-staleness-as-bigraded-h1-bound
  - query-planning-via-beck-chevalley
---

# Refresh materialized view

The substrate operation that *recomputes a [materialized view](teaching/explanations/materialized-view.md)'s current-result*, either fully or incrementally per the view's refresh-strategy.

Per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md) (proved), this operation is not a side-effecting bulk-update: it is the substrate's canonical projection $g^* : A_q \to A_p$ applied to the current quiescent base state $v^*_{\mathrm{new}}$, with the cache re-keyed by the canonical hash $\kappa(v^*_{\mathrm{new}})$. The operation inherits [settlement-determinism](../../../theorems/settlement-determinism.md): two refreshes of the same view on the same base state produce byte-identical results, and federated peers compute the same refreshed value without coordination. The structural identification of incremental refresh as a Beck–Chevalley mate of full-recompute is conditional on the pending ingredients of [materialized-view-staleness-as-bigraded-h1-bound](../theorems/materialized-view-staleness-as-bigraded-h1-bound.md) (status: `sketch`); under those ingredients, the rewrite is licensed by [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md).

## Signature

`refresh-materialized-view(view-record-id, refresh-mode) → (refreshed-view, refresh-witness)`

Inputs:

- **`view-record-id`** — reference to the [materialized-view-record](../objects/materialized-view-record.md); structurally, the substrate-content witness of the projection functor $g^*$ to be re-evaluated.
- **`refresh-mode`** — `full-recompute`, `incremental`. Per the math grounding, full-recompute is $g^*$ applied to the current quiescent base; incremental is the canonical extension of the section-gap $s_\Delta$ across the cover overlap (a Beck–Chevalley mate per [materialized-view-staleness-as-bigraded-h1-bound](../theorems/materialized-view-staleness-as-bigraded-h1-bound.md), status: `sketch`).

Outputs:

- **`refreshed-view`** — the view with updated current-result $g^*(v^*_{\mathrm{new}})$ and current-key $\kappa(v^*_{\mathrm{new}})$.
- **`refresh-witness`** — records the refresh, including which source-dependencies changed since last refresh (the $\Delta := v^*_{\mathrm{new}} \setminus v^*_{\mathrm{old}}$ used for incremental).

## Operational semantics

For **full-recompute**:

1. Sample the current base state and run it to quiescence per [settling-quiescence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) to obtain $v^*_{\mathrm{new}}$. Refresh on a non-quiescent base is forbidden — per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md), the canonical form is undefined off quiescence and the cache-coherence claim does not apply.
2. Apply the projection functor: `current-result ← g^*(v^*_{\mathrm{new}})`.
3. Re-key the cache: `current-key ← κ(v^*_{\mathrm{new}})` per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md).
4. Update last-refreshed-at to the witness ordinal of the refresh.

For **incremental**:

1. Identify $\Delta := v^*_{\mathrm{new}} \setminus v^*_{\mathrm{old}}$ — source-dependencies admitted since the last refresh — by querying the witness chain between `last-refreshed-at` and the current ordinal.
2. Compute the section-gap $s_\Delta = g^*(v^*_{\mathrm{new}}) \ominus_k g^*(v^*_{\mathrm{old}})$ on the affected region $g(\Delta)^+$ (the projection of admitted cells, closed under the cascade) via the [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md)'s $\leq_k$-difference. Per the wavefront-locality argument in [materialized-view-staleness-as-bigraded-h1-bound](../theorems/materialized-view-staleness-as-bigraded-h1-bound.md) (status: `sketch`), $|s_\Delta|$ is bounded by $|g(\Delta)^+|$, independent of view or base size.
3. Extend $s_\Delta$ canonically across the cover overlap. Per the same sketch, the $\delta^0 = 0$ vanishing of [wavefront-locality-via-cohomology-vanishing](../../../theorems/wavefront-locality-via-cohomology-vanishing.md) (status: `sketch`-invoked here, since the inheritance of the bound to the projection's pushforward is sketch ingredient 2) on the (un-pushed-forward) settling-associated sheaf is what licenses calling $s_\Delta$ refresh-resolvable; under the sketch's pending ingredients, the section on the overlap extends canonically to a coherent state on the union, and incremental refresh is the substrate's morphism realizing that extension.
4. Apply the extension to update `current-result`; re-key as in full-recompute step 3; update last-refreshed-at.

Per [witness](../../../objects/witness.md), refresh is recorded with the chosen mode and (for incremental) the $\Delta$ witnessed; per [streaming-replay-equivalence](../../../theorems/streaming-replay-equivalence.md), the refresh is replay-deterministic.

## Engineering invariants

- **Quiescence-relative coherence.** Per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md), `current-result` after refresh is exactly $g^*(v^*_{\mathrm{new}})$ for the quiescent base state $v^*_{\mathrm{new}}$. This is structural, not policy-dependent.
- **Result-deterministic.** Same source data + same refresh mode → same refreshed result, byte-identical. Inherited from settlement-determinism per the cited theorem.
- **Federation-stable.** Per [federation-convergence](../../../theorems/federation-convergence.md) and the cache's content-addressing, two substrates that share base predications produce byte-identical refreshed views without coordination.
- **Per-mode trade-off, not per-mode correctness.** Full-recompute is more expensive but operates on the entire base, and its correctness is the proved-status content of [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md). Incremental is faster but, under the sketch ingredients of [materialized-view-staleness-as-bigraded-h1-bound](../theorems/materialized-view-staleness-as-bigraded-h1-bound.md) (status: `sketch`), requires the wavefront-locality bound to apply (i.e., the substrate must be in the strict or Scott-continuous regime per [oltp-vs-olap-as-regime-distinction](../theorems/oltp-vs-olap-as-regime-distinction.md)). The two modes are expected to return the same value when both are applicable, contingent on the sketch's pending ingredients (1: the pushforward $g_* \mathcal{F}_U$ is a sheaf in the substrate's Grothendieck-site discipline; 2: the wavefront bound for $\mathcal{F}_U$ inherits to $g_* \mathcal{F}_U$); incremental refusal to apply outside its regime is structural, not a quality degradation.
- **Witnessed.** Per [witness](../../../objects/witness.md), the refresh's mode and (for incremental) the $\Delta$ are recorded; auditors can replay the refresh from the witness and verify byte-identity.

## Math grounding

The refresh-materialized-view operation is the substrate-content morphism that realizes the cache-coherence theorem [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md). The factorization:

- **Full-recompute ↔ canonical projection at the new quiescent base.** Per the cited theorem's coherence chain, $C(\kappa(v^*_{\mathrm{new}})) = g^*(v^*_{\mathrm{new}})$ holds by construction. Full-recompute is the substrate's morphism that materializes the right-hand side and updates the cache to the new key.

- **Incremental ↔ canonical extension of $s_\Delta$ across the cover.** Per [materialized-view-staleness-as-bigraded-h1-bound](../theorems/materialized-view-staleness-as-bigraded-h1-bound.md) (status: `sketch`), the section-gap $s_\Delta$ between $g^*(v^*_{\mathrm{old}})$ and $g^*(v^*_{\mathrm{new}})$ on the affected region $g(\Delta)^+$ is the staleness; under the sketch's pending pushforward verification, the $\delta^0 = 0$ vanishing of [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) on the (un-pushed-forward) settling-associated sheaf is what licenses the canonical extension. Incremental refresh is the substrate's morphism realizing that extension; per [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md) (proved), the rewrite from full-recompute to incremental is a Beck–Chevalley square *modulo the sketch's pending ingredients*.

- **Re-keying ↔ cache invalidation as content-addressing.** The substrate's invalidation discipline is *not* result-invalidation but re-keying-on-base-change per [materialized-view-record](../objects/materialized-view-record.md): if the new quiescent base hashes to a key different from `current-key`, the cache lookup misses and refresh fires. Refresh's job is to update the key together with the value, atomically.

- **Per-cell delta ↔ bilattice $\leq_k$-difference.** The $\ominus_k$ operator computing $s_\Delta$ is the bilattice's per-cell knowledge-order difference; cells unchanged in $g(\Delta)^+$ contribute zero to the gap (so the extension is the identity on them), and cells whose value was updated contribute the new-minus-old per-cell value.

## What the operation refuses

- **Refresh on a non-quiescent base.** Per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md), the canonical form $\kappa$ is undefined when $v \neq \mathrm{cl}(v)$; the cache-coherence claim does not apply. Refresh on a mid-settling base would produce a cache entry with no structural correctness guarantee. The substrate refuses; if the caller wants a stale-tolerant read, it is a separate read-path operation per the cited theorem's "Stale-tolerance is an explicit policy" clause.
- **Incremental outside the wavefront-locality regime.** Per [materialized-view-staleness-as-bigraded-h1-bound](../theorems/materialized-view-staleness-as-bigraded-h1-bound.md) (status: `sketch`), the wavefront bound on $|s_\Delta|$ requires the substrate to be in a regime where wavefront-locality applies. Outside that regime, incremental refresh's cost is unbounded and its correctness depends on the still-pending pushforward verification (ingredient 1 of the sketch); the operation refuses incremental and falls back to full-recompute.
- **Refresh whose witness chain cannot reconstruct $\Delta$.** If the witness chain between `last-refreshed-at` and the current ordinal is incomplete (e.g., truncated for retention), incremental cannot compute $\Delta$ structurally and refuses; full-recompute is the available fallback.

## Position in the platform

Refresh-materialized-view is the substrate's *view-update primitive*. Per the view's refresh-policy (`on-write`, `periodic-N`, `on-demand`, or `section-gap-threshold-r`), this is invoked on schedule, on source-data change events, or when the structural staleness measure exceeds threshold. Per the math grounding, refresh is not a side-effecting bulk-update: it is the canonical projection at the new quiescent base together with a re-keying step, with incremental being a Beck–Chevalley mate of full-recompute. A platform that ships separate "view rebuild" and "view delta-apply" code paths with different correctness theorems is duplicating substrate machinery the math identifies as one construction with two grade-equivalent rewrites.
