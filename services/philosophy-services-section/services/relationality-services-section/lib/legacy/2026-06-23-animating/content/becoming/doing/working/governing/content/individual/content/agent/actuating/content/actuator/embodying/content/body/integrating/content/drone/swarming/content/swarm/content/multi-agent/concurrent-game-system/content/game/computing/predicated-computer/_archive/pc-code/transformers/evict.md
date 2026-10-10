---
type: morphism
class: memory-operation
realizes: [working-set, persistent-set, eviction-policy]
depends-on: [working-set, persistent-set, eviction-policy, storage-backend, witness]
see-also: [page-in]
---

# Evict

The substrate operation that *removes predications from the [working set](teaching/explanations/working-set.md)*, optionally writing them to the [persistent set](teaching/explanations/persistent-set.md) if not already there. Evict is how the substrate frees working-set memory under [resource-budget](teaching/explanations/resource-budget.md) pressure.

## Signature

`evict(target-cells, eviction-reason) → evict-witness`

Inputs:

- **`target-cells`** — references to working-set cells to evict.
- **`eviction-reason`** — `lru-eviction`, `lfu-eviction`, `ttl-eviction`, `manual-eviction`.

Outputs:

- **`evict-witness`** — records the eviction (informational).

## Operational semantics

1. For each cell, check whether the cell exists in the persistent-set (by hash).
2. If not, write to persistent-set per [storage-backend](teaching/explanations/storage-backend.md)'s discipline (with [fsync](teaching/explanations/fsync-discipline.md) before acknowledging).
3. Remove from working-set.
4. Per [witness](../objects/witness.md), emit evict-witness.

Per [settlement-determinism](../theorems/settlement-determinism.md), eviction does not affect substrate behavior — evicted cells remain accessible via [page-in](page-in.md). Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), eviction itself is structurally a memory-management operation; the cited witnesses are informational.

## Engineering invariants

- **Persistence-before-removal.** A cell is removed from working-set only after it's confirmed in persistent-set.
- **Pinned-cells-protected.** Per [eviction-policy](teaching/explanations/eviction-policy.md), pinned cells are never evicted.
- **Substrate-behavior-preserving.** Per [settlement-determinism](../theorems/settlement-determinism.md), eviction doesn't change what the substrate computes.

## Position in the substrate

Evict is the substrate's *hot-to-cold transition primitive*. Composes with [page-in](page-in.md) (the inverse) to manage working-set membership under memory budget.
