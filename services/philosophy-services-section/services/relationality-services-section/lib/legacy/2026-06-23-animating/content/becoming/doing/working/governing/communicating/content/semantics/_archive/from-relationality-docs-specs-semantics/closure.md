# Closure Semantics (CCE)

**Role.** Defines the deterministic closure operator over cells and RTL judgments. This document describes the algorithmic semantics and evidence obligations without prescribing wire formats.

**Depends on.** `trace-universe.md` for the three fixed points, `cellular.md` for cell structure and invariants, and `language.md` for RTL normalization.

**Provides to.** Carrier encodings of closure outputs and host runtime orchestration. JSON surfaces are specified in `../carriers/closure-json.md` and host interfaces in `../host`.

---

## 1. Interface (Abstract)

CCE exposes two pure functions:

- `apply : (cell, judgment) → Reject(error, repair_log) | Accept(canonical_judgment, refined_cell, repair_log)`
- `merge : (cell, cell) → refined_cell | Reject(error, repair_log)`

Inputs are semantic cells and RTL judgments. Outputs are closure-complete cells, canonicalized judgments, and an ordered repair log. Error codes are textual (`CCE_*`, `CDS_*`, `RTL_*`); their encodings are handled by carriers.

Determinism is mandatory: identical inputs yield identical outputs and repair logs.

## 2. Phase Structure

`apply` runs three phases:

1. **Structural validation.** Ensure the cell satisfies the carrier schema and hashes; ensure the judgment shape matches the language carrier; check signature alignment. Failures: `CCE_CDS_INVALID`, `CCE_RTL_INVALID`, `CDS_ID_MISMATCH`.
2. **Judgment checking.** Type-check and normalize the judgment per `language.md` using the declared fuel. Propagate language errors verbatim.
3. **Closure construction.** Execute the deterministic algorithm in §3 to produce a refined, closure-complete cell.

`merge` validates both inputs, reconciles invariants, and then executes closure construction on the merged payload (§4).

## 3. Deterministic Closure Construction

Given a structural cell (and optional defining judgment), CCE performs:

1. **Initialization.** Build a worklist from constructors in declaration order. Prepare caches keyed by canonical identities for fixed-layer sections and constructor operand tuples.
2. **Layered expansion.** Iterate constructors breadth-first. Within a layer, operand tuples are ordered by canonical identity; ties break by constructor order. Each unique operand tuple is applied once per layer; duplicates are suppressed via the cache.
3. **Fuel bounds.** Use `closure_depth` from the defining expression when present, otherwise default 16. Each breadth-first layer consumes one unit. Exceeding fuel emits `CCE_CLOSURE_FUEL_EXCEEDED` and records the partial state.
4. **Fixed-layer repair.** After each layer, apply sheafification (plus construction) over each sieve. Non-unique gluings or failures yield `CDS_FIXED_LAYER_SHEAF_FAIL` (repairable) with a repair entry.
5. **σ/Δ stabilization.** Iterate stabilizer then drift until a fixed point or fuel exhaustion. Non-convergence is `CCE_SIGMA_DELTA_DIVERGED`, recorded with the fuel used.
6. **Invariant evaluation.** Evaluate `laws.invariants` in order. Hard invariants abort; repairable ones invoke deterministic recipes (`CCE_INV_*` and `CDS_*`). Each attempt appends a repair entry with before/after identities and remaining fuel.
7. **Identity check.** Recompute the canonical hash of the refined cell; mismatch is `CDS_ID_MISMATCH` and clears outputs except the error code and log.

The procedure terminates because fuel and caches bound the search and each repair either progresses or aborts with an explicit error.

### 3.1 Fixed-Layer Repair Recipe

For each sieve $S$ over object $U$:

1. Enumerate matching families $M(S)$ in lexicographic order of constituent section identities.
2. Attempt gluing; if multiple gluings exist, choose the lexicographically least identity. Failure to glue yields `CDS_FIXED_LAYER_SHEAF_FAIL`.
3. Replace the fixed-layer sections for $U$ with the glued result ordered by identity. Record before/after identities in the repair log.

### 3.2 σ/Δ Stabilization

Apply $\sigma$ then $\Delta$ to every section, iterating until all sections stabilize or fuel expires. Fuel consumption and last stable identity must be logged on divergence.

### 3.3 Invariant Catalogue

CCE recognizes the invariant family names from `cellular.md` plus CCE-specific entries:

- `CCE_INV_SECTION_TOTAL` (hard): every object has at least one section.
- `CCE_INV_SIGMA_DELTA_CLOSED` (repairable): saturate $\sigma/\Delta$ closure.
- `CCE_INV_OPERATOR_TOTAL` (hard): constructors reference only declared vocabulary.
- `CCE_INV_SHEAF_UNIQUENESS` (repairable): enforce unique gluing.
- `CCE_INV_REPAIR_HASH_MONO` (hard): forbids reuse of previous `after` identities.

Implementations may honor additional invariants only when the cell declares them explicitly.

## 4. Merge Semantics

`merge(c1, c2)` requires:

1. Matching sites (objects, morphisms, Heyting structure) or `CCE_MERGE_SITE_MISMATCH`.
2. Constructors of `c2` must extend those of `c1`; otherwise `CCE_MERGE_CONSTRUCTOR_GAP`.
3. Fixed-layer intersection by object must be non-empty; emptiness yields `CCE_MERGE_FIXED_LAYER_EMPTY`.
4. Invariants unify by code; conflicting metadata escalates severity to hard or rejects with `CCE_MERGE_INVARIANT_CONFLICT`.
5. Run closure construction on the merged payload and append a `MERGE_RECHECK` repair entry capturing fixed-layer hashes before/after.

Merge is associative and idempotent for inputs with identical canonical identities.

## 5. Repair Log Semantics

Repair logs are ordered sequences of entries:

- `code`: a CDS/CCE invariant identifier,
- `before_hash` / `after_hash`: canonical identities of the payload immediately before and after the repair,
- `fuel_used`: remaining closure fuel when the repair occurred.

Logs MUST appear even on failures (possibly empty). Entries are appended in chronological order when the repaired state becomes canonical. Replaying closure with the same inputs and fuel MUST reproduce the identical log.

## 6. Evidence Vector

When requested, closure may return an evidence array containing hashes of:

1. Input cell,
2. Input judgment (apply only),
3. Each repair-log entry (in order),
4. Output cell (on success),
5. Output canonical judgment (successful apply only).

Omission, insertion, or reordering is `CCE_RPC_EVIDENCE_INVALID`. The evidence vector, together with canonical payloads, suffices for independent replay.

## 7. Deterministic Implementation Checklist

1. Load schemas once per process; avoid runtime mutation that could affect ordering.
2. Canonicalize every intermediate cell before caching or hashing; cache keys are canonical hashes.
3. Keep worklists and fuel counters local to the invocation; ambient state must not influence ordering.
4. Emit repair entries immediately when state changes; never retroactively sort or coalesce.
5. When producing audit traces, tie each step to one of the three GFRTU closure principles (sheafification, σ/Δ stabilization, generative closure).

This document defines the semantics of closure; JSON carriers and host invocation details are described elsewhere in the specification suite.
