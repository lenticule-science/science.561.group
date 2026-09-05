---
type: concept
class: memory-discipline
depends-on: [predication-graph-store, cost-discipline, resource-budget]
see-also: [persistent-set, eviction-policy]
---

# Working set

The *substrate's resident-in-host-memory subset of the predication graph*. The working set is what the substrate's runtime can read and modify without going to slower storage; the rest of the predication graph lives in the [persistent-set](persistent-set.md) on disk (or remote object store), to be paged in on demand.

The substrate's predication-graph store may be much larger than host RAM permits. The working-set discipline is how the substrate makes the larger-than-memory store tractable:

- **Hot predications.** Recently-accessed cells, cells incident to active wavefronts, cells in active sublocales — kept resident.
- **Cold predications.** Cells unreferenced for some threshold — evicted to persistent-set.
- **Pinned predications.** Cells the substrate's policy declares always-resident (the active closure-rule system, the active scope records, current sessions).

Per [resource-budget](resource-budget.md), the working set is bounded by the substrate's memory budget. When the budget is exceeded, [eviction-policy](eviction-policy.md) determines what gets paged out.

The working set is *not* substrate-content directly — it's runtime state that reflects which substrate-content is currently resident. Per [self-representation](self-representation.md), the working-set's *policy* is substrate content (memory-budget, eviction-policy, pinning declarations); the *current state* is observable via [observability-as-reads](../theorems/observability-as-reads.md) reads but is regenerated on substrate restart.

Per [settlement-determinism](../theorems/settlement-determinism.md), the working-set discipline does not affect substrate behavior — only performance. A query whose result depends on cold predications pays the page-in cost; the query result is the same as if all content were resident.
