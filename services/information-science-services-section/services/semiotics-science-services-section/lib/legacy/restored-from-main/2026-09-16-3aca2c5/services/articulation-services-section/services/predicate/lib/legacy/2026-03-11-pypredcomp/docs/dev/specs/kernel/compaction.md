---
title: "Compaction (DRAFT — pending theory reconciliation)"
description: "Draft spec for stratum-preserving compaction per pt-04/t02-116. Blocked: secondary theory prescribes log-rewriting cosettling-equivalence-class compaction; this draft specifies append-summary-event. Reconciliation required."
kind: spec
status: draft
version: "0.2a-draft"
sources:
  - "operations/engineering/tools/predication-computer/pypredcomp/docs/dev/tasks/engineering/pt-04-stratum-preserving-compaction.md"
---

> **DRAFT — blocked.** Secondary theory ([`predicated-computing/concepts/compaction.md`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/compaction.md) + theorem [`compaction-via-cosettling-equivalence-class`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/compaction-via-cosettling-equivalence-class.md)) specifies **log-rewriting** compaction that quotients the event log by the cosettling-equivalence-class.
> This draft specifies **non-destructive append-summary-event** compaction.
> The two are not compatible.
> Spec is not normative until reconciled.
> The `PCC_COMPACT_*` error codes registered in [error-codes.md](error-codes.md) are placeholders pending the ratified design.

# Compaction

The substrate's [event log](../filesystem/event-log.md) is append-only and hash-chained from genesis to head.
Fiber materialization (the `fiber_reconcile` boot phase per [init-boot/boot-sequence.md](../init-boot/boot-sequence.md), the `presheaf-storage.md` projection operators, the federation-peer catch-up path per [snapshots.md](../filesystem/snapshots.md)) currently must walk the entire event log to reconstruct fiber state.
As a substrate accumulates events, this walk becomes the dominant boot cost and the dominant federation catch-up cost.

**Compaction** is the substrate's discipline for short-circuiting that walk *without removing or rewriting any event in the log*.
A `compact` event is appended to the log whose body holds, for each `(s, p, o, stratum)` triple reachable from the compacted prefix, the latest cell atom at that stratum.
A subsequent fiber-materialization pass that encounters a `compact` event uses its body as the materialization seed and replays only the events strictly after it.

The hash chain is preserved end-to-end: a `compact` event has the same `prev`/`id` discipline as any other event, and the events it summarizes remain in place for audit.
Compaction is therefore non-destructive and byte-identical-replay-equivalent under the discipline of §4.

The framing is grounded in [decisions/events-are-stratified-substrate-is-a-presheaf.md](../../decisions/events-are-stratified-substrate-is-a-presheaf.md): the stratum index is an *independent* fibre of the presheaf functor over $({\mathcal O}, \le)$, so compaction MUST preserve one summary cell per stratum per `(s, p, o)`.
Conflating strata at the compaction boundary would break [stratified-facts.md](stratified-facts.md) §3 (retraction discipline differs by stratum) and [projection-naturality.md](projection-naturality.md) §1 (per-stratum projection files MUST be byte-identical to a fresh re-projection).

## Grounded in

- [`predication-categories/morphisms/closure-2-monad.md`](../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) and [`predication-categories/theorems/closure-2-monad-lax-idempotence.md`](../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md) — σ/Δ closure operators are idempotent on their fixed points; the latest-per-stratum cell at the compaction boundary is a valid materialization seed under further σ/Δ application.
- [`predication-categories/theorems/iterated-cosettling-counts-derivable-cells.md`](../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/iterated-cosettling-counts-derivable-cells.md) — the load-bearing iterated-cosettling result.
- [`predicated-computing/concepts/compaction.md`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/compaction.md) and [`predicated-computing/theorems/compaction-via-cosettling-equivalence-class.md`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/compaction-via-cosettling-equivalence-class.md) — the secondary-theory engineering-claim.
  The append-summary-event shape below is not what these prescribe; reconciliation pending.
- [decisions/events-are-stratified-substrate-is-a-presheaf](../../decisions/events-are-stratified-substrate-is-a-presheaf.md) — stratum is an independent fibre of the presheaf; compaction must preserve it independently.
- [specs/kernel/stratified-facts.md](stratified-facts.md) §1 (the three strata) and §3 (retraction differs by stratum).
- [specs/kernel/projection-naturality.md](projection-naturality.md) §1 (per-stratum projection byte-identity invariant).
- [specs/filesystem/event-log.md](../filesystem/event-log.md) (the append-only hash-chained log this discipline composes with).
- [specs/filesystem/snapshots.md](../filesystem/snapshots.md) (the related but distinct hash-attestation primitive — see §6 below for the relationship).

## 1. The `compact` event

A compact event has the standard event envelope (`id`, `ord`, `prev`, `kind`, `node`, `body`, optional `wall_clock_ns`) per [event-log.md](../filesystem/event-log.md) §1, with `kind: "compact"` and the following body:

```jsonl
{
  "kind": "compact",
  "id": "<sha256>",
  "ord": <N>,
  "prev": "<id_of_event_at_ord_N-1>",
  "node": "<node-id>",
  "body": {
    "at_ord": <K>,
    "from_ord": <J>,
    "summary_cells": [
      { "s": "...", "p": "...", "o": "...", "stratum": "asserted",  "v": ..., "derived_from": null,        "derived_via": null,           "source_event_id": "<id>" },
      { "s": "...", "p": "...", "o": "...", "stratum": "saturated", "v": ..., "derived_from": ["<id>", ...], "derived_via": "<rule-id>",   "source_event_id": "<id>" },
      { "s": "...", "p": "...", "o": "...", "stratum": "settled",   "v": ..., "derived_from": ["<id>", ...], "derived_via": "⊙-stabilize", "source_event_id": "<id>" },
      ...
    ],
    "summary_cells_root_hash": "<sha256_of_canonical_sorted_summary_cells>",
    "compacted_prefix_tail_id": "<id_of_event_at_ord_K>"
  }
}
```

Field discipline:

- `at_ord` — the event-ordinal of the *last* event included in the compacted prefix.
  The compaction summarizes events `[from_ord, at_ord]` inclusive.
- `from_ord` — the event-ordinal of the *first* event included in the compacted prefix.
  For the first compaction in a log, `from_ord = 0` (the genesis event itself is included as the trivial seed).
  For subsequent compactions, `from_ord = (previous compact event's at_ord) + 1` so adjacent compactions tile the log without gap or overlap.
- `summary_cells` — an array of summary-cell objects.
  For each `(s, p, o, stratum)` triple that appears in any cell-emitting event in the prefix `[from_ord, at_ord]`, exactly one summary-cell entry: the cell atom from the *latest* (highest `ord`, then lexicographic-cell-`id` tiebreaker) event in the prefix that emitted a cell at that triple.
  The entry carries the cell's `s`, `p`, `o`, `v`, `stratum`, `derived_from`, `derived_via` (verbatim from the source cell atom), plus a `source_event_id` field naming the event the summary cell is taken from.
  Cell atoms whose `(s, p, o, stratum)` triple does not appear in any later event in the same prefix are *not* summarized — only the latest per triple per stratum survives the compaction summary.
- `summary_cells_root_hash` — `sha256(canonical(sorted(summary_cells, key=lambda c: (c["s"], c["p"], c["o"], c["stratum"]))))`.
  Lets a verifier check the summary's canonical content without re-canonicalizing the full event body.
- `compacted_prefix_tail_id` — the event id of the event at `at_ord`.
  Lets a verifier confirm the compaction referenced the chain it claims to summarize without rewalking the chain.

The `prev` field on the compact event itself is the id of the event at `ord - 1` per the standard event-log discipline.
Compaction is a normal append; it does not modify any earlier event's `prev` or `id`.

## 2. What gets summarized: stratum-preserving discipline

For each `(s, p, o)` triple that appears in any cell atom in any cell-emitting event in `[from_ord, at_ord]`:

- For each stratum value `σ ∈ {"asserted", "saturated", "settled"}` at which a cell atom for `(s, p, o)` was emitted in the prefix, **exactly one summary-cell entry** in `summary_cells` for `(s, p, o, σ)`: the cell atom from the latest emitting event.
- A `(s, p, o)` triple may have one, two, or three summary-cell entries (one per stratum that appeared in the prefix).
  The maximum is three — one per stratum.

This is the load-bearing **stratum-preserving** discipline of [decisions/events-are-stratified-substrate-is-a-presheaf](../../decisions/events-are-stratified-substrate-is-a-presheaf.md).
A naive compaction that summarizes only the "current value" per `(s, p, o)` (collapsing across strata) breaks:

- **Retraction.** Per [stratified-facts.md](stratified-facts.md) §3, asserted cells respond to retraction differently from saturated cells.
  A post-compaction retraction at `(s, p, o)` must consult the asserted summary cell *and* the saturated summary cell independently to determine dependent-invalidity propagation; a flat-summarized fiber cannot tell them apart.
- **Per-stratum projection.** Per [projection-naturality.md](projection-naturality.md) §1, `by-stratum/asserted.json`, `by-stratum/saturated.json`, and `by-stratum/settled.json` are independent presheaf projections.
  After compaction, materialization of any one of them must yield byte-identical content to a pre-compaction materialization.
  A flat-summarized compaction loses the asserted-only and saturated-only views.
- **Witness chains.** Per [stratified-facts.md](stratified-facts.md) §4, every stratum > 0 cell carries a `derived_from` witness pointing to lower-stratum cells.
  The summary's per-stratum cells must each carry their own `derived_from`, since post-compaction σ/Δ replay may need to re-derive saturated/settled values from the surviving asserted seeds and check witness identity per `PCC_WITNESS_DIVERGED`.

## 3. What does NOT get summarized

- **Non-cell events** in the prefix (`session-open`, `session-close`, `respond-trace`, `signal-fire`, etc.) are not part of `summary_cells`.
  They served their purpose at the time of original emission; their effects on cell state are captured by the cell atoms that the σ/Δ engine emitted in response, and those cell atoms are summarized per §2.
- **Older cells at the same `(s, p, o, stratum)`** in the prefix (anything but the latest per triple per stratum) are not part of `summary_cells`.
  The discipline relies on settling-monotonicity in $\le_k$ per [stratified-facts.md](stratified-facts.md) §1: each new cell at a given `(s, p, o, stratum)` joins onto the prior under $\vee_k$, so the latest cell is the running-join representative.
- **Snapshot events** ([snapshots.md](../filesystem/snapshots.md)) in the prefix are not part of `summary_cells` per se — they are not cell atoms — but their effect on state-root verification is independent of compaction and remains verifiable from the events that survive in the log alongside the compact event.
- **The pre-compaction events themselves** are not removed from the log.
  Compaction is non-destructive; the prefix `[from_ord, at_ord]` remains in `events.jsonl` for audit, federation push to peers without compaction, and "what was true at ord N" point-in-time queries.

## 4. Replay-equivalence (the load-bearing invariant)

The ship target per [milestones/v0.2a-multi-user-single-node.md](../milestones/v0.2a-multi-user-single-node.md) §"Ship targets" gate 6 demands byte-identical replay across two boot cycles.
Compaction MUST preserve this.
Specifically:

**Replay-equivalence invariant.** Let `L` be an event log containing a compact event `C` at ordinal `N` summarizing `[from_ord, at_ord]`.
Let `L_full` be a fresh re-projection of `L` walking every event from genesis through head.
Let `L_compacted` be a fresh re-projection of `L` that, on encountering `C`, seeds the materialization state from `C.body.summary_cells` and then replays events `[N+1, head]` only.
Then for every entity-slug `e`, every projection context `(stratum, peer, session, ord)`, the materialized projection file at that context is **byte-identical** between `L_full` and `L_compacted`.

This is the replay-equivalence gate.
Two enforcement consequences:

1. The compaction is **deterministic** in the strong sense: the same prefix `[from_ord, at_ord]` must produce a byte-identical `compact` event body across two independent compaction passes.
  The "latest per `(s, p, o, stratum)`" tiebreaker MUST use highest `ord` first, then lexicographic cell-`id` for cells emitted within the same event (which can occur for batch `respond` outputs); both criteria are deterministic functions of the log's bytes.
2. The materialization machinery MUST honour the compact-event seed: encountering a compact event during fiber reconcile is a contract to seed from `summary_cells` rather than continue to walk through `[from_ord, at_ord]` events as if they were loose cell emissions.
  Failing to honour the seed is a different replay path that may produce identical fibers in *some* cases (e.g. when the log has no retractions in the compacted prefix) but is not byte-identical replay across all cases — particularly when the prefix contains a saturated-cell retraction whose `derived_from` premises were also retracted in the same prefix; in that case the compaction summary records the post-retraction state, but a from-genesis walk that ignores the compact event would re-run the σ-pass and re-derive the saturated cell.
  The summary discipline is exactly what makes the two paths agree.

## 5. Errors

| Code | Meaning |
|---|---|
| `PCC_COMPACT_GAP` | A new compact event's `from_ord` does not equal `(previous compact's at_ord) + 1`, or `0` if no previous compact. Compactions MUST tile the log without gap. |
| `PCC_COMPACT_OVERLAP` | A new compact event's `from_ord` is less than or equal to a previous compact's `at_ord`. Compactions MUST tile the log without overlap. |
| `PCC_COMPACT_FUTURE` | A new compact event's `at_ord` is greater than the event-log height at append time. Compaction cannot summarize events not yet appended. |
| `PCC_COMPACT_TAIL_MISMATCH` | A compact event's `compacted_prefix_tail_id` does not match the id of the event at `at_ord` in the log. The compaction references a different chain than the log holds. |
| `PCC_COMPACT_SUMMARY_INCOMPLETE` | A compact event's `summary_cells` is missing an entry for some `(s, p, o, stratum)` triple that was emitted in `[from_ord, at_ord]`. |
| `PCC_COMPACT_SUMMARY_NON_LATEST` | A summary-cell entry's `source_event_id` does not point to the latest event in `[from_ord, at_ord]` that emitted a cell at that `(s, p, o, stratum)` per the §4 deterministic tiebreaker. |
| `PCC_COMPACT_SUMMARY_ROOT_DIVERGED` | A compact event's `summary_cells_root_hash` does not equal the recomputed `sha256(canonical(sorted(summary_cells, ...)))`. |
| `PCC_COMPACT_REPLAY_DIVERGED` | A fiber reconcile from a compact event's seed produced different bytes than a from-genesis walk. The replay-equivalence invariant of §4 is broken. |

## 6. Relationship to snapshots

[snapshots.md](../filesystem/snapshots.md) defines a separate primitive, the `snapshot` event, which records *verifiable hashes* of materialized state at an ordinal but does *not* hold the state itself.
Compaction and snapshots compose:

| Concern | Snapshot event | Compact event |
|---|---|---|
| Body content | Three root hashes (`cells-root-hash`, `rules-root-hash`, `fiber-root-hash`) | Per-`(s, p, o, stratum)` summary cells (the materialization seed) |
| Body size | O(1) | O(distinct triples in compacted prefix) |
| Purpose | Hash attestation; tampering detection; federation peer roots match | Materialization seed; short-circuits the fiber reconcile walk |
| Removes events from log? | No | No |
| Required for boot? | No | No (boot-from-genesis still works; compaction makes it cheaper) |
| Cadence | Configurable (default every 10000 ords per [snapshots.md](../filesystem/snapshots.md) §4) | Configurable (default every 100000 ords; v0.2a slice ships explicit `signal:compact:perform` only) |

Both are non-destructive append-only events.
A substrate that records both gets fast verification (snapshot) AND fast materialization (compact).
A v0.2a substrate that records neither is correct but pays the full event-log walk on every fiber reconcile.

The compaction discipline supplements the snapshot discipline; neither replaces the other.

## 7. v0.2a slice

The v0.2a slice ships:

- **The `compact` event format** per §1 in [event-log.md](../filesystem/event-log.md) wire format and [storage/event_log.py](../../../src/storage/event_log.py).
- **`compact_to(layout, event_log, at_ord, fiber_state, *, node_id, sess) -> compact_event`** in `storage/event_log.py` (or a new `storage/compaction.py`): walks the event log from `from_ord` to `at_ord`, computes the per-`(s, p, o, stratum)` summary cells per the §2 discipline, and appends the compact event.
- **`fiber_reconcile_from_compact(layout, compact_event)`** path: when fiber reconcile encounters a compact event during boot-time materialization, it seeds from `summary_cells` rather than walking through `[from_ord, at_ord]`.
  The post-compaction tail is replayed normally.
- **The §5 error codes**, registered in [error-codes.md](error-codes.md) and `src/substrate/error_codes.py`.
- **Replay-equivalence conformance test** (the `t02-116f` paired fixture per [decisions/fixture-authoring-paired-task.md](../../decisions/fixture-authoring-paired-task.md)): a multi-stratum scenario (assertion → σ-saturation → Δ-settlement → retraction) is run twice — once with `compact_to(at_ord=K)` invoked partway, once without — and the resulting `fibers/` directory is compared byte-for-byte.
  Mismatch is `PCC_COMPACT_REPLAY_DIVERGED`.

The v0.2a slice **does not** ship:

- **Configurable cadence cell** (`(system, compact-cadence, ...)
  `). v0.2a ships explicit per-call `compact_to` only, gated by `signal:compact:perform`.
  Cadence-driven background compaction ships at v0.3 alongside the snapshot-cadence cell extension per [snapshots.md](../filesystem/snapshots.md) §4.
- **Federation push of pre-compaction events to a peer that has compacted past them** (the peer's tail is past the events; the events are still on disk for audit).
  The federation handshake spec at v0.4 specifies how a fast-catch-up peer requests a compact event vs the full prefix.
- **Compaction of compactions** (a new compact event whose `from_ord` covers a previous compact event's range). v0.2a's tile-without-gap discipline supports this in principle (the new compact's body would summarize the union), but the v0.2a slice constrains compactions to non-overlapping forward tiles only; recompaction is `AUTHOR-IN-v0.3`.
- **Removal of events from the log.** Permanent.
  Compaction is non-destructive forever.

## 8. Conformance gates

A conforming implementation MUST:

1. Produce byte-identical `compact` event bodies for two independent compactions of the same prefix (determinism per §4).
2. Emit `PCC_COMPACT_GAP` / `PCC_COMPACT_OVERLAP` / `PCC_COMPACT_FUTURE` / `PCC_COMPACT_TAIL_MISMATCH` on the corresponding malformed compactions per §5.
3. Produce byte-identical `fibers/` materialization between a from-genesis walk and a compact-seeded walk per the §4 replay-equivalence invariant.
4. Honour the per-stratum discipline of §2: every `(s, p, o, stratum)` triple emitted in the compacted prefix has exactly one summary-cell entry.
5. Verify `summary_cells_root_hash` and `compacted_prefix_tail_id` on every compact event encountered during boot reconcile; mismatch is `PCC_COMPACT_SUMMARY_ROOT_DIVERGED` / `PCC_COMPACT_TAIL_MISMATCH`.
6. Treat `compact_to` as a session-issued substrate action obeying the gate-ordering invariant of [capability-permissions.md](../filesystem/capability-permissions.md) §6.3 (capability check fires before the first ord-stamp; denied call leaves zero on-disk side-effect).

## 9. Out of scope

- The voidmath geometric layer's interaction with compaction (forward-looking; voidmath ships post-v0.5).
- Compaction of the federation peer-stratum sub-fibers separately. v0.2a compacts the union; per-peer compaction is `AUTHOR-IN-v0.4` alongside the federation-protocol revision.
- Compaction-aware retention policies (per the audit-content-via-inconsistency-sheaf-cohomology theorem's §"Engineering consequence" suggestion).
  Out of scope until the cohomology-class-aware retention spec is authored (v0.3+).
