---
type: concept
class: performance-discipline
depends-on: [hash-discipline, cost-discipline-reads-free, predication-fibration, settlement-via-closure-2-monad, hash-injectivity-under-canonical-form]
see-also: [predication-graph-store, cache-coherence-via-functorial-projection, index]
---

# Cache

A *substrate-recorded auxiliary store of frequently-accessed values keyed by some key derivable from substrate content*. In the substrate's hyperdoctrine setting, a cache is not arbitrary memoization — it is *the substrate-side projection of a [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) functor along a particular substitution morphism*: the cache's stored values are functor outputs, the cache key is the canonical hash of the functor input, and the cache's coherence with the substrate is exactly the functor's deterministic mapping. Per [cache-coherence-via-functorial-projection](../theorems/cache-coherence-via-functorial-projection.md), this structural identification is what makes content-addressed caches *unconditionally coherent*: same input hash → same functor output → same cached value, with no invalidation possible.

Caches are how the substrate trades memory for time: pre-compute results that would otherwise be expensive to recompute, store them in a fast-access store, return them on cache-hit.

## Hyperdoctrinal structure

Per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), a substrate operator $O$ realizing a substitution functor $f^* : A_{\sigma'} \to A_\sigma$ is *deterministic* (per [determinism-via-fiber-functoriality](../theorems/determinism-via-fiber-functoriality.md)): same input value, same output value. A cache for $O$ is then a *partial function* $C : K \rightharpoonup A_\sigma$ where $K$ is a key-space and $C(\kappa(v)) = f^*(v)$ when defined.

The cache's coherence is structurally:

- **Cache hit.** $C(\kappa(v))$ is defined and equals $f^*(v)$ — the substrate's runtime returns the cached value rather than recomputing.
- **Cache miss.** $C(\kappa(v))$ is undefined — the substrate's runtime computes $f^*(v)$ and (typically) populates $C(\kappa(v))$ for future hits.
- **Coherence guarantee.** If $\kappa$ is the canonical hash and $f^*$ is functorial (per the fibration), then $C(\kappa(v))$ is *always* equal to $f^*(v)$ when defined — the cache cannot be incoherent.

Caches are an *optimization*, not a correctness concern. Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), cache hits are reads (free); cache misses are also reads (just slower). Per [self-representation](teaching/explanations/self-representation.md), the cache itself is substrate content (per [cache-record](../objects/cache-record.md)), but its absence doesn't change substrate behavior — only performance.

## Cache patterns

Each pattern is a particular choice of $\kappa$ (key extraction) and which functor $f^*$ is being cached:

- **Memoization cache.** Per [function-purity-replay-fidelity](theories/functional-runtime-platform/theorems/function-purity-replay-fidelity.md), pure functions are fibration functors. Cache key is `(function-record-hash, input-hash)`; value is the function's output. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the key uniquely determines the input.
- **Query result cache.** Cache key is the canonical-form hash of the query expression + scope; value is the result-set. The cached functor is the query-evaluation functor $\mathrm{eval} : \text{Query} \times \text{Scope} \to \text{ResultSet}$.
- **Computed-view cache.** Cache key is the [project](../morphisms/project.md) operation's view-spec hash; value is the rendered output. The cached functor is the projection morphism in the predication fibration.
- **Federation-cache.** Cache for content fetched from federation peers, reducing round-trips. Cache key is the canonical hash of the requested content; value is the fetched bytes.

Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), caches that key by canonical-form hash are content-addressed: same content always hashes to the same key, ensuring cache hits are correct.

## Cache invalidation

The substrate's cache-invalidation discipline reflects the underlying fibration's structure:

- **Content-addressed caches don't invalidate.** Per [cache-coherence-via-functorial-projection](../theorems/cache-coherence-via-functorial-projection.md), if the cache key uniquely determines the functor input (via the canonical hash), the cached output is *forever correct* — same key means same input means same functor output. Cache entries are valid forever.
- **State-dependent caches invalidate on substrate changes.** A cache of "current count of users" is keyed by something other than the canonical hash of the relevant substrate sub-state — typically a query against time-changing content. Such a cache invalidates when relevant predications change; per [witness](../objects/witness.md), the substrate identifies the relevant invalidation events.
- **Time-bounded caches expire.** Cache entries have TTL; expired entries are recomputed on next access. This is policy on the cache, not a correctness requirement — content-addressed cache entries don't need TTL for correctness.

## Federation cache coherence

Per [federation-convergence](../theorems/federation-convergence.md), federated caches share entries by content-hash; the same content appears once in the federation's cache regardless of which substrate produced it. Per [cache-coherence-via-functorial-projection](../theorems/cache-coherence-via-functorial-projection.md), this is structurally consistent: the functor $f^*$ is the same on every conformant substrate, so the cached values for a given key are equal across the federation.

## Position in the substrate

Caches sit in the substrate's read-discipline space: per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), they make reads cheaper without changing substrate state. Per [cache-coherence-via-functorial-projection](../theorems/cache-coherence-via-functorial-projection.md), their coherence is structural, not protocol-mediated — content-addressed caches are correct by virtue of the fibration's functoriality, not by an enforcement layer the substrate must police.
