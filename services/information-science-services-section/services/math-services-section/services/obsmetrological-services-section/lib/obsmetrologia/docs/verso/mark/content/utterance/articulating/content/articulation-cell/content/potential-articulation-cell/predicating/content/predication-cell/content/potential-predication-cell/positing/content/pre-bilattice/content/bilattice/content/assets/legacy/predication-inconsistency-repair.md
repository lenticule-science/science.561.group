---
title: "Inconsistency repair"
description: "Lifecycle of an `InconsistencyWitness`: detection at compose- or saturation-time, source-classification, optional `repair_resolution`, and projection to H¹ classes under the cohomology query. Sheaf-gluing grounding from the predication-category sheaf-of-fibers construction."
kind: spec
status: normative
version: "0.2"
---

A $\top$-cell at coordinate $(s, p, o)$ is the substrate's algebraic record of *contradiction*: two non-$\top$ inputs joined to $\top$ via $\odot$, or a σ-firing raised the value to $\top$ from a non-$\top$ prior. Per [decisions/bilattice-as-the-value-domain.md](../../decisions/bilattice-as-the-value-domain.md), $\top$ is admissible (the bilattice has it) and load-bearing (it must be observable rather than absorbed).

This spec records the lifecycle of an [`InconsistencyWitness`](../../../../src/substrate/inconsistency.py) from detection to optional repair, and how the witness catalogue projects to inconsistency cohomology $H^0/H^1$ under [`query_inconsistency_cohomology`](../../../../src/substrate/inconsistency.py).

## Grounded in

- [`predication-categories/objects/inconsistency-sheaf`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/inconsistency-sheaf.md) — the sheaf $\mathcal{F}^{(\top)}_U$ of $\top$-cells over open sets $U$ of the substrate's site; sections are inconsistency assignments.
- [`predication-categories/morphisms/sheaf-gluing`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/sheaf-gluing.md) — local sections that agree on overlaps glue to a global section; gluing-failure classes are the $H^1$ generators.
- [`predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — audit content is structurally the cohomology of $\mathcal{F}^{(\top)}_U$; $H^0$-counts and $H^1$-classes are the substrate's two audit-surface invariants.
- [`predicated-computing/theorems/regime-classification-for-substrate`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md) and the four per-regime envelope theorems — $H^1$ vanishes structurally under strict / Scott-continuous regimes; non-strict regimes carry non-trivial $H^1$.
- [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md) — the audit-cohomology-bound is regime-determined.

## 1. Detection

Two detection sites, both inside `respond`:

### 1.1. Compose-time (Phase 2)

When `knowledge_join(prev, new)` produces $\top$ from two non-$\top$ inputs, [`inconsistency.detect_compose_inconsistency`](../../../../src/substrate/inconsistency.py) returns true. The respond pipeline queues a pending witness with `kind = "compose"` and emits the witness in Phase 4c with `source_classification = "local-inference"` (default) or `"federation-conflict"` if `sender` matches `peer:*`.

### 1.2. Saturation-time (Phase 3.σ)

When a closure-rule firing raises a value to $\top$ from non-$\top$ prior, [`inconsistency.detect_saturated_inconsistency`](../../../../src/substrate/inconsistency.py) returns true. The witness is emitted with `source_cells` listing the firing's premise cell-ids and `source_classification = "local-inference"`.

## 2. Source classification

Five enumerated values per [`inconsistency.SourceClassification`](../../../../src/substrate/inconsistency.py):

| Classification | Meaning | When set |
|---|---|---|
| `federation-conflict` | A peer's federation-merged cell disagrees with local. | `sender` is `peer:*`. |
| `attack-surface` | A signed-but-disputed cell from a low-trust authoring boundary. | Manual classification by an audit closure rule; not auto-emitted. |
| `repair-source` | A `repair_resolution` cell that itself produced contradiction. | Set when a repair attempt is appended that re-asserts the original contradicted fact. |
| `local-inference` | Local σ-firings or compose-time joins. | Default when no other applies. |
| `cross-source` | Two non-peer authoring boundaries disagree. | Manual classification by an audit closure rule. |

The classification is **substrate content**, not engine state — closure rules can promote `local-inference` to `attack-surface` based on emergent audit-discipline rules. The default classification (`local-inference`) is conservative.

## 3. The `repair_resolution` lifecycle

An [`InconsistencyWitness`](../../../../src/substrate/inconsistency.py) carries a `repair_resolution` field that walks a four-state lifecycle. The lifecycle is **monotone** and **forward-only**: each state transition appends a substrate cell recording the transition; no transition is ever undone.

### 3.0. Lifecycle states

```text
  open  ──►  proposed  ──►  resolved  ──►  archived
   │                              ▲
   └──────────────────────────────┘   (acknowledgement track skips proposed)
```

| State | Meaning | Field shape |
|---|---|---|
| `open` | Default at witness emission. The contradiction has been detected; no repair attempt has been registered. | `repair_resolution = None` |
| `proposed` | A captain or office-incumbent has asserted a candidate repair cell (an affirmation, retraction, or acknowledgement candidate) but the substrate has not yet observed the σ/Δ closure that confirms the repair. | `repair_resolution = {"state": "proposed", "candidate_cell": "<cell-id>", "kind": "<affirm\|retract\|acknowledge>"}` |
| `resolved` | The substrate has observed σ/Δ closure under the candidate; the contradiction no longer surfaces in the resolved-from region of the cohomology surface. | `repair_resolution = {"state": "resolved", "via_cell": "<cell-id>", "kind": "<affirm\|retract\|acknowledge>", "settled_at_ord": <int>}` |
| `archived` | A captain has marked the resolved witness as archived for long-term audit retention; archived witnesses are excluded from default cohomology queries but remain content-addressed on disk. | `repair_resolution = {"state": "archived", "via_cell": "<cell-id>", "archived_at_ord": <int>, "archived_by": "<office-or-captain-id>"}` |

The transitions are:

- `open → proposed`: a candidate repair cell is asserted. Recorded as a substrate cell `(witness-id, repair-proposed, candidate-cell-id) = t`.
- `proposed → resolved`: the σ/Δ closure following the candidate produces no fresh $\top$-cell at $(s, p, o)$ over the next outer-fuel cycle. Recorded as `(witness-id, repair-resolved, via-cell-id) = t`.
- `resolved → archived`: a captain or office-incumbent emits `(witness-id, repair-archived, ack-cell-id) = t`. Only a witness in `resolved` can be archived; archiving an `open` or `proposed` witness is `PCR_REPAIR_ARCHIVE_PREMATURE`.
- `open → resolved` (acknowledgement shortcut): an explicit acknowledgement cell `(witness-id, acknowledged, ack-cell-id) = t` from a captain or office-incumbent transitions the witness directly from `open` to `resolved` with `kind = "acknowledge"`. The proposed-state confirmation is unnecessary because acknowledgement does not promise to clear the contradiction; it promises to record that it is recognised.

### 3.1. Affirmation (kind `affirm`)

A subsequent respond appends a cell at the same $(s, p, o)$ with the affirmed value (e.g., $t$). The affirming cell becomes the `candidate_cell` (state `proposed`); when the next σ/Δ closure shows no fresh $\top$-cell at $(s, p, o)$, the witness transitions to `resolved` with `via_cell = <affirming-cell-id>`.

### 3.2. Retraction (kind `retract`)

A subsequent respond retracts one of the `source_cells` (asserts the cell's value as $f$ at a later ord, or emits a `retracted-at-ord` predicate per [`stdlib/retract-and-assert.md`](../stdlib/retract-and-assert.md)). The retracting cell becomes the `candidate_cell`; when σ/Δ closure no longer derives the contradiction, the witness transitions to `resolved` with `via_cell = <retracting-cell-id>`.

### 3.3. Acknowledgement (kind `acknowledge`)

A captain or office-incumbent emits a cell `(witness-id, acknowledged, ack-cell-id) = t` indicating the inconsistency is recognised but not yet resolvable. This uses the `open → resolved` shortcut above: there is no `proposed` intermediate because acknowledgement does not require subsequent σ/Δ confirmation. Future audit queries surface acknowledged-resolved witnesses separately from affirm/retract-resolved ones via the `kind` field.

### 3.4. Monotonicity

Once `repair_resolution` is set on a witness file, the state field is never decreased and the file is never deleted. A subsequent re-occurrence of the contradiction produces a *new* witness with a new `step_ord`, citing fresh `source_cells`. This is how the witness catalogue records repair attempts that themselves produced contradiction (`source_classification = "repair-source"`); the new witness's lifecycle is independent of the old.

### 3.5. Conformance gates for transitions

A conforming implementation:

1. Refuses any backward transition (e.g., `resolved → proposed`) with `PCR_REPAIR_LIFECYCLE_BACKWARD`.
2. Refuses `open → archived` and `proposed → archived` with `PCR_REPAIR_ARCHIVE_PREMATURE`.
3. Records every transition as a substrate cell using the predicate names above; the cell's witness is the transition itself.
4. Honours the acknowledgement shortcut (`open → resolved` with `kind = "acknowledge"`) without requiring a `proposed` intermediate.
5. The `query_inconsistency_cohomology` routine excludes `archived` witnesses by default and excludes `resolved` witnesses when `include_resolved=False`; `open` and `proposed` are always counted in $H^0$.

## 4. Projection to H¹ (cohomology query)

[`query_inconsistency_cohomology`](../../../../src/substrate/inconsistency.py) folds the on-disk witness catalogue into a `CohomologyResult` with two invariants:

- **$H^0$ count** — the number of un-resolved witnesses in the queried region (an entity, optionally a peer or session). Always meaningful regardless of regime.
- **$H^1$ generators** — the distinct `step_ord` values at which a witness was recorded. Vanishes structurally under strict / Scott-continuous regimes (per the per-regime envelope theorems); meaningful under transfinite-bounded and aperiodic.

Per [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md), the engine reads the substrate's `regime-record` to choose the cohomology routine: strict-regime substrates skip the $H^1$ enumeration entirely (it is provably empty); transfinite-bounded substrates enumerate the firing-ordinal pattern; aperiodic substrates assemble $H^1$ via direct limit of countable-truncation $H^1$s.

The cohomology query is `cost_class = "read"` per [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md) — it does not advance state and does not consume settlement fuel.

## 5. Federation interaction

Per [decisions/federation-by-construction](../../decisions/federation-by-construction.md), federation merge is `respond` with `sender = peer:*`. A peer's cell that disagrees with local at $(s, p, o)$ produces a $\top$-cell whose witness carries `source_classification = "federation-conflict"`. Per the regime envelope:

- Strict / Scott-continuous federation ships endpoint state; conflicts surface immediately at receive time.
- Transfinite-bounded federation ships trajectory; conflicts surface as $H^1$-class disagreements between local and peer trajectories.
- Aperiodic federation ships truncation-trajectories; conflicts surface as direct-limit disagreements.

Mixed-regime federation must scope to a Scott-continuous prefix per [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md) §"What it rules out".

## 6. Conformance gates

A conforming implementation:

1. Emits an `InconsistencyWitness` at every $\top$-cell production, both at compose-time and at saturation-time.
2. Persists the witness atomically under `$ROOT/inconsistency/<entity>/<id>.json` content-addressed.
3. Honours the §3 monotone four-state lifecycle (`open → proposed → resolved → archived`, with the `open → resolved` acknowledgement shortcut); per §3.5 conformance gates for transitions.
4. The `query_inconsistency_cohomology` routine returns empty `H1_generators` under strict / Scott-continuous regimes regardless of `degree` argument; populates `H1_generators` under transfinite-bounded / aperiodic.
5. Cohomology queries are read-only; no event is appended.
6. Federation receive marks `source_classification = "federation-conflict"` automatically when `sender` matches `peer:*`.

## 7. Cross-references

- [`sigma-delta-passes.md`](sigma-delta-passes.md) §"H¹ audit pass" — the audit pass discipline as a third pass alongside σ/Δ.
- [`stratified-facts.md`](stratified-facts.md) §"Top values" — how $\top$ is exposed at each stratum.
- [`repair-log.md`](repair-log.md) — the structurally distinct repair-log entries (these record the engine's settlement steps; this spec records the witness catalogue).
- [`src/substrate/inconsistency.py`](../../../../src/substrate/inconsistency.py) — implementation.
- [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md) — the regime-determined audit-cohomology choice.
- [`_patterns/witness-lifecycle.md`](../_patterns/witness-lifecycle.md) — the four-state monotone lifecycle of §3 above is extracted as a cross-cutting pattern; this spec is the originating instance (`inconsistency` witness class).
