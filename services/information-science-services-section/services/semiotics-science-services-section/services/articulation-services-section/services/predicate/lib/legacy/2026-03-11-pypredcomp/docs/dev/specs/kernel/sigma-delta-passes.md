---
title: "σ / Δ pass separation"
description: "The closure-rule engine runs as two distinct passes — σ-saturation and Δ-stabilization — each with its own termination condition, fuel budget, and stratum output. Settled facts are the intersection of both fixed points."
kind: spec
status: normative
version: "0.1"
sources:
  - "operations/engineering/triage/operations/command/ideas/triage/dont-flatten-the-tower.md"
  - "operations/engineering/triage/operations/command/ideas/triage/fars-faoh-mash-architecture-from-first-principles.md"
---

# σ / Δ pass separation

The closure-rule engine inside [respond](respond.md) Phase 3 has, in earlier specifications, been written as a single layered breadth-first loop that interleaves rule firings with bilattice stabilization.
That conflation hides a structural fact: closure-rule firing (saturation under the σ-nucleus) and bilattice stabilization (settlement under the Δ-nucleus) are different operators with different termination conditions, different fuel disciplines, and different outputs at the [stratified-facts](stratified-facts.md) level.

This spec separates them.
The previous single loop is replaced by an outer **σ-pass** (saturation) followed by an inner **Δ-pass** (stabilization), iterated to a joint fixed point.
The internal algorithm of the engine is specified in [closure-engine-internals.md](closure-engine-internals.md); this spec specifies the phase shape.

The framing is committed in [decisions/events-are-stratified-substrate-is-a-presheaf.md](../../decisions/events-are-stratified-substrate-is-a-presheaf.md).

## 1. The two nuclei

The substrate's closure operator decomposes into two nuclei:

| Nucleus | Symbol | Operator | What it does | Output stratum |
|---|---|---|---|---|
| **σ-nucleus** | $\sigma$ | closure under the rule set | Saturates the asserted fiber: fires closure rules until no new conclusion is producible. | `"saturated"` |
| **Δ-nucleus** | $\Delta$ | bilattice stabilization | Drives the saturated fiber to a fixed point under per-cell $\odot$ then $\Rightarrow$ settlement. | `"settled"` |

The settled fiber is the joint fixed point:

$$ H^*_t = \text{Fix}(\sigma) \cap \text{Fix}(\Delta) $$

A fact appears at stratum `"settled"` only when it survives both fixpoints.
A fact at stratum `"saturated"` survives σ but may move under Δ; a fact at stratum `"asserted"` is the input to σ.

## 2. Pass structure inside `respond` Phase 3

`respond` Phase 3 is replaced by the following sub-phases.
Each sub-phase emits cells at a specific stratum (per [stratified-facts.md](stratified-facts.md) §2).

### 3.0 — Asserted intake

The merged incoming-and-substrate fiber from Phase 2 is exposed as the **asserted set**.
Cells in this set carry stratum `"asserted"` and an empty `derived_from`.

No closure work happens here; this is the σ-pass's input boundary.

### 3.σ — σ-pass (saturation)

Iterate breadth-first layers of closure-rule firings (per [closure-engine-internals.md](closure-engine-internals.md) §3.2):

1. Worklist over closure rules whose premises reference cells in the current asserted-or-saturated fiber.
2. For each (rule, bind-assignment) firing, emit one or more cells at stratum `"saturated"` with `derived_from` listing the matched premise cells and `derived_via` set to the rule id.
3. Newly saturated cells join the substrate fiber; the next layer's worklist may reference them.
4. **σ-fuel.** Default `sigma_fuel = 16` layers per `respond`.
  Per-rule `fuel` budgets apply per layer.
  Exceeding the σ-fuel surfaces `PCR_SIGMA_FUEL_EXCEEDED` with partial state preserved.
5. **σ-termination.** A layer with zero new firings → σ-fixed-point.
  Exit 3.σ; proceed to 3.Δ.
6. **σ-cycle detection.** A firing whose `derived_from` includes the cell it would emit (after $\odot$-merge into the substrate) is rejected as `PCR_SIGMA_CYCLE`.
  The substrate is not in a paradoxical state; the rule set is misdesigned.

The σ-pass does NOT run bilattice stabilization.
Per-cell $\odot$-merge of a newly emitted saturated cell into the substrate fiber happens (because that's how the next layer sees the new fact), but the cell's value is not iterated under $\Rightarrow$ during this pass.
Stabilization is the Δ-pass's job.

### 3.Δ — Δ-pass (settlement)

After 3.σ reaches a fixed point, run the Δ-pass:

1. Build a worklist of every cell whose value moved during 3.σ.
  Order is lexicographic over `(s, p, o)`.
2. For each cell, run the bilattice operator stabilization: iterate $\odot$ then $\Rightarrow$ on the cell's value until a fixed point or local fuel exhaustion (per [closure-engine-internals.md](closure-engine-internals.md) §3.5).
3. If the stabilization yields a value different from the cell's saturated value, emit a new cell at stratum `"settled"` with `derived_from` listing the saturated cell(s) that fed the stabilization and `derived_via = "⊙-stabilize"` or `"⇒-stabilize"` as appropriate.
4. **Δ-fuel.** Default `delta_fuel = 4` substeps per cell (the four-valued bilattice's bounded settlement bound, doubled for headroom).
  Exceeding the Δ-fuel surfaces `PCR_BILATTICE_DIVERGED` with the last stable hash recorded.
5. **Δ-termination.** When the Δ-worklist empties without producing new movement, the Δ-pass has reached its fixed point.

The Δ-pass MAY trigger new σ-firings if a stabilized value matches a previously unmatched closure-rule premise.
In that case the engine returns to 3.σ for another iteration.
The σ/Δ alternation is itself bounded by **outer fuel**.

### 3.outer — Outer fuel

The σ/Δ alternation is bounded by `outer_fuel = 8` σ↔Δ round-trips per `respond`.
Exceeding this surfaces `PCR_SIGMA_DELTA_DIVERGED`.
In practice the alternation converges in 1–2 round-trips for non-pathological rule sets; the outer fuel exists to bound pathological cases.

### 3.4 — Identity verification

Before exit, recompute the canonical hashes of the resulting fiber projections per stratum and verify against the in-progress hash chain.
Mismatch is `PCC_ID_MISMATCH`.

## 3. Wavefront-settle interaction

The captain's wavefront-settle worklist (a separate task on the v0.2 backlog; see [milestones/v0.2-os-class.md](../../milestones/v0.2-os-class.md)) is a refinement of the Δ-pass's per-cell stabilization that propagates settlement updates as a wavefront across cells related by closure rules, rather than re-walking every cell on every pass.

When wavefront-settle ships, the Δ-pass's worklist (§3.Δ step 1) becomes a priority queue keyed by wavefront ordinal rather than a lexicographic flat list.
The output stratum is unchanged (`"settled"`); the witness chain is unchanged (`derived_via` includes the wavefront propagation that triggered the cell's movement); the σ-pass is unaffected.

The seam between this spec and wavefront-settle is the Δ-pass's worklist data structure.
The σ/Δ separation is the precondition for wavefront-settle to be specifiable cleanly; without it, the wavefront would have to interleave with σ-firings and the resulting algorithm is significantly harder to reason about.

## 4. Termination conditions

Summary table of every halting condition for Phase 3:

| Condition | Meaning | Outcome |
|---|---|---|
| 3.σ layer with zero new firings | σ-pass fixed point | Proceed to 3.Δ. |
| 3.σ exceeds `sigma_fuel` | σ-pass exhausted budget | `PCR_SIGMA_FUEL_EXCEEDED`; partial saturated state preserved; no Δ-pass attempted. |
| 3.σ detects `PCR_SIGMA_CYCLE` | Rule set produces a self-justifying conclusion | Hard error; partial state preserved. |
| 3.Δ worklist empties without movement | Δ-pass fixed point | Check whether new σ-firings became possible; if no, exit Phase 3 successfully. |
| 3.Δ per-cell exceeds `delta_fuel` | Bilattice did not converge for a cell | `PCR_BILATTICE_DIVERGED`; partial settled state preserved. |
| 3.outer exceeds outer fuel | σ/Δ alternation did not converge | `PCR_SIGMA_DELTA_DIVERGED`; partial state preserved. |
| Identity verification fails | Hash chain mismatch | `PCC_ID_MISMATCH`; partial state cleared, error returned. |

Every termination condition that is not "fixed point reached" preserves partial state and writes a repair-log entry recording the termination cause and the cells whose stratum was promoted before the halt.
This preserves the [evidence-vector](evidence-vector.md) discipline.

## 5. Repair-log discipline

Per [repair-log.md](repair-log.md), entries appear in chronological order.
Stratum-aware codes:

| Code | Step kind | Stratum touched |
|---|---|---|
| `PCM_RESPOND_PHASE` (variant `"sigma-start"`) | σ-pass entered. | n/a |
| `PCR_RULE_FIRED` | A closure rule emitted a saturated cell. | `"saturated"` |
| `PCM_RESPOND_PHASE` (variant `"delta-start"`) | Δ-pass entered. | n/a |
| `PCR_DELTA_STABILIZED` | A cell's value reached its bilattice fixed point. | `"settled"` |
| `PCR_DELTA_NO_MOVEMENT` | Δ-pass found a cell already at fixed point; no `"settled"` cell emitted. | n/a |
| `PCM_RESPOND_PHASE` (variant `"sigma-delta-iter"`) | Outer-fuel iteration boundary. | n/a |
| `PCR_SIGMA_FUEL_EXCEEDED` / `PCR_BILATTICE_DIVERGED` / `PCR_SIGMA_DELTA_DIVERGED` | Halting condition. | n/a |

Repair-log readers can identify the σ-pass and Δ-pass sub-phases by the phase-marker entries.
This is required for diagnostic tooling and for the conformance vectors that exercise stratification.

## 6. Conformance gates

A conforming implementation:

1. Emits cells at the correct stratum per the §2 phase responsibilities; verified by the stratum-conformance vectors (per [conformance-vectors.md](../conformance-vectors.md) §11).
2. Produces byte-identical repair logs across runs for byte-identical inputs, including the σ/Δ phase boundary entries.
3. Implements σ-cycle detection.
4. Implements Δ-fuel per cell and the outer-fuel bound on σ/Δ alternation.
5. Reaches Phase 3 fixed points within configured fuel for the conformance fixtures.
6. Surfaces the correct error code per the §4 termination conditions.

The conformance suite exercises:

- A pure σ-only fixture (asserted cells + closure rules; no $\odot$/$\Rightarrow$ work). Δ-pass should be a no-op.
- A pure Δ-only fixture (asserted cells whose values force bilattice stabilization without rule firings).
- A combined fixture where σ produces saturated cells whose values then move under Δ.
- A pathological fixture that exceeds outer fuel; verify partial state and error code.
- A retraction fixture: assert premises; settle; retract a premise; verify dependent-invalidity correctly demotes the saturated and settled cells.

## 7. Mathematical interpretation

In PredCat terms:

- The σ-nucleus is the closure operator on the predication-category whose closed elements are the saturated fibers $H_t$.
- The Δ-nucleus is the closure operator whose closed elements are the bilattice-stable fibers $H^*_t$.
- The composition $\Delta \circ \sigma$ is the substrate's "tick" composite nucleus; the captain's older FARS/FAOH/MASH framing called this $\pi = \sigma \circ \Delta$.
- The fixed-point intersection $\text{Fix}(\sigma) \cap \text{Fix}(\Delta)$ is the global section $\Gamma(H^*)$ that the read surface exposes.

This spec commits the substrate to recognising both nuclei as separate operators, with separate fuel budgets, separate output strata, and separate halting conditions.
The earlier conflation hid the cases where σ-saturation depends on a Δ-stabilization that hasn't happened yet, or vice versa.

## 8. Relationship to the existing engine spec

[closure-engine-internals.md](closure-engine-internals.md) is updated to reference this spec for the phase shape, while preserving the per-layer worklist algorithm, the cache discipline, the invariant catalogue, and the determinism contract.
The §3 sub-phase structure of this spec replaces the §3 layered-loop structure in the engine internals; the engine internals retain the per-layer mechanics that both σ-pass and Δ-pass invoke.

## 9. H¹ audit pass

In addition to σ-saturation and Δ-stabilisation, the substrate runs a **third** structurally-aligned pass over the result: the **H¹ audit pass**, which folds the witness catalogue into the inconsistency-cohomology surface per [inconsistency-repair.md](inconsistency-repair.md).
This subsection records the pass's relationship to σ/Δ; the lifecycle of an `InconsistencyWitness` from detection to optional `repair_resolution` is the subject of [inconsistency-repair.md](inconsistency-repair.md).

### 9.1. When the H¹ audit pass runs

The H¹ audit pass is **read-only** and runs:

1. **Inline at every $\top$-cell production.** When σ or Δ produces a $\top$-cell (per [`inconsistency.detect_compose_inconsistency`](../../../../src/substrate/inconsistency.py) at compose-time and `detect_saturated_inconsistency` at saturation-time), the witness is immediately appended to the catalogue.
  This appending is part of `respond` Phase 4c, alongside cell and event emission.
2. **On demand via [`query_inconsistency_cohomology`](../../../../src/substrate/inconsistency.py).** Audit dashboards, governance/incident workflows, and federation-audit consumers query the cohomology surface; the query is `cost_class = "read"` per [decisions/cost-is-lawvere-quantale.md](../../decisions/cost-is-lawvere-quantale.md) and contributes the quantale unit.

### 9.2. Why H¹ audit is regime-determined

Per the four per-regime engineering envelope theorems:

- **Strict regime:** $H^1 = 0$ structurally.
  The audit pass folds witnesses to $H^0$-counts only; the $H^1$ enumeration is provably empty and skipped.
- **Scott-continuous regime:** $H^1 = 0$ on every finite prefix; per-prefix audit folds to $H^0$-counts.
- **Transfinite-bounded regime:** $H^1$ is enumerable indexed by non-Scott-continuous firing ordinal.
  The audit pass walks the ordinal pattern.
- **Aperiodic regime:** $H^1$ is the direct limit of countable-truncation $H^1$s.
  The audit pass assembles the limit.

The engine reads the substrate's `regime-record` and dispatches to the appropriate routine. v0.2 (strict default) does the cheap $H^0$-count.

### 9.3. Repair-log codes for the audit pass

| Code | Step kind | Stratum touched |
|---|---|---|
| `PCM_RESPOND_PHASE` (variant `"audit-start"`) | H¹ audit pass entered. | n/a |
| `PCR_INCONSISTENCY_DETECTED` | A $\top$-cell was produced and a witness was appended. | n/a (does not touch a stratum) |
| `PCR_AUDIT_NO_NEW_WITNESS` | The pass found no new $\top$-cells. | n/a |
| `PCM_RESPOND_PHASE` (variant `"audit-end"`) | H¹ audit pass complete. | n/a |

The audit pass does **not** emit substrate cells; it appends witness files (per [inconsistency-repair.md](inconsistency-repair.md) §6) and repair-log entries.

### 9.4. Conformance gates for the audit pass

A conforming H¹ audit pass:

1. Appends an `InconsistencyWitness` for every $\top$-cell produced by σ or Δ in the same `respond`.
2. Reads the `regime-record` and dispatches to the regime-appropriate cohomology routine.
3. Returns empty `H1_generators` under strict / Scott-continuous regimes regardless of `degree` argument.
4. Persists the witness atomically under `$ROOT/inconsistency/<entity>/<id>.json` content-addressed.

## 10. Projection API (kernel-side)

[`projection.py`](../../../../src/substrate/projection.py) exposes `project_stratum(cells, stratum)`, `project_stratum_at_or_below(cells, stratum)`, `project_peer(cells, peer)`, `project_at_ord(cells, ord)`, and `materialize_by_stratum_projections(entity, history)` as the kernel's projection surface.
The on-disk layout these write to is specified in [filesystem/presheaf-storage.md](../filesystem/presheaf-storage.md) §4; the algebra these honour (presheaf functoriality, naturality of merge under projection) is specified in [projection-naturality.md](projection-naturality.md).
The σ/Δ engine invokes these after each pass to materialise the up-to-date by-stratum cache.

## 11. Out of scope

- The wavefront-settle worklist (its own task; this spec notes the seam in §3).
- A presheaf-theoretic proof of joint-fixpoint convergence; the substrate uses the bounded-bilattice property and σ-fuel as the operational guarantee.
- Multi-pass parallelism within σ or Δ; the spec is single-threaded per `respond` invocation.
  Cross-`respond` parallelism is governed by [respond.md](respond.md) §7.
