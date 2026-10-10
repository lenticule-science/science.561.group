---
type: morphism
class: composed-operator
realizes: [events-as-source-of-truth, witness, determinism]
depends-on: [event-log, witness, closure-rule-system, predication-settling, increment-sequence, settling-endofunctor, settlement-determinism]
see-also: [take-snapshot, settlement-determinism, hash-injectivity-under-canonical-form]
---

# Replay

The composed operator that reconstructs the substrate's [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) at a chosen ordinal by re-iterating the [settling-endofunctor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/settling-endofunctor.md) over the [event log](../objects/event-log.md)'s witness chain. Replay is the substrate's *recovery primitive*: given the event log (materializing the [increment sequence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md) $U$) and the cited [closure-rule-system](../objects/closure-rule-system.md) versions, replaying produces the predication settling family byte-identically to what was originally produced.

Per [events-as-source-of-truth](teaching/explanations/events-as-source-of-truth.md), the event log is the substrate's rigorous record. Per [settlement-determinism](../theorems/settlement-determinism.md), the settling is a deterministic function of `(event log, closure-rule system)`. The composition: every valuation $v_\tau$ the substrate has ever held is recoverable from the event log alone.

## Signature

`replay(event-log, target-ordinal, replay-context) → (substrate-state, replay-witness)`

Inputs:

- **`event-log`** — reference to the [event log](../objects/event-log.md) accumulated up to (at least) the target ordinal. The replay operator reads this log; it does not modify it.
- **`target-ordinal`** — the [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md) entry $\tau$ at which to stop replay. The substrate's predication valuation $v_\tau$ at this ordinal is what's reconstructed.
- **`replay-context`** — references to the historical [closure-rule-system](../objects/closure-rule-system.md) versions, [shape-records](../objects/shape-record.md), [constraint-records](../objects/constraint-record.md), and any [federation-bridge](../objects/federation-bridge.md) entries that were active at the cited witnesses. Per [hash-discipline](teaching/explanations/hash-discipline.md), each is identified by its version-hash; the replay-context is what makes replay deterministic.

Outputs:

- **`substrate-state`** — the reconstructed valuation $v_\tau$ — the [predication-graph store](../objects/predication-graph-store.md)'s content as it existed at that ordinal.
- **`replay-witness`** — a witness recording the replay operation itself: input log hash, target ordinal, replay-context hashes, the canonical-form hash of the reconstructed state, any deviations encountered.

## Operational semantics

Replay proceeds in three phases:

1. **Starting point selection.** If a [snapshot](../objects/snapshot.md) at or before the target ordinal is available (per [take-snapshot](take-snapshot.md)), replay starts from the snapshot per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md). Otherwise replay starts from the substrate's bootstrap state per [bootstrap](teaching/explanations/bootstrap.md). The cheaper option is preferred; snapshots exist precisely to avoid replaying long log prefixes.
2. **Witness-by-witness re-execution.** The substrate iterates the event log forward from the starting point. For each witness, it applies the settling-endofunctor's step formula $v_{\tau+1} = \mathrm{cl}^{\mathcal{S}}_p(v_\tau \vee_k u_{\tau+1})$:
   - Resolve the witness's cited operator and rule-system version against the replay-context.
   - Re-run the operator against the cited input region.
   - Verify the produced output matches the witness's recorded `output-hash`. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), agreement of canonical-form hashes is agreement of content.
   - Apply the produced output to the substrate's intermediate state; advance to the next witness.
3. **Termination.** When the replay reaches the target ordinal, the substrate's intermediate state *is* $v_\tau$. The replay-witness is emitted, citing the reconstruction's hash.

## Engineering invariants

- **Deterministic given log and context.** Two replays of the same event log to the same target ordinal with the same replay-context produce byte-identical reconstructed valuations. Per [settlement-determinism](../theorems/settlement-determinism.md), every operator's determinism transitively guarantees the replay's determinism.
- **Verifiable against witnesses.** Each step of replay verifies the produced output matches the original witness's hash. A divergence at any step indicates either log corruption, replay-context mismatch, or an operator-determinism violation.
- **Snapshot-anchored when available.** Per [take-snapshot](take-snapshot.md), snapshots are check-pointed valuations. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), replay starting from a snapshot skips re-executing all witnesses preceding the snapshot.
- **Read-only on the event log.** Replay never modifies the event log; the log is the source of truth, replay is the read-side. Per [cost-discipline](teaching/explanations/cost-discipline.md), replay is settlement-cost (each re-execution counts) but not admission-cost; the log itself is unchanged.

## Failure modes

- **Log corruption.** A witness's recorded hash doesn't match its computed hash, or a cited operator/rule-system-version cannot be resolved. The replay-witness records the corruption point.
- **Replay-context mismatch.** The cited rule-system version or shape-records cannot be resolved. The replay-witness records the missing reference; replay halts.
- **Operator-determinism violation.** A re-executed operator produces an output whose hash differs from the witness's recorded `output-hash`. Substrate-correctness violation per [settlement-determinism](../theorems/settlement-determinism.md).
- **Snapshot-mismatch.** A cited snapshot's hash doesn't match the recorded `output-hash` of the witness it claims to anchor. Same handling as log corruption.
- **Fuel exhaustion.** Replaying a long log on a thin starting point exceeds the cited fuel. The replay-witness records the partial reconstruction.

## Position in the substrate

Replay is the substrate's *time machine*. Per the [audit stack](teaching/explanations/substrate-as-stack-composition.md), replay is what makes the substrate's history reconstructable from the event log alone. The substrate's [static-substrate](teaching/explanations/static-substrate.md) form is the form replay reads; the [predicated-computer](../objects/predicated-computer.md) form is what replay re-instantiates.

The substrate's commitments to determinism, canonical-form hashing, and witness-emission are precisely what make replay a substrate-level primitive rather than an external recovery procedure. A substrate that satisfies all three commitments has its history fully recoverable from any historical event-log copy. Replay is the basis of [restore-from-backup](restore-from-backup.md), [federation-convergence](../theorems/federation-convergence.md)'s catch-up, and the substrate's audit verification.

The pattern composes with [event-log](../objects/event-log.md), [witness](../objects/witness.md), [take-snapshot](take-snapshot.md), and [federate](teaching/explanations/federation-as-substrate-join.md) (which is replay applied to peer-witnesses crossing the federation boundary).
