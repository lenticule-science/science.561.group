---
title: "Predicated-computing grounding"
description: "Engineering-layer parallel to predication-category-grounding. Each subsystem cites the proved predicated-computing (PC) engineering theorems that determine its discipline. The captain's instruction: 'continue grounding our work in that specific mathematical theory' — at the engineering layer."
kind: spec
status: normative
version: "0.2"
---

# Predicated-computing grounding

[Predication-category-grounding](predication-category-grounding.md) maps substrate primitives to PredCat objects/morphisms — the *math* layer.
This pattern is its **engineering-layer parallel**: it maps subsystems to the proved theorems in the [predicated-computing](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/) (PC) theory that determine their engineering envelope.

The math layer says *what is structurally available* (bilattice values, $\odot$, $\Rightarrow$, fibers, sheaves).
The engineering layer says *what those structures force the implementation to do* (cost composes by quantale; authorization is one $\Box_R$ at six surfaces; the engine's settlement envelope is regime-determined; reads are free; caches are coherent without invalidation; canonical hash is injective; boot is deterministic; migration preserves prior content).

Both patterns are bidirectional indices.
The third section below lists each PC theorem with the v0.2 specs that cite it, so the grounding is round-trippable.

## 1. The three load-bearing v0.2 grounding decisions

These are the three v0.2 sprint decisions that lift PC engineering theorems into normative substrate commitments.
They sit alongside the existing decisions and constrain all v0.2 implementation.

| Decision | What it commits the OS to | PC theorems |
|---|---|---|
| [authorization-is-modal-restriction](../../decisions/authorization-is-modal-restriction.md) | One $\Box_R$ evaluator at six surfaces (capability, federation, projection, governance, auth, agent self-queueing). | [modal-restriction-as-substrate-authorization-primitive](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) |
| [cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md) | One Lawvere-quantale composition for fuel, sandbox, federation routing, telemetry. Reads are the quantale unit. | [cost-composition-via-lawvere-quantale](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md), [cost-discipline-reads-free](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md), [federation-path-metrics-multiplicative](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md) |
| [regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md) | Every rule system declares its regime; engine/audit/federation/snapshot discipline is regime-determined. | [regime-classification-for-substrate](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md), [strict-regime-engineering-envelope](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/strict-regime-engineering-envelope.md), [scott-continuous-regime-engineering-envelope](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuous-regime-engineering-envelope.md), [transfinite-bounded-regime-engineering-envelope](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transfinite-bounded-regime-engineering-envelope.md), [aperiodic-regime-engineering-envelope](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/aperiodic-regime-engineering-envelope.md) |

Together with the existing [predication-category-grounding](predication-category-grounding.md), these three decisions and the per-subsystem citations below form the complete v0.2 engineering-layer foundation.

## 2. Subsystem → PC theorem mappings

### kernel/, scheduling/

The kernel hosts the bilattice algebra (covered by predication-category-grounding); the scheduling layer is where the engineering-layer envelope shows up most directly.

| Subsystem / spec | Grounded in (PC theorems) |
|---|---|
| [scheduling/heartbeat](../scheduling/heartbeat.md) | [monotonic-clock-discipline](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/monotonic-clock-discipline.md) — substrate ordinal is the only correctness-relevant clock; wall-clock is instrumentation. The four per-regime engineering envelopes — fuel envelope per tick is regime-determined. |
| [scheduling/deadline](../scheduling/deadline.md) | [monotonic-clock-discipline](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/monotonic-clock-discipline.md) — deadlines are in event-ordinal; wall-clock predications are content. |
| [scheduling/periodic-rules](../scheduling/periodic-rules.md) | [monotonic-clock-discipline](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/monotonic-clock-discipline.md) — cron-equivalent firing on substrate ordinal; wall-clock cron is approximate by design. |
| [process/dispatch-as-scheduler](../process/dispatch-as-scheduler.md) | The four per-regime engineering envelopes — dispatch fuel envelope per regime. [cost-discipline-reads-free](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md) — dispatch-table reads do not advance state. |

### security/

Security is the densest grounding area: every authorization surface is a $\Box_R$ instance, and all resource budgeting is a quantale composition.

| Subsystem / spec | Grounded in (PC theorems) |
|---|---|
| [security/capability-model](../security/capability-model.md) | [modal-restriction-as-substrate-authorization-primitive](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — $\Rightarrow$ is the call-graph surface of $\Box_R$; non-amplification is structural. |
| [security/federation-trust](../security/federation-trust.md) | [modal-restriction-as-substrate-authorization-primitive](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — federation trust is $\Box_R$ at the federation accessibility sub-region; federation-trust-bilattice-graded is the per-surface theorem. |
| [security/persona-and-personnel](../security/persona-and-personnel.md) | [modal-restriction-as-substrate-authorization-primitive](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — projection composition at session-open is $\Box_R$ on the boundary's projection-restricted authz fiber. |
| [security/sandbox-and-fuel](../security/sandbox-and-fuel.md) | [cost-composition-via-lawvere-quantale](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) — per-session and per-personnel budgets are quantale ceilings. [cost-discipline-reads-free](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md) — read-side budgets are unit (reads are free). The four per-regime engineering envelopes — closure-fuel envelope is regime-determined. |
| [security/signing-and-witnessing](../security/signing-and-witnessing.md) | [modal-restriction-as-substrate-authorization-primitive](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — every $\Box_R$ evaluation produces a witness; the audit chain records authorization decisions at every surface uniformly. [hash-injectivity-under-canonical-form](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) — witness chain integrity is hash-injective. |

### filesystem/

The filesystem is grounded in the data-access discipline trio: hash-injectivity, index-as-Alexandrov-up-set, cache-coherence-via-functorial-projection.

| Subsystem / spec | Grounded in (PC theorems) |
|---|---|
| [filesystem/storage-layout](../filesystem/storage-layout.md) | [hash-injectivity-under-canonical-form](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) — content-addressed cell paths are hash-injective. [index-as-alexandrov-up-set](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/index-as-alexandrov-up-set.md) — cell/rule indices are Alexandrov up-sets on the fiber-algebra. [cache-coherence-via-functorial-projection](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) — fiber caches are content-addressed and structurally coherent. |
| [filesystem/content-addressing](../filesystem/content-addressing.md) | [hash-injectivity-under-canonical-form](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) — same content → same hash → same cell-id; collision-resistance gives content identity. [cache-coherence-via-functorial-projection](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) — content-addressed caches don't go stale. |

### drivers/

Drivers are interfacers; their structural discipline is doctrine-fidelity-via-faithful-interfacer-functor.

| Subsystem / spec | Grounded in (PC theorems) |
|---|---|
| [drivers/driver-model](../drivers/driver-model.md) | [doctrine-fidelity-via-faithful-interfacer-functor](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md) — `extract` / `apply` / `compose` are the three operations of a faithful interfacer functor; the counit law is the operational fidelity test. [modal-restriction-as-substrate-authorization-primitive](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — per-driver capability discipline is $\Box_R$ at the driver's capability fiber. [cost-composition-via-lawvere-quantale](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) — per-driver call budgets are quantale terms. |

### init-boot/, packaging/

These subsystems are grounded in determinism and migration-preservation.

| Subsystem / spec | Grounded in (PC theorems) |
|---|---|
| [init-boot/boot-sequence](../init-boot/boot-sequence.md) | [boot-determinism](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/boot-determinism.md) — boot is a deterministic function of `(deployment, persistent-set)`. [hash-injectivity-under-canonical-form](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) — phase-3 spot-check is structural. |
| [packaging/upgrade-flow](../packaging/upgrade-flow.md) | [forward-migration-preserves-prior-content](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/forward-migration-preserves-prior-content.md) — additive rule-system migration preserves prior content; rollback returns to byte-identical pre-upgrade state. [boot-determinism](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/boot-determinism.md) — post-upgrade boot is deterministic on the new image + the snapshot. |

### observability/, governance/

Audit content lives in the inconsistency sheaf's cohomology.

| Subsystem / spec | Grounded in (PC theorems) |
|---|---|
| [observability/log-aggregation](../observability/log-aggregation.md) | [audit-content-via-inconsistency-sheaf-cohomology](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — search and saved-search queries operate on substrate content; the event log is the canonical store. [cost-discipline-reads-free](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md) — log-search reads do not advance substrate state. |
| [observability/error-investigation](../observability/error-investigation.md) | [audit-content-via-inconsistency-sheaf-cohomology](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — investigation queries are structurally sheaf-cohomology computations on $\mathcal{F}_U^{(\top)}$. [cost-discipline-reads-free](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md) — witness-chain inspection is free. |
| [governance/incident-management](../governance/incident-management.md) | [audit-content-via-inconsistency-sheaf-cohomology](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — incidents are $\top$-cells; postmortem queries traverse the inconsistency sheaf's cohomology classes. |

## 3. Bidirectional index — PC theorem → citing v0.2 specs

Each row lists the v0.2-relevant specs that cite a given PC theorem.
Bidirectionality matches the existing predication-category-grounding pattern.

| PC theorem | Citing v0.2 specs |
|---|---|
| [modal-restriction-as-substrate-authorization-primitive](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) | [security/capability-model](../security/capability-model.md), [security/federation-trust](../security/federation-trust.md), [security/persona-and-personnel](../security/persona-and-personnel.md), [security/signing-and-witnessing](../security/signing-and-witnessing.md), [drivers/driver-model](../drivers/driver-model.md) |
| [cost-composition-via-lawvere-quantale](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) | [security/sandbox-and-fuel](../security/sandbox-and-fuel.md), [drivers/driver-model](../drivers/driver-model.md) |
| [cost-discipline-reads-free](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md) | [security/sandbox-and-fuel](../security/sandbox-and-fuel.md), [process/dispatch-as-scheduler](../process/dispatch-as-scheduler.md), [observability/log-aggregation](../observability/log-aggregation.md), [observability/error-investigation](../observability/error-investigation.md) |
| [federation-path-metrics-multiplicative](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md) | (cited by [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md); v0.4 federation-protocol spec inherits) |
| [regime-classification-for-substrate](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md) | [security/sandbox-and-fuel](../security/sandbox-and-fuel.md), [scheduling/heartbeat](../scheduling/heartbeat.md), [process/dispatch-as-scheduler](../process/dispatch-as-scheduler.md) |
| [strict-regime-engineering-envelope](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/strict-regime-engineering-envelope.md), [scott-continuous-regime-engineering-envelope](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuous-regime-engineering-envelope.md), [transfinite-bounded-regime-engineering-envelope](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transfinite-bounded-regime-engineering-envelope.md), [aperiodic-regime-engineering-envelope](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/aperiodic-regime-engineering-envelope.md) | (cited by [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md); per-regime envelopes constrain [security/sandbox-and-fuel](../security/sandbox-and-fuel.md), [scheduling/heartbeat](../scheduling/heartbeat.md), [process/dispatch-as-scheduler](../process/dispatch-as-scheduler.md)) |
| [monotonic-clock-discipline](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/monotonic-clock-discipline.md) | [scheduling/heartbeat](../scheduling/heartbeat.md), [scheduling/deadline](../scheduling/deadline.md), [scheduling/periodic-rules](../scheduling/periodic-rules.md) |
| [hash-injectivity-under-canonical-form](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) | [filesystem/storage-layout](../filesystem/storage-layout.md), [filesystem/content-addressing](../filesystem/content-addressing.md), [security/signing-and-witnessing](../security/signing-and-witnessing.md), [init-boot/boot-sequence](../init-boot/boot-sequence.md) |
| [index-as-alexandrov-up-set](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/index-as-alexandrov-up-set.md) | [filesystem/storage-layout](../filesystem/storage-layout.md) |
| [cache-coherence-via-functorial-projection](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) | [filesystem/storage-layout](../filesystem/storage-layout.md), [filesystem/content-addressing](../filesystem/content-addressing.md) |
| [boot-determinism](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/boot-determinism.md) | [init-boot/boot-sequence](../init-boot/boot-sequence.md), [packaging/upgrade-flow](../packaging/upgrade-flow.md) |
| [forward-migration-preserves-prior-content](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/forward-migration-preserves-prior-content.md) | [packaging/upgrade-flow](../packaging/upgrade-flow.md) |
| [doctrine-fidelity-via-faithful-interfacer-functor](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md) | [drivers/driver-model](../drivers/driver-model.md) |
| [audit-content-via-inconsistency-sheaf-cohomology](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) | [observability/log-aggregation](../observability/log-aggregation.md), [observability/error-investigation](../observability/error-investigation.md), [governance/incident-management](../governance/incident-management.md), [kernel/inconsistency-repair](../kernel/inconsistency-repair.md), [kernel/sigma-delta-passes](../kernel/sigma-delta-passes.md) §9 "H¹ audit pass" |
| [cache-coherence-via-functorial-projection](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) (extended) | [filesystem/storage-layout](../filesystem/storage-layout.md), [filesystem/content-addressing](../filesystem/content-addressing.md), [kernel/projection-naturality](../kernel/projection-naturality.md), [init-boot/boot-sequence](../init-boot/boot-sequence.md) §4.2 "Fiber-cache reconcile" |
| [cost-composition-via-lawvere-quantale](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) (extended) | [security/sandbox-and-fuel](../security/sandbox-and-fuel.md), [drivers/driver-model](../drivers/driver-model.md), [kernel/fuel-composition](../kernel/fuel-composition.md), [kernel/computational-model](../kernel/computational-model.md) §9 "Cost model" |
| [regime-classification-for-substrate](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md) (extended) | [security/sandbox-and-fuel](../security/sandbox-and-fuel.md), [scheduling/heartbeat](../scheduling/heartbeat.md), [process/dispatch-as-scheduler](../process/dispatch-as-scheduler.md), [process/multi-regime-session](../process/multi-regime-session.md), [kernel/inconsistency-repair](../kernel/inconsistency-repair.md), [kernel/computational-model](../kernel/computational-model.md) §9.2 |
| [boot-determinism](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/boot-determinism.md) (extended) | [init-boot/boot-sequence](../init-boot/boot-sequence.md) (incl. §4.1 "Bootstrap users"), [packaging/upgrade-flow](../packaging/upgrade-flow.md), [kernel/runtime-cycles](../kernel/runtime-cycles.md) §0 "Entrypoint and boot wiring" |
| [cross-implementation-replay-fidelity](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cross-implementation-replay-fidelity.md) | [decisions/trusting-trust-bootstrap-path](../../decisions/trusting-trust-bootstrap-path.md), [decisions/fixture-authoring-paired-task](../../decisions/fixture-authoring-paired-task.md) |

## 4. Where to look next

When designing a v0.x subsystem:

- Find the relevant row in §2.
  The cited PC theorems are the engineering claims the subsystem should rely on.
- If the subsystem doesn't appear: identify the substrate operation it most centrally implements (authorization, cost, settlement, federation, audit, content-addressing, migration, interfacing) and consult the corresponding row of §3.
- Add a "Grounded in" section near the top of the new spec citing the relevant theorems by relative path, then update §3 here so the bidirectional index stays current.

The math layer (predication-category-grounding) and the engineering layer (this pattern) are *not redundant* — they cite different artifacts.
The math layer cites PredCat objects/morphisms (the structures available); the engineering layer cites PC theorems (the engineering envelopes derived from those structures).
A complete spec grounds in both.

## 5. Cross-references

- [predication-category-grounding](predication-category-grounding.md) — the math-layer parallel to this pattern.
- [predicated-computing](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/) — the engineering theory.
- [predicated-computing theorems README](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/README.md) — index of all proved engineering theorems.
- [decisions/authorization-is-modal-restriction](../../decisions/authorization-is-modal-restriction.md), [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md), [decisions/regime-classification-is-load-bearing](../../decisions/regime-classification-is-load-bearing.md) — the three v0.2 decisions this pattern enacts.

## 6. Conformance

Predicated-computing grounding passes:

1. Every v0.2-relevant spec named in [milestones/v0.2-os-class.md](../../milestones/v0.2-os-class.md) "Specs read" carries a "Grounded in" section near the top citing the relevant PC theorem(s).
2. Each PC theorem citation in any v0.2 spec resolves to an existing theorem file under `library/.../predicated-computing/theorems/`.
3. The §3 bidirectional index is consistent with the per-spec "Grounded in" sections — no spec cites a theorem missing from §3, and no §3 row claims a citation that the spec doesn't make.
4. Every newly added v0.x spec receives a "Grounded in" section before its first conformance fixture.
