---
title: "Witness lifecycle"
description: "The four-state monotone lifecycle (`open → proposed → resolved → archived`, with the `open → resolved` acknowledgement shortcut) that every substrate-emitted witness class follows. Extracted from `kernel/inconsistency-repair.md` §3 to apply uniformly across capability-denial, fuel-exceeded, driver-fidelity, boot-failure, unmet-duty, and back-pressure-skipped-tick witnesses."
kind: spec
status: draft
version: "0.2b-draft"
---

# Witness lifecycle

Every substrate-emitted witness — inconsistency, capability-denial, fuel-exceeded, driver-fidelity, boot-failure, unmet-duty, back-pressure-skipped-tick, federation-trust, and any future witness class — walks the same four-state monotone lifecycle.
This spec extracts the discipline once so per-class witness specs cite by reference rather than re-deriving.

The discipline is fully specified inside [`kernel/inconsistency-repair.md`](../kernel/inconsistency-repair.md) §3 for the inconsistency case.
This spec lifts it to the pattern level.

## Grounded in

- [`predication-categories/objects/inconsistency-sheaf`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/inconsistency-sheaf.md) — the sheaf the inconsistency-witness class is sectioned over generalises: every witness class is sectioned over its own region of the substrate site.
- [`predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — audit content is the cohomology of the witness sheaf; the same $H^0$/$H^1$ surface applies per class.
- [`predicated-computing/theorems/repair-as-top-cell-resolution`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/repair-as-top-cell-resolution.md) — repair is structurally the resolution of a $\top$-class; the lifecycle records the resolution monotonically.
- [decisions/self-representation-everywhere](../../decisions/self-representation-everywhere.md) — every transition is a substrate cell, not engine state.
- Placeholder theorem `witness-as-cell.md` (named, not yet authored) is the load-bearing universal-lifecycle theorem this spec will cite once discharged.

## 1. The four states

```text
  open  ──►  proposed  ──►  resolved  ──►  archived
   │                              ▲
   └──────────────────────────────┘   (acknowledgement track skips proposed)
```

| State | Meaning | Field shape |
|---|---|---|
| `open` | Default at witness emission. The condition has been observed; no resolution attempt registered. | `resolution = None` |
| `proposed` | A captain or office-incumbent has asserted a candidate resolution cell but the substrate has not yet observed σ/Δ closure confirming it. | `resolution = {"state": "proposed", "candidate_cell": "<cell-id>", "kind": "<class-specific>"}` |
| `resolved` | The substrate has observed σ/Δ closure under the candidate; the condition no longer surfaces in the resolved-from region. | `resolution = {"state": "resolved", "via_cell": "<cell-id>", "kind": "...", "settled_at_ord": <int>}` |
| `archived` | The resolved witness is marked for long-term audit retention; archived witnesses are excluded from default cohomology queries but remain content-addressed. | `resolution = {"state": "archived", "via_cell": "<cell-id>", "archived_at_ord": <int>, "archived_by": "<office-or-captain-id>"}` |

The `open → resolved` acknowledgement shortcut applies when the resolution is *acknowledgement* (the condition is recognised but not promised to be cleared).
The proposed-state confirmation is unnecessary because acknowledgement does not promise σ/Δ closure.

## 2. Per-class instantiation

Each witness class instantiates the lifecycle by naming its concrete resolution `kind` set.
The `kind` is **substrate content**; new kinds may be added by closure rules without engine changes.

| Witness class | Emitter spec | Default `kind` set | Acknowledgement shortcut applies |
|---|---|---|---|
| `inconsistency` | [`kernel/inconsistency-repair.md`](../kernel/inconsistency-repair.md) §3 | `affirm`, `retract`, `acknowledge` | yes (`acknowledge`) |
| `capability-denial` | [`security/capability-model.md`](../security/capability-model.md) — denial witnesses at $\Box_R$ rejection | `grant`, `revoke`, `acknowledge` | yes |
| `fuel-exceeded` | [`kernel/fuel-composition.md`](../kernel/fuel-composition.md) §5 — per-respond ceiling exceeded | `raise-ceiling`, `defer`, `acknowledge` | yes |
| `driver-fidelity` | [`drivers/driver-model.md`](../drivers/driver-model.md) — counit-law violation; lossy upstream | `compensate`, `quarantine`, `acknowledge` | yes |
| `boot-failure` | [`init-boot/self-test.md`](../init-boot/self-test.md) — spot-check failure during boot | `repair-and-rerun`, `quarantine-driver`, `acknowledge` | yes |
| `unmet-duty` | [`personnel-development/duties.md`](../personnel-development/duties.md) — duty-record obligation unmet (v0.7 spec) | `discharge`, `reassign`, `acknowledge` | yes |
| `back-pressure-skipped-tick` | [`scheduling/back-pressure.md`](../scheduling/back-pressure.md) — strict-regime per-tick fuel envelope exceeded (v0.2b spec) | `defer-and-resume`, `raise-ceiling`, `acknowledge` | yes |
| `federation-trust` | [`security/federation-trust.md`](../security/federation-trust.md) — peer trust evaluation produced a $\top$-class | `re-attest`, `revoke-peer`, `acknowledge` | yes |

Every emitter spec MUST cite this pattern and name its `kind` set; the lifecycle proper is not re-specified per class.

## 3. Transitions

Per [`kernel/inconsistency-repair.md`](../kernel/inconsistency-repair.md) §3, four transitions are admissible:

- `open → proposed`: substrate cell `(witness-id, repair-proposed, candidate-cell-id) = t`.
- `proposed → resolved`: substrate cell `(witness-id, repair-resolved, via-cell-id) = t`, conditional on the next outer-fuel σ/Δ cycle producing no fresh contradictory cell at the witness's coordinates (or, for non-inconsistency classes, no fresh re-emission of the same condition).
- `resolved → archived`: substrate cell `(witness-id, repair-archived, ack-cell-id) = t`.
  Only a `resolved` witness may be archived.
- `open → resolved` (shortcut): substrate cell `(witness-id, acknowledged, ack-cell-id) = t` from a captain or office-incumbent.

All transitions are forward-only and recorded as substrate cells.
Engine state plays no role in the lifecycle.

## 4. Conformance gates

A conforming implementation:

1. Refuses any backward transition (e.g., `resolved → proposed`) with `PCR_REPAIR_LIFECYCLE_BACKWARD`.
2. Refuses `open → archived` and `proposed → archived` with `PCR_REPAIR_ARCHIVE_PREMATURE`.
3. Records every transition as a substrate cell using the predicate names above.
4. Honours the acknowledgement shortcut (`open → resolved` with `kind = "acknowledge"` or its class analogue) without requiring a `proposed` intermediate.
5. The cohomology query for the witness class excludes `archived` witnesses by default and excludes `resolved` witnesses when `include_resolved=False`; `open` and `proposed` are always counted in $H^0$.
6. Witness emission is `cost_class = "settle"`; lifecycle reads are `cost_class = "read"` per [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md).

## 5. Why one pattern

Two structural reasons.

**Audit uniformity.** A captain query "show me everything that needs my attention since last login" reduces to one cohomology fold across the union of witness sheaves; the per-class lifecycle being identical means the fold is well-defined without per-class branching.
Per [decisions/self-representation-everywhere](../../decisions/self-representation-everywhere.md), the witnesses are themselves cells; the cohomology fold is a `read`.

**Governance uniformity.** A captain's `acknowledge` action is the same shape regardless of which witness class it discharges.
The governance spec ([governance/decision-record.md](../governance/decision-record.md)) handles `acknowledge` by emitting one substrate cell per witness; per-class branching would force the governance spec to enumerate witness classes and would couple it to the schedule of new witness classes.

## 6. Cross-references

- [`kernel/inconsistency-repair.md`](../kernel/inconsistency-repair.md) §3 — the discipline as instantiated for the inconsistency-witness class; the source from which this pattern is extracted.
- [`anomaly-as-contradiction.md`](anomaly-as-contradiction.md) — the dual surface: $\top$-cells are the *content* the lifecycle resolves; this spec is the *governance* shape over them.
- [`approval-flow.md`](approval-flow.md) — the related cross-cutting pattern for approval; an `acknowledge` transition is structurally an approval-flow on the witness's coordinates.
- [`hierarchy-and-supersession.md`](hierarchy-and-supersession.md) — `archived` is structurally a supersession by an empty supersedor (the witness is retained but no longer in the active query surface).
