---
title: "Presheaf storage"
description: "Fibers are stored as a presheaf indexed by context (stratum, peer, session, ord) rather than as a flat set. Re-reading from a different vantage is a projection, not a recomputation."
kind: spec
status: normative
version: "0.1"
sources:
  - "operations/engineering/triage/operations/command/ideas/triage/dont-flatten-the-tower.md"
---

# Presheaf storage

The substrate's fiber storage is not a flat set of cells.
It is a **presheaf** indexed by the contexts under which a query may be made: stratum (per [../kernel/stratified-facts.md](../kernel/stratified-facts.md)), originating peer, originating session, and event-ordinal cursor.
Materialised fibers and on-disk projections are organised so that asking "what does the substrate believe at stratum X under peer Y as of ord N" is a deterministic *projection* of stored data, not a recomputation from scratch.

The framing is committed in [decisions/events-are-stratified-substrate-is-a-presheaf.md](../../decisions/events-are-stratified-substrate-is-a-presheaf.md).
This spec specifies the indexing dimensions, the projection operators an executor needs, the on-disk layout that supports them, and the migration story (which is none — v0.1 ships this from day one).

## 1. Why a presheaf

A flat fiber storage answers the question "what is the value at $(s, p, o)$?" by returning a single value.
That answers "what does the substrate believe?" only when the substrate has exactly one vantage.
The actual substrate has several:

- **Stratum vantage.** The asserted, saturated, and settled views differ — they MUST differ for the substrate to handle retraction correctly per [../kernel/stratified-facts.md](../kernel/stratified-facts.md) §3.
- **Peer vantage.** Federation peers contribute cells; "what do *we* think" vs "what does peer X think" vs "what does the union say" are three different questions, all legitimate.
- **Session vantage.** A session in flight may have written cells that are not yet settled; queries inside that session see one fiber, queries from outside see another (per [process/session-as-process.md](../process/session-as-process.md) when that ships at v0.2).
- **Temporal vantage.** "What was true at ord N" and "what is true now" are projections of the same storage at different cursors.

A presheaf is the mathematical object that admits all four projections as morphisms from the storage object.
Storing the substrate as a presheaf means each query is `read · project_C` for some context `C`, and re-projection at a different context is reading the same data through a different morphism — not rebuilding state.

## 2. Indexing dimensions

A cell-record's location in the presheaf is determined by four indices, derived from the cell-record fields and the event-log envelope:

| Index | Source | Cardinality | Notes |
|---|---|---|---|
| `entity` | cell-record `s` | unbounded | The subject entity slug. The primary index. |
| `stratum` | cell-record `stratum` (§4 of [cell-record.md](cell-record.md)) | 3 | `"asserted"` \| `"saturated"` \| `"settled"`. |
| `peer` | event-log envelope `peer` field (§1 of [event-log.md](event-log.md)) | small (peer count) | Originating node. `"self"` is the implicit local origin. |
| `session` | cell-record `sender` resolved to a session entity | session count | The session within which the cell was authored. May be absent for system-authored cells. |

(Predicate, object, and event-ordinal are not separate indices — predicate and object are part of the cell-record's $(s, p, o)$ key; event-ordinal is the temporal cursor and is implicit in any read.)

The "fiber at entity E under context C" is the set of cell records whose `s = E` and whose other indices satisfy C, projected by event-ordinal cursor.

## 3. Projection operators

An executor reading the presheaf invokes a projection.
The projection operators are:

```text
project_stratum(fiber, s)       — cells at stratum s. Default: "settled".
project_stratum_at_or_below(fiber, s)
                                — cells at stratum ≤ s in the §1 ordering. Useful for σ/Δ engine input.
project_peer(fiber, p)          — cells contributed by peer p. p = "self" returns local-origin cells.
project_peers(fiber, P)         — cells contributed by any peer in set P. The substrate's "what we and our trusted peers think."
project_session(fiber, sess)    — cells authored by session sess.
project_at_ord(fiber, n)        — cells visible up to event-ordinal n. Cells emitted later are excluded.
project_self_only(fiber)        — equivalent to project_peer(fiber, "self").
project_full(fiber)             — every cell in the presheaf, regardless of context.
```

Projections compose: `project_stratum(project_peer(fiber, P), s)` is well-defined and equals the fiber-cells satisfying both context constraints.
Composition is order-independent (commutative across distinct indices).
Implementations MAY exploit this for query planning.

The default fiber returned by `get_fiber(entity)` (per [../kernel/stratified-facts.md](../kernel/stratified-facts.md) §6) is `project_stratum(project_self_only(project_at_ord(fiber, current_ord)), "settled")`.
This is the substrate's "what is true here right now" view.

A projection is a *pure read*: it does not mutate the presheaf, does not advance event-ordinal, and does not invoke `respond`.
It is the read-side analogue of `respond`'s write-side single-primitive discipline.

## 4. On-disk layout

The presheaf is stored on disk as an extension of the existing storage layout (per [storage-layout.md](storage-layout.md)).

### 4.1 Cell atoms (event-body residents; per-cell files optional)

Cell atoms live inside event bodies in [events.jsonl](event-log.md), per [cell-record.md](cell-record.md) §0.
They carry the `stratum` field and the witness fields `derived_from` / `derived_via` for stratum > `"asserted"`.
Atoms are content-addressed by SHA-256 of their canonical bytes; the same `(s, p, o, v)` at different strata or with different witnesses produces different ids.

Per-cell file materialisation at `$ROOT/cells/<pp>/<id>.json` is optional (per [cell-record.md](cell-record.md) §7).
The recommended materialisation path is fiber-snapshot files (§4.2 below), which are the disk form of presheaf projections.

### 4.2 Fiber snapshots (the canonical materialisation)

The presheaf is materialised on disk as fiber-snapshot files (per [cell-record.md](cell-record.md) §1.5).
Each snapshot file IS the disk form of one presheaf projection at one event-ordinal cursor — a finite bundle of cell atoms in event-ordinal order, with the projection's `(entity, stratum, peer, session, ord)` context encoded by the file path.

**Naturality invariant.** The on-disk by-stratum / by-peer / by-session layout below is the *disk form* of the presheaf functor; the algebraic constraints those projection files must satisfy (presheaf functoriality of `restrict`, naturality of `merge` under `project`, monotonicity under event-ordinal advancement, identity-on-trivial-context) are specified normatively in [../kernel/projection-naturality.md](../kernel/projection-naturality.md).
Any implementation that materialises projection files MUST honour those invariants; in particular, two projection files written for the same `(entity, context, ord)` MUST be byte-identical regardless of whether they were produced inline by σ/Δ or rebuilt by the boot-time fiber-cache reconcile per [../init-boot/boot-sequence.md](../init-boot/boot-sequence.md) §4.2.
Detected divergence surfaces as `PCC_PROJECTION_DIVERGED` (§8 below).

Fiber snapshots are organised by projection context:

```text
$ROOT/fibers/<entity-slug>/
  by-stratum/
    asserted.json     — settled projection at stratum "asserted", peer "self", session unrestricted
    saturated.json    — same at "saturated"
    settled.json      — same at "settled" (the canonical default fiber)
  by-peer/
    self.json         — same as self_only projection at the default stratum
    peer:<peer-id>.json   — fibers contributed by each known peer
  by-session/
    <session-id>.json — per-session fibers, written as the session emits cells
  full.json           — full union projection for audit and federation push
  history.jsonl       — optional per-entity event subset (unchanged from current spec)
```

All snapshot files are caches: deletion does not lose information, because a node can rebuild any snapshot by replaying the event log restricted to events naming that entity (per [storage-layout.md](storage-layout.md) §5) and projecting the resulting cell atoms.
Snapshot files are not signed and not federated; only events (and their embedded cell atoms) are.

The `settled.json` file is the canonical entry point for the read surface.
The other snapshots exist for the σ/Δ engine, the federation merge logic, the audit tooling, and the in-flight session view.
Each snapshot's content is the cell atoms — the per-predication source of truth — bundled for read-side efficiency, not a separate primitive that competes with the atom.

### 4.3 No projection product explosion

The cross-product of (stratum × peer × session) is potentially large; storing every cell of it would be wasteful.
Implementations MUST materialise only the projections actually requested by the read surface, plus the three by-stratum projections (always written by the σ/Δ engine), plus the by-peer projections for known peers (written at federation receive).
Per-session projections are written only for sessions that opt into projection caching; otherwise per-session reads are computed on demand from the event log.

## 5. Determinism

For byte-identical events.jsonl files:

1. The set of cell records under `$ROOT/cells/` is byte-identical (by [storage-layout.md](storage-layout.md) §9).
2. The contents of every materialised projection file under `$ROOT/fibers/` are byte-identical, given the same projection-materialisation policy.
3. A read `project_C(fiber)` against the presheaf produces a byte-identical result for byte-identical context `C` and byte-identical event-ordinal cursor.

Determinism extends the existing replay guarantee from "one fiber state" to "every projection of the presheaf."
This is the foundation for the federation peers' ability to verify each other's projections without trusting the projection files (they reproject locally and compare).

## 6. Read concurrency

Multiple readers may invoke projections concurrently with appenders.
A reader observing the presheaf at event-ordinal N is guaranteed to see all complete events with `ord ≤ N` (by the event-log read-concurrency guarantee per [event-log.md](event-log.md) §7).
Projections at the cursor `N` are deterministic regardless of concurrent appends.

A reader holding an event-ordinal cursor MAY advance the cursor as new events arrive.
Long-running consumers (the heartbeat, MCP subscribers) maintain their own ord-cursor and reproject at the new cursor when new events are visible.
Projection caches MAY be invalidated lazily; correctness is guaranteed because the cache key is the (entity, context, ord) triple.

## 7. Migration from a flat-event log

There is no migration story for v0.1.
The substrate ships with stratum-indexed presheaf storage from day one. v0.1 is "substrate boots" and no substrate has been deployed without this layout (per [milestones/v0.1-substrate-boots.md](../../milestones/v0.1-substrate-boots.md)).

For a post-v0.1 substrate that needs to absorb a peer running an earlier (flat-fibre) version: the absorbing substrate treats every cell from the peer as stratum `"asserted"` and runs its own σ/Δ pass to populate the saturated and settled strata.
The peer's flat-fibre cells map cleanly to the asserted stratum because that is exactly what they were — claims by an external sender, never run through the local σ-nucleus.

## 8. Errors

| Code | Meaning |
|---|---|
| `PCC_PROJECTION_DIVERGED` | A projection file's contents do not match a fresh re-projection from the event log. (Indicates cache corruption or implementation bug.) |
| `PCC_PROJECTION_UNKNOWN_INDEX` | Read requested a projection along an index not specified in §2. |
| `PCC_PROJECTION_AT_FUTURE_ORD` | Read requested an event-ordinal cursor beyond the current log tail. |

## 9. Relationship to the rest of the substrate

- **Cell records.** The cell-record schema gains `stratum`, `derived_from`, `derived_via` per [cell-record.md](cell-record.md).
  The presheaf is the in-memory and on-disk shape that hosts these enriched records.
- **Event log.** The event log itself remains a flat append-only sequence (per [event-log.md](event-log.md)).
  The presheaf is a *projection* of the event log; the log is the source of truth.
- **Closure engine.** The σ-pass reads `project_stratum_at_or_below(fiber, "saturated")`; the Δ-pass reads the union of saturated and asserted; the read surface returns `project_stratum(fiber, "settled")` by default.
  See [../kernel/sigma-delta-passes.md](../kernel/sigma-delta-passes.md) §2.
- **Projection naturality.** The algebra the on-disk layout realises — presheaf functoriality, naturality of merge under projection, identity-on-trivial-context — is specified in [../kernel/projection-naturality.md](../kernel/projection-naturality.md).
  The §4.2 layout is the disk form; that spec is the algebraic contract.
- **Boot-time reconcile.** [../init-boot/boot-sequence.md](../init-boot/boot-sequence.md) §4.2 rebuilds projection files from the event log on every boot and compares against existing files; mismatch is `PCC_PROJECTION_DIVERGED` and forces the boot to `degraded`.
- **Federation merge.** The merge operator $\odot$ is a presheaf morphism: per-peer projections compose into the union projection.
  See [../network/federation-protocol.md](../network/federation-protocol.md) §7 with [../kernel/stratified-facts.md](../kernel/stratified-facts.md) §5.
- **MCP read surface.** The MCP `get_fiber` and `query` tools accept context arguments selecting projection.
  Default projection is `(stratum="settled", peer="self", session=unrestricted)`.
  See [../drivers/mcp-driver.md](../drivers/mcp-driver.md).

## 10. Conformance gates

A conforming implementation:

1. Materialises the three by-stratum projections (`asserted.json`, `saturated.json`, `settled.json`) for every entity that the σ/Δ engine has touched in the current `respond` invocation.
2. Returns byte-identical projection bytes for byte-identical (event-log, entity, context, ord) tuples.
3. Surfaces `PCC_PROJECTION_DIVERGED` if a projection file fails its content-hash check at startup.
4. Discards projection files at startup recovery and rebuilds on demand (per [storage-layout.md](storage-layout.md) §11).
5. Passes the projection-conformance fixtures in [conformance-vectors.md](../conformance-vectors.md) §11 (round-trip, composition-commutativity, federation-merge respects projection).

## 11. Out of scope

- A presheaf-theoretic formalisation beyond what the substrate consumes (sites, Grothendieck topologies, sheafification beyond the bilattice $\odot$).
  The substrate's algebra is the operational realisation; the formal layer lives in the predication-category library.
- Projection along arbitrary user-supplied predicates as a first-class index.
  Filter-by-predicate is a stdlib `filter` operation (per [../stdlib/](../stdlib/)) on top of a projection, not a presheaf index.
- Multi-version concurrency control beyond the single-cursor read model.
  The event-ordinal IS the version.
