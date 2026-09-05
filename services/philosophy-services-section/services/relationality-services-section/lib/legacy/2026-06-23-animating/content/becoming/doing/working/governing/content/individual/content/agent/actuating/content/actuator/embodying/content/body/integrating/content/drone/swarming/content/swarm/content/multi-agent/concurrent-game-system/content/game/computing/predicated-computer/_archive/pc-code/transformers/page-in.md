---
type: morphism
class: memory-operation
realizes: [working-set, persistent-set]
depends-on: [working-set, persistent-set, storage-backend, content-addressed-store]
see-also: [evict]
---

# Page in

The substrate operation that *brings predications from the [persistent set](teaching/explanations/persistent-set.md) into the [working set](teaching/explanations/working-set.md)*: the substrate reads bytes from the storage backend, decodes them, and makes the predications available to the runtime.

## Signature

`page-in(content-hash, target-region) → (loaded-predications, page-witness)`

Inputs:

- **`content-hash`** — canonical-form hash of the predications to load.
- **`target-region`** — the working-set region to load into.

Outputs:

- **`loaded-predications`** — the predications now in the working set.
- **`page-witness`** — records the page-in (informational; auditors can review paging patterns).

## Operational semantics

1. Look up the content-hash in the [content-addressed-store](../objects/content-addressed-store.md).
2. Read bytes from the storage backend.
3. Verify hash matches.
4. Decode (per [decode](decode.md)) into substrate predications.
5. Place in the working set; update last-access ordinal.
6. Per [witness](../objects/witness.md), emit page-witness.

Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), page-in is structurally a substrate read — it doesn't change substrate state, only working-set membership. Page-in cost is the storage backend's read cost.

## Engineering invariants

- **Hash-verified.** Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), loaded bytes are verified against the requested hash.
- **Read-only.** Page-in doesn't modify substrate content; it just relocates working-set residency.

## Position in the substrate

Page-in is the substrate's *cold-to-hot transition primitive*. Composes with [evict](evict.md) (the inverse) to manage working-set membership.
