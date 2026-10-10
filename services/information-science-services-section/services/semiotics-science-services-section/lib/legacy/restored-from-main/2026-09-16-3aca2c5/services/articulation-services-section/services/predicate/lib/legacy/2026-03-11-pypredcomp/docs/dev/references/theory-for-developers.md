---
title: "Theory for developers"
description: "Translation layer from the math/engineering theory into the code. Each theory construct is paired with the spec section that contracts it and the source module/file that realises it. Read this once before touching the kernel; reread the relevant row before any cross-cutting landing."
kind: reference
status: active
authority: "theories/.../predication-categories/, theories/.../predicated-computing/, specs/"
---


The substrate's [charter](../charter.md) names three convergences (math, engineering, cultural — see [texts/convergences.md](../texts/convergences.md)) and three layers of source-of-truth (math → engineering → specs → code).
[references/theories.md](theories.md) lists *paths*; this doc is the *bridge*.
Each construct from PredCat / PredComp / FARS is paired with:

- The spec section that contracts the construct in the OS.
- The source module/file that realises it.
- A "what this means when you write code" line that names the failure mode if you forget the theory.

When in doubt, the higher-authority source wins (math > engineering > spec > code per [charter §Source-of-truth](../charter.md)).
If the code disagrees with the math, the code is wrong.

## How to use this doc

1. Before opening a kernel module, find the row for the construct you're touching.
  Read the spec link, then the math link, then return.
2. When writing a closure rule, capability, or projection, cite the row's spec in your code comment (e.g. `# specs/kernel/respond.md §3.1`) per the [pypredcomp AGENTS.md discipline](../../../AGENTS.md).
3. When a conformance fixture fails, find the row whose realisation you suspect is wrong, then walk theory → spec → code and check each layer in order.
4. When proposing a decision in [decisions/](../decisions/), cite the row whose theory the decision is interpreting.

## 1. Bilattice value domain

| Layer | Reference |
|---|---|
| Math | [`predication-categories/objects/four-bilattice.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md), [`predication-categories/objects/bilattice.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md), Busaniche–Cignoli (2014) |
| Theory text | [Why Four Values Instead of Two](../../../../../../../../theories/science/theories/information/texts/why-four-values-instead-of-two.md) |
| Engineering | `predicated-computing/concepts/bilattice-value-domain` |
| Spec | [specs/kernel/isa.md](../specs/kernel/isa.md) §"Algebraic layer" + [specs/conformance-vectors.md §1–2](../specs/conformance-vectors.md) |
| Decision | [decisions/bilattice-as-the-value-domain.md](../decisions/bilattice-as-the-value-domain.md), [decisions/witness-pair-encoding-internal.md](../decisions/witness-pair-encoding-internal.md) |
| Code | [`src/substrate/algebra.py`](../../../src/substrate/algebra.py) — `Value` enum + `(a, b)` witness-pair tuple |

**What this means when you write code.** The four values $\bot, t, f, \top$ are not a sentinel pattern over booleans; they are the algebra.
Never collapse $\bot$ to `false` or $\top$ to "error" — both are first-class.
The 64-triple adjunction property in [conformance-vectors §1](../specs/conformance-vectors.md) is gating: if it fails, no other work proceeds.

## 2. Adjunction $a \odot p \le_t q \iff p \le_t (a \Rightarrow q)$

| Layer | Reference |
|---|---|
| Math | [Adjoint Structure of Predication on Bilattice-Valued Fibers](../../../../../../../../theories/science/theories/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md), Lambek (1958), Lawvere (1969) |
| Theory text | [Predication as Residuation](../../../../../../../../theories/science/theories/information/texts/predication-as-residuation.md), [convergences §1](../texts/convergences.md#1-the-math-lambek-lawvere-busanichecignoli) |
| Engineering | `predicated-computing/morphisms/predication-fusion`, `morphisms/predication-restriction` |
| Spec | [specs/kernel/respond.md](../specs/kernel/respond.md) §2 (Phase 2 uses $\Rightarrow$; Phase 3 uses $\odot$) |
| Code | [`src/substrate/algebra.py`](../../../src/substrate/algebra.py) — `fuse` ($\odot$) and `restrict` ($\Rightarrow$) |

**What this means when you write code.** The adjunction is the contract between sender authority and target settlement: a sender's fiber $a$ restricts ($\Rightarrow$) the payload before composition; closure rules then fuse ($\odot$) to fixed point.
If you implement either operator without the other passing the adjunction property test, both are wrong.
Authority is non-amplifying *because of* this adjunction (see row 8).

## 3. Predication cell and content addressing

| Layer | Reference |
|---|---|
| Math | [`predication-categories/concepts/predication-cell.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) |
| Engineering | `predicated-computing/concepts/predication-graph-store` |
| Spec | [specs/kernel/canonicalization.md](../specs/kernel/canonicalization.md), [specs/filesystem/](../specs/filesystem/) |
| Decision | [decisions/everything-is-a-cell-not-a-file.md](../decisions/everything-is-a-cell-not-a-file.md), [decisions/canonical-json-conventions.md](../decisions/canonical-json-conventions.md), [decisions/content-hash-via-sha256.md](../decisions/content-hash-via-sha256.md) |
| Code | [`src/storage/cell.py`](../../../src/storage/cell.py), [`src/storage/cell_record.py`](../../../src/storage/cell_record.py), [`src/substrate/canonicalization.py`](../../../src/substrate/canonicalization.py) |

**What this means when you write code.** A cell is `(s, p, o, v)` where `v` is a bilattice value.
The cell-id is the SHA-256 of the canonical-JSON byte form.
Two implementations that disagree on canonical-JSON are not the same OS, even if they agree on everything else.
Pydantic models for cells MUST round-trip canonical bytes byte-identically — see [implementation/python.md §"What the Python implementation MUST NOT do"](../implementation/python.md).

## 4. Stratified facts (asserted / saturated / settled)

| Layer | Reference |
|---|---|
| Math | [`predication-categories/theorems/meta-stratification-by-regime.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/meta-stratification-by-regime.md) |
| Engineering | `predicated-computing/concepts/four-layer-rule-architecture` |
| Spec | [specs/kernel/stratified-facts.md](../specs/kernel/stratified-facts.md), [specs/kernel/projection-naturality.md](../specs/kernel/projection-naturality.md) |
| Decision | [decisions/events-are-stratified-substrate-is-a-presheaf.md](../decisions/events-are-stratified-substrate-is-a-presheaf.md) |
| Code | [`src/substrate/projection.py`](../../../src/substrate/projection.py) — `project_stratum`, `materialize_by_stratum_projections` |

**What this means when you write code.** Cells carry a stratum tag (asserted, saturated, settled).
Projections are *functorial*: a per-stratum projection file MUST hold only its stratum's cells (no saturated firings leak into `asserted.json`, ever).
The naturality square in [projection-naturality.md](../specs/kernel/projection-naturality.md) is the gate; the conformance test that pins it is [`tests/conformance/test_projection_naturality.py`](../../../tests/conformance/test_projection_naturality.py).
If you change projection, run that test first.

## 5. Closure rules and the σ/Δ split

| Layer | Reference |
|---|---|
| Math | [`predication-categories/concepts/closure-rule-system.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md), [`objects/predication-settling.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) |
| Theory text | [How to Compute Closure on a Small Knowledge Base](../../../../../../../../theories/science/theories/information/texts/how-to-compute-closure-on-a-small-knowledge-base.md) |
| Engineering | `predicated-computing/concepts/closure-rule-system`, `flatfile-agentic-resource-system/morphisms/settle` |
| Spec | [specs/kernel/sigma-delta-passes.md](../specs/kernel/sigma-delta-passes.md), [specs/kernel/closure-engine-internals.md](../specs/kernel/closure-engine-internals.md), [specs/kernel/closure-rule-record.md](../specs/kernel/closure-rule-record.md) |
| Code | [`src/substrate/closure_engine.py`](../../../src/substrate/closure_engine.py), [`src/substrate/delta_pass.py`](../../../src/substrate/delta_pass.py) |

**What this means when you write code.** σ-saturation and Δ-stabilisation are *separate passes* with separate gates. σ produces new cells (knowledge growing); Δ tightens existing values to fixed point (truth settling).
The [bounded-settlement property](../specs/kernel/sigma-delta-passes.md) means Δ converges in at most 2 substeps per cell — if your implementation loops, the algebra is wrong, not the fuel.
Layer firings within a layer MUST be lexicographic by bind-variable assignment for determinism.

## 6. The respond primitive

| Layer | Reference |
|---|---|
| Math | The composition $a \odot p$ in Phase 3, restricted by $\Rightarrow$ in Phase 2. |
| Engineering | `predicated-computing/morphisms/respond` |
| Spec | [specs/kernel/respond.md](../specs/kernel/respond.md) (the load-bearing spec — read it before anything else) |
| Decision | [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md) |
| Code | [`src/substrate/respond.py`](../../../src/substrate/respond.py) — `respond(target, payload, sender) → Result` |

**What this means when you write code.** Every substrate-touching call eventually reduces to `respond`.
UI affordances, MCP tool calls, federation pushes, internal closure firings — all `respond`.
Before adding a new substrate operation, ask whether it's actually `respond` with a different payload shape (it almost always is).
New "primitives" outside `respond` need a captain decision.

## 7. Fuel composition and the Lawvere quantale

| Layer | Reference |
|---|---|
| Math | Lawvere (1973), enriched-category cost; [`predicated-computing/objects/cost-quantale-of-fuel.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/cost-quantale-of-fuel.md), [`predicated-computing/theorems/cost-composition-via-lawvere-quantale.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) |
| Engineering | `functional-runtime-platform/concepts/cost-composition` |
| Spec | [specs/kernel/fuel-composition.md](../specs/kernel/fuel-composition.md), [specs/kernel/computational-model.md](../specs/kernel/computational-model.md) §9 |
| Decision | [decisions/cost-is-lawvere-quantale.md](../decisions/cost-is-lawvere-quantale.md) |
| Code | [`src/substrate/cost.py`](../../../src/substrate/cost.py) |

**What this means when you write code.** Fuel composes by quantale-product across the five fuel surfaces.
The fuel ceiling is *persisted alongside the settle event* so replay reproduces fuel-exhaustion outcomes byte-identically (see [respond.md §3](../specs/kernel/respond.md)).
If a `respond` produces non-byte-identical replay, suspect fuel persistence first.

## 8. Capability and authorisation as modal restriction

| Layer | Reference |
|---|---|
| Math | The $\Rightarrow$ adjoint (row 2) interpreted modally |
| Engineering | `agential-orchestration-platform/theorems/governance-as-modal-restriction`, `functional-runtime-platform/theorems/capability-non-amplification` |
| Spec | [specs/security/capability-model.md](../specs/security/capability-model.md), [specs/security/](../specs/security/) |
| Decision | [decisions/authorization-is-modal-restriction.md](../decisions/authorization-is-modal-restriction.md), [decisions/capability-not-acl.md](../decisions/capability-not-acl.md), [decisions/identity-is-boundary-projection.md](../decisions/identity-is-boundary-projection.md) |
| Code | [`src/substrate/authorization.py`](../../../src/substrate/authorization.py) |

**What this means when you write code.** Authority is a fiber, not a flag.
A sender's fiber composes via $\Rightarrow$ with the payload before settlement; cells the sender's fiber says nothing about become $\bot$ and produce no downstream effect.
Capability non-amplification is *structural*: you cannot grant more authority than you have, because the algebra forbids it.
Never add an "admin override" code path — the override is `respond` with a different sender fiber.

## 9. Inconsistency and H¹ audit

| Layer | Reference |
|---|---|
| Math | Sheaf cohomology over the predication presheaf; H¹ as the obstruction to global section |
| Theory text | [State Change as Passage Through Contestation](../../../../../../../../theories/science/theories/information/texts/state-change-as-passage-through-contestation.md) |
| Engineering | `predicated-computing/concepts/inconsistency-as-cohomology` |
| Spec | [specs/kernel/inconsistency-repair.md](../specs/kernel/inconsistency-repair.md), [specs/kernel/sigma-delta-passes.md §9](../specs/kernel/sigma-delta-passes.md) |
| Code | [`src/substrate/inconsistency.py`](../../../src/substrate/inconsistency.py) |

**What this means when you write code.** $\top$ ("paraconsistent") is the runtime witness of an H¹ obstruction at a cell.
The H¹ audit pass returns the regime-appropriate cohomology surface; in strict regime an obstruction triggers the inconsistency-repair lifecycle (witness emission, source classification, optional `repair_resolution`).
Never silently coerce $\top$ to $t$ or $f$ — that destroys the audit signal.

## 10. Federation merge as $\odot$

| Layer | Reference |
|---|---|
| Math | $\odot$ commutative, associative, idempotent → CRDT-by-algebra |
| Engineering | `predicated-computing/morphisms/federation-handshake` |
| Spec | [specs/network/](../specs/network/) (federation), [specs/ipc/](../specs/ipc/) |
| Decision | [decisions/federation-by-construction.md](../decisions/federation-by-construction.md), [decisions/federation-signatures-ed25519.md](../decisions/federation-signatures-ed25519.md) |
| Code | [`src/network/federation.py`](../../../src/network/federation.py) |

**What this means when you write code.** Federation merge is *algebra*, not consensus.
There is no leader, no Paxos, no Raft.
Two nodes that retain opposite-direction evidence merge to $\top$ at that cell, and downstream rules see the $\top$.
If you find yourself implementing tie-breaking, conflict resolution, or last-writer-wins — stop.
The algebra has already merged; you're flattening a $\top$ that the captain wants preserved.

## 11. Sessions, dispatch, heartbeat

| Layer | Reference |
|---|---|
| Math | n/a directly; an engineering construct over the substrate |
| Engineering | `agential-orchestration-platform/concepts/session`, `concepts/dispatch`, `concepts/heartbeat`; `flatfile-agentic-resource-system/objects/session-record` |
| Spec | [specs/process/](../specs/process/), [specs/scheduling/](../specs/scheduling/), [specs/init-boot/](../specs/init-boot/) |
| Decision | [decisions/heartbeat-is-the-scheduler.md](../decisions/heartbeat-is-the-scheduler.md), [decisions/event-ordinal-is-time.md](../decisions/event-ordinal-is-time.md) |
| Code | [`src/substrate/runtime.py`](../../../src/substrate/runtime.py), [`src/process/session.py`](../../../src/process/session.py), [`src/init_boot/`](../../../src/init_boot/) |

**What this means when you write code.** Time is event-ordinal; wall-clock is instrumentation.
The heartbeat is an asyncio loop that fires scheduled rules and processes the inbox queue, in declared-dependency order.
Sessions are substrate cells with stable slugs across restarts.
There is no preemption.
If you reach for `time.time()` or `asyncio.sleep()` in a code path that produces a cell, an event, or an audit entry — stop and use the ordinal.

## 12. Boot sequence and the four-layer rule architecture

| Layer | Reference |
|---|---|
| Engineering | `predicated-computing/concepts/boot-sequence`, [`predicated-computing/theorems/boot-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/boot-determinism.md), [`predicated-computing/theorems/cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md), `flatfile-agentic-resource-system/concepts/four-layer-rule-architecture`, `flatfile-agentic-resource-system/concepts/event-sourcing` |
| Spec | [specs/init-boot/boot-sequence.md](../specs/init-boot/boot-sequence.md) (nine phases) |
| Code | [`src/init_boot/boot.py`](../../../src/init_boot/boot.py), [`src/init_boot/bootstrap_users.py`](../../../src/init_boot/bootstrap_users.py), [`src/init_boot/fiber_reconcile.py`](../../../src/init_boot/fiber_reconcile.py) |

**What this means when you write code.** Boot is a deterministic function of (deployment image, persistent set).
Caches are *recomputable from history*, never authoritative against history (the cache-coherence theorem).
The fiber-reconcile routine rebuilds projections from event-log truth and treats divergence as `PCC_PROJECTION_DIVERGED` — the boot transitions to `degraded` rather than trusting potentially-stale cache.
If a boot phase appears to need write access to truth (the event log), redesign — boot phases are reconcile, not patch.

## 13. Self-representation everywhere

| Layer | Reference |
|---|---|
| Engineering | `predicated-computing/concepts/self-representation`, FARS four-layer architecture |
| Spec | [specs/](../specs/) (every subsystem cites this; there is no privileged system table anywhere) |
| Decision | [decisions/self-representation-everywhere.md](../decisions/self-representation-everywhere.md), [decisions/drivers-are-substrate-entities.md](../decisions/drivers-are-substrate-entities.md), [decisions/skills-have-manifest-contracts.md](../decisions/skills-have-manifest-contracts.md) |
| Code | every module: a driver, rule, skill, agent, office, capability is a cell with the appropriate `kind` predicate |

**What this means when you write code.** There is no `/etc`.
There is no `register_*()` Python call that adds a substrate-known thing as a side effect of import.
Drivers, network endpoints, packages, init scripts, user accounts, closure rules, agent records — all are substrate cells, added by appending events.
If you find yourself adding a Python registry, dictionary, or class hierarchy that holds substrate state, stop and ask whether the state belongs in the event log.

## 14. The praxonic / cultural convergence

| Layer | Reference |
|---|---|
| Cultural | Praxonic worldmaking; IRN as recursive-contradiction content |
| Theory text | [convergences §3](../texts/convergences.md#3-the-cultural-operational-and-praxonic-both-run-on-top) |
| Code | the $\top$ value's persistence through closure-rule firings |

**What this means when you write code.** The captain's commitment to $\top$ as first-class is not aesthetic; it's the runtime instantiation of the theory that recursive systems carry contradiction as content.
Every code path that handles $\top$ is honouring this; every code path that flattens it is breaking it.
When unsure whether to coerce $\top$ in a new operator, the answer is: don't.

## See also

- [theories.md](theories.md) — paths into the full theory chain.
- [platform-theories.md](platform-theories.md) — the six PredComp sub-platforms and FARS, with what each contains.
- [implementation/python.md](../implementation/python.md) — canonical Python libraries; where Python's strengths help and constraints surface.
- [implementation/workflows.md](../implementation/workflows.md) — step-by-step recipes for the recurring dev workflows that operationalise this theory.
- [specs/_index.md §"Theory grounding"](../specs/_index.md) — the per-subsystem theory grounding table.
- [texts/convergences.md](../texts/convergences.md) — the three convergences underlying the design.
