---
type: concept
class: memory-discipline
depends-on: [predication-graph-store, content-addressed-store, hash-discipline]
see-also: [working-set, storage-backend]
---

# Persistent set

The *substrate's on-storage portion of the predication graph*: predications not currently in the [working set](working-set.md), held in some persistent backend (filesystem, object store, database) until paged back in on access.

The persistent-set is the substrate's *durability layer*. Per [hash-discipline](hash-discipline.md), persistent-set entries are addressed by their canonical-form hash (per the [content-addressed-store](../objects/content-addressed-store.md) discipline). Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), the persistent-set's content survives substrate-instance restarts.

The persistent-set composes with the [storage-backend](storage-backend.md) — the substrate's choice of which physical store the persistent-set lives on (local filesystem, S3, GCS, distributed filesystem, embedded database). Per [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md), substrate behavior is storage-backend-agnostic; the persistent-set's contents reflect the same substrate state regardless of backend.

Per [encryption](encryption.md), persistent-set entries may be encrypted-at-rest. The substrate's storage policy declares which regions are encrypted, under which recipients, with which scheme.

The persistent-set's invariants:

- **Content-addressed.** Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), entries are byte-addressable by hash.
- **Immutable per entry.** Once written, an entry's bytes don't change; updates produce new entries with new hashes.
- **Reconstructible.** Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md) and [backup-restore-fidelity](../theorems/backup-restore-fidelity.md), the persistent-set can be reconstructed from event-log + closure-rule-system version (modulo cost — replay-from-genesis is expensive).
- **Federation-compatible.** Per [federation-convergence](../theorems/federation-convergence.md), persistent-set entries can be exchanged with peer substrates by hash.
