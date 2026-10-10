---
title: "Should per-pass cost cells be emitted, gated by config?"
description: "specs/kernel/fuel-composition.md §4.2 emits ONE settlement cost cell per respond, summing all five fuel surfaces. Should an opt-in flag emit per-σ-pass and per-Δ-pass cells for finer telemetry?"
kind: question
date: "2026-05-02"
status: resolved-by-default
disposition-default: defer-to-v0.4
resolved: 2026-05-03
resolved-as: "Ratify default — opt-in flag at v0.4 observability work."
resolved-by: "agent (captain directive 2026-05-03; standard observability pattern is verbose-telemetry-behind-flag)"
---

> **Resolved 2026-05-03 (default ratified).** Defer-to-v0.4 stands. > When v0.4 observability work happens, ship > `respond.emit-per-pass-cost-cells` as an opt-in flag, off by > default — standard verbose-telemetry pattern (every database, > every web framework, every kernel tracer does this).
Captain > may overrule before v0.4. ---


## Question

[specs/kernel/fuel-composition.md](../specs/kernel/fuel-composition.md) §4.2 commits to emitting **one** settlement cost cell per respond, with `value` equal to the consumed total in the chosen quantale $\mathcal{V}$.
Per-pass per-iteration cost cells are NOT emitted; per-pass cost telemetry must be reconstructed from `RespondResult.repair_log` + `RespondResult.delta_log`.

Should an opt-in config flag (`respond.emit-per-pass-cost-cells: true`) cause Phase 4d to emit a sequence of cost cells — one per σ-pass iteration, one per Δ-pass cell, one for `outer_iterations`?

## Why this is a real question

**Pull toward per-pass cells:**

- Forecasting work (predicting whether a respond will fit its fuel envelope before starting) needs per-pass empirical data; the aggregated single cell hides the distribution.
- Cross-implementation cost diff: comparing Python vs Rust per-pass cost cell-by-cell catches drift more sharply than comparing aggregated totals.
- Audit queries on "which closure rules cost most" become trivial when cost is per-pass.

**Pull against per-pass cells:**

- A respond that fires 100 closure rules across 8 outer iterations emits ~800 cost cells; substrate cell count grows by ~10× per respond.
  The on-disk cost is real.
- The aggregated total is *exactly* the quantale-fold of the per-pass values (per the cost-composition theorem); the detail is mathematically reconstructible from the repair_log and delta_log.
- Per-pass cells incentivise per-pass reasoning, but the cost-quantale discipline says cost is *compositional* — splitting it back out at audit time encourages thinking about parts rather than the composition.
- Cost-class proliferation: per-pass cells need new `cost_class` values (`settlement-sigma-pass`, `settlement-delta-cell`, `settlement-outer-step`?), each requiring a quantale value mapping per [specs/kernel/fuel-composition.md](../specs/kernel/fuel-composition.md) §3.

## What would resolve it

A v0.4 forecasting prototype would tell us whether per-pass granularity is needed.
Until then:

- v0.2 ships **only** the aggregated cell (per [specs/kernel/fuel-composition.md](../specs/kernel/fuel-composition.md) §4.2).
- v0.3 may add the config flag if a v0.3 use case (cost-prediction in a captain dashboard, cross-implementation cost diff) demands it.
- v0.4 forecasting work decides finally; if forecasting can be done from `repair_log` + `delta_log` reconstruction, the flag stays a flag (off by default); if forecasting demands per-pass, the cells become standard.

Default disposition: **defer to v0.4**.
Aggregated single-cell is the v0.2 discipline.

## Stakes

**Low** for v0.2 — aggregated cell is sufficient for sandbox and capability budget enforcement, per [specs/kernel/fuel-composition.md](../specs/kernel/fuel-composition.md) §3.

**Medium** for v0.4 — forecasting may need granular data; if so, the choice becomes load-bearing.

**Low** for cross-implementation diversity per [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md) — replay-diversity already compares full event logs (which include the repair_log), so per-pass is recoverable when needed for diff investigation without being persisted as cells.

## Cross-references

- [specs/kernel/fuel-composition.md](../specs/kernel/fuel-composition.md) §4.2 — the aggregated-cell commitment this question opens.
- [decisions/cost-is-lawvere-quantale.md](../decisions/cost-is-lawvere-quantale.md) — the cost-class discipline.
- [src/substrate/cost.py](../../../src/substrate/cost.py) — implementation; current code emits one settlement cell per respond.
