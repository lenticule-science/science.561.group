---
type: definition
class: substrate-entity
realizes: [cache]
depends-on: [cache, hash-discipline]
see-also: [predication-graph-store]
---

# Cache record

A **cache record** is the substrate-entity formal definition of a [cache](teaching/explanations/cache.md): the predication-graph entity declaring a cache's purpose, key-extraction, value-source, and invalidation policy.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`cache-purpose`** — `memoization`, `query-result`, `computed-view`, `federation-fetch`.
- **`key-extractor`** — how cache keys are derived from substrate content (typically a canonical-form hash function).
- **`value-source`** — the substrate operation that produces the cached value when the key isn't in the cache.
- **`entries`** — references to the cached (key, value) pairs, with last-access ordinal for LRU eviction.
- **`max-size`** — bounded cache size; entries are evicted per the eviction policy.
- **`eviction-policy`** — `lru`, `lfu`, `ttl`.
- **`ttl-ordinals`** — for time-bounded caches, the TTL in substrate ordinals.
- **`invalidation-policy`** — `content-addressed-permanent`, `state-event-driven`, `time-bounded`, `manual`.
- **`closure-kind`** — `cache`.

## Invariants

- **Cache-correct.** Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), cache hits return the same value as recomputing — the cache is a performance optimization, not a behavioral change.
- **Substrate-recorded.** Per [self-representation](teaching/explanations/self-representation.md), the cache itself is queryable.
- **Reads-free.** Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), cache reads are free.

## Position in the substrate

Cache records are the substrate's *performance-optimization registry*. Cache absence does not change substrate correctness; cache presence improves performance for hot paths.
