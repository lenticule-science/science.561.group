---
type: theorem
class: engineering-claim
status: proved
depends-on: [cache, predication-fibration, hash-injectivity-under-canonical-form, determinism-via-fiber-functoriality, settlement-via-closure-2-monad, settlement-determinism]
see-also: [index-as-alexandrov-up-set, scope-cover-via-grothendieck-site, federation-convergence]
---

# Content-addressed cache coherence is structural via fibration functoriality

**Claim.** For any [cache](teaching/explanations/cache.md) $C$ on a substrate operator $O$ realizing a [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) substitution functor $f^* : A_{\sigma'} \to A_\sigma$, when the cache key $\kappa$ is the canonical-form hash of the input (per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md)), the cache's coherence with the substrate is *structural* — it cannot become stale, cannot disagree with re-computation, and cannot diverge across federation peers. Per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), $f^*$ is a function: for each input $v$, $f^*(v)$ is uniquely determined. The cache's stored value $C(\kappa(v)) = f^*(v)$ is therefore *forever correct* — same input hash means same input means same functor output.

## Why this holds

Per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), substitution along $f$ is a functor $f^* : A_{\sigma'} \to A_\sigma$. Per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), the substrate's runtime implementing $f^*$ produces the unique functor output for each input.

A content-addressed cache $C : K \rightharpoonup A_\sigma$ keyed by canonical hashes satisfies, by construction:

- **Key uniquely determines input.** Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the canonical hash $\kappa(v)$ uniquely determines $v$ (modulo collision-resistance). Two inputs with the same hash are byte-identical canonical-form values, hence identical fiber-algebra values.
- **Input uniquely determines output.** Per the fibration's functoriality, $f^*(v)$ is uniquely determined by $v$.
- **Composition is uniquely determined.** Cache key → input → output is a composition of functions; the result is a function.

Therefore $C(\kappa(v))$, when defined, equals $f^*(v)$ — necessarily, not by enforcement. There is no scenario in which the cache's stored value diverges from the functor output on the same input.

Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), settlement is the closure 2-monad's iteration; per its lax-idempotence, re-running the operator on a settled value returns the same value. The cache's entries are therefore stable across re-settlement.

## Engineering consequence

- **No invalidation needed.** A content-addressed cache entry doesn't go stale — same key always means same correct value. This is the substrate's content-addressed-storage discipline at the cache level.
- **Cross-host coherence.** Two substrates running the same operator implementations on the same input produce the same output (per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md)). Their caches, keyed by canonical hash, agree on every entry; merging caches across hosts is structurally consistent.
- **Federation cache merge is set-union.** Per [federation-convergence](federation-convergence.md), federated caches share entries by content-hash. The merge is set-union (with $\vee_k$ on values, but for content-addressed caches, all values for a given key are equal). No reconciliation is needed.
- **Cache miss is recomputation; cache hit is lookup.** The substrate's runtime distinguishes hit from miss but never validates the cached value — validation is automatic via the structural argument.
- **Persistent caches survive substrate restart.** A cache persisted across restart remains coherent without re-validation (the substrate hasn't changed its functors; the cache entries are still correct).

## State-dependent caches require explicit invalidation

The theorem applies to *content-addressed* caches — those keyed by canonical hash of the input. A cache keyed by something else (e.g., "current count of users" — keyed by a query against time-changing content rather than by the count's input bytes) is *not* covered by this structural argument:

- The cache's "key" doesn't uniquely determine the input — the underlying substrate state may change.
- Re-running the query produces different output as the substrate evolves.
- The cache *can* become stale; per [witness](teaching/explanations/witness.md), the substrate identifies invalidation events and the cache's policy invalidates accordingly.

Per the theorem, this distinction is structural: content-addressed caches are unconditionally coherent; state-dependent caches require explicit invalidation policy.

## What the theorem rules out

- **Stale content-addressed cache hits.** A cache that returns a value differing from the functor's output on the same hash-key is either (a) not implementing the fibration's functor (the operator is non-deterministic — non-conformant), or (b) not using canonical hashes (the key doesn't uniquely determine the input — non-disciplined). Per the theorem, neither is admissible in a conformant substrate.
- **Cache poisoning across hosts.** A federation peer that injects a malicious cache entry under an existing key would have to forge a hash collision (per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), computationally infeasible) or run a non-functorial operator (per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), non-conformant). The substrate's structural coherence prevents both.
- **Cache invalidation overhead on content-addressed caches.** A substrate that invalidates content-addressed cache entries on every substrate change is doing unnecessary work — the entries are correct by structure, not by freshness. Per the theorem, the invalidation policy is empty for content-addressed caches.

## What the theorem requires

- The substrate's value-domain admits the [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md).
- The cached operator implements its specified fibration functor (per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md)).
- The cache key is the canonical-form hash of the operator input (per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md)).
- The substrate maintains its canonical-form discipline (per [canonical-form-via-settling-quiescence](canonical-form-via-settling-quiescence.md)).

## Position

Together with [index-as-alexandrov-up-set](index-as-alexandrov-up-set.md) and [scope-cover-via-grothendieck-site](scope-cover-via-grothendieck-site.md), this theorem grounds the substrate's data-access discipline in the predication-fibration's structure. Indexes are Alexandrov-up-sets on the fiber-algebra; caches are functor-projection memoizations; scopes are Grothendieck-site elements. The substrate's read-discipline is structurally consistent across these three layers — same canonical-form discipline, same hash-injectivity, same fiber-functoriality.
