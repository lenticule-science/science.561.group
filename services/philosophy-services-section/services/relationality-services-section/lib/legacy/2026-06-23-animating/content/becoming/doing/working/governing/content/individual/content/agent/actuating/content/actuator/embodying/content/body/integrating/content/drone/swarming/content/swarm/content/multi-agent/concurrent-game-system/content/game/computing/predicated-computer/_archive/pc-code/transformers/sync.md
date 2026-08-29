---
type: morphism
class: federation-operator
realizes: [replication]
depends-on: [event-log, merge, snapshot]
see-also: [federation-handshake, content-addressed-store]
---

# Sync

The operator that brings two replicas of a substrate region into agreement by exchanging events from each replica's [event log](../objects/event-log.md) and merging the events into both replicas' state. Sync is the substrate's primary cross-replica coordination operator: it is what makes [replication](teaching/explanations/replication.md) operationally meaningful.

## Signature

`sync(replica-a, replica-b, region) → (post-sync-state, witness)`

Inputs:

- **`replica-a`**, **`replica-b`** — references to two substrate instances declared as replicas of the cited region. Each replica has its own event log and predication-graph store.
- **`region`** — the [scope](teaching/explanations/scope.md), [sublocale](../objects/application-sublocale.md), or other region-of-replication declared as the unit of synchronization.

Outputs:

- **`post-sync-state`** — both replicas now in agreement on the region: the same predication-graph hash within the region, the same set of events visible in their respective event logs.
- **`witness`** — records the sync's input states (each replica's pre-sync canonical hash for the region), the events exchanged, the [merge](merge.md) operations performed, the post-sync hash that both replicas reached.

## Operational semantics

Sync proceeds in five phases:

1. *Identify divergence.* Each replica reports its event-log position for the region (the hash of the last event affecting the region). The replicas exchange these hashes; if they're identical, the replicas already agree and sync is a no-op.
2. *Exchange events.* Each replica emits the events the other lacks: events in its own log but not in the other's, scoped to the region. Events are emitted in canonical-hash order. Per [content-addressed-store](../objects/content-addressed-store.md) discipline, events have content-derived ids, so determining "which events are new" is hash-comparison.
3. *Apply.* Each replica applies the received events to its own region, using the substrate's [closure-rule applications](closure-rule-application.md) and [merge](merge.md) on conflicting predications. The [event log](../objects/event-log.md)'s append-only discipline preserves causal ordering.
4. *Re-settle.* Each replica runs [settle](settle.md) on the region after applying received events; the substrate's value-domain join ensures convergence.
5. *Verify.* Each replica re-computes the region's canonical hash. If both hashes match, sync succeeds; if they don't, the substrate's [repair](teaching/explanations/repair.md) discipline determines next steps (typically a coherence repair).

## Engineering invariants

- **Convergence.** When sync succeeds, both replicas have byte-identical region content within the cited region. The substrate's value-domain join (per [merge](merge.md)) is what guarantees this; sync is the operational application of the join across replicas.
- **Symmetric.** Sync's effect on replica-a and replica-b is symmetric: post-sync, the two replicas are interchangeable for the region.
- **Witness-recorded on both sides.** Both replicas record matching witnesses; an auditor with both event logs can replay the sync byte-for-byte.
- **Partition-tolerant.** Sync's discipline does not require continuous connectivity; replicas separated by a network partition continue recording events independently, and a sync round at reunion merges the divergent events.

## Failure modes

- **Coherence violation during apply.** Two replicas record predications that, when merged, produce a conflict the substrate's value-domain cannot resolve through join (e.g., contradictory bilattice values). The substrate's [repair](teaching/explanations/repair.md) catalog determines whether the conflict is repairable; if not, sync aborts and the replicas remain divergent (the witnesses record the divergence; humans or governance must resolve).
- **Closure-rule-system version mismatch.** Two replicas running different rule-system versions cannot sync without a [bridge](theories/agential-orchestration-platform/concepts/federation.md). Sync detects the version mismatch via the events' cited rule-system version; if no bridge is available, sync aborts.
- **Authentication failure.** Sync between replicas requires verified identity, per [federation](theories/agential-orchestration-platform/concepts/federation.md). An unverified replica is not admitted; sync aborts.

## Position in the substrate

Sync is the operator that *makes replication operationally meaningful*. Without sync, replicas drift; with sync, they converge on agreement. The substrate's commitment that "the algebra IS the protocol" — that federation is intrinsic to the value-domain — is what makes sync straightforward: the operator does not require an external coordinator, a consensus protocol, or a leader election; it requires only that both replicas exchange their events and apply them.
