---
title: "Fuel composition (Lawvere-quantale)"
description: "σ_fuel, Δ_fuel, outer_fuel, β/η reducer fuel, and the per-respond `fuel` budget compose under one Lawvere quantale per `decisions/cost-is-lawvere-quantale.md`. The quantale's $\\otimes$ gives the total respond cost; the engine forecasts before starting."
kind: spec
status: normative
version: "0.2"
---

# Fuel composition

`respond` consumes fuel at five distinct boundaries:

| Boundary | Source surface | Symbol |
|---|---|---|
| Per-respond payload reduction (β/η) | `message_language.reduce_payload(payload, env, fuel)` | $f_\mathrm{red}$ |
| σ-pass per-cascade closure-rule fuel | `closure_engine.fire_rules(..., sigma_fuel)` | $f_\sigma$ |
| Δ-pass per-cell bilattice substeps | `delta_pass.run_delta_pass(..., DELTA_FUEL)` | $f_\Delta$ |
| σ↔Δ outer-fuel round-trips | `respond.SIGMA_DELTA_OUTER_FUEL = 8` | $f_\mathrm{outer}$ |
| Per-respond top-level fuel ceiling | `respond(..., fuel=1024)` | $F$ |

[`sigma-delta-passes.md`](sigma-delta-passes.md) §3.σ–§3.outer specifies each boundary's termination semantics.
This spec specifies how the five compose.

## Grounded in

- [`predicated-computing/theorems/cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) — total cost along an operation sequence is exactly the quantale's $\otimes$ along that sequence; with no context-dependent overhead terms.
- [`predicated-computing/theorems/cost-discipline-reads-free`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md) — fiber reads, witness-chain inspection, and cell projections contribute the quantale unit; only settlement contributes positive cost.
- [`predicated-computing/theorems/federation-path-metrics-multiplicative`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md) — federation hops compose by the same quantale; v0.4 federation cost extends this composition.
- [`predication-categories/concepts/lawvere-quantale-enriched-category`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/lawvere-quantale-enriched-category.md) — the substrate is enriched over $\mathcal{V}$; per-operation $\mathcal{V}$-grades compose by $\otimes$ along morphisms.
- [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md) — the v0.2 commitment that there is *one* quantale composition for all cost surfaces.
- [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md) — the closure-ordinal envelope per regime determines the strict bound on $f_\sigma + f_\Delta + f_\mathrm{outer}$.

## 1. The composition law

Under the v0.2 default quantale $\mathcal{V} = ([0, \infty], +, \min)$ with unit $0$:

$$ c_\mathrm{respond} \;=\; f_\mathrm{red} \;\otimes\; \bigl( \bigotimes_{i = 1}^{n} f_\sigma^{(i)} \;\otimes\; f_\Delta^{(i)} \bigr) $$

where $n \le f_\mathrm{outer}$ is the number of σ↔Δ outer iterations actually consumed (`RespondResult.outer_iterations`) and $f_\sigma^{(i)}, f_\Delta^{(i)}$ are the per-iteration σ-pass and Δ-pass costs.
Under additive cost, $\otimes$ is $+$ and the total is the arithmetic sum.

Under the reliability quantale $([0, 1], \cdot, \max)$ with unit $1$, the same formula holds with $\otimes = \cdot$; reads (which contribute the unit) drop out of the product.

The top-level $F$ is the **quantale ceiling** — a respond is admitted only if its forecast $c_\mathrm{respond} \le F$ in the quantale's order.

## 2. The forecast / consume / emit pipeline

Each respond invocation follows a three-step cost discipline:

1. **Forecast.** Before Phase 1, the engine reads the regime's per-regime envelope (per [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md)) and, if it can, computes a static upper bound $\widehat{c}$ on $c_\mathrm{respond}$ in $\mathcal{V}$.
  Strict-regime substrates have polynomial $\widehat{c}$ in `(|active_rules|, |fiber|)`; Scott-continuous and transfinite-bounded substrates may forecast only per-prefix.
  If $\widehat{c} > F$, surface `PCR_FUEL_FORECAST_EXCEEDED` before any state advance.
2. **Consume.** During Phases 2–3, each pass deducts its actual $f$-value from a remaining budget.
  Per-pass exhaustion produces the typed error per [`sigma-delta-passes.md`](sigma-delta-passes.md) §4 (`PCR_SIGMA_FUEL_EXCEEDED`, `PCR_BILATTICE_DIVERGED`, `PCR_SIGMA_DELTA_DIVERGED`).
3. **Emit.** In Phase 4d, the engine emits one [`CostCell`](../../../../src/substrate/cost.py) at `cost_class = "settlement"` with `value` equal to the consumed total in $\mathcal{V}$.
  Reads — `get_cell`, `project_stratum`, witness-chain walks — emit cells at `cost_class = "read"` with `value = q.unit()`.
  Per [`cost.py`](../../../../src/substrate/cost.py) `query_total_cost`, the per-entity cost total is the quantale-fold of the emitted cells.

## 3. Per-quantale cost-class assignments (normative)

| Cost class | Default quantale value | Reliability quantale value | Role |
|---|---|---|---|
| `read` | $0$ | $1$ | Quantale unit; reads are free per `cost-discipline-reads-free`. |
| `admission` | small constant (default $1$) | $\approx 1$ | One event-log append per admitted message. |
| `settlement` | $f_\mathrm{red} + \sum_i (f_\sigma^{(i)} + f_\Delta^{(i)})$ | $\prod_i p_i$ | Load-bearing cost; bounded by affected-region size, not substrate size. |

A substrate that bills reads at positive cost is non-conformant — it has lost the audit-scaling and observation-scaling guarantees per [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md) §"What it rules out".

## 4. Strict consequence vs new commitment

### 4.1. Strict consequences of `cost-is-lawvere-quantale`

The composition law in §1, the forecast/consume/emit discipline in §2, and the cost-class assignments in §3 are strict consequences of the cost-is-lawvere-quantale decision and the cited theorems.
No new commitment is required for them; this spec records the engineering shape they take inside the σ/Δ engine.

### 4.2. New commitments this spec makes

This spec introduces two normative commitments that go beyond the cited decisions:

1. **The five named fuel surfaces are exhaustive.** The engine does not maintain hidden fuel boundaries beyond $\{f_\mathrm{red}, f_\sigma, f_\Delta, f_\mathrm{outer}, F\}$.
  Adding a sixth (e.g., a per-rule fuel envelope with its own composition) requires extending this spec and amending [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md).
2. **Per-pass per-iteration cost cells are NOT separately emitted.** Phase 4d emits *one* settlement cost cell per respond, summing all five surfaces.
  This avoids the cost-cell explosion problem and preserves quantale-fold invariance, but it means per-pass cost telemetry must be reconstructed from `RespondResult.repair_log` + `RespondResult.delta_log` rather than from cost-cell inspection.
  (Open question: should per-pass cost cells be emitted optionally, gated by a config flag?
  See [questions/per-pass-cost-cell-emission.md](../../questions/per-pass-cost-cell-emission.md) — defer until v0.4 forecasting work needs the granularity.)

## 5. Conformance gates

A conforming implementation:

1. Honours the §1 composition law: total cost = quantale-$\otimes$ of the five fuel-surface contributions.
2. Honours the §3 cost-class assignments: reads emit at unit; admissions at the small constant; settlements at the consumed total.
3. Surfaces `PCR_FUEL_FORECAST_EXCEEDED` when the regime's forecast exceeds $F$, **before** Phase 1 advances any state.
4. Emits exactly one `cost_class = "settlement"` cell per respond, with `value` equal to the consumed total in $\mathcal{V}$.
5. Honours the [`sigma-delta-passes.md`](sigma-delta-passes.md) §4 termination conditions; the per-pass error codes are surfaced when the pass exhausts its budget.

## 6. Open question — fuel and the determinism guarantee

The relationship between fuel exhaustion and replay determinism is reconciled in [`respond.md`](respond.md) §3.1 ("Fuel and determinism").
This spec relies on that reconciliation: replay uses the same fuel ceiling persisted alongside the settle event so that pass-exhaustion is reproduced byte-identically.

## 7. Cross-references

- [`sigma-delta-passes.md`](sigma-delta-passes.md) §3, §4 — per-pass termination semantics.
- [`respond.md`](respond.md) §3, §6, §8 — top-level fuel and determinism.
- [`computational-model.md`](computational-model.md) §"Cost model" — big-O bounds derived from this composition.
- [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md) — the underlying decision.
- [`src/substrate/cost.py`](../../../../src/substrate/cost.py) — implementation of `LawvereQuantale`, `CostCell`, `query_total_cost`.
