---
type: morphism
class: composed-operator
realizes: [substrate-state, hash-discipline]
depends-on: [predication-graph-store, snapshot, canonicalize]
see-also: [replay, settle, fork-branch]
---

# Take-snapshot

The composed operator that produces a [snapshot](../objects/snapshot.md) of the substrate's state at a chosen history. Snapshots are cheap-to-restore copies of the substrate's content, used for replay anchoring (per [replay](replay.md)), branch creation (per [fork-branch](fork-branch.md)), audit checkpointing, and disaster-recovery hand-off.

A snapshot is *not* a copy of the substrate's runtime state — it is a canonical-form serialization of the substrate's content at a specific history. Restoring from a snapshot reconstructs the substrate's content byte-identically; multiple substrates can share a snapshot (e.g., for federation hand-off) without ambiguity about what the snapshot represents.

## Signature

`take-snapshot(substrate-state, snapshot-context, fuel) → (snapshot-record, witness)`

Inputs:

- **`substrate-state`** — references to the [substrate-state](teaching/explanations/substrate-state.md) being snapshotted: typically the current state, but may be a historical state recovered via [replay](replay.md). The state is read-only during snapshot-taking; the substrate's normal operations may continue concurrently.
- **`snapshot-context`** — references to the [scope-record](../objects/scope-record.md) bounding what's included in the snapshot, the cited [closure-rule-system](../objects/closure-rule-system.md) version, and any retention policy declarations. A scope-bounded snapshot includes only content within scope; a substrate-wide snapshot includes everything reachable.
- **`fuel`** — bound on snapshotting work per [fuel-bound](teaching/explanations/fuel-bound.md). Bounded by total content size, not by ambient settlement work.

Outputs:

- **`snapshot-record`** — the [snapshot](../objects/snapshot.md) record: a substrate entity with the cited history, the canonical-form hash of the included content, references to the included entities and predications, and the cited replay-context.
- **`witness`** — the witness recording the snapshot operation: input substrate-state hash, snapshot-context hashes, snapshot-record hash, fuel consumed.

## Operational semantics

Take-snapshot proceeds through three phases:

1. **Region delineation.** Given the snapshot-context's scope, the substrate's [traversal](traversal.md) operator enumerates the entities and predications inside scope at the cited history. Out-of-scope content is excluded; the snapshot's content is exactly what would be visible at the scope.
2. **Canonical-form serialization.** Each included entity is serialized via [canonicalize](canonicalize.md) into the substrate's canonical form. The serialization respects [hash-discipline](teaching/explanations/hash-discipline.md) — the content's canonical-form hash is the snapshot's address.
3. **Snapshot-record assembly.** A snapshot record is assembled with: the cited history ordinal, the canonical-form hash of all included content, references to the active rule-system / shape-record / constraint-record versions (the *replay-context* required to deterministically restore from this snapshot), the snapshot's own canonical-form hash. The snapshot is itself substrate content, addressed and audit-trail-traceable.

## Engineering invariants

- **Read-only on the source state.** Take-snapshot does not modify the substrate's running state. The substrate's normal operations may proceed during snapshotting; the snapshot represents the state at a specific history regardless of what happens afterward.
- **Replay-context-complete.** Every snapshot cites enough context (rule-system version, shape-records, constraint-records) that [replay](replay.md) starting from the snapshot is deterministic without requiring any out-of-snapshot lookup.
- **Hash-cited identity.** Two snapshots of the same substrate state at the same history with the same scope produce byte-identical snapshot records. Different scopes or different histories produce different snapshots; the canonical-form hash distinguishes them.
- **Witness-emitting.** Every snapshot operation produces a witness in the [event log](../objects/event-log.md). The substrate's audit chain records when snapshots were taken, what they covered, and at what cost.

## Failure modes

- **Out-of-scope reference.** An included predication references an entity outside the snapshot's scope. Per scope discipline, the reference is included as-is; the snapshot does not include the referenced entity. Restoring from such a snapshot in a different substrate produces dangling references that the substrate's [repair-catalog](../objects/repair-catalog.md) discipline must handle.
- **Inconsistency mid-snapshot.** Concurrent admissions modify content the snapshot is in the middle of serializing. The substrate's discipline is to hold the snapshot at a specific history (per [stepping](teaching/explanations/stepping.md))—concurrent admissions advance history *past* the snapshotted history, but the snapshot's content reflects the held history. The runtime mechanism (per implementation: copy-on-write, MVCC, immutable indices) is a substrate degree-of-freedom.
- **Fuel exhaustion.** A scope's content exceeds the cited fuel. The witness records "incomplete"; the caller may re-attempt with increased fuel or take multiple smaller-scope snapshots and compose them later.
- **Replay-context unresolvable.** A cited rule-system version cannot be resolved (typically because it was retired without preserving the version). The snapshot's restore-determinism is degraded; the witness records the missing context, and the caller may decide whether to accept the snapshot.

## Position in the substrate

Take-snapshot is the substrate's *checkpoint primitive*. Per the [persistence stack](teaching/explanations/substrate-as-stack-composition.md), take-snapshot complements the event-log: the event log is the rigorous record from which any state can be replayed, the snapshot is the cheap-to-restore checkpoint that bounds replay cost. The substrate's snapshot policy (how often to take, how long to keep) is a deployment-level trade-off; the substrate-level primitive is take-snapshot itself.

The pattern composes with [snapshot](../objects/snapshot.md) (the object the morphism produces), with [canonicalize](canonicalize.md) (the substrate's serialization primitive), with [replay](replay.md) (which uses snapshots as starting points), and with [fork-branch](fork-branch.md) (which uses snapshots as branch ancestors).
