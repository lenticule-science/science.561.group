---
title: "Stratified facts"
description: "Every fact in the substrate is tagged with the stratum it lives at — asserted, saturated, or settled — and behaves differently under retraction, federation merge, and witnessing accordingly."
kind: spec
status: normative
version: "0.1"
sources:
  - "operations/engineering/triage/operations/command/ideas/triage/dont-flatten-the-tower.md"
---

# Stratified facts

Facts in the substrate do not all live at the same level of derivation.
A claim handed in by an external sender (level 0) is structurally a different kind of object from a fact produced by a closure-rule firing under the σ-nucleus (level 1) and from a fact promoted by the Δ-nucleus to bilattice stability (level 2).
Conflating them — storing all three as identical EAVT entries — loses the structure that distinguishes them and makes retraction, federation merge, and audit silently incorrect.

This spec defines the **stratum tag** that every cell record carries, the lifecycle that moves a fact between strata, and the rules that govern its interaction with the rest of the substrate.
The σ-pass and Δ-pass are specified separately in [sigma-delta-passes.md](sigma-delta-passes.md).
The on-disk and in-memory storage layout that makes stratum-indexed projection efficient is specified in [presheaf-storage.md](presheaf-storage.md).

The framing is committed in [decisions/events-are-stratified-substrate-is-a-presheaf.md](../../decisions/events-are-stratified-substrate-is-a-presheaf.md).

## 1. The three strata

| Stratum | Tag | Mathematical object | Meaning |
|---|---|---|---|
| 0 | `"asserted"` | raw cell `(s, p, o, v)` | A claim made by an external sender. Not yet exposed to closure rules. |
| 1 | `"saturated"` | element of the closed fiber $H_t = \sigma(\text{asserted}_t)$ | A fact derivable from asserted facts under one or more σ-pass firings. |
| 2 | `"settled"` | element of the fixed fiber $H^*_t = \text{Fix}(\sigma) \cap \text{Fix}(\Delta)$ | A fact whose value is stable under both σ-saturation and Δ-stabilization. |

The wire-form value for the cell-atom `stratum` field (per [../filesystem/cell-record.md](../filesystem/cell-record.md) §1) MUST be exactly one of the three strings `"asserted"`, `"saturated"`, `"settled"`.

The stratum is a property of the **cell atom**, not of the fiber snapshot.
A cell atom carries one stratum; a fiber snapshot inherits its stratum from the presheaf projection that produced it (per [../filesystem/cell-record.md](../filesystem/cell-record.md) §1.5).
When a snapshot at stratum `"settled"` is read, every cell atom inside it has `stratum == "settled"`; the by-stratum snapshot files are the materialisation of `project_stratum(fiber, s)` per [presheaf-storage.md](../filesystem/presheaf-storage.md) §3.

A fourth implicit level — observable, the global section $\Gamma(H^*)$ — is not stored as a stratum tag because it is not a substrate-internal fact: it is what the MCP / HTTP read surface exposes after projection (see §6).

## 2. Lifecycle

A cell's stratum advances under the [respond](respond.md) phase machinery:

1. **Phase 2 (payload composition)** writes cells at stratum `"asserted"`.
  The sender's authority fiber composes via $\Rightarrow$, but the resulting cells stay at stratum 0 — they have not yet been exposed to the closure-rule system.
2. **Phase 3.σ (σ-pass)** reads asserted cells, fires closure rules in breadth-first layers, and emits new cells at stratum `"saturated"`.
  Asserted cells are NOT promoted; saturated cells are NEW records pointing back to the asserted premises that justified them (see §4 on witness chains).
3. **Phase 3.Δ (Δ-pass)** reads the union of asserted and saturated cells and runs bilattice stabilization (the bounded $\odot$ / $\Rightarrow$ settlement; see [computational-model.md](computational-model.md) §2).
  Cells whose value is stable under both σ and Δ are emitted at stratum `"settled"`.

Each promotion is a NEW cell record with its own SHA-256 id.
The original record at the lower stratum remains in the event log; storage projection sees both.
Retraction (§3) is the reason promotion does not destroy the lower-stratum record.

A cell's stratum NEVER moves backward: a saturated cell is not demoted to asserted, a settled cell is not demoted to saturated.
Demotion is achieved by RETRACTION of the higher-stratum record (§3), which leaves the lower-stratum record visible as before.

## 3. Retraction

Retraction is the operation that separates the strata most sharply.

- **Asserted cells.** An asserted cell may be retracted only by an explicit `cell` event from a sender with authority to retract it (see [capability-not-acl](../../decisions/capability-not-acl.md); the per-stratum capability fiber that scopes that authority is specified in [security/capability-model.md](../security/capability-model.md) §3a).
  Retraction is a new cell record at the same `(s, p, o)` with a denying value, subject to settling-monotonicity in $\le_k$.
  Asserted facts are NOT retracted by changes to other facts; they are first-class claims.

- **Saturated cells.** A saturated cell is **derived**: it exists because a closure rule fired against asserted (and possibly other saturated) premises.
  If any of those premises is retracted, the saturated cell becomes **dependently invalid**.
  The σ-pass detects dependent invalidity and emits a corresponding retraction-cell at stratum `"saturated"`.
  This is the load-bearing reason the stratum tag exists: an asserted fact and a saturated fact look identical at $(s, p, o, v)$ but respond completely differently to upstream change.

- **Settled cells.** A settled cell becomes invalid whenever EITHER the underlying saturated fiber moves (a σ-pass conclusion changed) OR the bilattice stabilization yields a different fixed point (a Δ-pass result changed).
  The Δ-pass detects this and emits a retraction-cell at stratum `"settled"`.

Retraction of a higher-stratum cell does not cascade through events that have already been emitted — past observers saw the old value as of their event ordinal, and that fact remains true.
Retraction emits new records at the current ordinal, and downstream replays after that ordinal observe the new state.
This preserves the [event-ordinal-is-time](../../decisions/event-ordinal-is-time.md) commitment.

## 4. Witness chains

Every cell atom at stratum > 0 carries a witness pointing to the lower-stratum cell atoms that justified its emission.
This is the on-disk encoding of the derivation tower.

Witness chains live on the cell atom, not on the fiber snapshot.
A snapshot is a bundle of atoms; each atom in the bundle carries its own `derived_from` / `derived_via` independently.
This is what makes the per-stratum projection well-defined: `project_stratum(fiber, "saturated")` returns the atoms whose `stratum == "saturated"`, each with its own witness chain pointing into atoms at strictly lower strata.

Two new optional fields on the cell-atom schema (see [../filesystem/cell-record.md](../filesystem/cell-record.md) §1.1):

| Field | Type | Meaning |
|---|---|---|
| `derived_from` | array of cell-ids | The cells (asserted or lower-saturated) that justified this firing. Required for stratum `"saturated"` and `"settled"`. |
| `derived_via` | string | The closure-rule id (for `"saturated"`) or the algebraic operator (for `"settled"`, e.g. `"⊙-stabilize"` / `"⇒-stabilize"`). |

The witness chain has these properties:

1. **Acyclicity within a respond round.** Within a single `respond` invocation, the `derived_from` graph is a DAG: a saturated cell points only to cells whose stratum is strictly less than its own (or, within stratum `"saturated"`, only to cells fired in a strictly earlier σ-pass layer).
2. **Replay attestability.** The witness chain is part of the cell's canonical bytes; a verifier replaying the event log from the same asserted premises MUST produce the same `derived_from` set.
  Mismatch is `PCC_WITNESS_DIVERGED`.
3. **Composition with the evidence vector.** The [evidence-vector](evidence-vector.md) of a `respond` invocation is the existing pre-stratum hash sequence; the witness chain on each emitted cell is a finer-grained per-cell attestation that an auditor can walk independently.

Witness chains are not optional for derived cells: an implementation that emits saturated or settled cells without `derived_from` MUST surface `PCC_MISSING_WITNESS`.

## 5. Federation merge

The merge operator $\odot$ (per [federation-protocol](../network/federation-protocol.md) §7) was specified for flat cells.
With stratification, merge is **stratum-respecting**:

1. Two cells at the same stratum and same `(s, p, o)` merge via $\odot$ exactly as before.
  The merged cell carries the same stratum tag and a `derived_from` list that unions both parents' witnesses (or, if both are stratum `"asserted"`, an empty `derived_from`).
2. Cells at different strata are NOT merged into a single record.
  They coexist: a peer's asserted claim and the local substrate's saturated derivation of a contradicting value live as two cells, both visible to projection.
3. The peer scope rule (per [federation-protocol](../network/federation-protocol.md) §8) applies per stratum: a peer may be authorized to contribute asserted cells but not saturated or settled ones (which would be an attempt to bypass the local σ/Δ engine).

Default peer-stratum policy: a peer may contribute `"asserted"` cells freely; `"saturated"` and `"settled"` cells from a peer are absorbed only if the peer's authority fiber explicitly grants `derivation-trust` for the relevant predicate.
Otherwise the peer's higher-stratum cells are demoted to `"asserted"` at receive time (the receiving substrate runs its own σ-pass against them).

## 6. Projection to the read surface

The MCP and HTTP read surfaces ([drivers/mcp-driver.md](../drivers/mcp-driver.md), [network/http-addressing.md](../network/http-addressing.md)) expose cells via projection per [presheaf-storage.md](presheaf-storage.md).
The default projection for a query is:

- `get_cell(id)` — exact cell, with its stratum tag visible.
- `get_fiber(entity)` — the **settled** projection: only cells at stratum `"settled"`.
  This is the global section $\Gamma(H^*)$ that downstream consumers should read.
- `get_fiber(entity, stratum=...)
  ` — explicit stratum projection for tooling, audit, and the σ/Δ engine itself.
- `entity_history(entity)` — full event sequence, all strata, in event-ordinal order.

A consumer that reads `get_fiber(entity)` without specifying a stratum receives the settled fiber by default.
This is the substrate's commitment that "what the OS will tell you is true" is the stratum-2 projection — not a flattened mixture of asserted and saturated facts.

## 7. Compatibility with v0.1

The v0.1 substrate ships with the stratum field added to the cell-record schema (per [../filesystem/cell-record.md](../filesystem/cell-record.md) §1) and the σ/Δ-pass split implemented (per [sigma-delta-passes.md](sigma-delta-passes.md)).
There is no migration burden because no substrate has shipped yet — the stratum field is in the schema from day one.

For an implementation that has not yet implemented the σ/Δ split, the conservative behaviour is:

- All cells from external `respond` invocations are emitted at `"asserted"`.
- All cells from closure-rule firings are emitted at `"saturated"`.
- All cells whose value moved during $\odot$/$\Rightarrow$ stabilization are emitted at `"settled"`.

This minimum implementation passes the stratum-conformance vectors (per [conformance-vectors.md](../conformance-vectors.md) §11).
Richer behaviour (correct dependent-invalidity tracking under retraction; settled-fiber re-derivation when premises move) is also part of the conformance suite; see the σ/Δ spec.

## 8. Errors

| Code | Meaning |
|---|---|
| `PCC_UNKNOWN_STRATUM` | Cell record has a `stratum` field whose value is not one of the three named strings. |
| `PCC_MISSING_STRATUM` | Cell record at v0.1+ lacks the `stratum` field entirely. |
| `PCC_MISSING_WITNESS` | Cell at stratum `"saturated"` or `"settled"` lacks `derived_from`. |
| `PCC_STRATUM_MONOTONICITY_FAIL` | A new cell record claims to be at a lower stratum than the prior cell at the same `(s, p, o)`. |
| `PCC_WITNESS_DIVERGED` | Replay produced a different `derived_from` set than the recorded cell. |
| `PCS_DERIVATION_TRUST_DENIED` | Peer attempted to contribute a `"saturated"` / `"settled"` cell without `derivation-trust`. |

## 9. Relationship to PredCat

Stratification is the engineering reflection of the [closure-rule system](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) operating on a fiber-with-derivation-history.
The math says the σ-nucleus and the Δ-nucleus are distinct closure operators on the predication-category; this spec says how the substrate stores the discriminating tag at the wire-format level so the distinction survives serialization, replay, and federation.

## 10. Out of scope

- The voidmath geometric layer and wavefront settlement compose with stratification but are specified separately.
  The σ/Δ spec notes the seam where wavefront-settle reads the saturated stratum.
- Presheaf-theoretic formalization beyond what the substrate consumes; see [references/triage-backlog-os-level.md](../../references/triage-backlog-os-level.md) for the captain's source material.
- Migration tooling for an already-deployed substrate. v0.1 ships stratification from day one; no migration applies.
