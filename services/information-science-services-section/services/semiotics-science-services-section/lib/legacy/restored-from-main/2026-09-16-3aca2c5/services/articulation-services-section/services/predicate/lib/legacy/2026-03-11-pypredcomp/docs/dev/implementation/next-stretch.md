---
title: "Next-stretch plan: v0.2a residual → v0.2b → v0.3 on-ramp"
description: "Procedural step-by-step for the next ~3 milestones, derived from the predicated-computing and predication-categories theorems. For each stage: which theorem authorises the work, the spec to write, the source module to touch, the conformance proof, and — critically — what the stage unlocks that makes the next stage possible. Not a substitute for the milestone records; a thread through them."
kind: implementation-guide
status: active
authority: "theories/.../predicated-computing/, theories/.../predication-categories/, milestones/, decisions/"
---

# Next-stretch plan

Read once at the top of any session whose horizon extends past a single task.
Reread the relevant stage before promoting a thin task record (see [workflows.md recipe 10](workflows.md#10-promoting-a-thin-t02-nn-task-record-into-a-procedural-plan)).

Each stage names:

- **Theorem grounding** — the predicated-computing or predication-categories theorem that authorises the stage's work.
  If you cannot point at the theorem, you do not yet have a landing.
- **Procedural steps** — the ordered moves, written so a developer can pick up at any step.
- **Conformance proof** — the test or fixture that proves the stage closed.
- **Enables next** — the *capability* that opens the next stage.
  This is the load-bearing question: every stage in this plan exists because the next one cannot start without it.

The plan is forward-only.
Backward-edits to closed stages mean a ship target slipped; consult the relevant milestone's gate list and re-open the gate explicitly rather than working around it.

## How this plan was derived

The plan is not a wish-list.
Each stage's existence is forced by:

1. A theorem in [`predicated-computing/theorems/`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/) or [`predication-categories/theorems/`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/) whose hypothesis is the *previous* stage's deliverable.
2. A row of [theory-for-developers.md](../references/theory-for-developers.md) whose code surface the stage realises.
3. A milestone ship target from [milestones/](../milestones/) that the stage closes.

If you find a stage in this plan whose chain (theorem → spec → gate) you cannot reconstruct, the plan is wrong, not the theory.
Surface it.

---

## Stage 0 — Where we are right now (2026-05-03)

- [v0.1](../milestones/v0.1-substrate-boots.md) closed.
  Substrate boots; respond reduces; canonical JSON round-trips; replay determinism (gate-1 of v0.2a) verified by [`tests/conformance/test_replay_determinism.py`](../../../tests/conformance/test_replay_determinism.py).
- [v0.2a](../milestones/v0.2a-multi-user-single-node.md) active.
  Per-stratum projection (`t02-110`) done; multi-user authoring scaffolding (`t02-30`, `t02-140`) promoted; personnel→boundary migration ([pt-08](../tasks/engineering/pt-08-personnel-to-boundary-migration.md)) open; H¹ audit cohomology surface (gate 5) and fuel-composition determinism (gate 6) outstanding.

The procedural question this plan answers from here is: **what is the smallest forward sequence of landings that makes v0.3 (bundled userland) reachable?**

---

## Stage 1 — Close v0.2a

> **For the granular per-landing form**, read [next-stretch-now.md](next-stretch-now.md).
> It telescopes this stage into four named landings (L1 personnel→boundary migration, L2 multi-user authoring scaffolding, L3 H¹ audit cohomology surface, L4 fuel-composition determinism), each with source-module pointers, captain-trove grounding, and the v0.2b/v0.3 work each landing unblocks.
> Use this Stage 1 when scoping multi-stage work; use the NOW-doc when picking a single landing.

**Theorem grounding.** [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) and [`audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md).
Per the first, projection-cache divergence surfaces as `PCC_PROJECTION_DIVERGED` (we never paper over divergence) (this is what gate 5 of v0.2a actually requires); per the second, the H¹ surface is the *content* the audit pass returns, not a side-effect of it.
Row 4 (stratified facts) and row 9 (H¹ audit) of [theory-for-developers.md](../references/theory-for-developers.md).

The closure-rule discipline grounding the residual fuel work is [`predication-categories/theorems/cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md): fuel composes by quantale-product, and the persisted fuel ceiling (row 7) is what makes replay determinism with non-trivial fuel-exhaustion paths possible.

### 1A. Personnel → boundary migration

Drives [pt-08](../tasks/engineering/pt-08-personnel-to-boundary-migration.md).
The migration is a one-shot natural transformation between two presheaves, authorised by [`identity-is-boundary-projection`](../decisions/identity-is-boundary-projection.md) and disciplined by row 13 (self-representation).

**Procedural steps.**

1. Extend [specs/init-boot/boot-sequence.md](../specs/init-boot/boot-sequence.md) §"Personnel-to-boundary migration" with the inverse-projection clause — the v0.1 fiber MUST be recoverable, so backwards-compat reads do not cost a re-author.
2. In [`src/init_boot/bootstrap_users.py`](../../../src/init_boot/bootstrap_users.py), implement detection of `personnel-record` cells lacking `migrated-to-boundary-at-ord` and emit boundary records via `respond` against the boundary entity.
  Do not mutate the personnel cell; append a `migrated-to-boundary-at-ord` predication.
3. Write the migration audit cell (one settle event with a witness chain pointing at the source personnel cell and the produced boundary cell) per row 9.
4. Idempotency: re-running on a migrated store finds no candidates and is a no-op append (zero new events).
5. Author paired fixture `t02-127f` covering the v0.1 → v0.2 substrate replay path.

**Conformance proof.** `t02-127f` plus a re-run of the boot-determinism conformance under [`tests/conformance/test_boot_determinism.py`](../../../tests/conformance/test_boot_determinism.py).
Migrated and unmigrated stores replay byte-identically up to the migration ordinal.

**Enables next.** Once boundary is the canonical identity surface, every multi-user authoring path in 1B addresses senders by boundary slug and the capability adjoint of row 8 acts on boundary fibers — *not* on legacy personnel records.
Without this, multi-user scaffolding has two identity systems and the modal-restriction algebra cannot enforce non-amplification consistently.

### 1B. Multi-user authoring scaffolding (close `t02-30`, `t02-140`)

**Procedural steps.**

1. Land the promoted bodies of [`t02-30`](../tasks/engineering/t02-30-v0.2a-multi-user-authoring.md) and [`t02-140`](../tasks/engineering/t02-140-v0.2a-multi-user-authoring.md) per their `## Description` arcs.
2. Confirm that the sender-fiber path through `respond` reads from the boundary record (not personnel).
3. Add the dispatch-shell smoke test that two boundaries authoring concurrently against disjoint targets produce byte-identical fiber state on replay (this is the *real* multi-user gate, not an interactive UI test).

**Conformance proof.** `tests/conformance/test_multi_user_authoring.py` (to be written) replaying a fixture of two-boundary concurrent authoring.

**Enables next.** v0.2b's driver-model work treats a driver as a substrate cell whose `respond` is invoked by an authenticated boundary-fiber (row 8 + row 13).
Drivers cannot be made first-class without a sender-identity that is a substrate cell.

### 1C. H¹ audit cohomology surface (gate 5 of v0.2a)

**Theorem.** [`audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md).
The audit pass returns the regime-appropriate cohomology surface; in strict regime, an H¹ obstruction triggers the inconsistency-repair lifecycle.

**Procedural steps.**

1. Confirm [`src/substrate/inconsistency.py`](../../../src/substrate/inconsistency.py) exposes `audit_h1(target) -> CohomologySurface` returning a structured object whose serialisation is canonical-JSON round-tripping (row 3).
2. Wire the audit pass into [`src/substrate/respond.py`](../../../src/substrate/respond.py) §Phase 4c so every `respond` returns its H¹ surface alongside the repair log.
3. Specify the regime-conditional behaviour in [specs/kernel/inconsistency-repair.md](../specs/kernel/inconsistency-repair.md): strict regime emits a witness; tolerant regime tags the cell with $\top$ and continues; aperiodic regime defers to the fuel ceiling.
4. Author conformance fixture exercising one cell each of $\bot$, $t$, $f$, $\top$ outcomes.

**Conformance proof.** `tests/conformance/test_h1_audit_surface.py`.
Gate 5 closed.

**Enables next.** v0.2b's observability dashboards (goal: [v0.2b-observability-dashboards](../goals/v0.2b-observability-dashboards.md)) consume this surface directly.
Without a structured H¹ object, dashboards either invent their own structure (and diverge from the algebra) or render nothing.

### 1D. Fuel-composition determinism (gate 6 of v0.2a)

**Theorem.** [`cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) plus row 7 of theory-for-developers.

**Procedural steps.**

1. Walk [`src/substrate/respond.py`](../../../src/substrate/respond.py) and confirm the fuel ceiling is read from the settle event on replay (not from defaults).
2. Walk [`src/substrate/cost.py`](../../../src/substrate/cost.py) for the quantale-product across the five fuel surfaces; the property test passes for arbitrary (associative, commutative, identity) ceilings.
3. Add a fixture whose first run exhausts fuel mid-rule and whose replay reproduces the same `PCR_FUEL_EXCEEDED` at the same ordinal.

**Conformance proof.** `tests/conformance/test_fuel_replay_determinism.py`.
Gate 6 closed.

**Enables next.** v0.2b's stdlib verbs (project, fold, materialize, etc.) each carry per-verb fuel envelopes; without composable fuel determinism the dispatch shell cannot guarantee that `verb1 | verb2` replays identically to its pipelined run.

---

## Stage 2 — v0.2b

Reach state: drivers are first-class, dashboards render, stdlib reduces to `respond`, packaging produces a reproducible wheel, network specs are stubbed with the algebraic spec eagerly authored.

### 2A. Driver model under faithful-interfacer-functor

**Theorem grounding.** [`doctrine-fidelity-via-faithful-interfacer-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md) plus row 13 (self-representation) of theory-for-developers.
A driver is *not* a Python module that registers itself at import; it is a substrate cell whose `kind` is `driver` and whose interface contract is encoded in the cell's predications.
The faithful-interfacer-functor is the proof obligation: the driver's substrate-side surface and its external-side surface are connected by a functor that preserves the operations the doctrine claims they share.

**Imaginative grounding.** Three captain-trove files give the design rationale for treating drivers as substrate cells rather than as registered Python modules:

- **`mcp-as-system-api`** + **`mcp-verb-inventory`** + **`cells-as-models-mcp-as-io`** ([trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  The argument: MCP is the substrate's external API; every external surface is one more MCP-shaped boundary; the ~50-verb catalog is enumerated already, so the driver model is the on-disk realisation of an inventory the captain has already worked out.
  Reduction: the MCP boundary is one instance of [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md), composed with [`doctrine-fidelity-via-faithful-interfacer-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md).
  No new theorem.
- **`live-swap-service-components`** ([trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  Hot-swapping a driver is *retract-and-reassert* against the driver-cell — never a runtime monkey-patch.
  The discipline lands at 2A because the driver-as-cell shape is the *only* shape that admits live-swap as a `respond` rather than as an out-of-band restart.
  Reduction: the swap is `respond` against `kind: driver` cells per [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md).
- **`node-rust-responsibility-split`** ([trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  The Rust port (per [implementation/_index.md](_index.md#sequencing-across-releases)) inherits the same driver-cell schema unchanged — the schema is the algebra-level contract, the language is the realisation.
  Reduction: this is the cross-language conformance discipline of [`conformance-via-fiber-algebra-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/conformance-via-fiber-algebra-functor.md) at the driver-cell scope.

**Procedural steps.**

1. Author [specs/drivers/driver-model.md](../specs/drivers/driver-model.md) §"Faithful interfacer functor" as the normative obligation.
  Cite the theorem.
  Name the four operations a driver-cell MUST expose: `open`, `respond` (delegated to substrate), `close`, `audit`.
2. Author the per-driver conformance vector under [specs/conformance-vectors.md](../specs/conformance-vectors.md) §"Driver fidelity": for any driver, the round-trip `external → substrate → external` agrees with `external → external` modulo the faithful-functor's image.
3. Implement the driver-cell schema in [`src/drivers/driver_cell.py`](../../../src/drivers/) (new module) with pydantic round-trip per row 3.
4. Three concrete drivers — pick the lowest-bandwidth three first (e.g. filesystem, hledger, in-memory MCP stub) — each in `src/drivers/<name>/`.
5. Each driver gets a paired fixture exercising the round-trip per [recipe 2](workflows.md#2-writing-a-paired-fixture-tnn-nnf).

**Conformance proof.** `tests/conformance/test_driver_fidelity.py` parameterised over the three drivers.
Gate item 1 of v0.2b.

**Enables next.** v0.3's bundled apps (email, calendar, chat, ledger) are *each* a driver-cell-plus-app pair.
Without the driver model normative, every v0.3 app re-invents its substrate boundary and the cross-app properties (e.g. "an email becomes a calendar invite becomes a chat reply, all preserving capability fiber") are unprovable.

### 2B. Observability and governance dashboards consume H¹

**Theorem grounding.** Same as 1C — but now the *consumers* are real dashboards, not just the audit object.
The dashboards realise [`audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) at the operational surface: a $\top$ cell appears on a dashboard *because* the algebra produced it, not because a logging side-effect was attached.

**Imaginative grounding.**

- **`web-gui-messaging`** ([trove §ERP and modules](../references/ideas-trove.md#erp-and-modules)).
  The web GUI is *one more interfacer* over the same substrate surface the TUI and the SDK consume; dashboards live at this interfacer, not as a separate observability stack.
  Reduction: [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md) at the GUI scope.
  No new theorem.
- **`dont-flatten-the-tower`** ([trove §Architecture](../references/ideas-trove.md#architecture)).
  Logs / events / settled facts are *strata*, not arbitrary record kinds.
  The log-aggregation view filters by stratum tag rather than by table; the dashboards inherit that distinction rather than re-introducing a flat "log table".
  Reduction: [`paraconsistency-as-substrate-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md) plus the strata discipline of [specs/kernel/stratified-facts.md](../specs/kernel/stratified-facts.md).
- **`mud-chat-as-messaging`** ([trove §ERP and modules](../references/ideas-trove.md#erp-and-modules)).
  The incident-management surface is shaped like a MUD-style channel: a directed conversation against an `incident` cell, with roles, replies, and per-message capability checks.
  The trove file argues this is the right model for *all* operator-facing real-time surfaces; 2B's incident dashboard is the first realisation.
  Reduction: incident cell + `respond` per [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md); no new primitive.

**Procedural steps.**

1. Specify [specs/observability/log-aggregation.md](../specs/observability/log-aggregation.md): logs are the projection of the event log filtered by `kind: log-line` predications.
  The aggregation view is a substrate query, not a sidecar.
2. Specify [specs/observability/error-investigation.md](../specs/observability/error-investigation.md) and land [pt-03](../tasks/engineering/pt-03-diagnostic-projection.md) — `project_derivation(cell_id) -> WitnessChain` on `substrate.projection`.
  Render at `/cells/<id>/why` per row 9.
3. Specify [specs/governance/incident-management.md](../specs/governance/incident-management.md): an incident is a substrate cell whose `kind: incident` aggregates the H¹ surface for a target window.
  Resolution is `respond` against the incident cell, producing a `repair_resolution` per row 9.
4. Wire the three dashboards in [`src/shell/web/`](../../../src/shell/) consuming the H¹ object from 1C.
  The dashboards do not poll; they subscribe to the substrate's heartbeat (row 11).

**Conformance proof.** `tests/conformance/test_h1_dashboards.py` — fire a fixture that produces one $\top$ cell, assert it appears on all three dashboards within one heartbeat tick.
Gate item 2.

**Enables next.** v0.4 (federation) needs the H¹ surface to *cross node boundaries* — a dashboard on node A renders an obstruction whose witness chain points at events on node B.
That cross-node walk requires the dashboard surface to already exist locally and to be witness-chain-aware.
Building dashboards in v0.4 instead of v0.2b would force the federation work to also re-design the audit UX.

### 2C. Stdlib verb specs and dispatch shell

**Theorem grounding.** Row 6 of theory-for-developers ("the respond primitive") plus [`single-respond-primitive`](../decisions/single-respond-primitive.md).
Every stdlib verb is `respond` against a different shape of payload.
The dispatch shell exists *only* to canonicalise the surface a developer types into a series of `respond` calls.

**Imaginative grounding.**

- **`relational-expression-syntax`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The Lispy DSL the captain has in mind for stdlib expressions is the *surface* form of the `respond` reduction: each S-expression is one `respond` call; pipelining is composition of `respond` calls; the parser is the canonicalisation layer named in 2C's "dispatch shell exists only to canonicalise" clause.
  Reduction: row 6 of [theory-for-developers.md](../references/theory-for-developers.md) plus [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md).
  No new primitive — the DSL is a face of `respond`.
- **`message-apply-settles-universe`** ([trove §Predication-native simulation](../references/ideas-trove.md#predication-native-simulation)).
  The captain's framing — that applying a message to the universe *is* the universe's settlement — is the operational reading of `respond` itself; per-verb fixtures verify the framing at each verb's reduction.
  Reduction: row 6.
- **`mcp-verb-inventory`** ([trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  The ~50-verb catalog the captain enumerated is the *target* set of stdlib verbs the dispatch shell will resolve.
  Per Thread G, each entry on the catalog must reduce to a `respond` shape; the per-verb spec section that distinguishes the verb is its `respond` reduction.
  Reduction: row 6 plus [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md) for the MCP-shaped verbs.

**Procedural steps.**

1. Author one spec per verb under [specs/stdlib/<verb>.md](../specs/stdlib/) per [recipe 4](workflows.md#4-adding-or-extending-a-stdlib-verb).
  The spec section that distinguishes the verb is its `respond` reduction.
2. Author the per-verb fixture per the [_index appendix](../specs/stdlib/_index.md).
  The fixture proves the verb's reduction is a well-typed `respond`.
3. Implement [`src/shell/repl.py`](../../../src/shell/repl.py) §dispatch as a one-screen function: parse the message-language token, route to `stdlib.<verb>`, return the `respond` result.
4. Land [pt-05](../tasks/engineering/pt-05-tier2-model-registry-lookup.md) and [pt-06](../tasks/engineering/pt-06-confidence-bilattice-calibration.md) for the model-registry and confidence-calibration verbs (these have the most non-trivial reductions).

**Conformance proof.** Per-verb fixtures plus a property-test that for any payload, `verb(payload)` agrees with `respond(verb_target, payload, sender)` byte-identically.
Gate item 3.

**Enables next.** v0.3's bundled apps script their workflows in the dispatch shell.
Without the shell stable, v0.3 work that touches a verb has to also fix the verb's reduction — a perpetual scope-bleed.

### 2D. Packaging skeleton (Nix flake)

**Theorem grounding.** [`deployment-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/deployment-determinism.md) plus row 12 (boot-determinism).
A reproducible build is the *outer envelope* of boot-determinism: the same image produces the same boot-determinism trajectory.
Without reproducibility, two captains running "the same" v0.3 disagree on what their substrate is.

This stage is **packaging-prep, not trusting-trust defence** per [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md).
Diverse-double-compiling and witnessed-toolchain land in stage 3A.

**Imaginative grounding.**

- **`guix-guile-composition-layer`** ([trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  Guix is the captain's long-horizon target for build-as-substrate-cell; the Nix flake at 2D is the same discipline at smaller scope, chosen because Nix is closer-at-hand.
  The architectural commitment (build artefacts are cells whose hash is the artefact's identity) is identical.
  Reduction: [`deployment-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/deployment-determinism.md) — Guix and Nix are two interfacers over the same content-addressed-build theorem.
- **`faoh-self-composing-harness-installer`** ([trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  The self-composing harness installer the captain has in mind for v1.0 is the *consumer* of 2D's reproducible-wheel guarantee — the installer asks "is this wheel the wheel I think it is" and refuses to proceed if not.
  2D ships the producer; 3A ships the witness chain; the installer at v1.0 closes the loop.
  Reduction: [`bootstrap-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md).

**Procedural steps.**

1. Author `flake.nix`, `default.nix`, `flake.lock` at the repo root.
2. The flake's `.#default` output produces a Python wheel via [poetry2nix](https://github.com/nix-community/poetry2nix) or equivalent.
3. Bit-identical across two builds on the same host.
  Use `diffoscope` to assert.
4. CI runs the build twice and asserts hash equality.

**Conformance proof.** Build-twice CI job emits matching SHA-256s.
Gate item 4.

**Enables next.** Stage 3A's trusting-trust machinery (diverse-double-compiling) requires a reproducible build *first* — the witnessed-toolchain cell schema records the SHA of the toolchain that produced the SHA of the wheel; if either step is non-reproducible the witness is meaningless.

### 2E. Network-protocol stubs (algebraic specs eager)

**Theorem grounding.** [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) plus row 10 (federation as $\odot$).
The algebraic federation spec — that merge is commutative-associative-idempotent and therefore convergent — does not depend on any specific wire format.
It can be specified and tested against an in-memory transport before the wire spec exists.

**Imaginative grounding.**

- **`everything-is-messages-from-an-entity`** ([trove §Agential layer](../references/ideas-trove.md#agential-layer)).
  The captain's `MODEL_ENTITY=` framing — every event in the substrate, including cross-node events, is a message from a sender entity — is the load-bearing intuition for federation: a peer is an entity, a federated event is a `respond` from one entity to another.
  The wire format is a faithful interfacer over the same `respond`.
  Reduction: [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md) at peer scope; no new primitive needed at 2E.
- **`mud-chat-as-messaging`** ([trove §ERP and modules](../references/ideas-trove.md#erp-and-modules)).
  The MUD-style channel pattern — directed messages with per-channel capability — is the captain's working model for both intra-node chat (3B) and inter-node federation (2E and 4A).
  The convergence guarantee at 2E is what makes the MUD model durable across nodes; without it the channel state would diverge silently.
  Reduction: [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md).

**Procedural steps.**

1. Stub `specs/network/federation-protocol.md`, `peer-trust.md`, `mtls.md`, `federation-rate-limit.md` each citing [decisions/network-spec-defer-until-implementer-named.md](../decisions/network-spec-defer-until-implementer-named.md).
2. Author the algebraic specs eagerly: `specs/network/federation-by-construction.md` (the $\odot$ merge contract) and `specs/network/capability-flow-across-federation.md` (the row-8 modal restriction crossing nodes).
3. Land [pt-01](../tasks/engineering/pt-01-federation-peer-share-fixture-replay.md) — the in-memory peer-share fixture replay.
  This proves the algebra without committing to a wire format.

**Conformance proof.** `tests/conformance/test_federation_algebraic.py` runs the merge property over arbitrary peer pairs.
Gate item 5.

**Enables next.** v0.4's wire-format work picks up an *already-validated* algebraic contract and only has to translate it.
Without 2E, v0.4 risks designing a wire format whose semantics quietly diverges from $\odot$ (and then no amount of CRDT theory recovers it — see [`federation-fuel-as-tensor-distributivity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-fuel-as-tensor-distributivity.md) for the cross-stage tensor obligation).

### What v0.2b unlocks for v0.3

After v0.2b: drivers are substrate cells (2A), dashboards consume H¹ (2B), every verb reduces to `respond` (2C), the wheel is reproducible (2D), the federation algebra is proved (2E). v0.3 can now treat each bundled app as a (driver-cell + verb-extensions + dashboard view) tuple and compose them with confidence the algebra is intact across the composition.

---

## Stage 3 — v0.3 on-ramp

Reach state: bundled userland boots in the base image; the captain accomplishes one daily task end-to-end through the OS that the previous version could not support.

The coarse goal at [v0.3-userland-daily-driver-ready](../goals/v0.3-userland-daily-driver-ready.md) MUST be replaced by per-app goals when v0.3 activates.
The procedural decomposition below is the template.

### 3A. Trusting-trust full machinery

**Theorem grounding.** [`deployment-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/deployment-determinism.md) + [`witness-as-cell`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-as-cell.md) + [`witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md).
The diverse-double-compiling discipline is the operational realisation of the witness-chain theorem: the wheel's authenticity is not a signature attached to it, but a chain of witness cells whose product is the wheel's hash.

**Imaginative grounding.**

- **`guix-guile-composition-layer`** ([trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  Guix's bootstrap discipline (the entire system is built from a known small seed under a known toolchain) is the same shape as 3A's witness-chain — the Guix bootstrappable-builds project is the upstream community 3A inherits from.
  Reduction: same theorem stack; Guix is a peer realisation of [`bootstrap-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md).
- **`faoh-self-composing-harness-installer`** ([trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  The harness installer at v1.0 reads the toolchain-witness cell at install time and refuses to proceed against a wheel whose witness chain doesn't close.
  The installer is the consumer side of the producer 3A defines.
  Reduction: [`witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md) extended one link upstream.

**Procedural steps.**

1. Specify the witnessed-toolchain cell schema per [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md): a `kind: toolchain-witness` cell carrying the SHA of the compiler, the SHA of the standard library, the SHA of the source tree, and the SHA of the produced wheel.
2. Implement diverse-double-compiling in CI: build the wheel under two distinct toolchain images, assert wheel-SHA equality, emit two `toolchain-witness` cells.
3. Boot-time check: the substrate verifies its own wheel against a `toolchain-witness` cell at boot phase 1 per [boot-sequence.md](../specs/init-boot/boot-sequence.md).

**Conformance proof.** `tests/conformance/test_diverse_double_compiling.py`.

**Enables next.** Self-hosting (3C) requires the boot-time witness check; otherwise a self-hosted substrate has no algebraic anchor distinguishing its compiled image from an attacker's substitute.

### 3B. First bundled apps as (driver + verb + dashboard) tuples

**Theorem grounding.** Row 13 (self-representation) plus the doctrine-fidelity theorem from 2A.
Each app is a substrate cell of `kind: app` whose composition with its driver, verb-extensions, and dashboard view satisfies a per-app fidelity contract.

**Imaginative grounding.** This is the rung where the captain's "ERP-from-one-substrate" pile lands procedurally.
Per Thread G, each idea below is a specialisation of an existing on-disk theorem, never a new primitive:

- **`erp-web-platform`** ([trove §ERP and modules](../references/ideas-trove.md#erp-and-modules)).
  The captain's "modules from one substrate" vision is what 3B realises: each bundled app is one ERP module; the cross-app properties (an email becomes a calendar invite becomes a chat reply, all preserving capability fiber) are exactly what the per-app fidelity contract guarantees.
  The trove's companion `cannibalize-pm-systems` framing — replacing Slack/Asana/etc. — is the same shape at productivity-stack scope and lands at v0.7 7A-7F; it is named in the [ideas trove §ERP and modules](../references/ideas-trove.md#erp-and-modules) catalog as a planned working-title.
  Reduction: [`conformance-via-fiber-algebra-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/conformance-via-fiber-algebra-functor.md) at app scope.
- **`web-gui-messaging`** + **`mud-chat-as-messaging`** ([trove §ERP and modules](../references/ideas-trove.md#erp-and-modules)).
  The chat app's surface is the MUD-style channel pattern; the dashboard view per app is the GUI face of the same `respond` the TUI sees.
  Reduction: [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md) at GUI scope; no new primitive.
- **`double-entry-operational-accounting`** + **`operational-chart-of-accounts`** ([trove §Records / accounting](../references/ideas-trove.md#records--accounting)).
  The ledger app at 3B is the first hledger-driver consumer; the chart of accounts is a substrate cell tree, and the ledger view is a fold over it.
  Reduction: [`cell-set-fold-as-graded-dispatch-specialization`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md).
  The same fold shape recurs at v0.7 7A (tasks-app rollup), so 3B's ledger is the rehearsal for 7A's task-rollup engine — building the ledger first proves the fold discipline at smaller scope.
- **`all-records-are-transactions`** ([trove §Records / accounting](../references/ideas-trove.md#records--accounting)).
  The σ/Δ universal-record discipline lands at the ledger app first; every app-cell at 3B carries σ/Δ shape, so v0.4's federation can merge two captains' app states by the same discipline.
  Reduction: row 9 of [theory-for-developers.md](../references/theory-for-developers.md) plus [`witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md).

**Procedural steps (per app).**

1. Author the app's spec under [specs/bundled-apps/<app>.md](../specs/bundled-apps/) naming: the driver (from 2A's catalog), the verb extensions (specs added under [specs/stdlib/](../specs/stdlib/) per 2C's discipline), the dashboard view (per 2B's discipline), the per-app conformance vector.
2. Author the (driver-cell + app-cell) pair as substrate content.
  The app-cell's `kind: app` predications point at the driver, the verbs, the view, and the package-record.
3. Per-app paired fixtures: a fixture for the app's primary user-visible workflow that round-trips through the driver and renders on the dashboard.

**Per-app priority order (theory-derived).** The captain's daily-driver gate (gate 7 of v0.3) is closed by *any one* end-to-end workflow.
The cheapest first end-to-end is **terminal + calculator + ledger**: terminal is a thin wrapper over `repl.py` from 2C; calculator's verbs are arithmetic specialisations of the message language; ledger reuses the hledger driver from 2A.
Email and chat are heaviest (network, external protocol surface) and should land last.

Suggested order: terminal → calculator → file browser → text editor → ledger → calendar → chat → email.

**Conformance proof.** Each app: a per-app conformance fixture under `tests/conformance/test_app_<name>.py`.
The cross-app gate (8 and 9 of v0.3) tests the inbox panel and streaming surface against any app.

**Enables next.** v0.4 federation work uses these apps as the *content* whose cross-node behaviour is interesting.
A v0.4 federation demo where two captains share a calendar invite is impossible if calendar isn't an app yet.

### 3C. Self-hosting threshold

**Theorem grounding.** [`bootstrap-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md) + 3A.
The substrate, having proved its own wheel via witness chain, can rebuild itself from source under its own dispatch shell.

**Imaginative grounding.**

- **`system-already-matches-specs`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain's observation: by the time the substrate self-hosts, the substrate *already is* its own build target — the spec/code drift to zero at 3C because the build is the substrate's own `respond`.
  3C is the operational moment that observation becomes load-bearing.
  Reduction: [`bootstrap-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md).
- **`praxis-driven-development`** ([trove §Misc](../references/ideas-trove.md#misc)).
  Self-hosting is the praxis-driven-development pattern at substrate scale: the substrate that builds itself is the substrate that can be debugged from inside itself.
  The discipline lands at 3C and matures at v1.0 10A (self-developing).
  Reduction: same theorem; 3C is the precondition for 10A.

**Procedural steps.**

1. The repl.py dispatch shell from 2C grows a `build` verb that invokes the flake from 2D.
2. The build emits a fresh wheel and a fresh `toolchain-witness` cell.
3. Boot the fresh wheel; assert it passes the diverse-double-compiling check from 3A.
4. The substrate has now built itself.

**Conformance proof.** `tests/conformance/test_self_hosting.py` (slow; runs nightly).

**Enables next.** v0.4 federation between two captains' substrates can assume each substrate is *the substrate it claims to be* — without 3C, federation has no algebraic anchor for peer identity beyond signatures.

### 3F. GitHub-Issues driver as fourth concrete driver

**Theorem grounding.** [`doctrine-fidelity-via-faithful-interfacer-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md) — the same theorem 2A's driver-model rests on; the GitHub-Issues binding is one more concrete instance of the faithful-interfacer functor.
Per [decisions/external-systems-get-drivers-peers-get-federation.md](../decisions/external-systems-get-drivers-peers-get-federation.md), GitHub Issues is an external system the substrate consumes via driver, not a peer the substrate federates with.

**Imaginative grounding.**

- **`github-issues-integration`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain's daily backlog already lives in GitHub Issues for several adjacent projects; lifting that surface onto the substrate proves the driver-model is robust enough for an external issue-tracker shape (as distinct from the filesystem, hledger, and MCP-stub surfaces 2A already covers).
  Reduction: same theorem as 2A.

**Procedural steps.**

1. Author `specs/drivers/github-issues-driver.md` listing capability declaration (issue-read, issue-write, label-write, comment-write), attach/detach lifecycle, rate-limit handling.
2. Implement `src/drivers/github_issues_driver.py` as one more `DriverCell` subclass; inbound issue → `kind: issue` cell; outbound write composes through the substrate's modal-restriction algebra so a sender without the right capability fiber gets a structured error rather than a 401.
3. Add the GitHub-Issues fidelity fixture (the same shape as 2A's three driver-cell concretes): assert one round-trip read / write / comment / close cycle with witness chain.

**Conformance proof.** v0.3 conformance vector: a synthetic issue created via the driver appears as a substrate cell with the right `kind` and `from-driver` lineage; the cell's witness chain points to the driver-record.
The same vector replayed against the witnessed wheel of 3A produces byte-identical output.

**Enables next.** v0.3 ships with four driver-cell concretes instead of three; the v0.4 federation work has one more peer-shape to test the algebraic-vs-driven distinction against (a federation peer publishes; an issue-tracker is queried — both cross the substrate boundary but only one is sender-cell-shaped).

### What v0.3 unlocks for v0.4

After v0.3: each captain has a substrate that runs their daily work, builds itself, witnesses its own toolchain, and exposes apps as substrate-native cells. v0.4's federation work now has *content* (cells, apps, audit surfaces) to federate, *identity* (witnessed substrates) to federate between, and an *algebra* (proved in 2E) to federate by.

---

## Cross-cutting threads

These are not stages; they are properties every stage preserves.
Verifying the thread is a step in [recipe 1](workflows.md#1-landing-a-v02a-task-end-to-end).

### Thread A: Everything reduces to `respond`

Row 6 of theory-for-developers.
Every stage above either invokes `respond` (1A's migration, 2A's driver delegation, 3B's app workflows) or specifies a verb whose reduction *is* `respond` (2C's stdlib, 3C's `build` verb).
If a stage introduces a code path that does substrate work *outside* `respond`, the stage is wrong.
This thread is enforced procedurally by [recipe 1 step 7](workflows.md#1-landing-a-v02a-task-end-to-end) (the spec citation requirement).

### Thread B: Everything is a cell

Row 13 + [decisions/everything-is-a-cell-not-a-file.md](../decisions/everything-is-a-cell-not-a-file.md).
Boundaries (1A), drivers (2A), incidents (2B), verbs (2C), toolchain witnesses (3A), apps (3B).
If a stage reaches for a Python registry/dictionary/class hierarchy to hold substrate state, the stage is wrong.

### Thread C: σ/Δ stratification preserved

Row 4 + 5.
Every stage that adds a closure rule (most do, implicitly via the audit pass, the dashboard subscriptions, the driver delegations) MUST verify [`tests/conformance/test_stratum_e3.py`](../../../tests/conformance/test_stratum_e3.py) `test_each_projection_file_holds_only_its_stratum_cells` still passes.
A stratum leak is the canonical bug; see [recipe 6 step 3](workflows.md#6-debugging-projection-divergence-pcc_projection_diverged).

### Thread D: Capability is non-amplifying

Row 8 + [`agential-orchestration-platform/theorems/governance-as-modal-restriction`].
Every stage that adds a sender-fiber surface (1A boundaries, 2A driver-cells, 2B dashboard subscribers, 3B app-cells) MUST verify the modal restriction adjoint composes — no new "admin override" code paths.
The check is procedural: grep for `bypass`, `override`, `as_admin`, `with_root_capability`, etc. in the stage's diff.

### Thread E: Witness chains are proof objects, not log lines

Row 9 + 3A's witness theorems.
Every stage that emits a witness (1A migration audit, 1C audit pass, 2B incident resolution, 3A toolchain witness) emits it as a structured cell whose serialisation round-trips canonical-JSON.
Witnesses-as-strings are the canonical regression.

---

## Glossary of theorem slugs cited above

For paths and detail, follow the links in each stage.
Index here for cross-referencing.

| Slug | Path |
|---|---|
| `cache-coherence-via-functorial-projection` | [`predicated-computing/theorems/cache-coherence-via-functorial-projection.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) |
| `audit-content-via-inconsistency-sheaf-cohomology` | [`predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) |
| `cost-composition-via-lawvere-quantale` | [`predicated-computing/theorems/cost-composition-via-lawvere-quantale.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) |
| `doctrine-fidelity-via-faithful-interfacer-functor` | [`predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md) |
| `deployment-determinism` | [`predicated-computing/theorems/deployment-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/deployment-determinism.md) |
| `boot-determinism` | [`predicated-computing/theorems/boot-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/boot-determinism.md) |
| `bootstrap-determinism` | [`predicated-computing/theorems/bootstrap-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md) |
| `federation-convergence` | [`predicated-computing/theorems/federation-convergence.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) |
| `federation-fuel-as-tensor-distributivity` | [`predicated-computing/theorems/federation-fuel-as-tensor-distributivity.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-fuel-as-tensor-distributivity.md) |
| `witness-as-cell` | [`predicated-computing/theorems/witness-as-cell.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-as-cell.md) |
| `witness-chain-as-proof-object` | [`predicated-computing/theorems/witness-chain-as-proof-object.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md) |
| `compaction-via-cosettling-equivalence-class` | [`predicated-computing/theorems/compaction-via-cosettling-equivalence-class.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/compaction-via-cosettling-equivalence-class.md) |

## See also

- [next-stretch-v0.4-v0.6.md](next-stretch-v0.4-v0.6.md) — continuation across v0.4 (federation) → v0.5 (industrial control) → v0.6 (third-party SDK).
  Read after this stretch closes (or earlier, when scoping work that is contingent on what v0.3 unlocks).
- [theory-for-developers.md](../references/theory-for-developers.md) — the per-construct theory→code bridge this plan threads through.
- [workflows.md](workflows.md) — the per-task procedural recipes that operationalise each stage's steps.
- [milestones/v0.2a-multi-user-single-node.md](../milestones/v0.2a-multi-user-single-node.md), [milestones/v0.2b-drivers-observability-packaging.md](../milestones/v0.2b-drivers-observability-packaging.md), [milestones/v0.3-bundled-userland.md](../milestones/v0.3-bundled-userland.md) — the per-milestone ship targets this plan derives.
- [pypredcomp/AGENTS.md](../../../AGENTS.md) — anti-patterns and session shape; every stage above respects these.
