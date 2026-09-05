---
type: theorem
class: engineering-claim
status: proved
depends-on: [materialized-view, materialized-view-record, refresh-materialized-view, cache-coherence-via-functorial-projection, predication-fibration, settlement-via-closure-2-monad, settling-quiescence, hash-injectivity-under-canonical-form]
see-also: [query-planning-via-beck-chevalley, secondary-index-as-alexandrov-cover, canonical-form-via-settling-quiescence]
---

# A materialized view is a content-addressed cache on a projection-functor at settling quiescence

**Claim.** A [materialized view](teaching/explanations/materialized-view.md) $V$ over a substrate predication scope is a content-addressed [cache](../../teaching/explanations/cache.md) keyed by the canonical hash of the *quiescent* substrate state restricted to $V$'s [predication-fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) base — the projection $g^* : A_q \to A_p$ that defines $V$. Per [cache-coherence-via-functorial-projection](../../cache-coherence-via-functorial-projection.md), the view's value is structurally coherent with re-computation whenever the cache key is taken at substrate [settling-quiescence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md). [Refreshing the view](../morphisms/refresh-materialized-view.md) is the substrate operation that detects loss of quiescence in $V$'s base predication and recomputes the cache entry.

## Why this holds

A materialized view is defined by:

- A *base scope* $S \subseteq A_q$ — the predications the view depends on.
- A *projection functor* $g^* : A_q \to A_p$ — the view's defining transformation.
- A *cache* $C : K \rightharpoonup A_p$ — the stored view value, keyed on canonical hash of the base state.

Per [cache-coherence-via-functorial-projection](../../cache-coherence-via-functorial-projection.md), when the key is the canonical hash of the input and the operator is a fibration's reindexing functor, the cache is structurally coherent: $C(\kappa(v)) = g^*(v)$ holds by construction. Per [settlement-via-closure-2-monad](../../settlement-via-closure-2-monad.md), substrate values evolve toward closure-fixed-points; per [settling-quiescence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md), at quiescence no further closure step changes the value.

The view's coherence chain:

1. The base state $v \in A_q$ reaches quiescence $v^* = \mathrm{cl}(v)$.
2. Per [hash-injectivity-under-canonical-form](../../hash-injectivity-under-canonical-form.md), the canonical hash $\kappa(v^*)$ uniquely determines $v^*$.
3. Per the fibration's functoriality, $g^*(v^*)$ is uniquely determined.
4. The cache entry $C(\kappa(v^*)) = g^*(v^*)$ is the materialized-view value.

The view's value is therefore *forever correct* relative to the quiescent base state $v^*$. When the base state becomes non-quiescent again — i.e., a new closure step would change $v^*$ — the cache key $\kappa(v^*)$ is stale (no longer the hash of the current substrate state); the substrate's refresh operation observes the stale key and recomputes.

## Engineering consequence

- **Materialized views need no invalidation policy on the projection.** Per [cache-coherence-via-functorial-projection](../../cache-coherence-via-functorial-projection.md), the projection cache is content-addressed and unconditionally coherent. The "invalidation" that materialized views require is not invalidation-of-result but *re-keying-on-base-change*: the base predication moved, so the cache lookup misses and refresh fires.
- **Refresh is recomputation under the closure fixed-point.** [refresh-materialized-view](../morphisms/refresh-materialized-view.md) is not a side-effecting bulk-update; it is the substrate's canonical projection $g^*$ applied to the new quiescent base state. Refresh inherits the substrate's [settlement-determinism](../../settlement-determinism.md): two refreshes of the same view on the same base state produce byte-identical results.
- **Incremental refresh corresponds to mate squares.** Per [query-planning-via-beck-chevalley](query-planning-via-beck-chevalley.md), the rewrites that turn full refresh into incremental refresh are Beck–Chevalley squares: when the new base state is a $\leq_k$-strengthening of the old, the projection's mate gives the delta-update.
- **Federated views agree.** Per [federation-convergence](../../federation-convergence.md) and the cache's content-addressing, two substrates that share base predications converge to byte-identical view values without coordination.
- **Stale-tolerance is an explicit policy.** A view that admits "stale" reads (returning a value computed from a non-quiescent base) is a separate engineering choice — *not* covered by the structural coherence theorem. Such reads must be marked at the API surface; the substrate's audit machinery distinguishes quiescent-key reads from stale-tolerant reads.

## What the theorem rules out

- **Push-based view invalidation as the primary mechanism.** A view system that depends on event-triggered invalidation (rather than content-addressed recomputation) cannot make the structural-coherence claim. Per the theorem, the cache's correctness comes from the projection's functoriality, not from invalidation diligence.
- **Views computed from non-quiescent bases.** A materialized view computed mid-settling (when $v \neq \mathrm{cl}(v)$) is not the result of $g^*$ on a stable input; per [canonical-form-via-settling-quiescence](../../canonical-form-via-settling-quiescence.md), the canonical form is undefined. Such views have no structural coherence guarantee.
- **Views whose projection is not a fibration functor.** A "view" defined by a non-functorial transformation (e.g., one that depends on an external clock or an out-of-band parameter) is not in the predication-fibration's coherence frame and cannot be content-addressed.

## Position

Together with [query-planning-via-beck-chevalley](query-planning-via-beck-chevalley.md) (planner soundness) and [secondary-index-as-alexandrov-cover](secondary-index-as-alexandrov-cover.md) (index-coverage analysis), this theorem completes the database-platform's data-access trilogy. Indexes give Alexandrov-open access paths into the fiber algebra; materialized views give content-addressed projections out of it; query planning composes both into theorem-backed plans.
