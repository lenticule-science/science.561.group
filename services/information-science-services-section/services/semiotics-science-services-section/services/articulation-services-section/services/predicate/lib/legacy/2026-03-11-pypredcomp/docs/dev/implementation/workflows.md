---
title: "Developer workflows"
description: "Step-by-step procedural recipes for the recurring dev workflows: landing a v0.2a task end-to-end, writing a paired fixture, adding a closure rule, debugging settlement non-convergence, debugging projection divergence, debugging non-deterministic replay, running targeted vs full tests, working with the event log. Each recipe names the spec it implements, the modules it touches, and the conformance check that proves it works."
kind: implementation-guide
status: active
authority: "AGENTS.md, specs/, decisions/"
---

# Developer workflows

Procedural step-by-step recipes for the work the captain actually asks for.
Each recipe is keyed to a real failure mode the project has hit; following it is the path of least surprise.

Read once before your first landing; reread the relevant recipe before you start the work it covers.
These recipes are *not* a substitute for the specs they cite — they are the bridge from "I have a task" to "the spec citation in the code comment is the right one."

The discipline these recipes encode comes from [pypredcomp/AGENTS.md](../../../AGENTS.md) (anti-patterns + session shape) and [_conventions.md](../_conventions.md) (work-orchestration).
When a recipe says "the milestone's ship target," it means the gate enumerated in [milestones/v0.2a-multi-user-single-node.md §"Ship targets"](../milestones/v0.2a-multi-user-single-node.md).

## Index

1. [Landing a v0.2a task end-to-end](#1-landing-a-v02a-task-end-to-end)
2. [Writing a paired fixture (`tNN-NNf`)](#2-writing-a-paired-fixture-tnn-nnf)
3. [Adding a closure rule](#3-adding-a-closure-rule)
4. [Adding or extending a stdlib verb](#4-adding-or-extending-a-stdlib-verb)
5. [Debugging settlement non-convergence](#5-debugging-settlement-non-convergence)
6. [Debugging projection divergence (`PCC_PROJECTION_DIVERGED`)](#6-debugging-projection-divergence-pcc_projection_diverged)
7. [Debugging non-deterministic replay](#7-debugging-non-deterministic-replay)
8. [Targeted vs full test runs](#8-targeted-vs-full-test-runs)
9. [Working with the event log](#9-working-with-the-event-log)
10. [Promoting a thin `t02-NN` task record into a procedural plan](#10-promoting-a-thin-t02-nn-task-record-into-a-procedural-plan)

---

## 1. Landing a v0.2a task end-to-end

The full arc, from the captain's request to a record cell on the task.
This is the *default* workflow — every other recipe is a sub-step of this one.

**Preconditions.** The captain has named a task ID (e.g. `t02-30`) or said "continue" with v0.2a active.

**Steps.**

1. **Read the task record.** `tasks/engineering/<task>.md`.
  Confirm `status: open` (or whatever the captain expects).
  Read the `## Description` and `## Acceptance` sections.
  If they're thin (just defer to the milestone), follow [recipe 10](#10-promoting-a-thin-t02-nn-task-record-into-a-procedural-plan) before continuing.
2. **Read the milestone's ship targets.** [milestones/v0.2a-multi-user-single-node.md §"Ship targets"](../milestones/v0.2a-multi-user-single-node.md).
  Identify which ship target the task contributes to.
  If it doesn't contribute to any, ask the captain — it may be wrongly scoped.
3. **Read the load-bearing spec.** Per the milestone's §Scope, the task names a spec under [specs/](../specs/).
  Read it once.
  Don't re-orient mid-work.
4. **Read the theory row.** Open [references/theory-for-developers.md](../references/theory-for-developers.md) and find the row whose construct your task touches.
  Walk theory → spec → code.
  If the existing code disagrees with the spec, the spec wins (and the captain may need to know).
5. **Decide whether to write `.local/session_plan.md`.** Per [pypredcomp/AGENTS.md](../../../AGENTS.md), only if the work has 3+ ordered steps.
  If it does, write the session plan before any code.
6. **Sketch the arc.** On paper or in the session plan: which modules will change, which new files will be created, which spec citation will appear in each code comment, which conformance check or fixture proves it works end-to-end. **The conformance check is non-negotiable** — if you can't name how end-to-end correctness is proved, you don't have a landing yet.
7. **Build.** Edit code.
  Cite the spec in the module docstring or top-of-file comment (e.g. `"""Implements specs/kernel/respond.md §3.1."""
  `).
  Per [pypredcomp/AGENTS.md §Discipline](../../../AGENTS.md), errors raise `SubstrateError` with codes from [`src/substrate/error_codes.py`](../../../src/substrate/error_codes.py); add new codes there before raising them inline.
8. **Targeted test runs as you go.** `pytest <one_file>` for the file you touched.
  Do not run the full suite per micro-change.
9. **Author the paired fixture.** Per [decisions/fixture-authoring-paired-task.md](../decisions/fixture-authoring-paired-task.md), every implementation task has a `tNN-NNf` paired fixture.
  Follow [recipe 2](#2-writing-a-paired-fixture-tnn-nnf).
10. **Run the conformance check that proves the ship target.** This is the gate-passing run.
  Identify it from the ship targets section: e.g. gate 5 ("H¹ audit pass returns regime-appropriate cohomology surface") is proven by the cohomology fixture in [tests/conformance/](../../../tests/conformance/).
11. **Run the full conformance suite once.** `pytest tests/conformance/`.
  Only if your task touched substrate-level code.
  Anything outside your touched modules that fails is pre-existing per [pypredcomp/AGENTS.md](../../../AGENTS.md) — note it but don't chase it.
12. **Update the task's `## Progress cells`.** Append a cell `(task:<id>, status, done, true)` with a witness pointer to the source file(s) and conformance test(s) that prove it.
  Use the [`fars-work-record-progress-cell`](../../../../../../../../.agents/skills/fars-work-record-progress-cell/SKILL.md) skill to enforce shape; manual edit is also acceptable.
  See `t02-110`'s done-cell for the canonical example shape.
13. **Advance the task's status.** Use [`fars-work-advance-task-state`](../../../../../../../../.agents/skills/fars-work-advance-task-state/SKILL.md).
  The lifecycle table in [specs/work-orchestration/task.md](../specs/work-orchestration/task.md) §2 enforces valid transitions.
14. **Update the milestone's `completion-percent`** if your task changes the rolled-up percentage.
  Use [`fars-work-rollup-progress`](../../../../../../../../.agents/skills/fars-work-rollup-progress/SKILL.md).
15. **Stop.** Don't commit unless the captain asks.
  Don't pile on adjacent improvements.
  The capability works end-to-end; further is scope creep.

**Failure modes this recipe prevents.**

- Shipping a slice of a cross-cutting feature and declaring done (the recipe forces the conformance gate at step 10).
- Quietly diverging from spec (the recipe forces spec citation at step 7).
- Test-coverage nibbling (the recipe binds work to a ship target, not to a `NotImplementedError`).
- Doc-assessment-as-session (the recipe makes spec reading a preparation step, not output).

---

## 2. Writing a paired fixture (`tNN-NNf`)

**Authority.** [decisions/fixture-authoring-paired-task.md](../decisions/fixture-authoring-paired-task.md).
Every implementation task has a paired fixture-authoring task with the suffix `f`.
They land together.

**Steps.**

1. **Identify the conformance area.** From [specs/conformance-vectors.md](../specs/conformance-vectors.md), pick the section your fixture pins (§11 stratification, §12 tier-routing, §13 boundary, §14 messaging, §15 risk-scoring, §16 streaming, §17 mcp-catalog, §18 skill-manifest, §19 pipeline, etc.).
2. **Place the fixture file.** Under `tests/fixtures/<area>/` (created if absent) named by the conformance vector.
  The path is the conformance contract.
3. **Compose the fixture as canonical JSONL.** Each line is one event in the canonical wire form per [specs/kernel/canonicalization.md](../specs/kernel/canonicalization.md).
  Lexicographic key sort, minimal numeric form, no whitespace.
  Generate it with [`src/substrate/canonicalization.py`](../../../src/substrate/canonicalization.py); do not hand-canonicalize.
4. **Write the test that replays the fixture.** Under [`tests/conformance/`](../../../tests/conformance/).
  The test calls `respond` (or whichever spec entry point the area covers) on each event and asserts byte-identical fiber state at the tail.
5. **Verify cross-implementation byte-identity.** Run the same fixture against the Rust sibling at `operations/engineering/services/mash/` if the Rust port covers the area.
  A fixture that passes in Python but fails in Rust (or vice-versa) is a spec defect; surface to the captain rather than silently diverge.
6. **Author the paired task record.** `tasks/engineering/tNN-NNf-<topic>.md` with frontmatter `kind: task`, `kind-of-task: engineering`, and a `## Description` that names the fixture path and the conformance section it pins.
7. **Cross-link the parent task.** In the parent's `## Acceptance`, confirm the paired fixture clause is satisfied.
  In the parent's `## Progress cells`, append `(task:<parent>, paired-fixture-authored, task:<parent>f, true)` with the fixture-file path as witness.

**What MUST be true of every fixture.**

- Replay produces byte-identical fiber state across two runs (determinism).
- Replay produces byte-identical fiber state across Python and Rust (cross-language).
- The fixture's events are canonical-form (sortable hash linkage round-trips).
- The conformance section it pins is named in the test's docstring.

---

## 3. Adding a closure rule

**Authority.** [specs/kernel/closure-rule-record.md](../specs/kernel/closure-rule-record.md), [specs/kernel/closure-engine-internals.md](../specs/kernel/closure-engine-internals.md).
The closure-rule discipline is grounded in row 5 of [theory-for-developers.md](../references/theory-for-developers.md).

**Steps.**

1. **Confirm the rule belongs in the kernel.** Most rules belong in the rule system as substrate cells, not in code.
  A closure rule is *only* in code if it is part of the closure engine itself (e.g. the σ-pass, the Δ-pass) — and those are already implemented in [`src/substrate/closure_engine.py`](../../../src/substrate/closure_engine.py) / [`src/substrate/delta_pass.py`](../../../src/substrate/delta_pass.py).
2. **Author the rule as a substrate cell.** Construct a rule record per [closure-rule-record.md](../specs/kernel/closure-rule-record.md): premise patterns, conclusion patterns, priority, fuel, scope.
  Use the message-language term calculus per [specs/kernel/message-language.md](../specs/kernel/message-language.md).
3. **Pick a priority deliberately.** Within a layer, rule firing order is priority then lexicographic by bind-variable assignment.
  Determinism depends on this.
  Don't tie priorities by accident.
4. **Pick a fuel bound deliberately.** Per-rule fuel composes with the respond fuel ceiling under the Lawvere quantale per [specs/kernel/fuel-composition.md](../specs/kernel/fuel-composition.md).
  Default 16 layers per [respond.md §2 Phase 3](../specs/kernel/respond.md); tighten if your rule should converge faster.
5. **Append the rule via `respond`** to the rule-system entity.
  Never `import`-time-register; the substrate is built from event-log replay, not import chains (per [pypredcomp/AGENTS.md "What the Python implementation MUST NOT do"](../../../AGENTS.md) and [implementation/python.md](python.md)).
6. **Author a fixture exercising the rule.** A small JSONL whose replay fires the rule and whose tail-state is the proof the rule fired correctly.
  Follow [recipe 2](#2-writing-a-paired-fixture-tnn-nnf).
7. **Verify σ/Δ stabilisation completes.** Two substeps per cell maximum (the bilattice's bounded-settlement property).
  If your rule loops, the rule is wrong, not the fuel.

---

## 4. Adding or extending a stdlib verb

**Authority.** [specs/stdlib/](../specs/stdlib/), [specs/kernel/message-language.md](../specs/kernel/message-language.md), v0.2b owns this work per [milestones/v0.2b-drivers-observability-packaging.md](../milestones/v0.2b-drivers-observability-packaging.md).

**Steps.**

1. **Confirm the verb is in scope.** The stdlib coreutils-equivalent set is project, filter, fold, materialize, hash, fork, await, settle, witness, audit, retract, assert.
  New verbs need a captain decision.
2. **Spec the verb.** A spec under `specs/stdlib/<verb>.md` with: signature in the message language; semantics as a `respond` reduction (or as a kernel primitive if it doesn't reduce); per-regime envelope per the dispatch-shell discipline in [specs/stdlib/_index.md](../specs/stdlib/_index.md).
3. **Implement in [`src/substrate/stdlib.py`](../../../src/substrate/stdlib.py).** Cite the spec in the function docstring.
4. **Add the conformance fixture.** Follow [recipe 2](#2-writing-a-paired-fixture-tnn-nnf).
  Place under `tests/fixtures/<verb-category>/` (created if absent) per the verb's category.
5. **Add the verb to the message-language CLI** ([`src/shell/repl.py`](../../../src/shell/repl.py)) only if v0.2b dispatch-shell work is in scope — otherwise leave the surface for later.

---

## 5. Debugging settlement non-convergence

**Symptom.** A `respond` invocation exhausts fuel (`PCR_FUEL_EXCEEDED`) or appears to loop.

**Steps.**

1. **Capture the repair log.** Every `respond` returns a `repair_log` even on error per [specs/kernel/respond.md §1](../specs/kernel/respond.md).
  Read the entries; identify which rule(s) fire repeatedly.
2. **Verify the bilattice algebra.** Run the adjunction property test: `pytest tests/conformance/test_adjunction_property.py`.
  If it fails, the algebra in [`src/substrate/algebra.py`](../../../src/substrate/algebra.py) is wrong.
  Stop everything else and fix it.
3. **Verify the σ/Δ split.** Δ-stabilisation converges in at most 2 substeps per cell per [sigma-delta-passes.md](../specs/kernel/sigma-delta-passes.md).
  If a cell oscillates, the rule's conclusion isn't $\le_k$-monotone — the rule is wrong, not the engine.
4. **Check the rule's fuel and priority.** Per-rule fuel composes with the respond ceiling per [fuel-composition.md](../specs/kernel/fuel-composition.md).
  Two rules at the same priority that produce each other's premises will loop until fuel exhausts.
5. **Look for $\top$ propagation.** If a $\top$ appears mid-settlement and a downstream rule fires on $\top$ unexpectedly, the receiving rule's pattern doesn't restrict on bilattice value as it should.
6. **Reproduce against the Rust algebra.** Per [specs/kernel/_index.md §"Implementation note"](../specs/kernel/_index.md), the Rust algebra is the truth-source for operator semantics across both implementations.
  If Python loops and Rust converges (or vice-versa), the operator implementation differs.
7. **Surface to the captain** if the spec is silent on the case.
  Don't silently change rule semantics to "fix" the loop.

---

## 6. Debugging projection divergence (`PCC_PROJECTION_DIVERGED`)

**Symptom.** Boot transitions to `degraded` with `PCC_PROJECTION_DIVERGED`; or [`tests/conformance/test_projection_naturality.py`](../../../tests/conformance/test_projection_naturality.py) fails.

**Steps.**

1. **Confirm the cache vs truth gap.** Per [specs/init-boot/boot-sequence.md §4.2](../specs/init-boot/boot-sequence.md), Phase 3's fiber-reconcile rebuilds projections from event-log truth and compares to existing on-disk files.
  Divergence means the on-disk projection is not what the event log says it should be.
2. **Identify the diverged entity.** The error includes the entity slug.
  Read `$ROOT/cells/<pp>/<id>.json` for the on-disk version; replay the event log for that entity to see what it should be.
3. **Check for a stratum-leak bug.** Per [specs/kernel/stratified-facts.md](../specs/kernel/stratified-facts.md) and [specs/kernel/projection-naturality.md](../specs/kernel/projection-naturality.md), each stratum projection file holds *only* its stratum cells.
  Saturated firings leaking into `asserted.json` is the canonical bug.
  The pin is [`tests/conformance/test_stratum_e3.py`](../../../tests/conformance/test_stratum_e3.py) `test_each_projection_file_holds_only_its_stratum_cells`.
4. **Check that `materialize_by_stratum_projections` ran.** Per [`src/substrate/projection.py`](../../../src/substrate/projection.py), this function is called from Phase 4b of [`src/substrate/respond.py`](../../../src/substrate/respond.py).
  If a `respond` skipped Phase 4b, projection won't be written.
5. **Discard the cache.** Per [boot-sequence.md §4.2 step 4](../specs/init-boot/boot-sequence.md), the in-memory fiber map of any entity whose projection diverged is discarded; reads rebuild on demand.
  The fix is *never* to patch the cache to match — caches are recomputable from history per [`predicated-computing/theorems/cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md).
6. **If the event log itself is wrong**, the bug is upstream — a `respond` produced a non-canonical event, or a settle event omitted a cell.
  Walk back to the producing `respond` and trace.

---

## 7. Debugging non-deterministic replay

**Symptom.** Two boots from the same event log produce byte-different fiber state; or the fuel-composition gate (gate 6 of v0.2a) fails: a `respond` with explicit `F = top-level ceiling` produces non-byte-identical replay across two fresh boot cycles.

**Steps.**

1. **Check fuel persistence.** Per [respond.md §3](../specs/kernel/respond.md), the fuel ceiling MUST be persisted alongside the settle event.
  Open the offending settle event in `events.jsonl` and confirm the fuel field is present.
2. **Check bind-variable ordering.** Per [respond.md §2 Phase 3](../specs/kernel/respond.md), within a layer bind-variable assignments fire in lexicographic order.
  A `dict` iteration in Python on an unsorted dict (older than 3.7, or after `set` operations) breaks this.
  Audit [`src/substrate/closure_engine.py`](../../../src/substrate/closure_engine.py) for unsorted iteration.
3. **Check rule priority.** Two rules at the same priority must still fire in deterministic order — usually by rule-id lexicographic.
  Confirm.
4. **Check canonicalization.** Per [pypredcomp/AGENTS.md "What the Python implementation MUST NOT do"](../../../AGENTS.md), pydantic models MUST round-trip canonical JSON byte-identically.
  A model whose `model_dump_json()` differs from `canonicalization.canonical_json(model.model_dump())` is the bug.
5. **Check for wall-clock leakage.** Per [decisions/event-ordinal-is-time.md](../decisions/event-ordinal-is-time.md), any `time.time()` or `datetime.now()` in a path that produces a cell, an event, or an audit entry is a determinism bug.
  Grep for these in [`src/substrate/`](../../../src/substrate/).
6. **Check asyncio task ordering.** Concurrent `respond` against disjoint targets is fine; concurrent against the same target requires the event-log append lock per [decisions/event-log-is-jsonl.md](../decisions/event-log-is-jsonl.md).
  Confirm the lock is held over the full append-then-emit window.

---

## 8. Targeted vs full test runs

**Authority.** [pypredcomp/AGENTS.md "Anti-patterns"](../../../AGENTS.md) — reflexive full-suite runs are a named anti-pattern.

| Situation | Run |
|---|---|
| Editing one module | `pytest tests/unit/test_<module>.py` |
| Editing closure-rule semantics | `pytest tests/conformance/test_adjunction_property.py tests/conformance/test_projection_naturality.py tests/conformance/test_stratum_e3.py` |
| Editing canonicalization | `pytest tests/conformance/test_canonicalization.py` and any fixture-driven tests under `tests/fixtures/` (created when fixtures land) |
| Editing a stdlib verb | `pytest tests/unit/test_stdlib.py tests/conformance/test_<verb>.py` |
| Editing boot or runtime | `pytest tests/unit/test_runtime.py tests/conformance/test_boot_*.py` |
| Editing federation / network | `pytest tests/unit/test_federation.py tests/conformance/test_federation_*.py` |
| Before declaring a substrate-level landing done | `pytest tests/conformance/` (full conformance suite, once) |
| End of a milestone ship | `pytest` (full suite, once) |

**Hypothesis property tests** under [`tests/property/`](../../../tests/property/) run against the bilattice algebra.
Run them when editing [`src/substrate/algebra.py`](../../../src/substrate/algebra.py), `cost.py`, `authorization.py`, or any other module whose correctness is algebraic.

---

## 9. Working with the event log

**Authority.** [decisions/event-log-is-jsonl.md](../decisions/event-log-is-jsonl.md), [decisions/event-ordinal-is-time.md](../decisions/event-ordinal-is-time.md).
The event log is `$ROOT/events.jsonl` — append-only, hash-chained, the only source of substrate truth.

**Common operations.**

1. **Read the tail.** `tail -n 20 $ROOT/events.jsonl | python -m json.tool` (each line is a JSON object).
2. **Find the last settle event for an entity.** `grep '"target":"<slug>"' $ROOT/events.jsonl | grep '"kind":"settle"' | tail -n 1`
3. **Replay the log to a particular ordinal.** Pass `--up-to-ord <N>` to the boot harness; the runtime stops after the Nth event and reports state.
4. **Verify hash linkage.** Per [boot-sequence.md §2](../specs/init-boot/boot-sequence.md), Phase 1 walks the chain from the genesis event to the tail and verifies each `prev-hash` matches.
  A break is `PCC_HASH_CHAIN_BROKEN`.
5. **Snapshot.** Per [filesystem/](../specs/filesystem/), a snapshot is a `snapshot` event recording a verifiable hash of materialised state at an ordinal.
  Snapshots are produced by `respond` against the snapshot entity, not by hand.

**What you MUST NOT do.**

- Edit the event log in place.
  Editing breaks hash linkage and destroys replay correctness.
- Remove events.
  Retraction is an *append* of a retract event per [stratified-facts.md](../specs/kernel/stratified-facts.md), not a delete.
- Use the event log as a queue.
  Inboxes are session entities, not the log.
- Bypass the log by writing to `$ROOT/cells/` directly.
  Cell-record files are projection cache; they're rebuilt from the log per [recipe 6 step 5](#6-debugging-projection-divergence-pcc_projection_diverged).

---

## 10. Promoting a thin `t02-NN` task record into a procedural plan

The `t02-NN` per-family records (e.g. `t02-30`, `t02-110`, `t02-140`) are intentionally thin dispatch shells whose `## Description` defers to the milestone.
Before a developer can land one, it needs a procedural plan.
This recipe is the promotion.

**When to promote.** Right after picking the task and before any code (step 1 → step 6 of [recipe 1](#1-landing-a-v02a-task-end-to-end)).

**Steps.**

1. **Open the task record.** Read the existing `## Description`.
  If it's the dispatch-shell shape ("the implementation slice for `t02-NN` is shipped per the owning milestone's ship targets"), this recipe applies.
2. **Identify the spec the task realises.** The milestone's §Scope or §"Task IDs owned by v0.2a" names it.
  If the task name doesn't unambiguously map to a spec section, ask the captain rather than guess.
3. **Identify the source modules to touch.** Look up the spec's "Implementation note" section, or find the module by grepping for the spec citation in [`src/`](../../../src/) (e.g. `rg 'specs/init-boot/boot-sequence.md.*4.1' src/`).
4. **Identify the conformance check.** From [specs/conformance-vectors.md](../specs/conformance-vectors.md) or the ship targets in [milestones/v0.2a-multi-user-single-node.md §"Ship targets"](../milestones/v0.2a-multi-user-single-node.md).
  Name the test file path that proves end-to-end correctness.
5. **Rewrite the task's `## Description`.** Add: (a) one sentence of what the task does; (b) the spec citation; (c) the modules to touch; (d) any depends-on-tasks that must be done first; (e) which ship target this contributes to.
6. **Rewrite the task's `## Acceptance`.** Add specific, checkable items: source files modified with spec citation in docstring; paired fixture authored at `tests/fixtures/<area>/<file>.jsonl`; conformance test passes; progress cell appended with witness pointers.
7. **Save.** Don't edit the milestone or the spec — the task body is sufficient.
  The milestone is authority; the task is procedure.

See `t02-30-v0.2a-multi-user-authoring.md` and `t02-140-v0.2a-multi-user-authoring.md` for example promoted bodies — both were promoted on 2026-05-03 as the canonical pattern.

---

## See also

- [pypredcomp/AGENTS.md](../../../AGENTS.md) — hard scope rules, anti-patterns, session shape.
- [_conventions.md](../_conventions.md) — work-orchestration conventions; horizon vs status.
- [theory-for-developers.md](../references/theory-for-developers.md) — the theory→code translation that grounds every recipe here.
- [python.md](python.md) — canonical Python libraries and the source layout.
- [rust.md](rust.md) — the Rust sibling; same conformance vectors byte-identically.
- [milestones/v0.2a-multi-user-single-node.md](../milestones/v0.2a-multi-user-single-node.md) — current active milestone with ship targets.
- [specs/conformance-vectors.md](../specs/conformance-vectors.md) — the cross-implementation conformance suite.
- [`fars-work-*` skills](../../../../../../../../.agents/skills/) — task-record scaffolding and lifecycle enforcement.
