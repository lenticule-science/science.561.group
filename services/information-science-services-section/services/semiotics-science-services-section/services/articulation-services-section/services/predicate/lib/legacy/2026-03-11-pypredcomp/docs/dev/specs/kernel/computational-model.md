---
title: "Computational model"
description: "How the predicated computer computes — the relationship between fibers, traces, closure-rule firings, the heartbeat, and the event log."
kind: spec
status: normative
version: "0.1"
sources:
  - "operations/engineering/triage/library/triage/relationality/archive/sscu-sprint/domains/technology/domains/computing/domains/relational-computer/architecture.md"
---

# Computational model

A higher-level summary of how the predicated computer actually *computes*.
Reads in concert with [isa.md](isa.md) (the primitives), [respond.md](respond.md) (the dispatcher), [closure-engine-internals.md](closure-engine-internals.md) (the algorithm), and [runtime-cycles.md](runtime-cycles.md) (when things run).

## 1. What "computing" means here

A Boolean computer evaluates Boolean functions over bits.
A relational database evaluates relational queries over rows.
A predicated computer evaluates **closure operators** over [predication fibers](isa.md) under the [bilattice algebra](decisions/value-domain-is-belnap-2x2.md).
The result of a computation is a settled fiber; the trace of the computation is a witness chain in the partially commutative monoid of operator-applications.

Concretely, "compute" in this system means: given a fiber state and a message, iterate closure rules and their algebraic compositions until a fixed point, witnessed by a deterministic trace.

## 2. The settlement principle

The fundamental computational fact: **closure on the bilattice is decidable and bounded**.
The four-valued algebra reaches a fixed point in at most 2 iterations per cell for non-pathological inputs (Busaniche–Cignoli, restated for the predication setting).
This is what makes the substrate an algebra rather than a search procedure.

Concretely:

- Settlement is *finite*: every `respond` invocation terminates within configured fuel.
- Settlement is *deterministic*: byte-identical inputs produce byte-identical traces.
- Settlement is *replayable*: the event log + the closure rules + the seed fiber are sufficient to regenerate any past state.

These three properties are the substrate's promises to all higher layers.
They are not just theoretical; they are checkable at runtime via the [conformance vectors](conformance-vectors.md).

## 3. Three levels of computation

The system uses three computation levels, allocated by the judgment required:

### Level 1 — the substrate

ISA operators ([isa.md](isa.md)) and the closure engine ([closure-engine-internals.md](closure-engine-internals.md)).
Total, pure, deterministic, bounded.

This is **almost all of the computation**.
Every query is fiber composition.
Every dispatch is `fuse` of office fiber and task fiber.
Every settlement is `fix_fuse_restrict` to fixed point.

### Level 2 — deterministic scripts

Some work is fully procedural: parsing markdown, formatting JSON, computing trial balances, running format-fitting tests.
These are scripts (Python, Rust, Node) that read substrate state and produce derived outputs.

The captain's existing harness has 16+ such scripts for tasks like task-router, library-search, harness-audit, ledger-tool.
These continue to work; they read fiber projections rather than EAVT graphs.

The transition criterion: when a piece of agentic work has been done deterministically enough times that a script can replicate it, the work moves from Level 3 to Level 2.
This is the "settlement path applied to inference cost."

### Level 3 — LLM inference

Inference handles work that requires understanding: novel task decomposition, reading comprehension, writing prose, judgment under ambiguity.

Model tier (Opus / Sonnet / Haiku / local) is chosen by the office's `formality-level` predicate ([apps/dispatch.md](apps/dispatch.md)):

- F0 inquiry, no formal recognition predicates → Opus.
- F1 derivation, prose-level recognition → Sonnet.
- F2 procedure, structured recognition → Haiku.
- F3 process, fully algebraic recognition → script (Level 2) or hook (Level 1).

The system optimizes for **agent unnecessity** on routine work: every task should eventually be completable by Level 2 or Level 1.
The continuous-learning pipeline ([apps/review.md](apps/review.md)) is what drives that migration.

## 4. The heartbeat as the unit of time

The substrate's time is event-ordinal.
The heartbeat is what advances it.
See [runtime-cycles.md](runtime-cycles.md) §3.

Each heartbeat tick:

1. Reads pending messages from the inbox queue (from MCP / HTTP / federation peers / local schedulers).
2. For each message, runs `respond`.
  Closure rules fire.
  Repair log accretes.
  Evidence vector is computed if requested.
3. Appends events to the log.
  Cell-record files and fiber-cache files are updated.
4. Notifies subscribed views.
  WebSocket pushes go out.
5. Sleeps until next signal.

This is the main loop of the substrate.
Everything else is what feeds it (interfacers, peer sync) or what reads from it (UI, queries, audits).

## 5. The event log as the spine

`events.jsonl` is the source of truth ([event-log.md](event-log.md)).
Every fact about the substrate is derivable from it.
Replay produces byte-identical state.
Federation peers exchange events; merging is `fuse` per cell.

This means:

- The substrate is **content-addressable**: every record has a stable hash; every event has `id`, `prev`, `ord`.
- The substrate is **forkable**: snapshot a log; fork; the two forks can later be `fuse`-merged.
- The substrate is **auditable**: any past state is reachable by replay-up-to-ord; any decision is traceable to the events that fired it.
- The substrate is **federated by construction**: the merge operation is the same as local update.

These four properties are what make this not a database.
The database is a working memory; the substrate is the canonical history.

## 6. Cells, entities, and identity

An entity is whatever appears as `s` or `o` in cells.
There is no separate entity table; entities are reified by participation.
This means:

- Adding a new entity is appending a cell that names it.
- "Deleting" an entity is impossible; old cells remain in the log forever.
  (One can mark an entity as `(entity, retired-at, ord) = t`; queries filter accordingly.)
- Two entities have the same identity iff their slugs match.
  Slug uniqueness is global within a substrate.
- Federation peers contribute cells naming their own entities; cross-peer entity-name collisions produce $\top$-cells, surfacing the disagreement honestly.

Slugs follow the substrate's identifier alphabet ([cell-record.md](cell-record.md) §4): lower-kebab-case ASCII, optionally containing `:` and `/` for namespacing.
The colon convention separates entity-type from entity-id (e.g., `task:write-spec`, `office:planner`, `account:expenses:hosting`).

## 7. Composition

The substrate is one algebra.
Higher-level concepts compose:

```
session = closure-rule-firing where target = office-incumbent
        ⊙ payload = task-context

dispatch = fuse(office-fiber, task-fiber)
         followed by ranking by composed bilattice value

federation = fuse across peers
           with provenance preserved via signature predicate

closure-rule = substrate entity itself
             whose firing decomposes to ISA operations
             which decompose to bit-level operations on the host
```

Every layer reduces to the layer below.
The substrate's primitives are not extensible at the higher levels — adding "a new kind of operation" beyond the ISA would mean changing the substrate.
The algebra is closed.

## 8. The compute envelope

Practically:

- A `respond` call: median latency ≈ ms (in-memory); 99p latency depends on closure-rule fan-out and event-log fsync cadence.
- A federation sync: median ≈ network-RTT plus fuse cost (proportional to disagreement count).
- A heartbeat tick: as fast as new messages arrive; sleeps when idle.
- A full library replay (importing the captain's existing 11k+ entities): minutes on a single node, parallelizable per-fiber.
- Memory: in-memory fiber map + closure-rule cache + recent event tail.
  Configurable; degrades gracefully (LRU eviction) under pressure.
- Disk: `events.jsonl` grows monotonically.
  Compaction is a downstream operation; the slice doesn't compact.

These are not promises (they're implementation-dependent), but they're the rough envelope.
Sensor-rate ICS writes (per [apps/ics.md](apps/ics.md)) push the throughput; agential operation pushes the closure-rule diversity; the substrate handles both with the same machinery.

## 9. Cost model

The "settlement is finite" guarantee in §2 is qualitative; this section gives the engineering bounds.
The substrate's cost discipline is one Lawvere quantale per [decisions/cost-is-lawvere-quantale.md](../../decisions/cost-is-lawvere-quantale.md); per-respond cost composition is specified in [fuel-composition.md](fuel-composition.md).
This section gives the asymptotic envelope.

### 9.1. Per-respond cost in the strict regime

For a substrate in the strict regime per [decisions/regime-classification-is-load-bearing.md](../../decisions/regime-classification-is-load-bearing.md) (the v0.2 default — finite value-domain $\mathbf{L} = \{\bot, t, f, \top\}$, finite live entity set, quantifier-free closure rules), one `respond(target, payload, sender)` invocation has cost bounded by:

$$ c_\mathrm{respond} \;=\; O\!\left(\,|\mathrm{payload}| \;+\; F_\sigma \cdot |R_\mathrm{active}| \cdot |\mathrm{fiber}_\mathrm{target}| \;+\; F_\Delta \cdot |\mathrm{cells\,moved}|\,\right) $$

where:

- $|\mathrm{payload}|$ is the number of predicates in the incoming message (bounded by the message-language's payload-size limit).
- $F_\sigma = $ `sigma_fuel` (default 16 layers).
- $|R_\mathrm{active}|$ is the number of active closure rules whose premises pattern-match the merged fiber.
- $|\mathrm{fiber}_\mathrm{target}|$ is the size of the target's existing fiber (number of cells).
- $F_\Delta = $ `delta_fuel` (default 4 substeps per cell).
- $|\mathrm{cells\,moved}|$ is the number of cells whose value moved during the σ-pass (worst case $|R_\mathrm{active}| \cdot |\mathrm{fiber}_\mathrm{target}|$).

The σ-pass cost dominates for closure-heavy responds; the Δ-pass cost dominates when $|R_\mathrm{active}|$ is small but values move through many bilattice substeps.

In the **typical** case (small payload, ~tens of active rules, fiber size in low thousands, settling in 1–2 outer iterations rather than 8), per-respond cost is in the millisecond range — consistent with the §8 envelope.

In the **worst case** for strict-regime substrates (payload triggers σ-cycle near fuel exhaustion, every cell movement re-triggers further firings), per-respond cost approaches the polynomial $O(|R_\mathrm{active}|^{F_\sigma} \cdot |\mathrm{fiber}_\mathrm{target}|)$; in practice fuel exhausts before this is reached and the engine surfaces `PCR_SIGMA_FUEL_EXCEEDED`.

### 9.2. Per-respond cost in higher regimes

Scott-continuous substrates have per-finite-prefix cost identical to strict; the global cost is the supremum over prefixes.
Transfinite-bounded substrates have transfinite-firing-ordinal-indexed cost; aperiodic substrates have direct-limit-bounded cost.
The per-regime envelope theorems give the precise bounds (cited from [decisions/regime-classification-is-load-bearing.md](../../decisions/regime-classification-is-load-bearing.md)).

In v0.2 (strict default), engineering reasoning uses the §9.1 bound directly.
In v0.5+ (transfinite-bounded ICS deployments), the engine reads the substrate's `regime-record` and substitutes the appropriate envelope.

### 9.3. Reads are free

Per [decisions/cost-is-lawvere-quantale.md](../../decisions/cost-is-lawvere-quantale.md), reads contribute the quantale unit.
Fiber projection reads, witness-chain inspection, audit cohomology queries, and `get_cell` traversals do not appear in the cost model — they are bounded by I/O latency (file system read, in-memory map lookup) but contribute zero to the substrate's cost composition.

This is what makes per-fiber materialised projections (per [projection-naturality.md](projection-naturality.md)) affordable: producing them is settlement work; reading them is free.

### 9.4. The Turing question (engineering-undefended claim)

Earlier framings claimed the substrate "is not Turing-complete" or "is decidable rather than computational."
Both claims are **engineering-undefended** in v0.2:

- The strict-regime engine is provably bounded per the §9.1 envelope; closure rules in the strict regime cannot encode general recursion.
- The transfinite-bounded regime admits transfinite-stage closure; whether this remains sub-Turing is an open math question (per the predication-categories theory, the closure ordinal is the relevant invariant, not the Turing degree).
- The aperiodic regime admits uncountable-stage closure; this *can* simulate Turing computation in principle.

The v0.2 substrate's *engineering* claim is the §9.1 cost bound, not a Turing-incompleteness claim.
Reasoning about computability classes is a math-library question (see `predicated-computing/concepts/closure-ordinal-vs-turing-degree`, draft); the substrate's discipline is the cost bound and the regime declaration, not a recursion-theory argument.

## 10. The substrate's claim

The substrate is the deterministic computer that solves the captain's problem space (records, communication, accounting, knowledge, agential work, physical control, simulation, federation) on one algebra.
The PredCat math defines what the algebra is.
PredComp says how a computer is built on it.
AgOP says how agents act on it.
The specs in this directory say what the wire formats and APIs and runtime cycles look like in concrete code.

Implementations that pass [conformance vectors](conformance-vectors.md) and round-trip the [self-test](self-test.md) are conformant.
They can run any of the [apps](apps/_index.md), federate with peers, and absorb future application work without re-architecture.
