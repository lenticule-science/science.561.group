---
type: definition
class: store
depends-on: [predication-graph-store, hash-discipline, canonical-form, predication-valuation, settling-quiescence]
see-also: [event-log, two-store-coherence, replication]
---

# Snapshot

A **snapshot** of a predicated computer is a content-addressed, point-in-time view of a substrate region: the [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) $v_t$ at a chosen ordinal $t$ of the substrate's settling, restricted to a declared region, canonical-form-serialized, identified by the hash of the canonical bytes. A snapshot is a substrate entity in its own right, queryable through the substrate's operators, and is what the substrate uses to communicate state to other predicated computers (federation), to other replicas (sync), and to external observers (export).

A snapshot has three components:

- **The captured content.** A canonical-form serialization of the predications in the snapshot's declared region — typically a [scope](teaching/explanations/scope.md), a [sublocale](application-sublocale.md), or a particular subset of predicates. The captured content is exactly the restriction of the valuation $v_t$ to the region. The serialization is canonical per [canonical-form](teaching/explanations/canonical-form.md); two snapshots of the same valuation at the same ordinal have the same byte-encoding and the same hash.
- **The metadata.** Predications declaring the snapshot's coverage (what region it captured), its origin (which substrate instance produced it), its event-log position (which ordinal $t$ it was taken at), its [topology](teaching/explanations/topology.md) constraints (where it is admissible to be received), and its [provenance](teaching/explanations/provenance.md) chain (what events caused its content). Metadata is itself canonical-form-serialized and hashed; two snapshots with different metadata are different snapshots, even if their captured content is identical.
- **The witness.** A [witness](teaching/explanations/witness.md) record of the snapshot's creation: which operator captured it, which canonical hashes it produced, which ordinal it was taken at. The witness goes into the [event log](event-log.md), so the snapshot's creation is itself a substrate event.

## Quiescent vs. intermediate snapshots

A snapshot taken at a [quiescent](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) ordinal $\tau^*$ — one at which $v_{\tau^*+1} = v_{\tau^*}$ for every subsequent step — captures the substrate's settled state. Such snapshots are the primary unit of substrate hand-off: per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), reconstruction from a quiescent snapshot requires zero closure-rule application.

A snapshot taken at a non-quiescent ordinal $t$ captures an intermediate valuation $v_t$. Such snapshots are admissible (the substrate may take them for debugging or fine-grained replication) but the user must understand they are snapshots of a particular point in the settling family, not of the eventual quiescent valuation.

## Engineering uses

Three engineering uses of snapshots:

- **Replication.** Replicas exchange snapshots to converge their predication-graph stores (see [replication](teaching/explanations/replication.md)). A snapshot's hash is the unit of agreement: two replicas that have applied snapshots up to the same hash agree on the corresponding content. Per [federation-convergence](../theorems/federation-convergence.md), this works directly for substrates in the strict or Scott-continuous regime; for non-Scott-continuous regimes the snapshot must be paired with the non-Scott-continuous-firing-ordinal record to preserve $H^1$ content.
- **Federation.** Inter-platform messaging often takes the form of "I am sending you this snapshot" rather than "I am sending you this stream of events." The snapshot's hash is the unit of agreement; signing the snapshot's metadata produces the federation-handshake's authentication artifact.
- **Audit and replay.** A snapshot at a known event-log position is a checkpoint: the substrate's audit operator can replay forward from the snapshot's content to a target event-log position, comparing each intermediate hash against witness records. The snapshot is what makes long-replay-from-genesis avoidable.

A snapshot is *immutable*: once produced, its canonical hash identifies its content forever. A new snapshot of the same region at a later ordinal is a different snapshot with a different hash, not an update to the old one. The discipline is what makes content-addressing meaningful for the substrate's communication: a recipient verifying a snapshot's hash against the canonical bytes verifies the content unforgeably.
