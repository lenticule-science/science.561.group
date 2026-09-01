---
type: theorem
class: engineering-claim
status: proved
depends-on: [snapshot, replay, hash-discipline, predication-valuation, settling-quiescence, settlement-determinism]
see-also: [settlement-determinism, take-snapshot]
---

# Snapshot replay reproduces the snapshotted state byte-identically

**Claim.** Let $S$ be a [snapshot](../objects/snapshot.md) taken at history $t$ from substrate state $H_t$ via [take-snapshot](../morphisms/take-snapshot.md), under cited replay-context $C$. Then [replay](../morphisms/replay.md) starting from $S$ — using $C$ as replay-context — reconstructs the [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) $v_t$ of $H_t$ cellwise-equal in every fiber, with the same canonical-form hash.

The fidelity is *unconditional* on which substrate the replay runs in: a snapshot taken on substrate $A$ and replayed on substrate $B$ (with both substrates supporting the cited replay-context) produces the same reconstruction. Snapshots are the substrate's portable hand-off unit.

## Why this holds

A snapshot at history $t$ is the canonical-form serialization of the predication valuation $v_t$ — a single point in the substrate's [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) family $(v_\tau)_{\tau<\lambda}$. Replay reconstructs $v_t$ from the serialization, with no further closure-rule application required because the snapshot's content is already at the cited ordinal.

**Part 1: Snapshot serialization is canonical.** Per [take-snapshot](../morphisms/take-snapshot.md) and [canonicalize](../morphisms/canonicalize.md), the snapshot's content is the canonical-form serialization of $v_t$. Two snapshots of the same valuation under the same scope produce byte-identical serialization. The snapshot's `output-hash` is the canonical-form hash of $v_t$ — direct reference to the valuation, not a paraphrase.

**Part 2: Snapshot deserialization is the inverse of canonicalization.** Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), distinct canonical-form contents produce distinct canonical-form hashes. The substrate's canonicalization is therefore injective on content; deserializing a canonical-form serialization recovers the original valuation cellwise-equal in every fiber.

**Part 3: Quiescent valuations need no further computation.** Per [settling-quiescence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md), the snapshot's $v_t$ is at a settled point — applying the closure operator to $v_t$ returns $v_t$ unchanged. Per [take-snapshot](../morphisms/take-snapshot.md), every snapshot cites the active [closure-rule-system](../objects/closure-rule-system.md) version, [shape-records](../objects/shape-record.md), and [constraint-records](../objects/constraint-record.md). Per [replay](../morphisms/replay.md), starting from a snapshot does *not* re-execute any of the witnesses preceding the snapshot — those witnesses' effects are already baked into $v_t$. The replay only needs to reconstruct $v_t$ from its serialization, which Part 2 guarantees is cellwise-identical. No further determinism is required (no closure-rule applications, no settlement work) to reach the snapshotted valuation.

Combining the three: canonical serialization of a quiescent valuation (Parts 1, 3) plus injective deserialization (Part 2) implies the reconstruction equals the original snapshotted valuation.

## Engineering consequence

Snapshots are the substrate's *portable state hand-off unit*. Three engineering uses follow:

- **Snapshot-anchored replay.** A long event log can be replayed from a recent snapshot rather than from substrate bootstrap, bounding replay cost. Per [take-snapshot](../morphisms/take-snapshot.md), the substrate's snapshot policy trades storage cost (snapshots take space) for replay cost (snapshots short-circuit log re-execution).
- **Disaster recovery hand-off.** A failed substrate's most recent snapshot, plus the event log between the snapshot and the failure, are sufficient to reconstruct the failure-time state on a different substrate. The fidelity guarantee is what makes this safe.
- **Federation peer hand-off.** A new federated peer joining a substrate's federation can be initialized from a snapshot rather than replaying the substrate's full history. The peer reconstructs the snapshotted valuation and proceeds with normal federation merge from that history forward — per [federation-convergence](federation-convergence.md), the peer converges to the federation's current state through normal merge.

## What the theorem rules out

- A snapshot whose serialization is non-canonical (the same valuation produces different snapshots on different runs) violates Part 1 and breaks the fidelity claim.
- A snapshot whose deserialization is lossy (some predications fail to round-trip) violates Part 2; the substrate must surface the loss as an explicit kernel-content declaration per [interfacer](teaching/explanations/interfacer.md).
- A snapshot whose replay-context is incomplete (a cited rule-system version is unrecoverable) means the snapshot is unreplayable — not a fidelity violation per se, but a usability failure that the substrate must surface clearly.
- A snapshot of a non-quiescent valuation — taken mid-settlement before the closure operator stabilizes — produces a reconstruction at that intermediate ordinal, not at the final settled state. Such snapshots are admissible but the user must understand they are snapshots of an intermediate $v_\tau$, not of the eventual quiescent $v^\infty$.

## What the theorem requires

- The substrate's [canonicalize](../morphisms/canonicalize.md) operator produces canonical-form serializations: same valuation always produces the same bytes.
- The substrate's [hash-discipline](teaching/explanations/hash-discipline.md) is hash-injective per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md): canonical-form hashes uniquely identify valuations.
- The cited replay-context (rule-system version, shape-records, constraint-records) is preserved across the snapshot's lifetime. A retired-without-archival rule-system version makes the snapshot non-replayable.
- The snapshot includes all content required to reconstruct the valuation at the cited history. A scope-bounded snapshot includes only in-scope content; replay can reconstruct only the in-scope state, with out-of-scope references treated as dangling per the snapshot's documentation.

## Connection to determinism

The fidelity claim is a corollary of [settlement-determinism](settlement-determinism.md) restricted to the snapshot-replay path: replay from a snapshot performs zero closure-rule applications (the snapshot has already settled), so the determinism reduces to canonicalization being deterministic — which is the [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md) commitment.
