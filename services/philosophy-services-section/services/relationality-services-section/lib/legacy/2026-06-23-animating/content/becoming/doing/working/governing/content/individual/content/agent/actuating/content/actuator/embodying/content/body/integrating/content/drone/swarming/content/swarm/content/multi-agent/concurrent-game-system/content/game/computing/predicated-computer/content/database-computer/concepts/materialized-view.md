---
type: concept
class: data-access-discipline
depends-on: [query-language, cache, witness, witness]
see-also: [oltp-vs-olap]
---

# Materialized view

A *substrate-recorded query whose result is pre-computed and stored*, refreshed on substrate events that affect its source data. Materialized views are how the substrate trades storage and refresh-cost for fast read access to expensive queries.

Compared to [cache](../../teaching/explanations/cache.md):

- **Cache** is *opportunistic*: store query results on first compute; invalidate on data change.
- **Materialized view** is *declared*: maintain the result continuously; the substrate's discipline ensures it's up-to-date.

A materialized view has the structure:

- **View-id** — substrate identifier.
- **Source query** — the query whose result is materialized.
- **Refresh policy** — when to refresh: `on-write` (immediately on source data change), `periodic-N` (every N seconds), `on-demand` (only when read).
- **Storage** — the materialized result, accessible like any other substrate query target.

Common refresh patterns:

- **Incremental refresh.** When source data changes, recompute only the affected portion of the view (vs full recompute).
- **Eventual consistency.** The view may lag behind source data by some bounded duration.
- **Strong consistency.** The view is always up-to-date with source data (more expensive — every source change triggers refresh).

Per [self-representation](../../teaching/explanations/self-representation.md), materialized views are substrate content. Per [witness](../../../objects/witness.md), refresh events are recorded.

Per [federation-convergence](../../../theorems/federation-convergence.md), materialized views can be federated: each substrate-instance maintains its own view; per [streaming-replay-equivalence](../../../theorems/streaming-replay-equivalence.md), the views converge on the same content given the same source events.

Materialized views are a primary optimization for [oltp-vs-olap](oltp-vs-olap.md) workloads: complex analytical queries can be materialized in advance, then served as cheap reads from OLAP queries.

Per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md), the cache is structurally coherent at substrate quiescence. Per [materialized-view-staleness-as-bigraded-h1-bound](../theorems/materialized-view-staleness-as-bigraded-h1-bound.md), the staleness *between* refreshes is precisely the $H^0$ section-gap on the overlap of the (refresh-time, current) replica cover of the projection's pushforward of the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) — i.e., the per-cell list of cells whose projected value has shifted since refresh. The corresponding $\delta^0 / H^1$ vanishing supplied by the substrate's wavefront-locality is what makes that section-gap *canonically refresh-resolvable* (no merge obstruction). The support of the gap is bounded by the projection of cells admitted since refresh — not by substrate or view size. A "freshness SLA" is a structural bound on the size of this gap; an incremental refresh applies the closure cascade to its support only.
