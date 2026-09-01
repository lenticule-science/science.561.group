---
title: "respond pipeline"
description: "respond is structured as an ordered pipeline of phase objects sharing a typed context. Adding kernel capability is authoring a phase, not editing a monolith."
kind: spec
status: normative
version: "0.1"
sources:
  - "operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/respond.md"
  - "operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/sigma-delta-passes.md"
  - "operations/engineering/tools/predication-computer/pypredcomp/docs/dev/questions/v1.0-agent-merge-authority.md"
---


[respond](respond.md) is the substrate's single state-mutating primitive.
This spec specifies the *shape* of its implementation: an ordered pipeline of small phase objects sharing a typed context, rather than a single monolithic function body.

The phase decomposition is normative.
The exact phase list and slugs given in §3 are normative for v0.2; v0.3+ MAY add phases via the registration mechanism in §5 but MUST NOT remove or reorder the v0.2 phases without an accompanying decision.

## 1. Why a pipeline

`respond` is the load-bearing extensibility surface.
Every kernel capability — Box_R authz, payload reduction, settling-monotonic compose, dependent-invalidity, σ↔Δ closure, persistence, the H¹ audit pass, cost emission, retraction audit logs, directive side-effects — is a discrete operation that runs in a specific position in the call's lifecycle.

When `respond`'s implementation was a single ~700-line function, adding a new capability meant editing the monolith mid-loop and re-establishing every invariant by hand.
Phase decomposition turns "add a capability" into "author a phase class + register it," with the phase's preconditions and outputs visible at the type level.

The pipeline ordering is *data*, not control flow.
The v1.0 agent-merge-authority story (see [questions/v1.0-agent-merge-authority.md](../../questions/v1.0-agent-merge-authority.md)) requires that an in-OS agent can author kernel behaviour.
The substrate-resident phase registry (§5) is the precondition for that: at v1.0 the phase list will be loaded from substrate cells (`(respond, has-phase, <slug>)`), so adding a phase becomes an in-OS `respond` call against the kernel — auditable, reversible, and gated by the office×change-class deontic the captain selected for v1.0 merge authority.

## 2. The phase contract

A **phase** is an object with:

- `slug: str` — the phase's content-addressable identifier.
  Unique within a pipeline.
  The same string an in-OS agent authors as the `<slug>` slot of `(respond, has-phase, <slug>) = TRUE` to register the phase at v1.0.
- `run(ctx: RespondContext) -> None` — execute the phase, reading required inputs from `ctx` and writing outputs back to it.

Phases MUST be deterministic pure functions of their input `ctx`.
Non-determinism breaks Gate-9 byte-identity (per [respond.md](respond.md) §3) and is forbidden.

A phase MAY:

- **Set `ctx.halted_with`** to a `PCR_*` code to record a soft halt (σ-fuel exhausted, bilattice diverged, σ↔Δ outer-fuel exhausted).
  The pipeline continues to subsequent phases so partial state still commits — this matches the pre-pipeline `respond` semantics where Phase 4 always persisted the cell + event regardless of σ↔Δ halt.
- **Raise `SubstrateError`** to abort the pipeline hard before any further work runs.
  Reserved for invariant violations and gate denials (e.g. `PCC_AUTHZ_DENIED`, `PCM_PAYLOAD_INVALID`, `PCC_MONOTONICITY_FAIL`, `PCC_MISSING_WITNESS`).

A phase MUST NOT:

- Read disk state outside its declared inputs (the layout + event-log handles passed via `ctx` are exempt; they are the persistence surface).
- Mutate state behind the back of the context (no module-level mutable globals, no caches that affect output).
- Skip steps based on external conditions; "do I have work to do" is internal to the phase and determined from `ctx` alone.

## 3. The v0.2 phase list

The default pipeline (`DEFAULT_PIPELINE` in [`src/substrate/respond.py`](../../../../src/substrate/respond.py)) is:

| Order | Slug | Maps to respond.md | Brief |
|---|---|---|---|
| 1 | `authz-gate` | Phase 0 | Box_R gate on the (sender → target) authentication edge. Raises `PCC_AUTHZ_DENIED` on a non-TRUE box value before any state mutates. |
| 2 | `validate-and-reduce-payload` | Phase 1 | Slug validation, fiber load, witness-coverage invariant check, payload reduction under fuel. |
| 3 | `compose` | Phase 2 | Settling-monotonic merge with prior fiber, compose-time inconsistency detection, asserted-cell emission, event-ord pre-allocation. |
| 4 | `dependent-invalidity` | Phase 2.5 | σ-pass dependent-invalidity propagation per [stratified-facts.md](stratified-facts.md) §3. Emitted before the σ↔Δ loop so the loop sees the up-to-date fiber. |
| 5 | `close-sigma-delta` | Phase 3 | σ↔Δ outer-fuel alternation per [sigma-delta-passes.md](sigma-delta-passes.md). Soft-halts on `PCR_SIGMA_FUEL_EXCEEDED` / `PCR_BILATTICE_DIVERGED` / `PCR_SIGMA_DELTA_DIVERGED`. |
| 6 | `build-cell` | Phase 3.5 | Assemble the `FiberSnapshot`; queue saturated-stratum top-cells for Phase 4c. |
| 7 | `persist` | Phase 4 + 4b | Write cell record, append event with `payload_keys` + `payload_digest`, write fiber, materialize by-stratum projections. |
| 8 | `emit-inconsistency-witnesses` | Phase 4c | H¹ audit pass: emit one `InconsistencyWitness` per queued contradiction, bracketed by `audit-start` / `audit-end` markers per [sigma-delta-passes.md](sigma-delta-passes.md) §9. |
| 9 | `emit-cost-cell` | Phase 4d | Emit a settlement cost cell sized by σ-cycles consumed. No-op responds emit nothing. |
| 10 | `emit-retraction-audit-log` | Phase 4e | When `at_stratum` is non-default, emit the audit-log fiber per [tool-risk-scoring.md](../security/tool-risk-scoring.md) §3. |
| 11 | `apply-directive` | Phase 5 | Apply directive side-effect strictly after the audit trail commits. |

The mapping to `respond.md`'s abstract phases is 1:1; the pipeline does not add or remove abstract phases, it only structurally separates what was previously inline.

## 4. The shared context

`RespondContext` (defined in [`src/substrate/respond.py`](../../../../src/substrate/respond.py)) is a typed dataclass carrying:

- The 12 input parameters of `respond` (target, payload, sender, layout, event_log, node_id, active_rule_ids, fuel, metadata, directive, enforce_authz, at_stratum).
- One field per phase output, grouped by phase.
  Field defaults are the same "empty" values the original closure-captured locals were initialised to; the field-to-local mapping is intentionally 1:1 to preserve byte-identity of the emitted `RespondResult`.
- A `mark(variant, iteration)` helper that appends a `PhaseMarker` to both the typed `phase_log` and the unified `audit_log`.
- A `to_result()` method that builds the public `RespondResult` from the final ctx state.

Phases read what they need and write outputs back.
The next phase observes them.
This is the same data flow as the original closure-captured locals; the change is purely structural — the locals become typed fields, the function-local execution order becomes pipeline order.

## 5. Pipeline registration (substrate-resident at v1.0)

At v0.2 the pipeline is hard-coded in module data:

```python
DEFAULT_PIPELINE: PhasePipeline = PhasePipeline([
    AuthzGatePhase(),
    ValidateAndReducePayloadPhase(),
    # …
])
```

Out-of-tree extensions and tests build derived pipelines via `DEFAULT_PIPELINE.with_phase(phase, after=<slug>)` or by passing a custom list to `PhasePipeline(...)
`.

At v1.0 a substrate-resident loader will replace this with a list assembled from on-disk cells.
The schema:

- `(respond, has-phase, <slug>) = TRUE` — registers the phase identified by `<slug>`.
- `(respond:phase:<slug>, has-implementation, <import-path>) = TRUE` — binds the slug to a Python import path the loader can `importlib`-resolve to the phase class.
  This binding is the place the trusting-trust gate lives: only loader-trusted import paths may be bound (per the [trusting-trust decision](../../decisions/trusting-trust-substrate-bootstrap.md)).
- `(respond:phase:<slug-a>, before, respond:phase:<slug-b>) = TRUE` — orders `<slug-a>` before `<slug-b>`.
  The loader topologically sorts these constraints; cycles surface `PCR_SIGMA_CYCLE` at boot.

### 5.1. Loader determinism

Topological sort with `before`-edges alone is non-deterministic when zero-indegree nodes are incomparable: two valid orderings exist and a loader is free to pick either, breaking Gate-9 byte-identity (per [respond.md](respond.md) §3) across hosts that picked different orderings.

The loader MUST therefore use **Kahn's algorithm with lexicographic slug tie-break**: at each step, choose the smallest-slug node among those with zero remaining indegree.
This makes the sort a deterministic function of the loaded cell set and recoverable across hosts.

### 5.2. Loader error conditions

The loader MUST surface these conditions at boot rather than silently degrading:

- **Cycle in `before` edges** → `PCR_SIGMA_CYCLE`.
  The phase set is misdesigned; refuse to boot.
- **Duplicate `has-phase` registration for the same `<slug>`** → `PCM_RESPOND_PHASE`.
  The substrate-cell schema is one-cell-per-phase; a duplicate indicates a corrupted authoring path.
  (The in-process `PhasePipeline` constructor already raises `ValueError` on duplicate slugs; the loader's check is the on-disk analogue.)
- **`has-phase` cell with no matching `has-implementation` binding** → `PCM_RESPOND_PHASE`.
  Refuse to boot rather than silently dropping the phase.
- **`has-implementation` import path not in the loader-trusted set** → `PCC_AUTHZ_DENIED`.
  The trusting-trust gate (see [trusting-trust decision](../../decisions/trusting-trust-substrate-bootstrap.md)) lives here.

The registration story is out of scope for v0.2. v0.2 ships the in-process registry above; the substrate-cell schema and the determinism + error-surfacing rules are committed here so the v1.0 implementer has an unambiguous contract.

## 6. Conformance gates

A conforming pipeline implementation:

1. Produces byte-identical `RespondResult` for byte-identical inputs across runs (Gate-9 byte-identity, per [respond.md](respond.md) §3).
2. Runs phases in the order declared by the pipeline; observes no out-of-order or skipped phases for any input.
3. Surfaces phase-set duplicates at construction (the `PhasePipeline` constructor MUST raise `ValueError` on duplicate slugs).
4. Honours soft-halt semantics: phases set after a soft halt still run (so partial state commits); phases set after a hard `SubstrateError` raise propagate the exception unchanged.
5. Exposes phases as individually unit-testable units: a phase's `run(ctx)` produces the same outputs against the same `ctx` whether it ran via the pipeline or directly from a test.

The conformance suite exercises:

- The full v0.2 phase list against the existing `respond` conformance fixtures (`tests/conformance/test_respond_*` and the σ/Δ + dependent-invalidity tests).
  The pipeline implementation MUST pass every pre-existing conformance test unchanged.
- A phase-pipeline-specific test (`test_respond_pipeline.py`) verifying duplicate-slug rejection, the `with_phase` insertion helper, and individual phase invocation against a synthetic context.

## 7. Out of scope

- The substrate-cell phase registry loader (committed in §5; implementation is v1.0).
- Cross-`respond` parallelism: the pipeline is single-threaded per `respond` invocation.
  Concurrency is governed by [respond.md](respond.md) §7.
- Phase removal: v0.2 phases are normative; removing one requires an accompanying decision in `docs/dev/decisions/`.
