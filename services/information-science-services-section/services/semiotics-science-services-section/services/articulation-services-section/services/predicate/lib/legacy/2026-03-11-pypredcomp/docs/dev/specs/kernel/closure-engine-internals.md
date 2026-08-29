---
title: "Closure-engine internals"
description: "The deterministic closure-construction algorithm. Companion to respond.md that documents the engine's internal phase structure, fuel accounting, and invariant catalogue."
kind: spec
status: normative
version: "0.1"
sources:
  - "operations/engineering/triage/.../semiotic-cell-machine/cce.md"
  - "operations/engineering/triage/.../semiotic-cell-machine/cds.md"
---

# Closure-engine internals

The closure engine inside [`respond`](respond.md) Phase 3 implements a deterministic algorithm that consumes a substrate fiber and a payload, runs closure rules to fixed point, and produces a settled fiber plus repair log.
This spec documents the algorithm's internal structure, in PredCat vocabulary, with the phase shape carried forward from the captain's pre-PredCat CCE specification.

## 1. Phase structure

`respond` runs three phases on each invocation:

### Phase 1 — Structural validation

- Validate the target reference: it must name an entity slug present in the substrate or be a fresh slug intended to be created.
- Validate the payload: canonical JSON, no unknown reserved keys, every predicate slug matches the substrate's identifier alphabet.
- Validate the sender if present.
- Hard failures: `PCC_UNKNOWN_FIELD`, `PCC_CANONICALIZATION_FAIL`, `PCC_ID_MISMATCH`, `PCA_SCOPE_INSUFFICIENT`.

No state changes.
No closure work.
If Phase 1 fails, return immediately with empty repair log.

### Phase 2 — Payload composition

The payload is normalized into an **incoming fiber** over the target's index.
This is the predicated-computing analogue of CCE's "RTL judgment normalization" phase:

1. Each (predicate, value) pair in the payload becomes a candidate cell `(target, predicate, ?)
  `.
2. Numeric literals are encoded canonically.
  String values are validated against the predicate's expected value-type.
3. If a sender is present, the sender's authority fiber composes the incoming fiber via $\Rightarrow$: `incoming_constrained = sender_authority ⇒ payload_as_fiber`.
  Cells the sender's authority is silent on become $\bot$.
4. The result is a fiber over a sparse subset of the substrate's cell-index space.

Hard failures: `PCC_UNKNOWN_FIELD`, `PCA_SCOPE_INSUFFICIENT`.

### Phase 3 — Closure construction

This is the deterministic algorithm.
The order of every comparison is normative.

The phase is split into two named sub-passes — the **σ-pass** (saturation) and the **Δ-pass** (stabilization) — per [sigma-delta-passes.md](sigma-delta-passes.md).
The per-layer mechanics described in §3.1–§3.8 below are invoked by both sub-passes; the sub-pass spec defines which mechanics apply to which sub-pass and what stratum the emitted cells carry.
Implementations MUST follow the σ/Δ phase shape; the sub-section structure here is the engine-internal mechanism that both sub-passes reuse.

#### 3.1 Initialization

- Build a worklist of closure rules whose premise patterns reference cells touched by the merged fiber.
  Worklist order: by rule `priority`, then lexicographic over `rule.id`.
- Initialize two caches keyed by canonical cell-record SHA-256:
  - `fiber_cache` for materialized fiber slices.
  - `firing_cache` for already-applied (rule, bind-assignment) pairs.

Cache keys are SHA-256 hashes of canonical bytes.
This bounds cache width by the number of distinct digests fuel permits.

#### 3.2 Layered breadth-first expansion

Iterate by layer.
Within a layer:

1. For each rule in worklist order, enumerate matches of `rule.premise` against the current substrate state.
2. Bind-variable assignments are sorted lexicographically.
3. For each unique (rule, assignment), check `firing_cache`.
  If hit, skip.
4. Otherwise: build conclusion cells, propose them via $\odot$-merge into the substrate.
  Record the firing in `firing_cache`.
  Append a repair-log entry.

Each layer is the next iterate of the closure operator.
Halting after `fuel` layers computes the bounded sequence; this is the *operational presentation* of fixed-point iteration.

#### 3.3 Fuel bounds

- Default global fuel: 16 layers per `respond`.
- Per-rule fuel from the `closure-rule-record.fuel` field, if present.
- Each layer decrements global fuel by 1.
- Each rule firing decrements per-rule fuel by 1.

Exceeding fuel surfaces `PCR_FUEL_EXCEEDED`.
Partial state is preserved; the repair log records the exhaustion entry.
The substrate is not rolled back — the partial settlement is kept.

#### 3.4 Fiber merge after each layer

After each layer:

- Per cell whose value moved, $\odot$-merge the proposed value with the current substrate value.
- $\odot$ unions evidence: $(a_1, b_1) \odot (a_2, b_2) = (a_1 \lor a_2, b_1 \lor b_2)$.
  Affirmative + denying evidence produces $\top$.
- Settling-monotonicity invariant: the post-merge value MUST be $\ge_k$ the pre-merge value.
  Violation → `PCC_MONOTONICITY_FAIL` (hard, abort).
- This step is the predicated-computing analogue of CCE's "fixed-layer repair via plus-construction."
  It is the deterministic gluing of evidence sources.

#### 3.5 Bilattice operator stabilization

After each layer's merges:

- For each cell whose value moved, run the bilattice operator stabilization: iterate $\odot$ then $\Rightarrow$ on the cell's value until a fixed point or local fuel exhaustion.
- The bilattice's bounded-settlement property guarantees this completes in at most 2 substeps per cell for the four-valued case.
- Non-convergence (the $\bot$-oscillation pathological case) surfaces `PCR_BILATTICE_DIVERGED` with the last stable hash recorded.

#### 3.6 Invariant evaluation

After stabilization, evaluate the substrate's invariant catalogue (per [closure-rule-record.md](closure-rule-record.md) §7 and the per-substrate `invariants` configuration):

- Hard invariants abort on failure.
- Repairable invariants invoke deterministic repair recipes; each repair appends a log entry.
- Cross-record invariants (`PCC_REPAIR_HASH_CHAIN`, etc.) verify the in-progress repair log's structural validity.

#### 3.7 Layer termination

A layer terminates when:

- Zero new firings occurred in the layer → fixed point, exit Phase 3 successfully.
- Fuel exhausted → `PCR_FUEL_EXCEEDED`, exit with partial state.
- Hard invariant fail → exit with error code, partial repair log.

#### 3.8 Identity verification

Before exit:

- Recompute the canonical SHA-256 of the resulting fiber.
- Verify against the in-progress hash chain.
- Mismatch → `PCC_ID_MISMATCH` (clears outputs, returns error).

## 2. Closure invariant catalogue

These invariants are checked per layer in §3.6.
Catalogue:

| Code | Severity | Repair recipe |
|---|---|---|
| `PCR_INV_RULE_ACTIVE` | hard | None; rule must currently be in active set (not retired). |
| `PCR_INV_PREMISE_RESOLVABLE` | hard | None; premise patterns must reference declared predicates. |
| `PCC_INV_VALUE_ENCODING` | hard | None; cell values must be in the four-value bilattice. |
| `PCC_INV_MONOTONICITY` | hard | None; cell values cannot move backward in $\le_k$. |
| `PCC_INV_REPAIR_HASH_MONO` | hard | Forbid reuse of any prior `after_hash` in the repair log. |
| `PCR_INV_BILATTICE_CLOSED` | repairable | Saturate $\odot$/$\Rightarrow$ until fixed point. |
| `PCC_INV_FIBER_TOTAL` | repairable | Every entity has at least one cell (or is provisional). |

Implementations MAY extend the catalogue per substrate configuration; undeclared checks MUST NOT be inserted.

## 3. Merge semantics (federation)

For two settled fibers from federation peers (see [federation-protocol.md](federation-protocol.md)):

```
merge(fiber_a, fiber_b) → merged_fiber | error
```

Steps:

1. Validate both fibers are over compatible predicate-categories (the substrate's predicate set and bilattice).
  Mismatch → `PCF_MERGE_PREDICATE_GAP`.
2. Verify each fiber's repair log is self-consistent (hash chain, settling-monotonicity).
3. Per-cell: $\odot$-merge values; conflicts produce $\top$ honestly.
4. Per-rule: union the rules; conflicting rule definitions (same id, different bytes) → `PCF_MERGE_RULE_CONFLICT`.
5. Run the closure-construction algorithm on the merged payload, appending a `MERGE_RECHECK` repair entry capturing pre/post hashes.

Merge is associative and idempotent for inputs with byte-identical canonical hashes.

## 4. Determinism contract

For byte-identical inputs against byte-identical substrate state, `respond` produces:

- Byte-identical settled fiber.
- Byte-identical repair log (entries, order, hashes, fuel counts).
- Byte-identical evidence vector if requested.
- Byte-identical sequence of appended events.

Determinism is the load-bearing property.
The substrate's deterministic implementation checklist:

1. **Schema lock-in**: load substrate schemas (predicate definitions, value-domain) at process startup; lock.
2. **Hash discipline**: canonicalize every intermediate fiber before caching; cache keys are SHA-256 of canonical bytes.
3. **Worklist purity**: worklists, fuel counters, caches are local to the respond invocation; no ambient state, no shared mutable.
4. **Repair logging**: emit entries at the moment of state change; canonical pre/post hashes; never retroactively coalesce.
5. **Trace reproducibility**: every step in a trace ties to one of the closure principles (cell-evidence merge, bilattice stabilization, closure-rule firing) and to the specific repair-log entry that witnessed it.

## 5. Mathematical interpretation

The closure construction is the operational reflection of three principles defined in PredCat:

- **Cell-evidence merge** ↔ CCE's "sheaf completion via plus-construction."
  In the bilattice algebra, this is $\odot$-merge of two cells' evidence.
  Federation peers contributing to the same cell merge their values; disagreement produces $\top$.
- **Bilattice stabilization** ↔ CCE's "Δ-stabilization" (per [sigma-delta-passes.md](sigma-delta-passes.md)).
  The four-valued algebra's bounded settlement property: $\odot$ followed by $\Rightarrow$ reaches a fixed point in at most 2 substeps per cell.
  Cells emitted under stabilization carry stratum `"settled"`.
- **Closure-rule firing** ↔ CCE's "generative closure via UG iteration" / σ-pass saturation.
  Closure rules generate new cells; rules iterate breadth-first; fuel bounds the depth.
  Cells emitted by a firing carry stratum `"saturated"` and a `derived_from` witness chain pointing to the matched premises (per [stratified-facts.md](stratified-facts.md)).

Implementations MUST preserve this interpretation in logs and audit traces.
Diagnostic output references the relevant principle and cites the repair-log entry that witnessed progress.

## 6. Relationship to the captain's CCE source spec

The [source CCE spec](../tasks/mining/m01-cce.md) is written in pre-PredCat vocabulary (GFRTU, RTL, CDS, sites, sheaves).
The structure carries forward; the vocabulary changes:

| CCE term | PredCat term |
|---|---|
| CDS cell | settled fiber over a target entity |
| RTL judgment | message payload with sender |
| Site / sieves / Heyting topology | predicate-category structure |
| Constructor | closure rule |
| Generative closure (UG iteration) | closure-rule firing in breadth-first layers |
| σ/Δ stabilization | bilattice operator iteration |
| Plus-construction sheaf gluing | $\odot$-merge of fiber values |
| Recognition fibers / fixed layer | predication fibers |

The algorithm shape, fuel bounds, repair log shape, evidence vector, error code naming, determinism contract — all carry forward intact.

See [references/vocabulary-translation.md](../references/vocabulary-translation.md) for the systematic vocabulary translation across all the captain's pre-PredCat specs.
