---
title: "Next-stretch SOON: opening v0.2b — the five first landings after v0.2a ships"
description: "The v0.2b counterpart to next-stretch-now.md. Where the codebase will be on the day v0.2a ships; the five landings that open v0.2b in parallel; for each landing — the on-disk theorem that authorises it, the captain-trove ideas that informed it, the ordered procedural moves keyed to source modules and spec sections, the conformance proof, and the v0.2b-residual / v0.3 work it unblocks. Read after [next-stretch-now.md](next-stretch-now.md) when v0.2a ship-targets 1-6 are met and the next agent is picking up v0.2b's first slice."
kind: implementation-guide
status: active
horizon: soon
authority: "milestones/v0.2b-drivers-observability-packaging.md, theories/.../predicated-computing/, theories/.../predication-categories/, operations/engineering/triage/operations/command/ideas/triage/"
predecessor: "implementation/next-stretch-now.md (v0.2a closing landings L1-L4)"
predecessor-of: "implementation/next-stretch.md §Stage 2 (the multi-stage stretch this SOON-doc telescopes the first slice of)"
---

# Next-stretch SOON

The queue between v0.2a shipping and v0.2b's first ship-target gate.
Five landings; pick one and ship it.
Unlike L1-L4 in [next-stretch-now.md](next-stretch-now.md) which had a sequential-then-parallel shape, **all five landings here are parallel-eligible from day one** — they touch disjoint surfaces and each grounds in a different on-disk theorem.
The constraint is bandwidth, not ordering.

```text
v0.2a ships ──┬──► S1 driver model           ──► v0.2b ship-target 1
              ├──► S2 observability surface  ──► v0.2b ship-target 2
              ├──► S3 stdlib + dispatch shell ──► v0.2b ship-target 3
              ├──► S4 nix-flake skeleton     ──► v0.2b ship-target 4
              └──► S5 network spec stubs     ──► v0.2b ship-target 5
```

## The queue

- **S1 — Driver model under the faithful-interfacer-functor discipline** (`t02-50`…`t02-53` driver-model spec normalisation + `t02-60`…`t02-64` three concrete drivers).
  Closes ship target 1.
  Independent.
- **S2 — Observability surface consuming H¹ audit cohomology** (`t02-70`…`t02-74` log-aggregation + error-investigation + dashboards + `t02-75` diagnostic projection per pt-03 + `t02-80`…`t02-81` incident-management).
  Closes ship target 2.
  Independent.
  Consumes the H¹ surface that L3 of v0.2a-NOW just landed; cannot start before that.
- **S3 — Stdlib verb specs + dispatch shell** (on-disk: `t02-93` per-verb regime addenda + `t02-100` `project` verb + `t02-102` `filter` verb + the remaining per-verb / dispatch-shell / per-verb-fixture tasks per [specs/stdlib/_index.md](../specs/stdlib/_index.md), to be authored under `t02-NN-v0.2b-stdlib-and-dispatch-shell.md` slugs as needed + `t02-23` skill-spec-v1 schema + `t02-205`/pt-13 first operational-skill-pack batch).
  Closes ship target 3.
  Independent.
  Consumes L4's fuel-replay determinism implicitly via every verb's reduction to `respond`.
- **S4 — Nix-flake skeleton (packaging-prep, NOT trusting-trust)** (on-disk: `t02-90` + `t02-94` packaging-skeleton; `t02-91` deployment-config-as-cell; `t02-92` DR-test-as-replay).
  Closes ship target 4.
  Independent.
  Bit-identical wheel from two builds on the same host is the gate; the diverse-double-compiling discipline is v0.3 per [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md).
- **S5 — Network spec stubs aligned to the deferral discipline** (on-disk: `t02-150` federation-protocol stub + `t02-155` peer-trust stub + `t02-202`/pt-01 federation peer-share fixture-replay + `t02-203`/pt-05 Tier-2 model registry lookup + `t02-204`/pt-06 confidence-bilattice calibration).
  Closes ship target 5.
  Independent.
  Algebraic specs eager; wire formats deferred until implementer is named per [decisions/network-spec-defer-until-implementer-named.md](../decisions/network-spec-defer-until-implementer-named.md).

> **Drift to surface (meta-finding from authoring this doc, 2026-05-03):** the [v0.2b milestone](../milestones/v0.2b-drivers-observability-packaging.md) §"Task IDs owned by v0.2b" assigns ID ranges (`t02-50…53` driver model, `t02-90…94` stdlib verb specs, `t02-100…102` Nix-flake, `t02-150…155` stdlib dispatch shell, `t02-200…201` network stubs) that are partly contradicted by [tasks/engineering/](../tasks/engineering/) on disk: the only `t02-9N`/`t02-10N` task files actually written (`t02-90`, `t02-91`, `t02-92`, `t02-94`) are *packaging-skeleton* tasks; `t02-100` and `t02-102` are *stdlib verb spec* tasks; `t02-150` and `t02-155` are *network-stub* tasks; nothing exists at `t02-200`/`t02-201`.
> The on-disk `of-goal` slugs are correct; the milestone's Task IDs paragraph is stale.
> The five landings below are keyed to **on-disk reality**, not to the milestone paragraph.
> Resolution belongs to whoever next refreshes the milestone — until then, trust the task files' `of-goal` field as the source of truth and treat the milestone paragraph as out-of-date.

This doc is the telescoped form of [next-stretch.md §Stage 2](next-stretch.md#stage-2--v02b) — one section per *landing* (a pull-request-shaped piece of work an agent can pick up, finish, and ship a paired fixture against).
Use this doc when picking a single v0.2b landing for a session; use [next-stretch.md](next-stretch.md) when scoping work whose horizon extends past v0.2b's first gate.

## How this SOON-doc was derived

Same chain as [next-stretch-now.md §"How this NOW-doc was derived"](next-stretch-now.md#how-this-now-doc-was-derived):

- **Captain's imaginative material** from the [ideas trove reference](../references/ideas-trove.md), pulled per landing rather than per stretch. v0.2b is the release where several long-standing trove themes (`mcp-as-system-api`, `mcp-verb-inventory`, `cells-as-models-mcp-as-io`, `live-swap-service-components`, `web-gui-messaging`, `guix-guile-composition-layer`, `relational-expression-syntax`, `all-records-are-transactions`, `dont-flatten-the-tower`) become load-bearing rather than aspirational.
  Each landing names its trove sources and reduces them to existing on-disk theorems per [next-stretch-v0.4-v0.6.md Thread G](next-stretch-v0.4-v0.6.md#thread-g-every-claimed-new-primitive-must-be-reduced-to-an-existing-theorem).
- **Source-tree truth** as projected for the day v0.2a ships.
  The procedural steps are keyed to existing files (the `src/drivers/`, `src/network/`, `src/shell/`, `src/substrate/` modules already exist as v0.1 / v0.2a stubs) or to file paths already named in carried task records under [tasks/engineering/](../tasks/engineering/).
  Where a new module is required (e.g. `src/stdlib/`, `src/observability/`), the landing names it explicitly and cites the proximate-sibling module as the layout precedent.
- **What the spec already says** vs **what the verb/driver/dashboard MUST add**. v0.2b is unusual in that most of its specs were already authored in v0.1 / v0.2 at status `normative`; v0.2b's job is to bring the implementation to the spec, not to author the spec from scratch.
  Each landing distinguishes "spec already normative — implementing" from "spec needs §X added — extending then implementing".

If a landing below cites a module that has moved or a fixture path that no longer matches, the *doc* is wrong; surface and fix here rather than re-routing the procedural steps in your head.

## Status snapshot, projected for the day v0.2a ships

| Surface | Where it will be | Open work for v0.2b |
|---|---|---|
| Drivers | `src/drivers/{__init__.py, driver_base.py, mcp_driver.py}` exist as v0.1 stubs; the driver-model spec at [specs/drivers/driver-model.md](../specs/drivers/driver-model.md) is normative v0.2 with the faithful-interfacer-functor grounding already in §"Grounded in"; per-driver specs at [specs/drivers/](../specs/drivers/) cover thirteen concrete drivers (caldav, fs, git, github-issues, hledger, matrix, mcp, modbus, mqtt, smtp-imap) plus attach-detach lifecycle. | S1 normalises the spec's ship-discipline (paired-fixture per [decisions/fixture-authoring-paired-task.md](../decisions/fixture-authoring-paired-task.md)), implements the driver-cell schema, and lands three lowest-bandwidth concrete drivers under `src/drivers/<name>/`. |
| Observability | `src/substrate/inconsistency.py` exposes `audit_h1` after L3 of v0.2a-NOW; specs at [specs/observability/{log-aggregation, error-investigation, dashboards, alerting, captain-home}.md](../specs/observability/) are normative v0.2; no `src/observability/` package yet. | S2 creates `src/observability/`, surfaces H¹ via three downstream consumers (log-aggregation feed, error-investigation diagnostic-projection, dashboards), wires the captain-home dashboard. |
| Stdlib | `src/substrate/stdlib.py` exists as a single-module placeholder; `src/substrate/respond.py` and `src/substrate/runtime.py` exist (the dispatch substrate the verbs reduce to); per-verb specs at [specs/stdlib/](../specs/stdlib/) cover all thirteen verbs at status normative. | S3 splits `src/substrate/stdlib.py` into `src/stdlib/<verb>.py` per-verb modules, implements the dispatch shell that reduces each verb to `respond` per [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md), authors per-verb fixtures, and lands `boot/schemas/skill-spec-v1.schema.json` for skill-pack registration. |
| Packaging | No `flake.nix`, no `nix/` directory; spec at [specs/packaging/nix-flake-spec.md](../specs/packaging/nix-flake-spec.md) is normative v0.1 with the top-level flake structure already drawn out. | S4 lands `flake.nix` + `nix/substrate-py.nix` + `nix/dev-shell.nix` + lockfile; gate is `nix build .#default` producing a bit-identical wheel from two builds on the same host. Trusting-trust defence (diverse-double-compiling, witnessed-toolchain cell schema) is **explicitly out of scope** — v0.3 work. |
| Network | `src/network/{__init__.py, http_server.py, websocket.py, federation.py, mud_ledger.py}` exist as v0.1 stubs; spec dir at [specs/network/](../specs/network/) has fifteen specs (federation-protocol, activitypub, caldav/carddav, gemini, http2, http-addressing, icalendar, imap, irc, matrix-cs/s2s, modbus, mqtt, network-algebraic-contract, pop3, smtp, tcp-binding, websocket, xmpp). Most are at status `normative` for the algebra and stub for wire format. | S5 aligns each spec with the v0.2b stub discipline (explicit "Wire format deferred" section citing the deferral decision), lands the four carried-task spec extensions (pt-01/05/06 + pt-13). No network-implementation work in v0.2b. |
| Tasks | All seven v0.2b carried project-tasks (pt-01, pt-03, pt-05, pt-06, pt-13, plus deferred pt-02 and pt-04 awaiting upstream) plus the on-disk subset (`t02-23`, `t02-90`/`91`/`92`/`93`/`94`, `t02-100`/`102`, `t02-150`/`155`, `t02-202`/`203`/`204`/`205`) open under [tasks/engineering/](../tasks/engineering/). | The five landings below distribute these task IDs across the five surfaces per their on-disk `of-goal` field. Where the milestone names IDs that don't yet exist on disk (e.g. `t02-50…53` for driver model), the landing flags them as "to be authored". |

---

## S1 — Driver model under the faithful-interfacer-functor discipline

> **Operation-vocabulary reconciliation needed.** [`specs/drivers/driver-model.md`](../specs/drivers/driver-model.md) §2 is normative and names the three operations as `extract` / `apply` / `compose` (per the interfacer concept and the faithful-interfacer-functor theorem).
> The sibling [`goals/v0.2b-driver-model-and-three-drivers.md`](../goals/v0.2b-driver-model-and-three-drivers.md) §"Procedural steps" still names a four-operation set `open` / `respond` / `close` / `audit` — this is residue from an earlier draft and is contradicted by the normative spec. **This SOON doc follows the spec**, not the goal doc, for operation-set authority.
> The first task within S1 below explicitly includes refreshing the goal doc to match.

### Where the code is

The driver substrate exists at [`src/drivers/`](../../../src/drivers/) with three files: `__init__.py`, `driver_base.py` (the abstract base — the proximate-sibling for the new driver-cell schema), and `mcp_driver.py` (the v0.1 MCP stub — already the lowest-bandwidth concrete driver, reusable as the third of the three v0.2b drivers).

The spec at [specs/drivers/driver-model.md](../specs/drivers/driver-model.md) is **already normative v0.2** with the faithful-interfacer-functor grounding in §"Grounded in", the driver-record schema in §1, the three-operation discipline (`extract`, `apply`, `compose`) in §2, and the lifecycle state-machine in §3. v0.2b's S1 work is **not** spec authoring — it is normative-discipline alignment + Python implementation against the existing spec.

The thirteen per-driver specs at [specs/drivers/](../specs/drivers/) (`caldav-driver.md`, `fs-driver.md`, `git-driver.md`, `github-issues-driver.md`, `hledger-driver.md`, `matrix-driver.md`, `mcp-driver.md`, `modbus-driver.md`, `mqtt-driver.md`, `smtp-imap-driver.md`, `attach-detach.md`) are the menu — pick three lowest-bandwidth ones for the v0.2b shipping batch.
Per [`goals/v0.2b-driver-model-and-three-drivers.md`](../goals/v0.2b-driver-model-and-three-drivers.md) §"Procedural steps" the recommended three are filesystem (`fs-driver`), `hledger`, and the in-memory MCP stub (already exists at `mcp_driver.py`).

The conformance-vector surface at [specs/conformance-vectors.md](../specs/conformance-vectors.md) needs a new §"Driver fidelity" section per the goal-doc's procedural step 2.

### Theorem grounding

[`predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md) — the three driver operations (`extract`, `apply`, `compose`) are exactly the operations of a faithful interfacer functor between the substrate's predication category and the external system's category.
The framework-enforced requirement that every driver MUST implement all three is the operational form of the functor's faithfulness; the conformance round-trip (`external → substrate → external` agreeing with `external → external` modulo the functor's image) is the counit-law fidelity test.

Reinforced by [`predicated-computing/theorems/interfacer-counit-law`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law.md) and its uniformity strengthening [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md) — the counit law is the conformance vector's algebraic content; uniformity says it holds the same way across every concrete driver, which is what makes the *generic* driver-fidelity vector authorable once and reused per driver.

Composed with [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — the per-driver `capabilities-required` field (spec §1) is checked at attach via $\Box_R$ at the driver's capability fiber sub-region; without this the driver-cell could leak past its declared surface.

Decision authority: [decisions/drivers-are-substrate-entities.md](../decisions/drivers-are-substrate-entities.md), [decisions/fixture-authoring-paired-task.md](../decisions/fixture-authoring-paired-task.md).
Theory→code row: rows 6 (interfacer/driver) and 8 (capability) of [theory-for-developers.md](../references/theory-for-developers.md).

### Imaginative grounding

Three captain-trove files are the design rationale for *why* drivers are substrate cells rather than Python plugin modules:

- **`mcp-as-system-api`** ([trove file](../../../../../../triage/operations/command/ideas/triage/mcp-as-system-api.md), cited in [ideas-trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  The argument: MCP is the substrate API — drivers expose substrate facilities to external agents and external systems to substrate cells through the same protocol.
  This collapses the "driver framework" and "agent protocol" into one surface.
  Reduction to on-disk theorem: the faithful-interfacer-functor is exactly the functorial discipline this collapse requires; the MCP-driver is the concrete instance ([`specs/drivers/mcp-driver.md`](../specs/drivers/mcp-driver.md)).
  No new theorem needed.
- **`mcp-verb-inventory`** (trove §Infrastructure).
  The ~50-verb catalog.
  Each verb in the catalog is a driver-side `apply` operation; the inventory is the menu of `apply` operations the driver-cell schema's `applies` field enumerates.
  Reduction: same theorem; the inventory is the *content* of each driver's interfacer functor, not a new construct.
- **`cells-as-models-mcp-as-io`** (trove §Infrastructure).
  The framing that cells ARE the models the substrate manipulates and MCP is the I/O channel between cells and the external world.
  Reduction: this is the `extract`/`apply` symmetry the interfacer theorem already proves — `extract` is "external → cell-model" and `apply` is "cell-model → external", with `compose` providing the merge that makes them a functor rather than a pair of unrelated translations.

Long-horizon trove tie-in: **`live-swap-service-components`** (trove §Infrastructure).
The ability to detach + re-attach a driver mid-operation without dropping in-flight cells is what attach-detach.md §4 names; the lifecycle state-machine (`unloaded → loaded → attached → operating → detaching → detached`) is the operational discipline.
The `draining` substate is the trove's "graceful hand-off" — formal authority for that branch is the same interfacer-counit law: the drained driver's final cell-state must agree with the freshly-attached driver's initial cell-state on the boundary, modulo the functor.

### Procedural steps

1. **Reconcile sibling-doc operation vocabulary first.** Refresh [`goals/v0.2b-driver-model-and-three-drivers.md`](../goals/v0.2b-driver-model-and-three-drivers.md) §"Procedural steps" to match the normative spec's `extract` / `apply` / `compose` operation set; remove the stale `open` / `respond` / `close` / `audit` four-op naming.
  Then author [specs/drivers/driver-model.md](../specs/drivers/driver-model.md) §"Conformance discipline" (new section between §3 lifecycle and §4 if §4 exists, else appending) naming: (i) the per-driver paired fixture obligation per [decisions/fixture-authoring-paired-task.md](../decisions/fixture-authoring-paired-task.md), (ii) the framework-enforcement that loading a driver-cell without all three of `extract`/`apply`/`compose` populated MUST fail at attach with the new error-code `driver_fidelity_violation` (add to `src/substrate/error_codes.py`), (iii) the conformance-vector reference into [specs/conformance-vectors.md](../specs/conformance-vectors.md) §"Driver fidelity".
2. Extend [specs/conformance-vectors.md](../specs/conformance-vectors.md) with §"Driver fidelity" — the generic vector: for any driver `D`, any external state `e`, `D.extract(e) ∘ D.apply` agrees with `id_external` modulo the faithful functor's image.
  The vector is parameterised over `D` and instantiated per concrete driver in the per-driver fixture.
  Cite the interfacer-counit-law theorem; cite the uniformity theorem as authority for the per-driver instantiation pattern.
3. Implement the driver-cell schema in `src/drivers/driver_cell.py` (new module; proximate sibling to existing `driver_base.py`).
  Use pydantic v2 per [python.md](python.md); fields exactly per [specs/drivers/driver-model.md](../specs/drivers/driver-model.md) §1.
  Include canonical-JSON serialisation per [decisions/canonical-json-conventions.md](../decisions/canonical-json-conventions.md).
  Verify with `rg -n driver_cell src/drivers/`.
4. Refactor `src/drivers/driver_base.py` so that it requires (rather than recommends) all three of `extract`/`apply`/`compose`; raise `driver_fidelity_violation` from `__init__` if any are unimplemented.
  The MCP stub at `src/drivers/mcp_driver.py` already implements all three — verify with `rg -nE "def (extract|apply|compose)" src/drivers/mcp_driver.py`; if any are missing, implement before the base-class refactor lands.
5. Pick three lowest-bandwidth concrete drivers per [`goals/v0.2b-driver-model-and-three-drivers.md`](../goals/v0.2b-driver-model-and-three-drivers.md) §"Procedural steps": filesystem, hledger, in-memory MCP stub.
  Land each under `src/drivers/<name>/` (new subpackage; mcp-driver migrates from the single-module form).
  Each driver's `apply` operations come from its per-driver spec ([specs/drivers/fs-driver.md](../specs/drivers/fs-driver.md), [hledger-driver.md](../specs/drivers/hledger-driver.md), [mcp-driver.md](../specs/drivers/mcp-driver.md)).
6. Write the paired fixture per driver per [workflows.md recipe 2](workflows.md).
  Conformance vector instantiated per driver: `tests/conformance/test_t02_60f_fs_driver.py`, `test_t02_61f_hledger_driver.py`, `test_t02_62f_mcp_driver.py`.
  Each test exercises `extract` then `apply` and asserts the round-trip agrees with `id_external` on the driver's stated boundary.
  The MCP-driver test additionally exercises the live-swap path: detach mid-operation, attach a fresh instance, assert the boundary cell-state agrees byte-identically.
7. Author the attach-detach lifecycle conformance vector per [specs/drivers/attach-detach.md](../specs/drivers/attach-detach.md) §4: the drained → reattached transition MUST preserve cell-state on the driver's declared boundary fiber.
  Fixture path `tests/conformance/test_t02_53f_attach_detach_lifecycle.py`.

### Conformance proof

S1 closes when:

- The driver-fidelity conformance vector exists in [specs/conformance-vectors.md](../specs/conformance-vectors.md) and is referenced from [specs/drivers/driver-model.md](../specs/drivers/driver-model.md) §"Conformance discipline".
- Three concrete drivers (fs, hledger, mcp) load without `driver_fidelity_violation` and pass their per-driver fixture.
- The attach-detach lifecycle fixture passes including the live-swap branch.
- `t02-50`…`t02-53` and `t02-60`…`t02-64` are marked `done` in their task records.

### Enables next

- **v0.2b ship target 1** is met.
- **S5 carried-task `t02-202`/pt-01 federation peer-share fixture-replay** can land — federation-peer "sharing" is a driver-shaped operation between two substrate nodes, and the fixture-replay form depends on the paired-fixture discipline S1 normalises.
- **v0.3 self-hosting** depends on the substrate being able to drive its own build toolchain — the trusting-trust witnessed-toolchain machinery is a specialised driver, and S1's fidelity vector is the prerequisite shape for the witnessed-build conformance vector v0.3 ships.
- **v0.4 federation** depends on the generic driver-cell schema (S1 §3) for the federation-peer driver-cell variant.
- **v0.5 industrial control** depends on the modbus driver, which slots into S1's framework directly with no further infrastructure.

---

## S2 — Observability surface consuming H¹ audit cohomology

### Where the code is

The H¹ audit cohomology surface lands at the close of v0.2a's L3 — `audit_h1` exposed from [`src/substrate/inconsistency.py`](../../../src/substrate/inconsistency.py) and consumed by [`src/substrate/respond.py`](../../../src/substrate/respond.py) Phase 4c.
This is the data source S2 builds on; nothing in S2 can start until L3 lands.

There is **no `src/observability/` package yet**.
S2 creates it.
The proximate-sibling pattern is `src/substrate/` — a flat-module package with one `.py` per concept.
Modules to create: `log_aggregation.py`, `error_investigation.py`, `dashboards.py`, `alerting.py`, `captain_home.py`, `metrics.py`.
The `__init__.py` registers each consumer with the substrate's H¹ event stream.

The five normative specs already exist at [specs/observability/](../specs/observability/): `log-aggregation.md`, `error-investigation.md`, `dashboards.md`, `alerting.md`, `captain-home.md`.
The dashboards spec already lays out the cell-resident dashboard record and widget types ([specs/observability/dashboards.md §1-§2](../specs/observability/dashboards.md)).
S2 implements against these specs without re-authoring.

The diagnostic-projection extension carried as **pt-03** lands as `t02-75` — a new section in [specs/observability/error-investigation.md](../specs/observability/error-investigation.md) plus the corresponding implementation in `src/observability/error_investigation.py`.
The grounding spec is [specs/kernel/projection-naturality.md](../specs/kernel/projection-naturality.md).

### Theorem grounding

[`predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — the audit content for a saturated cell IS the H¹ class of the inconsistency sheaf at that cell's stratum.
Dashboards rendering "why is this cell saturated?" are rendering H¹ representatives; log-aggregation grouping by audit-equivalence is grouping by H¹-cocycle equivalence.
Without this theorem, observability would be a heuristic over event logs; with it, the dashboards display the *content* of the audit, not a summary.

Composed with [`predicated-computing/theorems/paraconsistency-as-substrate-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md) — the H¹ surface is bilattice-valued (it tracks the full $(t, f)$ pair, not collapsed to $\bot$); the dashboards' incident-management treatment of "this cell is contradictory but not derelict" is paraconsistency rendered as an operational state rather than an error to clear.

For the diagnostic-projection extension (pt-03 → t02-75): [`predicated-computing/theorems/cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) — the diagnostic projection that surfaces "why this cell is saturated" is a projection in the sense of this theorem; functoriality is what guarantees the diagnostic agrees with the audit-cell whose H¹ class it is rendering.

For the captain-home dashboard: [`predicated-computing/theorems/access-patterns-as-temporal-2-category-limit-colimit-triad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/access-patterns-as-temporal-2-category-limit-colimit-triad.md) — the captain's working surface is a colimit of recent access-patterns over the captain's authority sub-region; the home dashboard renders this colimit.
The temporal-2-category structure is what makes "today's home" different from "yesterday's home" without needing snapshot duplication.

Decision authority: [decisions/observability-surfaces-h1-audit-cohomology.md](../decisions/observability-surfaces-h1-audit-cohomology.md) (if absent, surface as a question per [workflows.md](workflows.md) and authoring against the L3 audit-cell shape directly).
Theory→code row: rows 4 (stratification), 5 (inconsistency repair), 11 (audit) of [theory-for-developers.md](../references/theory-for-developers.md).

### Imaginative grounding

Three captain-trove files motivate observability as a substrate-resident surface rather than a separate monitoring system:

- **`web-gui-messaging`** ([trove file](../../../../../../triage/operations/command/ideas/triage/web-gui-messaging.md), cited in [ideas-trove §ERP and modules](../references/ideas-trove.md#erp-and-modules)).
  The web UI contract — every UI panel is a cell-resident widget receiving cell updates as messages, not a separately-managed view over a database.
  Reduction to on-disk theorem: dashboards-as-cells (spec §1) is the operational form; the underlying authority is [`predication-categories/theorems/predication-fiber-functor`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) (the dashboard cell is a fiber over the dashboards-stratum) composed with row 13 (self-representation everywhere) of [theory-for-developers.md](../references/theory-for-developers.md) — the dashboard updates by the same `respond` discipline as any other cell.
  No new theorem needed.
- **`dont-flatten-the-tower`** (trove §Architecture).
  The argument that asserted/saturated/settled facts are different strata that observability MUST distinguish.
  The dashboards spec's widget types (`time-series`, `gauge`, `histogram`, `event-stream`) are stratum-aware — a "respond/sec" gauge over the asserted stratum has a different meaning than the same gauge over the settled stratum.
  Reduction: this is the per-stratum projection discipline already authorised by `cache-coherence-via-functorial-projection`; the dashboards just consume it consistently.
- **`all-records-are-transactions`** (trove §Records).
  The σ/Δ universal-record discipline.
  Observability events MUST be unified-records — the σ side is the metric's settled state, the Δ side is the change since the last reading.
  Without this, dashboard panels that "average over the last hour" lose the auditable connection between their displayed value and the events that produced it.
  Reduction: row 9 (witness chains) of theory-for-developers, on-disk theorem [`witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md).

Long-horizon trove tie-in: **`relational-expression-syntax`** (trove §Misc).
The Lispy DSL for cell-pattern queries. v0.2b dashboards do **not** ship the DSL — they accept JSON pattern objects per [specs/observability/dashboards.md §2](../specs/observability/dashboards.md) `data-source`.
The DSL is v0.7+ scope.
But the JSON pattern shape S2 ships MUST be a JSON projection of the eventual DSL's AST; the v0.2b form must not paint the v0.7 form into a corner.
Reduction: same `cache-coherence-via-functorial-projection` — the JSON pattern and the eventual DSL form are two presentations of the same query-as-projection; functoriality is what guarantees one can be derived from the other.

### Procedural steps

1. Verify L3 of v0.2a-NOW has landed: `rg -n audit_h1 src/substrate/inconsistency.py src/substrate/respond.py`.
  If absent, S2 cannot start; surface the dependency as a blocker on the v0.2a closure rather than working around it.
2. Create `src/observability/` package with `__init__.py` and the six concept-modules listed in §"Where the code is".
  Each module's `__init__`-time work is to subscribe to the relevant slice of the H¹ event stream from `src/substrate/inconsistency.py`.
3. Implement `src/observability/log_aggregation.py` per [specs/observability/log-aggregation.md](../specs/observability/log-aggregation.md).
  The aggregation key is the H¹-cocycle equivalence class — log lines whose audit-cells are in the same H¹ class are aggregated into one displayed group.
  This is what the audit-cohomology theorem authorises; without it the aggregation would be a string-similarity heuristic.
4. Implement `src/observability/error_investigation.py` per [specs/observability/error-investigation.md](../specs/observability/error-investigation.md), then extend that spec with §"Diagnostic projection (pt-03)" per the carried task `t02-75`.
  The diagnostic surfaces the projection that explains *why* a saturated cell exists — given a saturated cell, walk the per-stratum projection backward to the cells whose conjunction produced the saturation.
  Cite [specs/kernel/projection-naturality.md](../specs/kernel/projection-naturality.md).
5. Implement `src/observability/dashboards.py` per [specs/observability/dashboards.md](../specs/observability/dashboards.md).
  Dashboard cells live in the dashboards stratum; widgets are sub-cells; the rendering pipeline is the cell → widget-spec → web-GUI-message chain that the trove's `web-gui-messaging` makes operational.
  Connect to the existing [`src/shell/web_gui.py`](../../../src/shell/web_gui.py) via a websocket subscription per [`src/network/websocket.py`](../../../src/network/websocket.py).
6. Implement `src/observability/alerting.py` per [specs/observability/alerting.md](../specs/observability/alerting.md).
  An alert is a closure rule that fires on the appearance of a specific H¹ class; the rule lives in the alerts-stratum and fires through `respond` — there is no separate alerting daemon.
  This is what makes the alerting surface auditable in the same shape as the audit it observes.
7. Implement `src/observability/captain_home.py` per [specs/observability/captain-home.md](../specs/observability/captain-home.md).
  The home view is a colimit over the captain's authority sub-region — recent commands, open questions, in-flight tasks, current dashboards.
  The colimit definition is per `access-patterns-as-temporal-2-category-limit-colimit-triad`.
8. Implement governance — [specs/governance/incident-management.md](../specs/governance/incident-management.md) per `t02-80`/`t02-81` — as a closure rule in `src/governance/incident_management.py` (new module if `src/governance/` doesn't exist, else extending).
  An incident-cell is opened when an alert fires; closed when the underlying H¹ class clears.
  Per-incident retrospective cells link the incident to the audit-cells whose H¹ class produced it.
9. Author paired fixtures per landing: `tests/conformance/test_t02_70f_log_aggregation.py`, `test_t02_71f_error_investigation.py`, `test_t02_72f_dashboards.py`, `test_t02_73f_alerting.py`, `test_t02_74f_captain_home.py`, `test_t02_75f_diagnostic_projection.py`, `test_t02_80f_incident_management.py`.
  Each fixture exercises end-to-end: synthetic inconsistency event → audit-cell write → H¹ class formed → dashboard widget updates / log line aggregated / alert fires / incident opens — depending on the consumer.

### Conformance proof

S2 closes when:

- The six observability modules exist in `src/observability/` and each subscribes to a stable slice of the H¹ event stream.
- A live multi-user node renders the captain-home dashboard with non-trivial widgets fed from real audit cohomology (not synthetic data).
- `t02-70`…`t02-75`, `t02-80`/`t02-81`, and pt-03 are marked `done`.
- Spec [specs/observability/error-investigation.md](../specs/observability/error-investigation.md) carries the new §"Diagnostic projection (pt-03)" section.

### Enables next

- **v0.2b ship target 2** is met.
- **v0.3 self-hosting** depends on the substrate being able to observe its own boot — captain-home + alerting wired over the v0.3 self-host runlevels is the surface that makes self-hosting debuggable.
- **v0.4 federation** depends on the dashboards' `network-graph` widget type to render federation topology.
- **v0.7 productivity stack** depends on the diagnostic-projection surface for the agential-layer's "explain this decision" workflow.

---

## S3 — Stdlib verb specs + dispatch shell

### Where the code is

The stdlib substrate exists at [`src/substrate/stdlib.py`](../../../src/substrate/stdlib.py) as a single-module v0.1 placeholder. v0.2b's S3 splits this into per-verb modules under a new `src/stdlib/` package — one `.py` per verb per the menu in [specs/stdlib/_index.md](../specs/stdlib/_index.md): `project.py`, `filter.py`, `fold.py`, `materialize.py`, `hash.py`, `fork.py`, `await.py`, `settle.py`, `witness.py`, `audit.py`, `retract_and_assert.py`, `skill_manifest.py`.
The proximate sibling for the package layout is `src/substrate/` — flat module-per-concept.

The dispatch substrate already exists: [`src/substrate/respond.py`](../../../src/substrate/respond.py) (the universal primitive every verb reduces to per [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md)) and [`src/substrate/runtime.py`](../../../src/substrate/runtime.py) (the runtime that calls `respond`).
The dispatch shell is a thin layer above `respond` that takes a verb name + arguments and synthesises the `respond` call.

All thirteen per-verb specs exist at [specs/stdlib/](../specs/stdlib/) at status normative — see the listing in [specs/stdlib/_index.md §"Specs (to be written at v0.2)"](../specs/stdlib/_index.md).
Each spec carries §"Per-verb fixture discipline" obligations per [decisions/fixture-authoring-paired-task.md](../decisions/fixture-authoring-paired-task.md).

The skill-spec-v1 schema is the carried-task `t02-23` per [tasks/engineering/t02-23-v0.2b-stdlib-and-dispatch-shell.md](../tasks/engineering/t02-23-v0.2b-stdlib-and-dispatch-shell.md): land `boot/schemas/skill-spec-v1.schema.json` as a JSON Schema (Draft 2020-12) projection of the skill-cell record per [specs/agential/skill-registry.md](../specs/agential/skill-registry.md).

The first batch of operational skill-packs is `t02-205`/pt-13 per [tasks/operational/pt-13-operational-skill-packs-first-batch.md](../tasks/operational/pt-13-operational-skill-packs-first-batch.md) — content authoring under `.local/skills/` and `operations/engineering/skills/`, each conforming to the schema `t02-23` lands.

### Theorem grounding

[`predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) — the `fold` verb's behaviour on a cell-set is a specialisation of the graded-dispatch discipline.
The dispatch shell's "verb name + args → `respond` call" reduction is the *generic* form of this; per-verb modules are the *specialisations*.
Without this theorem the verbs would be a flat menu of unrelated functions; with it they are an indexed family with shared algebraic structure.

Composed with [`predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md) — the dispatch shell's selection of which `respond`-shape to call for a given verb is a $\mathcal{Q}$-enriched fusion in the cost quantale (per [decisions/cost-is-lawvere-quantale.md](../decisions/cost-is-lawvere-quantale.md)).
Each verb carries its own cost annotation; nested verb calls compose costs via the quantale's $\otimes$.

For `project` specifically: [`predicated-computing/theorems/cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) — `project` is *the* operational form of the per-stratum projection that this theorem authorises. v0.2a's L4 (fuel-composition determinism) is the prerequisite — without quantale-product determinism, two `project` calls on the same pattern could return cells in different orders.

For `witness` and `audit`: [`predicated-computing/theorems/witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md) — the verb returns the witness chain as a substrate-readable proof object; the chain's structure is fixed by the theorem, not by the verb's implementation choices.

For `materialize` and `settle`: [`predicated-computing/theorems/scott-continuity-as-checkpointability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuity-as-checkpointability.md) — `settle` runs `respond` to a fixed point; Scott-continuity of the underlying closure operator is what makes the fixed point both reachable and checkpointable mid-iteration.

For the skill-spec schema (`t02-23`): [`predicated-computing/theorems/signature-binds-witness-to-identity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/signature-binds-witness-to-identity.md) — the schema is the canonical-JSON byte-form the signature binds; without canonical form, two byte-different but semantically-equal skill records would have different content-addresses, breaking signature verification.

Decision authority: [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md), [decisions/canonical-json-conventions.md](../decisions/canonical-json-conventions.md), [decisions/content-hash-via-sha256.md](../decisions/content-hash-via-sha256.md).
Theory→code rows: 4 (stratified facts → `project`, `filter`, `materialize`), 8 (capability → `respond` discipline), 9 (witness chains → `witness`, `audit`), 13 (self-representation → skill-spec schema) of [theory-for-developers.md](../references/theory-for-developers.md).

### Imaginative grounding

Three captain-trove files motivate the "every verb reduces to `respond`" discipline rather than a flat verb menu:

- **`mcp-verb-inventory`** ([trove file](../../../../../../triage/operations/command/ideas/triage/mcp-verb-inventory.md), cited in [ideas-trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  The ~50-verb catalog.
  The argument: the verb menu is finite and known in advance, not extensible by user code at runtime; this is what makes the substrate's verb surface auditable and dispatch-shell-checkable.
  Reduction to on-disk theorem: the graded-dispatch / $\mathcal{Q}$-enriched fusion theorem makes the inventory a typed indexed family rather than a string menu — at any point the substrate knows which verbs are valid in which capability fiber.
  No new theorem needed.
- **`relational-expression-syntax`** (trove §Misc).
  The Lispy DSL for verb composition. v0.2b does **not** ship the DSL — verbs are called as Python functions in this release.
  But the dispatch-shell's argument shape MUST be a Python projection of the eventual DSL's AST; the v0.2b form must not paint the v0.7+ DSL form into a corner.
  Reduction: same graded-dispatch discipline; the DSL is the dispatch-shell's eventual user-facing surface.
- **`cells-as-models-mcp-as-io`** (trove §Infrastructure).
  The framing that every verb operates on cell-models, never on opaque "data".
  The verb menu's signature (`project(pattern)`, `filter(fiber, predicate)`, etc.) is uniformly cell-shaped — `pattern` is a cell, `predicate` is a cell, `fiber` is a cell-set.
  Reduction: the same self-representation row 13 — verbs operate on the same cells they themselves are encoded as.

Long-horizon trove tie-in: **`live-swap-service-components`** (trove §Infrastructure).
The dispatch shell's verb-name → `respond` reduction is what makes a verb's implementation hot-swappable — replace the verb's substrate-side function and the next `respond` call picks up the new implementation. v0.2b doesn't ship the swap mechanism, but the dispatch shell MUST not bake module references into the call site (call by verb-name string, not by Python import).
This is the v0.2b discipline that makes v0.3+'s live-swap simple.

### Procedural steps

1. Create `src/stdlib/` package with `__init__.py` registering the verb table (verb-name string → Python callable).
  Use the proximate-sibling pattern from `src/substrate/`.
2. Migrate per-verb implementations from `src/substrate/stdlib.py` into one module per verb under `src/stdlib/<verb>.py` per the menu in [specs/stdlib/_index.md](../specs/stdlib/_index.md).
  Each module imports `respond` from `src/substrate/respond.py` and reduces its verb's behaviour to a `respond` call shape per [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md).
  When the migration is complete `src/substrate/stdlib.py` is empty (or removed); confirm with `rg -n "from substrate.stdlib import" src/`.
3. Implement the dispatch shell at `src/stdlib/dispatch.py` — a function `dispatch(verb_name, args)` that looks up `verb_name` in the registry from step 1, validates `args` against the verb's spec ([specs/stdlib/<verb>.md](../specs/stdlib/) §"Signature"), and reduces to the verb's `respond` shape.
  The dispatch is what makes the verb-name a string call site — no Python imports from the call surface.
4. Author per-verb fixtures per [workflows.md recipe 2](workflows.md): `tests/conformance/test_t02_NNf_<verb>.py` for each verb.
  The fixtures land alongside the per-verb implementations in S3 — paired-task discipline.
  See [specs/stdlib/_index.md §"Per-verb fixture discipline"](../specs/stdlib/_index.md) for the per-verb obligation shape.
5. For `project`, `filter`, `fold`, `materialize` specifically: each fixture MUST exercise the projection-naturality contract from [specs/kernel/projection-naturality.md](../specs/kernel/projection-naturality.md). v0.2a's L4 fuel-composition determinism is the prerequisite — verify with `rg -n quantale_product src/substrate/cost.py` before writing these fixtures.
6. For `witness` and `audit`: each fixture MUST exercise the witness-chain proof-object shape per [specs/security/signing-and-witnessing.md](../specs/security/signing-and-witnessing.md).
7. For `settle` and `await`: each fixture MUST exercise the Scott-continuity / checkpointability discipline.
  Run a synthetic settlement to fixed point; assert intermediate checkpoints can be replayed forward to the same fixed point.
8. Author `boot/schemas/skill-spec-v1.schema.json` per `t02-23`.
  Use JSON Schema Draft 2020-12.
  Schema validates the canonical-JSON byte-form per [decisions/canonical-json-conventions.md](../decisions/canonical-json-conventions.md) — schemas-of-arbitrary-JSON would defeat the content-addressing discipline.
  Cross-link from [boot/schemas/_index.md](../../../boot/schemas/) (create if absent) and from [specs/agential/skill-registry.md](../specs/agential/skill-registry.md).
9. Land the first batch of operational skill packs per `t02-205`/pt-13 — content under `.local/skills/<name>/SKILL.md` and `operations/engineering/skills/<name>/SKILL.md`.
  Each pack is a skill-cell whose record validates against the v1 schema.
  Per the carried-task record [tasks/operational/pt-13-operational-skill-packs-first-batch.md](../tasks/operational/pt-13-operational-skill-packs-first-batch.md).

### Conformance proof

S3 closes when:

- `src/stdlib/<verb>.py` exists for every verb in [specs/stdlib/_index.md](../specs/stdlib/_index.md); `src/substrate/stdlib.py` is empty or removed.
- The dispatch shell at `src/stdlib/dispatch.py` accepts every verb-name and reduces to `respond` per the verb's spec.
- Per-verb fixtures (`t02-170`…`t02-175` plus the verb-specific `t02-NNf` IDs) all pass.
- `boot/schemas/skill-spec-v1.schema.json` validates the example skill-records under `.local/skills/` and `operations/engineering/skills/`.
- `t02-90`…`t02-94`, `t02-150`…`t02-155`, `t02-170`…`t02-175`, `t02-23`, `t02-205`/pt-13 are marked `done`.

### Enables next

- **v0.2b ship target 3** is met.
- **S2 captain-home dashboard** can render the verb-call event stream cleanly because every verb's invocation is a `respond` call with a uniform event shape.
- **v0.3 bundled userland** depends on the verb table being the surface user code calls — without S3, userland would be calling substrate internals directly.
- **v0.7+ relational-expression-syntax DSL** depends on the dispatch shell's string-based verb-name discipline; baking imports into call sites would foreclose the DSL's compilation target.
- **v0.8 agential layer** depends on the skill-spec schema for skill-pack registration.

---

## S4 — Nix-flake skeleton (packaging-prep, NOT trusting-trust defence)

> **Spec-vs-milestone gate divergence.** [`specs/packaging/nix-flake-spec.md`](../specs/packaging/nix-flake-spec.md) §1 names `default = substrate-os` (a bootable image) as the top-level package, with `substrate-py` / `substrate-rs` as siblings.
> The [v0.2b milestone](../milestones/v0.2b-drivers-observability-packaging.md) §"Ship targets" item 4 names a different gate: "`nix build .#default` produces a reproducible wheel (bit-identical across two builds on the same host)" — i.e. a Python wheel, not a bootable image. **This SOON doc treats v0.2b's `default` as aliased to `substrate-py` (wheel-first)** because the milestone is the v0.2b authority and the bootable-image flavour belongs to v0.3 self-hosting per [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md).
> The first task within S4 below explicitly refreshes the spec to mark the bootable-image framing as v0.3-targeted and to document the v0.2b `default = substrate-py` alias.

### Where the code is

There is **no `flake.nix` and no `nix/` directory** at the project root yet.
S4 lands them.

The spec at [specs/packaging/nix-flake-spec.md](../specs/packaging/nix-flake-spec.md) is **already normative v0.1** with the top-level `flake.nix` shape drawn out in §1, including the per-implementation derivations (`substrate-py`, `substrate-rs`) and the dev shell. v0.2b's S4 work is implementation against this spec, **modulo the gate divergence noted in the callout above** — for v0.2b, `default` aliases to the wheel-producing `substrate-py` derivation.

The full trusting-trust machinery (diverse-double-compiling discipline, witnessed-toolchain cell schema, multi-compiler bootstrap evidence) is **explicitly out of scope** per [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md). v0.2b's gate is "two builds on the same host produce a bit-identical wheel" — a single-machine reproducibility check, not a defence against compromised toolchains.
The Guix manifest shadow at [specs/packaging/guix-manifest-spec.md](../specs/packaging/guix-manifest-spec.md) is similarly v0.3 scope; v0.2b's S4 lands the Nix flake only.
The `substrate-os` bootable-image derivation is also v0.3 scope.

The proximate-sibling for what `nix/substrate-py.nix` looks like is the spec's §1 `callPackage ./nix/substrate-py.nix { }` line — the spec already names the file paths the implementation must use.

### Theorem grounding

[`predicated-computing/theorems/deployment-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/deployment-determinism.md) — the bit-identical-build property is the operational form of deployment-determinism at the packaging stratum.
Two builds of the same source on the same host MUST produce the same wheel; this is what makes deployment a deterministic function of the source-tree commit, which in turn is what makes provenance auditable.
Without this theorem the gate would be a heuristic ("looks like the same wheel"); with it, byte-equality is the authorised acceptance criterion.

For the v0.2b/v0.3 boundary specifically — what S4 ships vs what v0.3 trusting-trust adds: the same theorem, applied at two strata. v0.2b gates determinism over `(source, host) → wheel`. v0.3 will gate determinism over `(source) → wheel` independent of host, by composing two compilers' outputs and witnessing their agreement.
The v0.2b form is the prerequisite shape; it must not foreclose the v0.3 extension.
Per [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md) the v0.3 work extends rather than replaces the v0.2b flake.

v0.2b's bit-identical-on-same-host claim does **not** need a separate transport-invariance theorem — it is fully covered by `deployment-determinism` at the `(source, host) → wheel` stratum.
The cross-host transport-invariance claim that v0.3's witnessed-build will need *will* require a packaging-stratum specialisation theorem (currently not on disk). v0.2b's S4 deliberately stops at the same-host gate and does not assert cross-host invariance; flagging here so the next agent doesn't paint v0.3 into a corner by overclaiming v0.2b's reproducibility property.

Decision authority: [decisions/package-format-is-nix-flake.md](../decisions/package-format-is-nix-flake.md), [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md).
Theory→code row: row 12 (deployment determinism / packaging) of [theory-for-developers.md](../references/theory-for-developers.md).

### Imaginative grounding

Two captain-trove files frame why packaging is a substrate concern rather than an external build-tool concern:

- **`guix-guile-composition-layer`** ([trove file](../../../../../../triage/operations/command/ideas/triage/guix-guile-composition-layer.md), cited in [ideas-trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  The aspiration to use Guix/Guile as a composition layer over the substrate's package surface. v0.2b uses Nix rather than Guix per [decisions/package-format-is-nix-flake.md](../decisions/package-format-is-nix-flake.md), and the Guix manifest is the v0.3 shadow per [specs/packaging/guix-manifest-spec.md](../specs/packaging/guix-manifest-spec.md).
  The trove's argument — that the package layer should be a pure-functional composition rather than an imperative script — survives the format choice; Nix flakes are the same shape under a different syntax.
  Reduction to on-disk theorem: the deployment-determinism theorem makes the pure-functional discipline the authorised one regardless of which toolchain instantiates it.
- **`all-records-are-transactions`** (trove §Records).
  The σ/Δ universal-record discipline applies to packaging: a wheel artefact is a σ-side settled state of the build; the flake's lockfile pins the Δ-side trajectory of inputs that produced it.
  Reduction: the wheel + lockfile pair is a witness chain in the sense of the on-disk theorem [`witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md); v0.3's witnessed-toolchain cell-schema is the substrate-resident form of this, but v0.2b's flake-lockfile-pair is already its on-disk shape.

Long-horizon trove tie-in: there is no v0.7+ trove file pulling on packaging directly — packaging is one of the few v0.2b surfaces whose long-horizon shape is fully determined by the on-disk theorems rather than by speculative trove material.
The trusting-trust extension at v0.3 is a theorem-driven elaboration, not a trove-driven one.

### Procedural steps

1. **Refresh [specs/packaging/nix-flake-spec.md](../specs/packaging/nix-flake-spec.md) for v0.2b alignment first.** Add §"v0.2b packaging-prep alias" naming `default = substrate-py` for v0.2b (wheel-producing) and explicitly tagging the §1 `default = substrate-os` (bootable-image) framing as v0.3 self-hosting scope per [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md).
  This unblocks the rest of S4 without a hidden spec-vs-implementation contradiction.
2. Land `flake.nix` at the repository root with `default = substrate-py` (per the §"v0.2b packaging-prep alias" just authored).
  Copy the §1 top-level structure for everything else; fill in the `description` and verify the `nixpkgs.url` channel matches the host the captain develops on.
3. Land `nix/substrate-py.nix` — the Python derivation.
  Inputs are `pkgs`; output is a wheel produced by `pkgs.python311.pkgs.buildPythonPackage` (or the captain's chosen Python version per [python.md](python.md)).
  Source is the repository checkout via `src = ../.
  `.
  Dependencies pinned to canonical libraries per [python.md](python.md): `pydantic-ai`, `langgraph`, `fastapi`, `pydantic`, `cryptography`, `mcp` (the Python SDK).
4. Land `nix/dev-shell.nix` per the spec — a `pkgs.mkShell` with the language toolchain plus the test runners (`pytest`, `pytest-cov`, `mypy`, `ruff` per [python.md](python.md) §"Tooling").
5. Run `nix flake lock` to produce `flake.lock` (committed).
  The lockfile pins every input's hash; this is the σ-side settled state per the trove's `all-records-are-transactions`.
6. Run `nix build .#default` twice on the same host.
  Compute `sha256sum result/<wheel>` after each build. **Gate: the two hashes MUST match byte-for-byte.** If they diverge, surface the non-determinism (commonly: timestamps in the wheel metadata, source-order in built archives, build-time entropy in `__pycache__`); fix it in `nix/substrate-py.nix` by passing `SOURCE_DATE_EPOCH` and `--no-compile` per the standard Python reproducible-build recipe; rebuild and re-hash.
  The on-disk task carrying this work is [`tasks/engineering/t02-92-v0.2b-dr-test-as-replay.md`](../tasks/engineering/t02-92-v0.2b-dr-test-as-replay.md) — DR-test-as-replay is the same byte-equality discipline applied at the disaster-recovery stratum.
7. Land `nix/substrate-rs.nix` as a *stub* — the Rust implementation lands at v0.x per [_index.md](_index.md) §"Sequencing across releases"; the stub is what makes the spec's two-derivation top-level shape valid in v0.2b without breaking the gate.
  Document the stub in the file's header comment.
8. **Explicitly do NOT land**: `nix/substrate-os.nix` (the bootable-image derivation), `nix/witnessed-toolchain.nix`, `nix/diverse-double-compiling.sh`, the `boot/schemas/witnessed-build-v1.schema.json` cell-schema.
  These are v0.3 scope per [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md).
  If you find yourself reaching for them, stop and re-read the decision.
9. Land `t02-91-v0.2b-deployment-config-as-cell` — the deployment-config-as-substrate-cell discipline that makes `flake.nix`'s pinned inputs visible inside the substrate as a `kind: deployment-config` cell.
  This is what makes "the substrate built itself" auditable from inside the substrate, not just from the host's filesystem.
10. Author the paired conformance fixture for the reproducibility gate: `tests/conformance/test_t02_94f_nix_flake_reproducibility.py` (paired with `t02-94`).
  The fixture invokes `nix build .#default` twice via subprocess (skipped if `nix` is not on PATH — flag the skip clearly), hashes both wheels, asserts equality.
  Cite `predicated-computing/theorems/deployment-determinism` in the test docstring.
11. Document the v0.2b-vs-v0.3 boundary in [specs/packaging/nix-flake-spec.md](../specs/packaging/nix-flake-spec.md) §"Trusting-trust deferral (v0.2b)" — a new section explicitly naming what v0.2b ships vs what v0.3 adds, citing the decision.
  This protects the next agent against accidentally picking up v0.3 work.

### Conformance proof

S4 closes when:

- `flake.nix`, `flake.lock`, `nix/substrate-py.nix`, `nix/substrate-rs.nix` (stub), `nix/dev-shell.nix` exist at the repository root / under `nix/`.
- `nix build .#default` produces a wheel; two consecutive invocations on the same host produce byte-identical wheels.
- The reproducibility fixture passes (or skips cleanly if `nix` unavailable on the test host).
- [specs/packaging/nix-flake-spec.md](../specs/packaging/nix-flake-spec.md) carries the new §"v0.2b packaging-prep alias" and §"Trusting-trust deferral (v0.2b)" sections.
- `t02-90`, `t02-91`, `t02-92`, `t02-94` are marked `done`.

### Enables next

- **v0.2b ship target 4** is met.
- **v0.3 trusting-trust defence** has its prerequisite shape — diverse-double-compiling extends the same flake, doesn't replace it; the witnessed-toolchain cell-schema is a substrate-resident projection of the lockfile S4 lands.
- **v0.3 self-hosting** depends on the substrate being able to build itself from a flake; S4's reproducibility gate is what makes "the substrate built itself, and we can verify the build" a checkable claim.
- **v0.3 Guix manifest shadow** ([specs/packaging/guix-manifest-spec.md](../specs/packaging/guix-manifest-spec.md)) extends rather than replaces the Nix flake; S4's lockfile becomes the Guix manifest's input pinning source.

---

## S5 — Network spec stubs aligned to the deferral discipline

### Where the code is

The network substrate exists at [`src/network/`](../../../src/network/) with five v0.1 stubs: `__init__.py`, `http_server.py`, `websocket.py`, `federation.py`, `mud_ledger.py`. v0.2b's S5 does **not** add network-implementation work — wire-format implementation is deferred per [decisions/network-spec-defer-until-implementer-named.md](../decisions/network-spec-defer-until-implementer-named.md).

The spec dir at [specs/network/](../specs/network/) has fifteen specs covering federation-protocol, ActivityPub, CalDAV, CardDAV, Gemini, HTTP/2, HTTP-addressing, iCalendar, IMAP, IRC, Matrix C-S and S-S APIs, modbus, MQTT, network-algebraic-contract, POP3, SMTP, TCP-binding, WebSocket, XMPP.
Most are at status `normative` for the algebra (which is eager per the deferral decision) and `stub` or unspecified for the wire format (which is deferred).
S5's job is to align each spec with the v0.2b stub discipline — explicit "Wire format deferred" sections citing the deferral decision so the next agent does not mistake an algebraic spec for a complete wire-protocol spec.

The carried-task `t02-202` per pt-01 (federation peer-share fixture-replay) extends [specs/network/federation-protocol.md](../specs/network/federation-protocol.md) with a fixture-replay surface — the node serialises a witness-share, the receiving node replays it, both nodes' federation-state must agree.
See [tasks/engineering/pt-01-federation-peer-share-fixture-replay.md](../tasks/engineering/pt-01-federation-peer-share-fixture-replay.md).

The carried-task `t02-203` per pt-05 (Tier-2 model registry lookup spec) extends [specs/scheduling/tier-routing.md](../specs/scheduling/tier-routing.md) and [specs/agential/non-lm-models.md](../specs/agential/non-lm-models.md).
Fixture deliverable `tests/fixtures/tier-routing/registry-lookup.jsonl`.
See [tasks/engineering/pt-05-tier2-model-registry-lookup.md](../tasks/engineering/pt-05-tier2-model-registry-lookup.md).

The carried-task `t02-204` per pt-06 (per-model-family confidence ↔ bilattice calibration) extends [specs/agential/non-lm-models.md](../specs/agential/non-lm-models.md).
Fixture deliverable `tests/fixtures/tier-routing/calibration-binding.jsonl`.
See [tasks/engineering/pt-06-confidence-bilattice-calibration.md](../tasks/engineering/pt-06-confidence-bilattice-calibration.md).

The sample task [tasks/engineering/t02-150-v0.2b-network-stubs.md](../tasks/engineering/t02-150-v0.2b-network-stubs.md) demonstrates the per-spec stub-discipline alignment shape — the same edit pattern repeats across the fifteen network specs.

### Theorem grounding

[`predicated-computing/theorems/federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) — federation algebra is the federation protocol; two nodes that agree on the algebra and disagree on the wire format will eventually agree on cell-state because the algebra is what determines convergence, not the wire form.
This is the on-disk authority for "algebra eager, wire deferred" — without this theorem the deferral would be a punt; with it, it is the *correct* sequencing because the algebra fully determines what any future wire format must encode.

Composed with [`predicated-computing/theorems/transport-tolerance-of-federation`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transport-tolerance-of-federation.md) — federation's correctness is invariant under transport choice.
Different wire formats (gRPC, JSON-over-HTTP, BSON-over-WebSocket) all satisfy the algebra; the choice of which to ship can wait until the implementer picks a stack.

For pt-01 (federation peer-share fixture-replay): [`predicated-computing/theorems/witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md) — the witness-share serialised by node A and replayed by node B is a witness chain in the on-disk shape; the replay-equivalence the fixture asserts is exactly the proof-object's transport invariance.

For pt-05 / pt-06 (Tier-2 model registry, calibration): [`predicated-computing/theorems/conformance-via-fiber-algebra-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/conformance-via-fiber-algebra-functor.md) — Tier-2 models (non-LM) are interfacers in the same sense as drivers (per S1's faithful-interfacer-functor discipline), specialised to the agential stratum.
The registry lookup is the dispatch from the agential layer to the model-fiber; the calibration binds the model's native confidence values to the bilattice fiber the substrate operates over.

For [specs/network/network-algebraic-contract.md](../specs/network/network-algebraic-contract.md) specifically (the spec that makes the algebra-eager / wire-deferred discipline normative): [`predicated-computing/theorems/doctrine-fidelity-compositionality`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-compositionality.md) — composability of the algebraic contract across nodes is what the wire format MUST preserve; the contract spec's job is to name the composition law before the wire form is chosen.

Decision authority: [decisions/network-spec-defer-until-implementer-named.md](../decisions/network-spec-defer-until-implementer-named.md).
Theory→code row: row 10 (federation merge as $\odot$) of [theory-for-developers.md](../references/theory-for-developers.md).

### Imaginative grounding

Two captain-trove files frame the algebra-eager / wire-deferred discipline:

- **`mcp-as-system-api`** ([trove file](../../../../../../triage/operations/command/ideas/triage/mcp-as-system-api.md), cited in [ideas-trove §Infrastructure](../references/ideas-trove.md#infrastructure)).
  The argument that MCP is the substrate API, not "a network protocol the substrate happens to speak" — collapses the network-protocol decision into the driver-cell decision (S1).
  Reduction to on-disk theorem: federation-convergence + the faithful-interfacer-functor (S1) — the network surface is a federation of driver-cells; choosing a wire format is choosing a transport for the driver-cell exchanges, which the convergence theorem already authorises as deferrable.
- **`all-records-are-transactions`** (trove §Records).
  The σ/Δ discipline applies to network exchanges: a federation share is a Δ-side transaction; the receiving node's settled state is the σ side.
  Reduction: same `witness-chain-as-proof-object`; the fixture-replay surface (pt-01) is the operational form.

Long-horizon trove tie-in: **`live-swap-service-components`** (trove §Infrastructure).
The deferral discipline is what makes a future live-swap of the wire format possible — when an implementer is named in v0.4 and picks (say) gRPC, replacing it later with QUIC or WebTransport is the same kind of swap the trove file describes for service components, applied at the transport layer.
Reduction: same federation-convergence theorem — wire-format swap is invariant for the algebra, so the swap is authorised before it is engineered.

### Procedural steps

1. Walk every spec under [specs/network/](../specs/network/).
  For each, verify it carries an explicit "Wire format deferred (v0.2b stub)" section citing [decisions/network-spec-defer-until-implementer-named.md](../decisions/network-spec-defer-until-implementer-named.md).
  If absent, add it.
  Use [specs/network/federation-protocol.md](../specs/network/federation-protocol.md) (after `t02-150` lands) as the template.
2. Confirm [specs/network/_index.md](../specs/network/_index.md) groups the fifteen specs into "algebraic specs (eager)" and "wire format stubs (deferred)" subsections.
  If it doesn't, restructure it.
  The index is what the next agent reads first; it must make the v0.2b discipline visible at the index level.
3. Confirm [specs/network/network-algebraic-contract.md](../specs/network/network-algebraic-contract.md) is at status `normative` and names the composition law per `doctrine-fidelity-compositionality`.
  This is the load-bearing spec the deferral leans on; if it is at status `stub` or `draft`, it MUST be promoted before the per-protocol stubs are aligned.
4. Land `t02-202`/pt-01: extend [specs/network/federation-protocol.md](../specs/network/federation-protocol.md) with a §"Peer-share fixture replay" section per [tasks/engineering/pt-01-federation-peer-share-fixture-replay.md](../tasks/engineering/pt-01-federation-peer-share-fixture-replay.md).
  Author the fixture at `tests/conformance/test_t02_202f_federation_peer_share_replay.py` exercising serialise → replay → state-agreement.
5. Land `t02-203`/pt-05: extend [specs/scheduling/tier-routing.md](../specs/scheduling/tier-routing.md) and [specs/agential/non-lm-models.md](../specs/agential/non-lm-models.md) with the Tier-2 model registry lookup per [tasks/engineering/pt-05-tier2-model-registry-lookup.md](../tasks/engineering/pt-05-tier2-model-registry-lookup.md).
  Author the fixture at `tests/fixtures/tier-routing/registry-lookup.jsonl`.
6. Land `t02-204`/pt-06: extend [specs/agential/non-lm-models.md](../specs/agential/non-lm-models.md) with §"Confidence ↔ bilattice calibration" per [tasks/engineering/pt-06-confidence-bilattice-calibration.md](../tasks/engineering/pt-06-confidence-bilattice-calibration.md).
  Author the fixture at `tests/fixtures/tier-routing/calibration-binding.jsonl`.
7. **Explicitly do NOT land**: any wire-format implementation.
  No `src/network/<protocol>/` modules; no FastAPI endpoints beyond what `src/network/http_server.py` already stubs; no real ActivityPub / Matrix / SMTP code.
  If an implementer is named for v0.4 federation, that work happens then, against the algebraic specs S5 confirms.
8. Document the v0.2b/v0.4 boundary in [specs/network/_index.md](../specs/network/_index.md) §"Implementation deferral" — explicit list of which protocols await an implementer assignment, citing the deferral decision.

### Conformance proof

S5 closes when:

- Every spec under [specs/network/](../specs/network/) carries an explicit "Wire format deferred (v0.2b stub)" section citing the deferral decision.
- [specs/network/_index.md](../specs/network/_index.md) groups specs into algebraic-eager and wire-deferred subsections.
- The four carried-task spec extensions (`t02-202`/pt-01, `t02-203`/pt-05, `t02-204`/pt-06, plus the per-spec stub alignments under `t02-200`/`t02-201`) are landed.
- Fixtures `tests/conformance/test_t02_202f_federation_peer_share_replay.py`, `tests/fixtures/tier-routing/registry-lookup.jsonl`, `tests/fixtures/tier-routing/calibration-binding.jsonl` exist and pass.
- pt-01, pt-05, pt-06 are marked `done`; `t02-200`…`t02-204` are marked `done`.

### Enables next

- **v0.2b ship target 5** is met.
- **v0.4 federation** has a clean spec surface to implement against — the algebraic specs are normative and the wire-format choice is the only open question for the named implementer.
- **v0.5 industrial control (modbus, MQTT)** depends on the algebraic-contract spec being normative; S5 confirms this prerequisite.
- **v0.6 third-party SDK** depends on the per-protocol algebraic specs being citable from outside the project — S5's index restructuring makes that citation surface clean.

---

## After v0.2b's first slice ships — what unlocks immediately

Once the five S1-S5 landings are in:

- **v0.2b ship targets 1-5** are met.
  The substrate gains a normative driver framework, an observability surface consuming H¹ audit cohomology, a stdlib + dispatch shell, a reproducible packaging skeleton, and a network spec surface aligned to the deferral discipline.
- **v0.2b residual** opens — the deferred-from-v0.2a `t02-122`/`t02-123`/`t02-124` four-state repair lifecycle (gated on the math-side `witness-as-cell` theorem); the pending-from-v0.2a `t02-116`/pt-04 stratum-preserving compaction (rewrite spec to log-rewriting form).
  See [milestones/v0.2b-drivers-observability-packaging.md](../milestones/v0.2b-drivers-observability-packaging.md) §"Carried project tasks" for the residual menu.
- **v0.2b ships** when the residual is closed; v0.3 self-hosting + trusting-trust starts then.
  See [next-stretch.md §Stage 3 — v0.3 on-ramp](next-stretch.md#stage-3--v03-on-ramp) for the next stretch.

The next agent picking up v0.2b residual or v0.3 on-ramp work should open [next-stretch.md](next-stretch.md) for the multi-stage view, [next-stretch-v0.4-v0.6.md](next-stretch-v0.4-v0.6.md) for the federation horizon, and (when authoring the v0.3 on-ramp landings at NOW-doc / SOON-doc granularity becomes useful) extend this telescoping pattern with a `next-stretch-then.md` for v0.3's first landings.

## Cross-cutting threads (the same Threads A-H apply here)

The eight cross-cutting threads from [next-stretch.md](next-stretch.md) and [next-stretch-v0.4-v0.6.md](next-stretch-v0.4-v0.6.md) apply to every landing in this doc:

- **Thread A (paired-fixture discipline)** — every implementation slice ships a `t02-NNf` test alongside the implementation `t02-NN`.
- **Thread B (single-respond reduction)** — every verb, every observability consumer, every driver call reduces to `respond`.
- **Thread C (canonical-JSON byte-form)** — every cell record, every schema, every wire format (when wire formats land) uses canonical JSON.
- **Thread D (substrate-resident)** — drivers, dashboards, alerts, incidents, skills are cells, not external resources.
- **Thread E (paraconsistency operational)** — H¹ surfaces bilattice-valued; the dashboards display saturation as a state, not an error.
- **Thread F (algebra eager, wire deferred)** — S5's deferral discipline is the canonical instance.
- **Thread G (every claimed primitive reduces to an existing theorem)** — the trove citations in §"Imaginative grounding" each name their reduction.
- **Thread H (never cite a name not on disk)** — every theorem-slug above is verified on-disk; if any link is broken, fix the doc here rather than re-routing the procedural steps.

## Glossary of theorem slugs cited above

(Same glossary discipline as [next-stretch-now.md §"Glossary of theorem slugs cited above"](next-stretch-now.md#glossary-of-theorem-slugs-cited-above).)

- [`access-patterns-as-temporal-2-category-limit-colimit-triad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/access-patterns-as-temporal-2-category-limit-colimit-triad.md) — captain-home dashboard colimit (S2).
- [`audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — H¹ audit surface (S2).
- [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) — `project` verb, diagnostic projection (S2, S3).
- [`cell-set-fold-as-graded-dispatch-specialization`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) — `fold` verb dispatch (S3).
- [`conformance-via-fiber-algebra-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/conformance-via-fiber-algebra-functor.md) — Tier-2 model registry, calibration (S5).
- [`deployment-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/deployment-determinism.md) — bit-identical wheel gate (S4).
- [`doctrine-fidelity-compositionality`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-compositionality.md) — network-algebraic-contract composition (S5).
- [`doctrine-fidelity-via-faithful-interfacer-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md) — driver three-operation discipline (S1).
- [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) — algebra-eager / wire-deferred authority (S5).
- [`graded-dispatch-via-q-enriched-fusion`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md) — verb-name dispatch shell (S3).
- [`interfacer-counit-law`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law.md) — driver-fidelity conformance vector (S1).
- [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md) — generic vector instantiated per driver (S1).
- [`modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — per-driver capability check (S1).
- [`paraconsistency-as-substrate-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md) — bilattice-valued H¹ surface (S2).
- [`scott-continuity-as-checkpointability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuity-as-checkpointability.md) — `settle` / `await` verbs (S3).
- [`signature-binds-witness-to-identity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/signature-binds-witness-to-identity.md) — skill-spec canonical-JSON form (S3).
- [`transport-tolerance-of-federation`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transport-tolerance-of-federation.md) — wire-format invariance (S5). *(Removed from S4 in revision: v0.2b's same-host bit-identical gate is fully covered by `deployment-determinism`; the cross-host transport-invariance claim is v0.3 scope and will need a packaging-stratum specialisation theorem not yet on disk.)*
- [`witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md) — `witness` / `audit` verbs (S3); flake-lockfile pair (S4); peer-share fixture replay (S5).

## See also

- [next-stretch-now.md](next-stretch-now.md) — predecessor; the four landings that close v0.2a (L1-L4).
- [next-stretch.md](next-stretch.md) — multi-stage view; this SOON-doc telescopes Stage 2.
- [next-stretch-v0.4-v0.6.md](next-stretch-v0.4-v0.6.md) — successor stretches; federation, industrial control, third-party SDK.
- [next-stretch-v0.7-v1.0.md](next-stretch-v0.7-v1.0.md) — long horizon; productivity stack, agential layer, continuous learning, self-developing OS.
- [capability-ladder.md](capability-ladder.md) — single canonical view of the build-X-to-enable-Y forward chain across all releases.
- [workflows.md](workflows.md) — recipes for the recurring bits referenced from the procedural steps above (paired-fixture authoring, debugging non-deterministic replay, working with the event log).
- [../references/theory-for-developers.md](../references/theory-for-developers.md) — pairs every PredCat / PredComp construct with the spec section that contracts it and the source module that realises it.
- [../references/ideas-trove.md](../references/ideas-trove.md) — the captain-trove reference index whose entries each landing's §"Imaginative grounding" cites.
- [../milestones/v0.2b-drivers-observability-packaging.md](../milestones/v0.2b-drivers-observability-packaging.md) — the milestone whose ship targets the five landings here close.
