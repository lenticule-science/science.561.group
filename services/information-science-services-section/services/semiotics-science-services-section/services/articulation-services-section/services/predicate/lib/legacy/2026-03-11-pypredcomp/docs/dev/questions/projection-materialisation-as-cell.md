---
title: "Should per-stratum projections be materialised as content-addressed cells?"
description: "Today projections are computed on read per filesystem/presheaf-storage.md and kernel/projection-naturality.md. v0.2b observability dashboards will read them often. Should the materialised projection be itself a cell — content-addressed, in the event log — or a derived artifact outside the substrate?"
kind: question
status: open
opened: 2026-05-02
opened-by: agent
disposition-default: defer-to-v0.2b
---

# Should per-stratum projections be materialised as content-addressed cells?

## Question

Should per-stratum projections be materialised as content-addressed cells (durable, in the event log, queryable through standard cell surfaces), kept as on-read derived artifacts (recomputed on each read from the input cells), or implemented as virtual cells (queryable by computed hash but discarded post-query)?

## Context

[`filesystem/presheaf-storage.md`](../specs/filesystem/presheaf-storage.md) §4.2 (after round-2's tightening) and [`kernel/projection-naturality.md`](../specs/kernel/projection-naturality.md) specify that per-stratum projections are functorial and on-read in v0.2.
The [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) theorem says content-addressed caches don't go stale.

The v0.2b observability work ([milestones/v0.2b-drivers-observability-packaging.md](../milestones/v0.2b-drivers-observability-packaging.md)) will read per-stratum projections often (every dashboard refresh, every error-investigation walk).
The question: should the substrate materialise the projection *as a cell* — making it content-addressed, hash-injective, replayable, and queryable through the same surfaces as any other cell — or as a *derived artifact* outside the substrate (a sidecar file, a memoisation table)?

## Why this is a real question

Three pulls.

**Pull toward materialise-as-cell:**

- Inherits cache coherence structurally per [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) — no invalidation logic.
- Reads of the materialised projection are free per [`cost-discipline-reads-free`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md) — same as any other read.
- Federation receives the materialised projection per the standard cell receive path, not a separate sync.
- Replay reproduces the materialisation byte-identically per the existing replay discipline.

**Pull toward derived-artifact:**

- The materialised projection is *strictly* a function of the input cells; storing it as a cell is data duplication on disk.
- Recomputing on read is cheap because the input cells are content-addressed and the computation is functorial.
- Adding a new cell kind ("projection-cell") expands the substrate's surface and requires every higher-level reader to know about it.
- The σ/Δ closure passes do not need projection-cells — they read fiber projections directly; a materialised form is purely an optimisation.

**Pull toward a third path — virtual-cell:**

- A "virtual" projection that *behaves* like a cell (queryable, content-addressable by computed hash) but is computed on read.
  This preserves the queryable surface without the disk-duplication.
- Conceptually clean but requires a query-layer extension: the storage layer must know to materialise on read and discard post-query.

## Default disposition

**`defer-to-v0.2b`**: keep the on-read computation discipline as specified by [`filesystem/presheaf-storage.md`](../specs/filesystem/presheaf-storage.md) §4.2 and [`kernel/projection-naturality.md`](../specs/kernel/projection-naturality.md).
Materialisation is a v0.2b observability optimisation — authorised only if the v0.2b dashboards measure on-read recomputation as insufficient.
If the v0.2b ship targets pass without the optimisation being needed, the question is closed in favour of on-read.

## What would resolve it

A captain decision after at least one of:

1. The v0.2b observability dashboards measure per-stratum projection read latency and find on-read recomputation insufficient.
2. The v0.4 federation work needs to ship a projection across a peer without re-deriving it on the receiving side.
3. A future closure rule produces a *projection* as its conclusion (forces projection-cells into the σ-pass output discipline).

Default disposition if none of (1)–(3) materialise by v0.2b ships: **keep on-read computation**; the cache-coherence theorem makes on-read free, and the materialised form is an optimisation that the v0.2b observability work can authorise *if it measures need*.

## Stakes

**Low** if the on-read discipline scales to the v0.2b dashboard read patterns — the discipline already covers everything except disk-storage shape.

**Medium** if v0.4 federation needs to ship materialised projections — at that point the materialisation question becomes a federation wire-format question and binds tightly to [decisions/federation-by-construction](../decisions/federation-by-construction.md).

**Low** if a future closure rule produces a projection — the σ-pass discipline already handles cell production; projection-cells would be a special case of a more general "structured cell output" extension.

## Options

The three pulls above crystallise into three captain-decidable options corresponding to three categorical positions on the section-of-the-projection-presheaf.

### Option A — section-as-object (materialise-as-cell)

The per-stratum projection is itself a substrate cell, content-addressed by `SHA-256(canonical(input-cells, stratum, projection-spec))`.
It lives in the event log; it federates by the standard cell-receive path; replay reproduces it byte-identically.

- **Categorical position.** The section is an *object* of the presheaf category; cells are the objects, and the materialised projection is one.
- **Substrate consequence.** A new cell kind (`projection-cell`); higher-level readers learn one new shape; cache coherence is structural per [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md); reads are free per [`cost-discipline-reads-free`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md).
- **Ship-target witness shape.** A v0.2b dashboard read of the materialised projection produces a `read` cost-class witness; replay across two boot cycles reproduces the projection-cell id byte-identically.
- **Cost.** Disk duplication (the projection is a function of input cells already on disk).
- **Back-out.** Stop authoring `projection-cell`s; existing ones become inert content-addressed history.
  The on-read computation is unchanged.
- **Best when.** v0.2b dashboards measure on-read recomputation as insufficient *and* the dashboards become the dominant read pattern.
  Or v0.4 federation needs to ship pre-derived projections.

### Option B — section-as-morphism (on-read derived artifact)

Per-stratum projections are computed on each read from the input cells.
No materialisation; the projection lives only in memory at query time.
This is the v0.2 status quo per [`filesystem/presheaf-storage.md`](../specs/filesystem/presheaf-storage.md) §4.2 and [`kernel/projection-naturality.md`](../specs/kernel/projection-naturality.md).

- **Categorical position.** The section is a *morphism* of the presheaf category — the projection morphism applied at read time.
- **Substrate consequence.** No new cell kind; higher-level readers see one surface (input cells); the projection is computed inside the storage layer; cache coherence is trivially structural.
- **Ship-target witness shape.** Read latency on the v0.2b dashboards is the gate.
  If acceptable, no further action; if not, escalate to A or C.
- **Cost.** Recomputation on each read.
  Bounded by input-cell content addressing; cheap on small input sets, super-linear on large fibers.
- **Back-out.** Already the default; no back-out needed.
- **Best when.** v0.2b dashboards' read latency is acceptable.
  Or the consuming surface is rare (audit traversal, not real-time UI).

### Option C — section-as-functor (virtual-cell)

A "virtual" projection that *behaves* like a cell (queryable by computed hash, addressable through the standard cell surface) but is computed on read and discarded post-query.
The query layer knows to materialise on demand and not persist.

- **Categorical position.** The section is a *functor* — the projection functor evaluated at query time, presented to readers as a cell.
- **Substrate consequence.** A query-layer extension: the storage layer must distinguish "ask for cell X" (real cell) from "ask for virtual-cell V (computed)".
  Higher-level readers see one surface; the virtual case is invisible at the read API.
- **Ship-target witness shape.** Same as B at the consuming surface; the difference is only inside the storage layer.
  Replay reproduces the computed hash byte-identically (so federation can address virtual cells by id even if neither side has materialised them).
- **Cost.** Recomputation on each read (same as B); plus the query-layer extension's implementation cost.
- **Back-out.** Remove the query-layer extension; readers fall back to addressing input cells directly.
- **Best when.** Federation needs to address projections by id (so a peer can request "give me your projection at hash H") without committing to materialisation on either side.
  Allows lazy resolution.

### Comparison

| Dimension | A. section-as-object | B. section-as-morphism | C. section-as-functor |
|---|---|---|---|
| Categorical position | object | morphism | functor |
| New cell kind | yes (`projection-cell`) | no | no (virtual) |
| Disk duplication | yes | no | no |
| Read latency | low (cached) | recomputed | recomputed |
| Federation byte-identical | yes (cell receive) | n/a (no cross-node sync) | yes (by computed hash) |
| Replay byte-identical | yes | yes (deterministic recomputation) | yes (deterministic computed hash) |
| v0.2b dashboard fitness | best | depends on latency | same as B |
| v0.4 federation fitness | best | weakest | adequate |

### Recommended-for-captain ordering

The agent's recommended evaluation order, **conditional on what the v0.2b dashboards actually measure**:

1. Stay at **B** (default disposition); ship v0.2b with on-read.
2. If dashboard latency is the bottleneck → upgrade to **A** for the dashboard-consumed strata only (a partial materialisation; the unconsumed strata remain on-read).
3. If v0.4 federation ships pre-derived projections → upgrade to **A** universally.
4. Choose **C** only if federation requires address-by-hash before either side commits to materialisation.
  This is plausible but not yet a known v0.4 requirement.

The agent does **not** recommend C as the default: it adds query-layer surface that the substrate does not currently need, and the categorical clarity (functor-vs-object) is real but does not justify the extra layer pre-emptively.

## Cross-references

- [`filesystem/presheaf-storage.md`](../specs/filesystem/presheaf-storage.md) §4.2
- [`kernel/projection-naturality.md`](../specs/kernel/projection-naturality.md)
- [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md)
- [`cost-discipline-reads-free`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md)
