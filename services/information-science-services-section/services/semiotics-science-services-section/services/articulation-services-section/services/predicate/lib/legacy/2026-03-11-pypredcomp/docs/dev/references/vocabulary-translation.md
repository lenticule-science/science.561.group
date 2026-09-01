---
title: "Vocabulary translation"
description: "Systematic translation from the captain's pre-PredCat spec vocabulary to current PredCat / PredComp / AgOP terms."
kind: reference
---


The captain's older specifications (semiotic-cell-machine, GFRTU, sscu-sprint, FaRS-analyses) are written in terms that predate the predication-categories crystallization.
This table maps them forward, term-by-term, so the agent can read either vocabulary and recognize the same structure.

The math substrate underneath has cleaned up; the engineering content carries forward intact.

## Substrate

| Older term | Current term | Notes |
|---|---|---|
| GFRTU (Generative Fibered Recognition Trace Universe) | predication-category fibration | The mathematical universe. PredCat handles this with cleaner foundations. |
| Cell / CDS payload | settled fiber over an entity, *or* a single predication-cell record | "Cell" was overloaded in CCE — it meant the whole entity-with-its-fiber. We split: a cell record is one $(s,p,o,v)$; a fiber is the collection. |
| CDS (Cellular Data Serialization) | the cell-record / fiber wire format | See [specs/cell-record.md](../specs/cell-record.md), [specs/canonicalization.md](../specs/canonicalization.md). |
| Site, sieves, Heyting topology | predicate-category structure | The four canonical morphism classes (subject-projection, object-projection, specialization, converse) replace site/sieves. |
| Recognition fibers, fixed layer | predication fibers | The "fixed layer" was the settled state; with the bilattice we don't need a separate name. |
| σ, Δ tables | bilattice operator tables | $\odot$ and $\Rightarrow$ on the four values. The σ/Δ naming survives only as the **σ/Δ faces of records** (saturation, transfer). |
| Recognition objects | entities | |

## Closure

| Older term | Current term |
|---|---|
| CCE (Cellular Closure Engine) | the closure engine internal to [`respond`](../specs/respond.md) |
| `cce_apply(cell, judgment)` | `respond(target, payload, sender?)` |
| `cce_merge(c1, c2)` | $\odot$-merge across federated peers (see [federation-protocol.md](../specs/federation-protocol.md) — TODO) |
| Generative closure / UG operator iteration | closure-rule system iteration to fixed point |
| Constructors | closure rules |
| RTL judgment | message + sender |
| RTL signature | substrate's predicate vocabulary + function catalog |
| Plus-construction sheaf gluing | fiber-merge via $\odot$ |
| σ/Δ stabilization | bilattice operator iteration (still bounded; same property) |
| `defining_expression` | optional metadata listing closure rules and fuel that produced a fiber |
| `closure_depth` (default 16) | global fuel default for `respond` |
| Repair log | unchanged — see [specs/repair-log.md](../specs/repair-log.md) |
| Evidence vector | unchanged — see [specs/evidence-vector.md](../specs/evidence-vector.md) |

## Storage and transport

| Older term | Current term |
|---|---|
| CDS-Storage | the predication-graph store; layout per [specs/storage-layout.md](../specs/storage-layout.md) |
| `$ROOT/cells/<pp>/<cell-id>.json` | unchanged path scheme |
| `PutCell`, `GetCell`, `HasCell` | `put_record`, `get_record`, `has_record` (see [specs/runtime-cycles.md](../specs/runtime-cycles.md) §1) |
| CCE-ABI | absorbed into MCP surface (see [specs/mcp-surface.md](../specs/mcp-surface.md)) |
| CCE-RPC | absorbed into MCP surface |
| Node-cycle | runtime-cycles ([specs/runtime-cycles.md](../specs/runtime-cycles.md)) |
| Node-addressing | HTTP-addressing ([specs/http-addressing.md](../specs/http-addressing.md)) |
| RDF profile | RDF projection (interfacer; spec pending) |

## Error codes

| Older code prefix | Current prefix |
|---|---|
| `CCE_*` (closure engine errors) | `PCR_*` (predicated-computing rule) |
| `CDS_*` (cell-data errors) | `PCC_*` (predicated-computing cell) |
| `RTL_*` (term-language errors) | `PCM_*` (predicated-computing message) |
| `CS_ERR_*` (storage errors) | `PCS_*` (predicated-computing storage) |
| (new) | `PCE_*` (event log), `PCA_*` (auth/scope), `PCH_*` (heartbeat), `PCF_*` (federation) |

The textual code form survives; only the prefix changes (and additions are made for areas the older specs didn't cover, like federation and event-log-specific errors).

## Agential layer

| Older term | Current term |
|---|---|
| FARS (Flatfile Agentic Resource System) | now a sub-theory of AgOP at the flatfile substrate; but most "FaRS" content has been absorbed into PredComp and AgOP. |
| FAOH (FARS Agent Orchestration Harness) | absorbed; harness composition is `respond(office, "compose-context", session)` |
| MASH (Multi-Agent Semiotic Hub) | the heartbeat / runtime; see [specs/runtime-cycles.md](../specs/runtime-cycles.md) |
| FaRS "respond()" primitive | `respond` ([specs/respond.md](../specs/respond.md)) |
| FaRS fiber | predication-fiber |
| FaRS skill / runbook / instinct / observation | substrate entities; see [specs/apps/review.md](../specs/apps/review.md), [specs/apps/sessions.md](../specs/apps/sessions.md) |

## Worldbuilding / simulation

| Older term | Current term |
|---|---|
| Praxon (praxonic worldmaking) | substrate entity; see [specs/apps/simulation.md](../specs/apps/simulation.md) |
| IRN (irresolved noise) | $\top$-cells |
| Trace, decay, alignment, recursion (praxonic terms) | substrate-cell trajectories under closure-rule firings; see [specs/apps/simulation.md](../specs/apps/simulation.md) |

## Voidmath / earlier framings

| Older term | Current term |
|---|---|
| Voidmath | early name for the math now in PredCat |
| Four-position taxonomy (settled-partnered, etc.) | settlement-trajectory positions in the bilattice's joint $\le_k / \le_t$ space |
| Bypass cones | predicate-category neighborhood structure |
| Tower / fold | closure-iteration over levels (level-n settled entities become level-n+1 atoms); engineered as the **stratum tag** on cell records (`asserted` / `saturated` / `settled`), see [specs/kernel/stratified-facts.md](../specs/kernel/stratified-facts.md). |
| "σ face of a record" / "saturation" (captain's older idiom) | **σ-pass** output — cells emitted at stratum `"saturated"`; see [specs/kernel/sigma-delta-passes.md](../specs/kernel/sigma-delta-passes.md). |
| "Δ face of a record" / "transfer" (captain's older idiom) | **Δ-pass** output — cells emitted at stratum `"settled"`; same spec. |
| Flat fiber over an entity | **presheaf** indexed by (entity, stratum, peer, session, ord); see [specs/filesystem/presheaf-storage.md](../specs/filesystem/presheaf-storage.md). The flat-fiber view is recoverable as `project_stratum(fiber, "settled") · project_self_only`. |
| Re-reading state from a different vantage | **projection** along a presheaf morphism; not a recomputation. |

## Reading the older specs

When reading any of the captain's pre-PredCat specs, mentally substitute using this table.
The structural commitments — wire format, hash discipline, repair-log shape, evidence vector, error code naming, fuel bounds — carry forward intact.
The mathematical foundation underneath (sites with Heyting topology vs. predicate-categories with bilattice fibers) is cleaner now but operationally equivalent for the engineering work the agent is doing.

The agent does not need to read the older specs unless this directory cites them for a specific construction (in which case the cite includes a path under `operations/engineering/triage/...
`).
The new specs in [specs/](../specs/) are the working contracts; this table is for the cases when the agent encounters older terms in code, comments, or archived discussion.
