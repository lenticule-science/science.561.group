---
type: concept
class: discipline
depends-on: [event-log, two-store-coherence]
see-also: [reification, determinism, snapshot]
---

# Source of truth

The substrate's commitment that *the event log is authoritative and the working model is a replay artifact*. A predicated computer's state at any moment is a function of two things: the sequence of reified messages that have been admitted, and the substrate's algebra that processes those messages. Anything else — in-memory indexes, cached projections, snapshot files, derived files written to disk — is a *cache*: a computational shortcut that the substrate can rebuild from the authoritative log if lost.

The discipline is the substrate's answer to the question "where does state live?" A substrate without source-of-truth discipline has state distributed across runtime caches, in-memory structures, derived files, and possibly an event log that is *one of* these stores rather than authoritative over them. When the stores diverge — as they always eventually do — the substrate has no principled way to decide which is correct.

## The structural commitment

Three properties define the discipline:

- **Events are the source of truth.** Every state change the substrate undergoes is recorded as an event in the [event log](../objects/event-log.md). "Saving a substrate" is preserving the event log; "loading a substrate" is replaying the log. There is no save operation that writes a derived store as the authoritative artifact; there is no load operation that reads a derived store as authoritative.
- **The working model is a cache.** The in-memory representation of substrate content (indexes, dispatch tables, fiber lookups) is a derived view computed by replaying the event log. It can be discarded and reconstructed at any time without information loss. Reconstruction takes time but produces byte-identical results, modulo declared elision.
- **Snapshots are accelerators, never authoritative.** A snapshot caches the post-replay state for fast restart. A substrate may write snapshots periodically; on load, the substrate restores from the snapshot AND replays any events with timestamp greater than the snapshot's cutoff. The snapshot is an optimization; if the snapshot is lost or corrupted, the substrate can be reconstructed from the log alone.

## Replay determinism

Per [determinism](determinism.md), replaying the same event log produces the same working model. The property is what makes the discipline operational: if replay were not deterministic, "the log is the source of truth" would be empty — two substrates loaded from the same log could disagree, and the disagreement would have no resolution.

Replay determinism rests on three sub-disciplines:

- **Events are content-addressed.** An event's identifier is the canonical hash of its (channel, operation, timestamp, origin, payload). Two byte-identical events have the same identifier; appending the same event twice is idempotent. Per [hash-discipline](hash-discipline.md), the canonical-form discipline ensures the hash is stable across implementations.
- **Reducers are pure.** A reducer is a pure function `(working-model, event, context) → working-model`. Reducers do not read from external state, do not branch on host time, do not depend on the substrate's invocation order beyond what the event payload encodes. Per [read-discipline](read-discipline.md), reducers do not branch on substrate content.
- **Elision is deterministic.** Some events supersede earlier events: a file-changed event supersedes an earlier file-ingest for the same path; a retract event supersedes an earlier admission. The elision pass filters superseded events from the replay stream before reducer application; the post-elision stream is a deterministic function of the original log.

## What the discipline rules out

A substrate's working model is *not* updated through paths the event log does not see. Specifically:

- **No in-memory non-monotonic operation.** Supersession happens at the event-stream layer (elision), not at the in-memory model layer. The substrate does not have a primitive to "delete a claim from the working model directly" — deletion is a retraction event in the log, and replay produces a working model that omits the retracted claim.
- **No ad-hoc cache invalidation.** Caches are derived; they are invalidated by the event sequence that produced them. There is no out-of-band signal that says "this cache entry is stale." If a cache entry is stale, the events that staled it are in the log, and the cache will reflect the staleness on the next replay.
- **No state outside the log.** Runtime state that the substrate depends on for correctness must enter the log. A substrate that maintains in-memory state separately — a counter that increments in memory but never enters the log — has erected a parallel state the substrate is unaware of, and the parallel state will drift.

## Engineering consequences

- **The substrate is auditable end-to-end.** Every state change is in the log; reconstructing the substrate's state at any past moment is replaying up to that moment. Auditors do not need separate logs from runtime subsystems; the substrate's own log covers everything.
- **The substrate is replicable.** Two substrates with the same log have the same state. Replication is event-stream replication: copy the events, apply replay determinism, get matching state. Per [replication](replication.md), the discipline is what makes CRDT-style convergence operational at substrate level.
- **The substrate is recoverable from corruption of the working model.** If the working model is lost or corrupted, the substrate restores by replaying the log. The cost is replay time; the value is that no information is lost.
- **The substrate is portable across implementations.** Two implementations that share the substrate's reducer specifications and the canonical-form discipline produce byte-identical working models from the same log. The implementation is interchangeable; the log is portable substrate content.
- **Compaction is bounded.** A substrate's event log grows monotonically. The substrate's discipline admits compacting sequences of superseded events into single representative events, with replay-equivalence verification ensuring the compaction does not change the resulting working model. Compaction reduces log size while preserving source-of-truth.

## Position in the substrate

Source-of-truth is the substrate's *persistence discipline*. It is what makes the substrate's content survive runtime restarts, software upgrades, host migrations, and corruption events. Per [two-store-coherence](two-store-coherence.md), the discipline is the engineering content that makes the predication-graph store and the event log coherent: the predication-graph is derived from the event log, not maintained separately.

The pattern composes with [reification](reification.md) (every event in the log is a reified message), with [determinism](determinism.md) (replay determinism is what makes the log authoritative), with [canonical-form](canonical-form.md) (events' content-addressing depends on canonical-form discipline), and with [snapshot](../objects/snapshot.md) (snapshots are accelerators, not authority).
