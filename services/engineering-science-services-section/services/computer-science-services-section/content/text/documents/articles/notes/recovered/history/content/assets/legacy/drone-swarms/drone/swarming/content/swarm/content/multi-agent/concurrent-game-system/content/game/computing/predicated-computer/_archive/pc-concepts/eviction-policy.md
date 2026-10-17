---
type: concept
class: memory-discipline
depends-on: [working-set, persistent-set, resource-budget, witness]
see-also: [cache]
---

# Eviction policy

The *substrate-recorded discipline for moving predications between [working set](working-set.md) and [persistent set](persistent-set.md)*: which cells get evicted (paged out) when the working set's [resource budget](resource-budget.md) is exceeded.

Common eviction policies:

- **LRU (least-recently-used).** Evict the cells whose last-access ordinal is oldest.
- **LFU (least-frequently-used).** Evict cells with lowest access counts.
- **TTL (time-to-live).** Evict cells past a substrate-ordinal age threshold.
- **Pinned-aware.** Never evict pinned cells (active rule system, current sessions); evict from the un-pinned set first.
- **Wavefront-aware.** Evict cells outside the current wavefront; cells in active settling are protected.
- **Sublocale-aware.** Evict cells outside active sublocales; per [application-sublocale](../objects/application-sublocale.md), the substrate may scope evictions to non-potential sublocales.

Per [self-representation](self-representation.md), the eviction policy is substrate content — declared per substrate-instance, queryable, adjustable. Per [witness](../objects/witness.md), evictions produce witnesses (informational by default; auditors can review eviction patterns).

Per [settlement-determinism](../theorems/settlement-determinism.md), eviction does not affect substrate behavior — only performance. A query for an evicted cell pays the page-in cost; the result is the same as if the cell were resident.

Per [federation-convergence](../theorems/federation-convergence.md), eviction is local to the substrate-instance — federated peers may have different working-set states with the same persistent-set contents (or even different storage backends entirely).
