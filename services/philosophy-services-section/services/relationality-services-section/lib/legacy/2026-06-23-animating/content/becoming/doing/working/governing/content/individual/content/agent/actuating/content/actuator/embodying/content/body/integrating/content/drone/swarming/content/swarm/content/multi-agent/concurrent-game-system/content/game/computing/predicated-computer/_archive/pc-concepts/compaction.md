---
type: concept
class: discipline
depends-on: [event-log, source-of-truth, closure-2-monad, iterated-cosettling-counts-derivable-cells, closure-2-monad-lax-idempotence]
see-also: [snapshot, canonical-form, compaction-via-cosettling-equivalence-class, non-destructive-compaction-realizes-cosettling-equivalence-class]
---

# Compaction

The substrate's discipline for *bounding the growth of the event log* by collapsing sequences of superseded events into single representative events. In the substrate's hyperdoctrine setting, compaction is not log-rewriting at the protocol layer — it is *quotienting the event log by the [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md)'s cosettling equivalence class*: two log prefixes that produce the same closure-fixed-point are interchangeable, and per [iterated-cosettling-counts-derivable-cells](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/iterated-cosettling-counts-derivable-cells.md), the substrate can choose any prefix in the equivalence class as a canonical representative.

A substrate's [event log](../objects/event-log.md) grows monotonically — every admitted message is appended, none are deleted. Without compaction, the log accumulates unbounded historical content even when most of it has been superseded by later events. Compaction recognizes superseded sequences and rewrites them into compact equivalent sequences, with a *replay-equivalence verification* ensuring no information loss.

## What compaction does, in math terms

Per [iterated-cosettling-counts-derivable-cells](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/iterated-cosettling-counts-derivable-cells.md), for a strict-regime closure operator $T$ with seed-derived target $w$,

$$T^{*-1}(w) \;=\; \{v : \mathrm{seed} \subseteq v \subseteq w\}$$

— the iterated cosettling at $w$ is exactly the lattice interval between the seed (cells with no incoming closure rule) and $w$. Every $v$ in this interval produces the same closure-fixed-point $w$. Compaction's claim: the substrate may rewrite the event log to *any* $v$ in this equivalence class, with the canonical choice being the substrate's policy decision.

Per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), the closure 2-monad $\mathrm{Cl}$ is lax-idempotent: $\mathrm{Cl}^2 \cong \mathrm{Cl}$. So any prefix already in the closure's image is a fixed point under further compaction — *compaction is itself idempotent*, by the same monad-structural property that makes commit idempotent for transactions.

A typical compaction collapses sequences like `ingest → change → change → change` (a file ingested, edited three times) into a single `ingest` event with the final content. The earlier intermediate edits are no longer in the log; the final state of the file is preserved because both prefixes lie in the same cosettling equivalence class.

## Three load-bearing properties

- **Replay-equivalence.** Per [source-of-truth](source-of-truth.md), the log is authoritative. A compaction operation that produces a new log $L'$ from the original $L$ must satisfy *replay equivalence*: $T^*(L') = T^*(L)$ — the closure-fixed-point of replaying both is the same. The substrate verifies this by hash-comparing canonical forms. Per the cosettling-counts theorem, any $L'$ satisfying $\mathrm{seed}(L) \subseteq L' \subseteq L$ is admissible. A compaction whose replay-equivalence test fails is rejected; the original log is preserved.

- **Idempotence.** Compacting a compacted log produces the same compacted log. This follows from $\mathrm{Cl}$'s lax-idempotence: once the log is at the canonical representative of its cosettling class, further compaction is a no-op.

- **Channel-scoped.** Compaction operates per [channel](channel.md). A substrate may compact its filesystem-event channel without compacting its messages channel; the channels' event sets evolve independently. Each channel has its own compaction policy and its own per-channel closure operator.

## What compaction admits

The substrate admits compaction recipes for sequences whose net effect lies in the same cosettling equivalence class. Common recipes:

- **Supersession.** A `file-changed` event supersedes the prior `ingest-file` for the same path; both prefixes produce the same closure-fixed-point on the path's content-hash predication. Compaction merges them into a single `ingest-file` with the latest content-hash.
- **Deletion.** A `file-deleted` event makes prior events for the same path obsolete in the closure-fixed-point. Compaction removes the entire history of the deleted path's predications, keeping only the deletion record (or eliding the path entirely if no audit-trail requirement remains).
- **Sequential aggregation.** A sequence of accounting events that together net to a single ledger predication can be compacted into one event recording the net effect. This is admissible when the value-domain's join is associative-commutative-idempotent (per [substrate-value-domain](substrate-value-domain.md)) — i.e., the closure operator commutes with the join.

Compaction does *not* admit:

- **Retraction-without-record.** A retraction event that retracts a prior insertion stays in the log. The history of "this was admitted, then retracted" is auditable content; collapsing it loses the substrate's record of the retraction. Substrates that need *forensic* compaction (compaction that does erase retracted content) must declare it as policy and accept the audit limitation.
- **Reordering across channels.** Events in one channel cannot be reordered relative to events in another channel through compaction. The substrate's [time-and-event-ordinals](time-and-event-ordinals.md) discipline is preserved.
- **Crossing equivalence-class boundaries.** A compaction that produces a log $L'$ outside the cosettling equivalence class of $L$ would change the closure-fixed-point. The substrate refuses; per [iterated-cosettling-counts-derivable-cells](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/iterated-cosettling-counts-derivable-cells.md), the equivalence class is determined and verifiable.

## Compaction as substrate operation

Compaction is itself a substrate operation, witnessed in the substrate's audit trail. The substrate emits a `compaction-performed` event recording: which channel was compacted, which events were compacted into which representatives, the replay-equivalence verification's hash. Auditors can reconstruct the pre-compaction log from external archive (if preserved) and verify the compaction was correct.

A substrate may run compaction periodically (a maintenance schedule), reactively (when log size crosses a threshold), or never. The choice is policy; the substrate's discipline is that whatever choice is made is itself substrate content.

## What compaction does *not* replace

Per [snapshot](../objects/snapshot.md), the substrate's *snapshot* discipline is distinct from compaction:

- A snapshot is a *cache* of the working model after replaying the log. Snapshots are throwaway accelerators (per [source-of-truth](source-of-truth.md), the log is authoritative; the snapshot is an optimization).
- A compaction *rewrites the log itself*, replacing sequences of events with equivalent shorter sequences. The compacted log is the new authoritative record.

The two compose: a substrate may compact its log and then take a fresh snapshot from the compacted log. Replay-equivalence holds at both layers.

## Position in the substrate

Compaction is the substrate's *log-size discipline*. Without it, a long-running substrate accumulates historical content the substrate could correctly omit; with it, the log size is bounded by the substrate's *current state* plus its declared audit-retention policy, not by its operating duration. Per the cosettling-counts theorem, the bound is structural: the canonical representative's size is determined by the seed-cell count, not by the log's history.

The pattern composes with [event-log](../objects/event-log.md) (compaction operates on log channels), with [source-of-truth](source-of-truth.md) (replay-equivalence is the discipline that makes compaction safe), with [hash-discipline](hash-discipline.md) (replay-equivalence verification compares hashes), and with [snapshot](../objects/snapshot.md) (snapshots are independent of compaction; a compacted-log substrate uses snapshots the same way an uncompacted-log substrate does).
