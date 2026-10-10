---
title: "Events are stratified, the substrate is a presheaf"
description: "Every fact carries a stratum tag (asserted / saturated / settled) corresponding to the derivation pass that emitted it; fibers are stored as a presheaf indexed by context, not as a flat set. Re-reading from a different vantage is a projection, not a recomputation."
kind: decision
date: "2026-05-02"
status: committed
---


## What

Two coupled commitments:

1. **Stratification.** Every cell record in the substrate carries a `stratum` field whose value is one of `"asserted"`, `"saturated"`, or `"settled"`.
  The tag identifies the derivation pass that emitted the cell:
   - `"asserted"` — claimed by an external sender; not yet exposed to closure rules.
   - `"saturated"` — derived by a σ-pass closure-rule firing; carries a `derived_from` witness chain back to the asserted premises that justified it.
   - `"settled"` — survived both σ-saturation and Δ-stabilization; the value the read surface exposes by default.
2. **Presheaf storage.** Fibers are stored on disk and in memory as a presheaf indexed by context — stratum, originating peer, originating session, and event-ordinal cursor.
  Materialised fiber files are organised so that "give me the substrate's view at stratum X under peer Y as of ord N" is a deterministic *projection* of stored data, not a recomputation from scratch.

The closure-rule engine inside `respond` Phase 3 separates into two named sub-phases — the σ-pass (saturation) and the Δ-pass (stabilization) — each emitting cells at the appropriate stratum, with separate fuel budgets, separate halting conditions, and separate witness chains.

The full normative content lives in [specs/kernel/stratified-facts.md](../specs/kernel/stratified-facts.md), [specs/kernel/sigma-delta-passes.md](../specs/kernel/sigma-delta-passes.md), and [specs/filesystem/presheaf-storage.md](../specs/filesystem/presheaf-storage.md).

## Why

The captain's [`dont-flatten-the-tower.md`](../../../engineering/triage/operations/command/ideas/triage/dont-flatten-the-tower.md) argues that EAVT-style flat storage conflates three different mathematical objects:

| Level | Mathematical object | What it is |
|---|---|---|
| 0 | asserted triple `(E, A, V)` | a raw claim |
| 1 | closed fiber $H_t$ | the σ-saturated state |
| 2 | fixed fiber $H^*_t$ | the Δ-settled state |

Conflating them causes specific operational failures:

- **Retraction is wrong.** A saturated fact becomes invalid when its premises are retracted; an asserted fact does not.
  A flat store cannot tell them apart, so it either retracts neither (silently lying about derived consequences) or retracts both (silently lying about assertions made by external senders).
- **Federation merge is wrong.** A peer's asserted claim and the local substrate's saturated derivation of a contradicting value are different kinds of things; merging them with $\odot$ as if they were the same kind erases the distinction.
  The peer-stratum scope rule is impossible to express against a flat store.
- **The MCP read surface lies.** A reader of a flat fiber sees a mixture of "what was claimed" and "what was derived" with no way to ask for one or the other.
  The settled view is the substrate's canonical "this is true" — but a flat store has no settled view, only a single value per cell.
- **Re-projection requires recomputation.** Asking "what did peer X think before they synced with us?" against a flat store requires replaying the event log; with a presheaf, it is a `project_peer` morphism on the materialised storage.

The captain's idea calls this "flattening the tower."
Curry-Howard-Lambek says level $N$'s closed algebra becomes the terms of level $N+1$'s language; storing all levels as the same kind of object loses that structure.
Stratification preserves it.

The presheaf framing is the mathematical object that makes all of the contextual reads (stratum, peer, session, ord) into morphisms on the same stored substrate, rather than separate computations against separate stores.

Source: this conversation (2026-05-02); the captain's [`dont-flatten-the-tower.md`](../../../engineering/triage/operations/command/ideas/triage/dont-flatten-the-tower.md), [`unified-record-sketch.md`](../../../engineering/triage/operations/command/ideas/triage/unified-record-sketch.md), [`fars-faoh-mash-architecture-from-first-principles.md`](../../../engineering/triage/operations/command/ideas/triage/fars-faoh-mash-architecture-from-first-principles.md); the predication-category library.

## What it rules out

- Flat EAVT storage in which every cell record is structurally identical regardless of derivation pass.
- A single closure-rule engine loop that interleaves σ-firings with Δ-stabilization (the previous shape of [closure-engine-internals.md](../specs/kernel/closure-engine-internals.md) §3).
- Federation merge that absorbs a peer's saturated or settled cells into the local substrate without re-running the local σ-pass against them.
  (Demote-to-asserted is the default; explicit `derivation-trust` is required to honour a peer's higher-stratum claims.)
- Read APIs that return cells without exposing their stratum.
  Every cell read across MCP, HTTP, or the web GUI surfaces its stratum to the consumer.

## What it does not constrain

- The order in which the σ-pass and Δ-pass run within a single Phase 3, beyond "σ first, then Δ, then σ↔Δ alternation bounded by outer fuel."
- The internal data structure used by the σ-pass worklist (lexicographic, priority queue, wavefront ordinal — when wavefront-settle ships).
- Whether to materialise per-session or per-peer projection files eagerly or lazily; conformance is the same as long as projections at a given (entity, context, ord) tuple are byte-identical to a fresh re-projection from the event log.
- The introduction of additional stratum tags in future versions, provided they are strictly between or above the existing three and the schema migration is non-breaking. v0.1 ships exactly the three tags.
- The voidmath geometric layer, wavefront-settle worklist, and other refinements that compose with stratification but ship on later tasks.

## Concrete consequences

- The `cell` field of every event in `events.jsonl` carries a `stratum` field.
  The same `(s, p, o, v)` at different strata is a different cell record with a different SHA-256 id.
- The closure-rule engine inside `respond` Phase 3 has two named sub-phases (`PCM_RESPOND_PHASE` repair-log entries with `"sigma-start"` and `"delta-start"` variants).
- The default `get_fiber(entity)` read returns the settled-stratum projection.
  Tooling and audit explicitly request other strata.
- Federation peer policies are extended with a `derivation-trust` predicate; the default is to demote a peer's higher-stratum cells to asserted at receive time.
- The conformance-vector suite gains a stratum block exercising the four termination conditions of the σ/Δ engine plus the projection-commutativity of the presheaf.

## Vocabulary

The terms `stratum`, `σ-pass`, `Δ-pass`, `presheaf`, and `projection` join the substrate's normative vocabulary.
They are added to [references/vocabulary-translation.md](../references/vocabulary-translation.md) as the canonical engineering names for the captain's older "saturation," "transfer," "tower of levels" idioms.
