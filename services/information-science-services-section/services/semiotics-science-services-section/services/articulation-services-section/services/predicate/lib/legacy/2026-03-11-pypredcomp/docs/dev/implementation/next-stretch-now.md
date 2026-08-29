---
title: "Next-stretch NOW: closing v0.2a (gates 5-6 + pt-08) and the on-ramp into v0.2b"
description: "The most granular slice of the next-stretch plan series. Where the codebase is on 2026-05-03; the four open landings between today and v0.2a shipping; for each landing — the on-disk theorem that authorises it, the captain-trove ideas that informed it, the ordered procedural moves keyed to source modules and spec sections, the conformance proof, and the v0.2b/v0.3 work it unblocks. Read before [next-stretch.md](next-stretch.md) when the session horizon is a single landing rather than a multi-stage stretch."
kind: implementation-guide
status: active
horizon: doing
authority: "milestones/v0.2a-multi-user-single-node.md, theories/.../predicated-computing/, theories/.../predication-categories/, operations/engineering/triage/operations/command/ideas/triage/"
predecessor-of: "implementation/next-stretch.md (the multi-stage stretch this NOW-doc telescopes Stage 1 of)"
---

# Next-stretch NOW

The queue between today and v0.2a shipping.
Four landings; pick one and ship it.

```text
L1 ──► L2 ──┐
            ├──► v0.2a ships ──► v0.2b
L3 ────────►│
L4 ────────►│
```

L1 closed 2026-05-03 (BEFORE ordering ratified — see [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../decisions/personnel-migration-sequenced-before-bootstrap-users.md)); L2 is the current focus.
L3 and L4 are independent of L1/L2 and of each other — separate agents can pick them up in parallel.

## The queue

- **Closed 2026-05-03: L1 — Personnel → boundary migration** ([pt-08](../tasks/engineering/pt-08-personnel-to-boundary-migration.md), folds into `t02-127`).
  Sequencing ratified BEFORE per [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../decisions/personnel-migration-sequenced-before-bootstrap-users.md); spec at `boot-sequence.md §4.0`; module + 11 conformance tests (incl. byte-identical migration replay) in.
- **In flight: L2 — Multi-user authoring scaffolding closure** (`t02-30`/`t02-31`/`t02-32` role definitions + `t02-140`/`t02-141` bootstrap-users + fiber-cache reconcile).
  Closes ship targets 3 and 4.
  Was sequential after L1; L1 has now closed.
- **Parallel-eligible: L3 — H¹ audit cohomology surface**.
  Closes ship target 5.
  Independent of L1/L2; v0.2b observability cannot start without it.
- **Parallel-eligible: L4 — Fuel-composition determinism**.
  Closes ship target 6.
  Independent of L1-L3; v0.2b stdlib dispatch shell cannot guarantee replay-equivalent pipelines without it.

This doc is the telescoped form of [next-stretch.md §Stage 1](next-stretch.md#stage-1--close-v02a) — one section per *landing* (a pull-request-shaped piece of work an agent can pick up, finish, and ship a paired fixture against).
Use this doc when picking a single landing for a session; use [next-stretch.md](next-stretch.md) when scoping work whose horizon extends past v0.2a shipping.

## How this NOW-doc was derived

Same chain as [next-stretch.md §"How this plan was derived"](next-stretch.md#how-this-plan-was-derived), with two extra inputs that the multi-stage doc only invokes at v0.7+:

- **Captain's imaginative material** from the [ideas trove reference](../references/ideas-trove.md), pulled per landing rather than per stretch.
  The trove was treated as a working-out space — many ideas there are now load-bearing for v0.2a even though the trove file frames them as long-horizon.
  The relevant trove files for each landing are cited inline and the reduction-to-on-disk-theorem is stated explicitly per [next-stretch-v0.4-v0.6.md Thread G](next-stretch-v0.4-v0.6.md#thread-g-every-claimed-new-primitive-must-be-reduced-to-an-existing-theorem).
- **Source-tree truth** as of 2026-05-03 — the actual file layout under [`src/`](../../../src/) (see the per-landing "where the code is" subsection).
  The procedural steps are keyed to existing files, never to files-that-should-exist.
  Where a new module is required, it is named explicitly and its proximate-sibling module is cited as the layout precedent.

If a landing below cites a module that has moved or a fixture path that no longer matches, the *doc* is wrong; surface and fix here rather than re-routing the procedural steps in your head.

## Status snapshot, 2026-05-03

| Surface | Where it is | Open work |
|---|---|---|
| Substrate boot | `src/init_boot/{boot.py,bootstrap_users.py,fiber_reconcile.py,personnel_migration.py,self_test.py,runlevels.py}` all exist; `personnel_migration` is wired into `boot.py` as a Phase 3 step *before* `bootstrap_users` and *before* `runlevel_promote`; `tests/conformance/test_t02_127f_personnel_migration.py` covers detection, audit, idempotent re-run, `legacy_view` round-trip, divergent-scheme detection, and byte-identical migration-event-tail replay. | **L1 closed.** Sequencing ratified BEFORE per [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../decisions/personnel-migration-sequenced-before-bootstrap-users.md); spec at `boot-sequence.md §4.0`; `legacy_view` realised at `personnel_migration.py:241-289`. L2 finishes `bootstrap_users.py`'s manifest-hash + per-role capability-fiber emission; reconcile is fixture-tested but not multi-user yet. |
| Process / user | `src/process/{user.py,session.py,session_messaging.py}` exist | L2 finishes the role definitions consumed by user.py's boundary-construction. |
| Substrate kernel | `src/substrate/` has `inconsistency.py`, `cost.py`, `respond.py`, `error_codes.py` | L3 surfaces `audit_h1` from `inconsistency.py` into `respond.py` Phase 4c; L4 confirms the quantale-product walks and adds the fuel-replay fixture. |
| Specs | `specs/security/{capability-model.md, user-as-boundary.md, persona-and-personnel.md, signing-and-witnessing.md, federation-trust.md, sandbox-and-fuel.md, tool-risk-scoring.md, secrets-management.md}` exist; `specs/init-boot/{boot-sequence.md, bootstrap-manifest.md, init-runlevels.md, self-test.md, service-supervision.md}` exist | L1 extends boot-sequence §"Personnel-to-boundary migration" + cross-link in user-as-boundary; L2 cross-links role defs from capability-model into user-as-boundary; L3 extends specs/kernel/inconsistency-repair.md §"H¹ surface contract"; L4 extends specs/kernel/fuel-composition.md §"Replay equivalence under quantale-product". |
| Tasks | All five carried project-tasks (pt-02, pt-04, pt-07, pt-08, pt-10) plus `t02-110…145` open under [tasks/engineering/](../tasks/engineering/) | pt-08 promoted in this stretch; pt-02 and pt-07 and pt-10 are L2-adjacent; pt-04 is waits on the secondary-theory rewrite; v0.2b picks it up. |

---

## L1 — Personnel → boundary migration ([pt-08](../tasks/engineering/pt-08-personnel-to-boundary-migration.md))

### Where the code is

The migration module lives at [`src/init_boot/personnel_migration.py`](../../../src/init_boot/personnel_migration.py) and **is wired into [`src/init_boot/boot.py`](../../../src/init_boot/boot.py) as Phase 3's `_phase_personnel_migration` step**, sequenced *before* `_phase_bootstrap_users` (PHASES indices 9 then 10) per the [BEFORE-ordering decision](../decisions/personnel-migration-sequenced-before-bootstrap-users.md).
Verify with `rg -n personnel_migration src/init_boot/boot.py`.
The bootstrap-users module at [`src/init_boot/bootstrap_users.py`](../../../src/init_boot/bootstrap_users.py) — the spec's Phase 3 §4.1 sub-step — is the proximate sibling that L2 also touches.

The boundary entity construction lives at [`src/process/user.py`](../../../src/process/user.py); the migration writes through `respond` against this entity, never bypassing it (per [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md)).

The conformance pair at [`tests/conformance/test_t02_127f_personnel_migration.py`](../../../tests/conformance/test_t02_127f_personnel_migration.py) covers detection, audit-cell write, idempotent re-run, `legacy_view` round-trip + error branches, divergent-scheme detection, and the `test_migration_replay_is_byte_identical` byte-comparison (two fresh substrates with identical inputs produce byte-identical migration event tails).
The `legacy_view(boundary_slug)` inverse-projection helper is realised at `personnel_migration.legacy_view` (lines 241-289).

### Theorem grounding

[`predicated-computing/theorems/predication-fiber-functor`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) — the migration is a natural transformation between the `personnel-record`-fiber and the `boundary`-fiber over the same base; functoriality across the migration ordinal is what makes the inverse-projection (boundary → personnel) recover the v0.1 fiber for backwards-compat reads.
Composed with [`bootstrap-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md) — the migration is a deterministic function of (legacy personnel set, boundary scheme version).

Decision authority: [decisions/identity-is-boundary-projection.md](../decisions/identity-is-boundary-projection.md).
Theory→code row: row 13 (self-representation) of [theory-for-developers.md](../references/theory-for-developers.md).

### Imaginative grounding

Two captain-trove files are the design rationale for *why* personnel becomes a projection of boundary rather than the other way around:

- **`user-as-boundary`** ([trove file](../../../../../../triage/operations/command/ideas/triage/user-as-boundary.md), cited in the [ideas trove §Architecture](../references/ideas-trove.md#architecture)).
  The argument: a user is the boundary entity, holographically projecting auth/authz/attention/history fibers; personnel/office/persona-agent are *projections* of the boundary, not independent record kinds.
  This is the load-bearing intuition the migration realises — we are not "moving" personnel into a different table, we are recognising it has *always been* a projection of a boundary that v0.1 didn't yet name.
  Reduction to on-disk theorem: this is the natural-transformation-between-presheaves picture, formally [`predication-fiber-functor`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) plus [decisions/identity-is-boundary-projection.md](../decisions/identity-is-boundary-projection.md).
  No new theorem needed.
- **`unified-record-sketch`** (trove §Records).
  The σ/Δ universal-record discipline.
  The migration's audit cell is itself a unified-record (the σ side is the boundary's settled identity; the Δ side is the migration event); writing it any other way regresses on the discipline that v0.2a is *also* shipping.
  Reduction: row 9 (witness chains) of theory-for-developers, on-disk theorem [`witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md).

### Procedural steps

L1 is closed (2026-05-03).
The procedural log is preserved below for traceability — every step is `[done]`.
The historical "build-X-to-enable-Y" chain was: spec §4.0 (originally drafted as "§4.3") → `legacy_view` helper → fixture extension → conformance test extension → ratify the sequencing decision (BEFORE) → declare L1 closed and unblock L2.

1. **[done] Module exists and is wired.** [`src/init_boot/personnel_migration.py`](../../../src/init_boot/personnel_migration.py) implements detection (cells lacking `migrated-to-boundary-at-ord:<ord>`), boundary emission via `respond`, and the audit-predicate write on the personnel side; it is registered as `_phase_personnel_migration` in `boot.py` Phase 3.
  Re-runs append zero events on a fully-migrated store (the docstring's "Idempotent" claim is realised by the prefix scan in `MIGRATED_PREDICATE_PREFIX`).
2. **[done] Conformance pair exists.** [`tests/conformance/test_t02_127f_personnel_migration.py`](../../../tests/conformance/test_t02_127f_personnel_migration.py) covers detection, audit-cell write, idempotent re-run, `legacy_view` round-trip + error branches, divergent-scheme detection (`PCB_BOUNDARY_SCHEME_DIVERGED`), and ordinal-replay byte-comparison (`test_migration_replay_is_byte_identical` — two fresh substrates with identical inputs produce byte-identical migration event tails).
3. **[done] Spec section authored.** [boot-sequence.md §4.0 "Personnel-to-boundary migration"](../specs/init-boot/boot-sequence.md) (placed before §4.1 bootstrap-users to mirror the BEFORE ordering ratified by [personnel-migration-sequenced-before-bootstrap-users.md](../decisions/personnel-migration-sequenced-before-bootstrap-users.md)) covers detection, emission contract, audit-cell shape, idempotency, divergent-scheme detection, and the inverse-projection clause.
  (Originally drafted in this NOW-doc as "§4.3"; on the actual spec layout it is §4.0 because Phase 3 is `## 4.
  ` and migration is the first sub-step.)
4. **[done] Implement `legacy_view(boundary_slug)` inverse-projection helper.** Realised at [`personnel_migration.legacy_view`](../../../src/init_boot/personnel_migration.py) (lines 241-289): walks a `boundary:<bare>` fiber, filters to the carry-forward predicates (`role-*`, `granted:*`), and returns a v0.1-shaped `{slug, kind-personnel-record, predicates}` dict.
  Raises `PCB_BOUNDARY_NOT_FOUND` for non-boundary slugs and missing fibers.
  This is what makes the migration *functorial* in the predication-fiber-functor sense — without the inverse projection, there's only a forward map, which the natural-transformation discipline does not authorise.
5. **[done] Extend the conformance test.** In [`tests/conformance/test_t02_127f_personnel_migration.py`](../../../tests/conformance/test_t02_127f_personnel_migration.py), add three assertions: (a) `personnel_migration.legacy_view(slug)` round-trips against the v0.1 fixture for every migrated boundary (proves functoriality); (b) two fresh boot cycles produce byte-identical event-log tails covering the migration ordinal (proves the migration is itself a Scott-continuous projection per [`scott-continuity-as-checkpointability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuity-as-checkpointability.md)); (c) divergent-manifest detection fires `PCR_PERSONNEL_MIGRATION_SCHEME_DIVERGENT` (proposed code name; pick when wiring) from [`src/substrate/error_codes.py`](../../../src/substrate/error_codes.py) when the persistent set contains a personnel cell whose migration audit references a different boundary scheme than the current code's `MIGRATED_PREDICATE_PREFIX`.
6. **[done] Sequencing decision ratified.** [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../decisions/personnel-migration-sequenced-before-bootstrap-users.md) ratifies the BEFORE ordering already shipped in `boot.py`'s `PHASES` list (entries 9 then 10) and documented at spec §4.0.
  The §"Sequencing decision" subsection below is retained for historical reference; its disagreement is closed in favour of BEFORE on the grounds that (a) the bootstrap manifest is boundary-shaped, not personnel-shaped, so the AFTER-ordering rationale "let bootstrap-users seed personnel records for the migration to sweep" has no actual seedable shape; (b) the pt-08 acceptance language already required BEFORE; (c) the shipped code, the docstring, and §4.0 of the spec all already match BEFORE — the decision record makes the ratification explicit so it stops being implicit in three places.
7. **[done] L1 declared closed.** Steps 1-6 are all in.
  The milestone's "Current focus" pointer in [milestones/v0.2a-multi-user-single-node.md](../milestones/v0.2a-multi-user-single-node.md) is updated to L2; the L1 row is removed from "in flight".

### Sequencing decision (resolved — historical)

> **Status: closed 2026-05-03.** Ratified BEFORE ordering.
> See [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../decisions/personnel-migration-sequenced-before-bootstrap-users.md).
> The text below is preserved for archaeology only — it describes the open disagreement at the time this NOW-doc was first written, including a recommendation (AFTER) that has been *superseded*.
> Do not act on the content below; refer to the decision record for the active position.

**The (former) disagreement.** Earlier drafts of this NOW-doc claimed the code in `boot.py` sequenced personnel_migration AFTER bootstrap_users; the pt-08 task record prescribed BEFORE.
In fact the code has *always* sequenced BEFORE (PHASES entries 9 then 10, and `_phase_personnel_migration`'s docstring explicitly says BEFORE).
The "AFTER ordering" framing in earlier drafts of this section was a misreading of `boot.py`; both the code and pt-08 agree on BEFORE.
Resolution: ratify BEFORE.
Per the decision record's "What it rules out", the AFTER-ordering rationale ("let bootstrap-users seed personnel records for the migration to sweep") has no actual seedable shape because the bootstrap manifest is boundary-shaped, not personnel-shaped.

### Conformance proof

`tests/conformance/test_t02_127f_personnel_migration.py` covers all eleven L1 conformance cases, including `test_migration_replay_is_byte_identical` which builds two fresh substrates seeded identically and asserts both parsed-event-tail equality and raw-bytes equality of the JSONL suffix covering the migration ordinal — directly realising `bootstrap-determinism` at the migration boundary.

### Enables next (immediate, mid-term, long-term)

- **Immediate (this stretch).** Under the ratified BEFORE ordering, by `bootstrap_users`' entry every identity slug the substrate has ever seen is canonically a boundary, so L2's per-user capability fibers attach functorially to a single record-kind rather than two.
  No conditional branch on "is this manifest entry's boundary already provisioned, or is its personnel-record-shaped predecessor still in the log."
- **Mid-term (v0.2b).** The driver-model spec ([specs/drivers/driver-model.md](../specs/drivers/driver-model.md), authored under v0.2b's Stage 2A) treats a driver-cell's `respond` as invoked by an authenticated boundary-fiber; without L1, the driver-model's capability discipline would have to pattern-match between two identity record-kinds, which the modal-restriction algebra of [`modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) does not authorise.
- **Long-term (v0.7+).** The ideas-trove `unified-architecture-from-sender-identity` proposal — collapsing dispatch / training / gamification into a single sender-identity-driven composition — is *only buildable at all* if every sender is uniformly a boundary projection.
  L1 is the minimum-viable downpayment on that long-horizon idea; without it, the v0.7 productivity stack and v0.8 agential layer would each have to re-litigate the identity model.

### Risks / unknowns carried forward (post-L1)

- **`migrated-to-boundary-at-ord:<ord>` predicate value-encoding.** `personnel_migration.py` uses a string prefix (`MIGRATED_PREDICATE_PREFIX = "migrated-to-boundary-at-ord:"`) with the ordinal embedded in the predicate name rather than in the value.
  The natural-transformation discipline does not constrain this; the captain's decision does.
  The encoding shipped in v0.2a is what `bootstrap-determinism` is computing the deterministic function *of* — switching later silently invalidates every fixture-replay artefact.
  Either ratify the embedded-ordinal convention in a follow-up decision record, or migrate to a `(predicate=migrated-to-boundary-at-ord, value=<ord>)` shape before any future scheme bump.
- **Divergent-scheme error-code name.** L1 ships using `PCB_BOUNDARY_SCHEME_DIVERGED` (already in [`src/substrate/error_codes.py`](../../../src/substrate/error_codes.py)).
  The earlier `PCR_PERSONNEL_MIGRATION_SCHEME_DIVERGENT` proposal in this doc was advisory; the actual code-name carries the failed-invariant slug (boundary-scheme), not the call-site (personnel migration), per the substrate-wide convention.

---

## L2 — Multi-user authoring scaffolding closure (`t02-30`-`t02-32`, `t02-140`-`t02-145`)

### Where the code is

[`src/init_boot/bootstrap_users.py`](../../../src/init_boot/bootstrap_users.py) and [`src/init_boot/fiber_reconcile.py`](../../../src/init_boot/fiber_reconcile.py) exist as scaffolds.
[`src/process/user.py`](../../../src/process/user.py) is the boundary-entity construction site that consumes the role definitions from `t02-30`/`t02-31`/`t02-32`.
The role definitions themselves are spec-side and live (or will live) under [specs/security/capability-model.md](../specs/security/capability-model.md).

[`tests/conformance/test_bootstrap_users_manifest.py`](../../../tests/conformance/test_bootstrap_users_manifest.py) is the seed that L2's conformance work extends.

### Theorem grounding

[`audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — concurrent multi-boundary authoring is exactly where strict-regime substrates discover H¹ obstructions, so the *real* multi-user gate is "two boundaries authoring concurrently against disjoint targets produce byte-identical fiber state on replay" (per L3's surface).
Composed with [`modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — the per-role capability fibers are accessibility-relation refinements of the boundary's modal universe; admin / member / observer are not three "user types" but three modal restrictions of the same `respond` surface.

Decision authority: [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md), [decisions/identity-is-boundary-projection.md](../decisions/identity-is-boundary-projection.md), and the v0.2a ship-target row in [milestones/v0.2a-multi-user-single-node.md](../milestones/v0.2a-multi-user-single-node.md) §"Ship targets" gate 4.

### Imaginative grounding

- **`unified-architecture-from-sender-identity`** (trove §Architecture).
  The argument: dispatch, training, and gamification all collapse into a single sender-identity-driven composition.
  L2 is the v0.2a-shaped slice of this — admin / member / observer are three sender-identity refinements that drive *the same* `respond`.
  The trove file argues the long-horizon target; this landing realises the minimum-viable scaffolding.
  Reduction: [`modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — three accessibility-relations on the same modal universe.
- **`parameterized-agent-context`** (trove §Agential).
  The argument: an agent's context is not a session bag but a fiber-composition over the boundary.
  The fiber-cache reconcile (`fiber_reconcile.py`) IS the substrate-side implementation of this — when the cache disagrees with the persistent set, reconcile reproduces the canonical fiber composition and treats the cache as a cheap projection.
  Reduction: [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md).
  No new theorem needed.
- **`mcp-as-system-api`** + **`mcp-verb-inventory`** (trove §Infrastructure).
  At v0.2a these are not yet realised as the substrate's external API surface (that lands in v0.2b dispatch shell + v0.6 SDK), but the scaffolding L2 ships does not foreclose the MCP-as-system-API future: every per-role capability fiber is expressible as a modal restriction over the eventual MCP verb set, not as a Python-side enum.
  Reduction: same as L2's main theorem grounding.

### Procedural steps

1. **Land the role definitions.** Pick up [`t02-30`](../tasks/engineering/) (admin), `t02-31` (member), `t02-32` (observer) per their task records.
  Each role is a substrate cell `kind: capability-fiber-role` whose body is the modal-restriction predicate.
  Record the cells under the boot-emitted persistent set; they are not Python classes.
2. **Wire `bootstrap_users.py` to emit per-user capability fibers** by composing the per-role modal-restriction with the boundary's identity.
  Each boundary in the manifest gets one `(boundary:<slug>, has-capability-fiber, fiber:<role>)` predication, materialised as a fiber-cache projection by `fiber_reconcile.py` on first read.
3. **Confirm sender-fiber path through `respond`.** In [`src/substrate/respond.py`](../../../src/substrate/respond.py), the sender-identity lookup MUST read from the boundary record (via `process/user.py`'s boundary-construction) and never from a personnel record.
  After L1 lands, this is a one-line correctness check; before L1 lands, this would silently dual-source.
4. **Add the multi-user concurrent-authoring conformance test.** New file `tests/conformance/test_multi_user_authoring.py`.
  The test boots a fresh substrate, replays a fixture of two boundaries (one admin, one member) authoring concurrently against disjoint targets, and asserts byte-identical fiber state across two replays. *This is the real gate-4 closure*, not an interactive UI test.
5. **Fiber-cache reconcile for ≥3 users.** Extend the existing reconcile fixture to cover the gate-3 multi-user manifest threshold: ≥3 boundaries, divergence-free reconcile across two fresh boot cycles per [milestones/v0.2a-multi-user-single-node.md §Ship targets](../milestones/v0.2a-multi-user-single-node.md#ship-targets) gate 3.
  Witness: the fiber-cache file's content hash matches across both boots.
6. **Inter-session messaging.** Confirm [`src/process/session_messaging.py`](../../../src/process/session_messaging.py) routes through the boundary-fiber per [specs/process/multi-regime-session.md](../specs/process/multi-regime-session.md).
  This is the wire-up path that the v0.7 productivity stack's chat / mail / shared-document workflows will reuse.

### Conformance proof

`tests/conformance/test_multi_user_authoring.py` (concurrent-authoring fixture replay) + extension of `test_bootstrap_users_manifest.py` to ≥3 users + fiber-cache hash equivalence across two boots.
This closes gates 3 and 4 of v0.2a.

### Enables next

- **Immediate (this stretch).** L3's H¹ audit pass needs at least two concurrent-authoring boundaries to exhibit the kind of inconsistency it surfaces; without L2's scaffolding the gate-5 fixture would be synthetic (a single boundary with a self-inconsistency), which understates what the H¹ surface actually has to handle.
- **Mid-term (v0.2b).** The driver-model spec authors a driver-cell as one boundary among many; the dispatch shell ships verbs whose non-amplification is the modal restriction of the invoking boundary's capability fiber.
  Both depend on the fiber-cache reconcile being a single-source-of-truth.
- **Long-term (v0.4 federation, v0.6 SDK).** Federation peers are *boundaries with a network projection*; the SDK app is *a boundary with a capability-import projection*.
  Both reduce to L2's discipline applied at a new surface; both are uncontroversial-to-design *only* because L2 establishes the pattern at the single-node case first.

### Cross-references with adjacent open project-tasks

- [pt-02 — per-stratum capability fiber for retraction](../tasks/engineering/pt-02-per-stratum-capability-fiber-retraction.md) folds into the role-definition work; coordinate so `t02-30`'s admin role's retraction-capability is correctly stratified before L2 is declared closed.
- [pt-07 — privileged-cross-projection capability spec](../tasks/engineering/pt-07-privileged-cross-projection-capability.md) gates `t02-125`.
  Its spec authoring belongs to L2's role-definition pass; its conformance fixture belongs alongside the L2 concurrent-authoring fixture.

---

## L3 — H¹ audit cohomology surface (gate 5)

### Where the code is

[`src/substrate/inconsistency.py`](../../../src/substrate/inconsistency.py) is the home of `audit_h1`.
[`src/substrate/respond.py`](../../../src/substrate/respond.py) §Phase 4c is the wire-up site.
[`specs/kernel/inconsistency-repair.md`](../specs/kernel/inconsistency-repair.md) is the spec to extend with the regime-conditional behaviour.

### Theorem grounding

[`audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — the audit pass returns the regime-appropriate cohomology surface; in strict regime, an H¹ obstruction triggers the inconsistency-repair lifecycle.
Composed with [`paraconsistency-as-substrate-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md) — tolerant regime tags the cell with $\top$ rather than rejecting; aperiodic regime defers to the fuel ceiling.

Theory→code: row 9 (H¹ audit) of [theory-for-developers.md](../references/theory-for-developers.md).

### Imaginative grounding

- **`dont-flatten-the-tower`** (trove §Architecture).
  The argument: asserted, saturated, settled facts are different mathematical objects and MUST NOT be conflated by flat EAVT storage.
  The H¹ surface is *exactly* the place where the tower's stratification becomes load-bearing — the cohomology object measures "between which strata does this inconsistency live".
  Returning H¹ as anything other than a structured per-stratum object reduces to flattening the tower.
  Reduction: [`audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md).
  No new theorem needed; the per-stratum structure IS the cohomology surface.
- **`all-records-are-transactions`** (trove §Records).
  Every state change is double-entry.
  The H¹ surface's repair-log entries MUST be themselves substrate cells with σ/Δ structure; rendering H¹ as a Python dict-of-strings regresses on the discipline.
  Reduction: [`witness-as-cell`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-as-cell.md).
- **`cells-as-models-mcp-as-io`** (trove §Infrastructure).
  The argument: cells are models with deterministic algebraic inference; MCP unifies cell queries, rules, and LLM calls.
  The H¹ surface IS the canonical example of a cell whose value is the result of algebraic inference (cohomology computation over the closure rule system).
  Anticipating v0.2b's dispatch shell: an H¹ surface MUST be query-shaped — a `respond` against the audit-cell returns the surface's structured form.

### Procedural steps

1. **Confirm `audit_h1` signature.** In [`src/substrate/inconsistency.py`](../../../src/substrate/inconsistency.py), `audit_h1(target) -> CohomologySurface` returns a structured object whose pydantic serialisation is canonical-JSON round-tripping (row 3 of theory-for-developers).
  The surface's shape: per-stratum (e1-e4) obstruction tuples + per-source classification + (optional) repair witnesses.
2. **Wire into respond.** In [`src/substrate/respond.py`](../../../src/substrate/respond.py) §Phase 4c, every `respond` invocation that crosses an inconsistency frontier returns its H¹ surface alongside the repair log.
  Strict-regime invocations that have a non-empty surface trigger the inconsistency-repair lifecycle (the v0.2a stub `repair_resolution: str | None = None` per [milestones/v0.2a-multi-user-single-node.md](../milestones/v0.2a-multi-user-single-node.md) — the four-state lifecycle defers to v0.2b).
3. **Spec the regime-conditional behaviour.** Extend [`specs/kernel/inconsistency-repair.md`](../specs/kernel/inconsistency-repair.md) §"Regime-conditional H¹ behaviour": strict regime emits a witness; tolerant regime tags the cell with $\top$ and continues; aperiodic regime defers to the fuel ceiling (see L4).
  Each branch cites the theorem.
4. **Author conformance fixture.** `tests/fixtures/kernel/h1-audit/` (create if absent), four fixtures — one each for $\bot$, $t$, $f$, $\top$ outcomes.
  Each fixture: a per-stratum closure-rule input, the expected H¹ surface byte-form, the expected repair-log byte-form.
5. **Conformance test.** `tests/conformance/test_h1_audit_surface.py`.
  Replays the four fixtures; asserts canonical-JSON round-trip on each surface; asserts strict-regime inconsistency triggers the (stub) repair lifecycle.

### Conformance proof

`tests/conformance/test_h1_audit_surface.py` plus the four paired fixtures.
Closes gate 5 of v0.2a.

### Enables next

- **Mid-term (v0.2b).** The observability + governance dashboards (goal: [v0.2b-observability-dashboards](../goals/v0.2b-observability-dashboards.md)) consume this surface directly.
  Without a structured H¹ object, dashboards either invent their own structure (and diverge from the algebra) or render nothing useful.
- **Mid-term (v0.2b deferred-from-v0.2a).** The four-state `open → proposed → resolved → archived` repair lifecycle (`t02-122/123/124`, v0.2b picks up pending `witness-as-cell` math-side authoring) attaches *to* the H¹ surface — without L3 there's nothing for the lifecycle states to predicate.
- **Long-term (v0.5 industrial control).** Sensor-uncertainty bilattice values surface as the same cohomology shape — sensor disagreement IS a per-stratum H¹ obstruction. v0.5's Stage 5B (bilattice-native sensor uncertainty) reduces to L3's surface plus the bilattice operations; no new substrate primitive needed.

---

## L4 — Fuel-composition determinism (gate 6)

### Where the code is

[`src/substrate/respond.py`](../../../src/substrate/respond.py) reads the fuel ceiling on replay.
[`src/substrate/cost.py`](../../../src/substrate/cost.py) is the home of the quantale-product across the five fuel surfaces.
[`specs/kernel/fuel-composition.md`](../specs/kernel/fuel-composition.md) is the spec to extend.

### Theorem grounding

[`cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) plus row 7 (persisted fuel ceiling) of theory-for-developers.
Composed with [`scott-continuity-as-checkpointability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuity-as-checkpointability.md) — fuel-exhaustion mid-rule replays byte-identically *because* the fuel ceiling is a Scott-continuous projection of the rule-application chain.

### Imaginative grounding

- **`token-economy-from-predication`** (trove §Records).
  The argument: token-spend is the substrate's accounting view of fuel-consumption.
  L4 is what makes that long-horizon idea coherent — if fuel doesn't compose deterministically across rule applications, then "tokens spent on this respond" is not a well-defined cell value, and the v0.7+ token-economy work has no algebraic ground.
- **`daemon-world-tick`** (trove §Agential).
  The argument: a periodic world-tick cycle drives auto-dispatch each tick.
  The world-tick is *exactly* a `respond` invocation with a tick-derived fuel ceiling; without L4's quantale-product determinism across the five surfaces (CPU, IO, network, storage, ord-budget), the world-tick cannot be replayed, which forecloses the v0.8 agential-layer's auto-dispatch daemon.
  Reduction: this is `cost-composition-via-lawvere-quantale` applied at a recurring tick surface; no new theorem needed.

### Procedural steps

1. **Walk respond.py for ceiling-on-replay.** In [`src/substrate/respond.py`](../../../src/substrate/respond.py), confirm the fuel ceiling is read from the settle event on replay, not from defaults.
  Defaults-on-replay is the canonical regression; if the test harness silently uses defaults when the settle event lacks a ceiling field, replay is non-deterministic by construction.
2. **Walk cost.py for the quantale-product.** In [`src/substrate/cost.py`](../../../src/substrate/cost.py), the quantale-product across CPU / IO / network / storage / ord-budget MUST satisfy associativity, commutativity, identity.
  Add property tests (e.g. via hypothesis) that exercise these for arbitrary ceiling tuples.
3. **Author the fuel-replay fixture.** `tests/fixtures/kernel/fuel-replay/` — a fixture whose first run exhausts fuel mid-rule and whose replay reproduces the same `PCR_FUEL_EXCEEDED` at the same ordinal.
  The fixture's settle event explicitly carries the ceiling.
4. **Conformance test.** `tests/conformance/test_fuel_replay_determinism.py`.
  Two boot cycles; replay produces byte-identical event-log tail; the `PCR_FUEL_EXCEEDED` raise happens at the same ordinal.
5. **Spec the replay equivalence.** Extend [`specs/kernel/fuel-composition.md`](../specs/kernel/fuel-composition.md) §"Replay equivalence under quantale-product": the contract is that for any two `respond` invocations $r_1, r_2$ with composed ceiling $F = F_1 \otimes F_2$, the pipeline `r_1 | r_2` produces a byte-identical event-log tail to running them in sequence with $F_1$ then $F_2$.

### Conformance proof

`tests/conformance/test_fuel_replay_determinism.py`.
Closes gate 6 of v0.2a.

### Enables next

- **Mid-term (v0.2b stdlib).** The dispatch shell ships verbs (project, fold, materialize, etc.) each with per-verb fuel envelopes.
  Without L4, the shell cannot guarantee that `verb1 | verb2` replays identically to the pipelined run; per-verb fuel envelopes would be advisory rather than algebraic.
- **Long-term (v0.5 + v0.7).** Industrial-control rate limits (v0.5 sensor ingest) and productivity-stack workflow budgets (v0.7) are *both* fuel-envelope refinements over L4's quantale.
  Neither stretch can ship deterministic replay without the v0.2a quantale ground.

---

## After v0.2a ships — what unlocks immediately

When L1-L4 close, v0.2a ships.
The next-stretch handoff is to v0.2b; consult [next-stretch.md §Stage 2](next-stretch.md#stage-2--v02b) for the multi-stage view.
The granular handoff is:

| Closed by | Unblocks (v0.2b) |
|---|---|
| L1 (boundary canonical) | 2A driver-model's authenticated-sender path; pt-08-equivalent for any future migration. |
| L2 (multi-user concurrent authoring) | 2A driver-cell's "invoked by which boundary"; 2B incident-management's per-boundary attribution. |
| L3 (H¹ surface) | 2B observability dashboards; 2B incident-management's repair-log subscription; deferred `t02-122/123/124` lifecycle. |
| L4 (fuel quantale) | 2C stdlib dispatch shell's per-verb-fuel; reproducibility-witness wheel hash (v0.2b 4D). |

Three v0.2b stretches are NOT unblocked by anything in this NOW-doc and can be picked up in parallel with L1-L4 by separate agents:

- **v0.2b 2D Nix-flake skeleton** ([goals/v0.2b-packaging-skeleton](../goals/) — `t02-100…102`).
  Pure packaging work; no theorem hypothesis sits in v0.2a.
- **v0.2b network stubs** (`t02-150/155/170/175`).
  Spec-stub work explicitly deferred per [decisions/network-spec-defer-until-implementer-named.md](../decisions/network-spec-defer-until-implementer-named.md).
- **v0.2b operational skill packs** (`pt-13` → `t02-205`).
  Content authoring under `.local/skills/`; orthogonal to the substrate kernel.

If you have agent capacity on one of those three streams while the L1-L4 work is in flight, take it — they do not race against L1-L4's modules.

## Cross-cutting threads (the same Threads A-H apply here)

Threads A-E from [next-stretch.md §"Cross-cutting threads"](next-stretch.md#cross-cutting-threads) and Threads F-H from [next-stretch-v0.4-v0.6.md §"Cross-cutting threads (continued)"](next-stretch-v0.4-v0.6.md#cross-cutting-threads-continued) all apply at this NOW-horizon.
The two most likely to be violated by the work above:

- **Thread B (everything is a cell).** L1's role definitions (`t02-30/31/32`) and L3's H¹ surface are the two places where a careless implementation reaches for a Python class hierarchy or a dict-of-strings respectively.
  Both MUST be substrate cells.
- **Thread D (capability is non-amplifying).** L2's per-role capability fibers are the load-bearing test of this.
  `grep` the L2 diff for `bypass`, `override`, `as_admin`, `with_root_capability`; any hit is a regression on the modal-restriction adjoint.
- **Thread H (never cite a phantom theorem).** Run the verifier in [next-stretch-v0.4-v0.6.md Thread H](next-stretch-v0.4-v0.6.md#thread-h-never-cite-a-theorem-name-that-is-not-on-disk) against the docs you author for L1-L4 before merging.

## Glossary of theorem slugs cited above

For paths and detail, follow the links in each landing.
Index here for cross-referencing; only on-disk theorems are listed (per Thread H).

| Slug | Path |
|---|---|
| `predication-fiber-functor` | [`predication-categories/theorems/predication-fiber-functor.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) |
| `bootstrap-determinism` | [`predicated-computing/theorems/bootstrap-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md) |
| `witness-chain-as-proof-object` | [`predicated-computing/theorems/witness-chain-as-proof-object.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md) |
| `witness-as-cell` | [`predicated-computing/theorems/witness-as-cell.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-as-cell.md) |
| `audit-content-via-inconsistency-sheaf-cohomology` | [`predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) |
| `paraconsistency-as-substrate-discipline` | [`predicated-computing/theorems/paraconsistency-as-substrate-discipline.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md) |
| `modal-restriction-as-substrate-authorization-primitive` | [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) |
| `cache-coherence-via-functorial-projection` | [`predicated-computing/theorems/cache-coherence-via-functorial-projection.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) |
| `cost-composition-via-lawvere-quantale` | [`predicated-computing/theorems/cost-composition-via-lawvere-quantale.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) |
| `scott-continuity-as-checkpointability` | [`predicated-computing/theorems/scott-continuity-as-checkpointability.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuity-as-checkpointability.md) |

## See also

- [next-stretch.md](next-stretch.md) — the multi-stage stretch plan whose Stage 1 this NOW-doc telescopes.
- [next-stretch-v0.4-v0.6.md](next-stretch-v0.4-v0.6.md), [next-stretch-v0.7-v1.0.md](next-stretch-v0.7-v1.0.md) — successor stretches.
- [theory-for-developers.md](../references/theory-for-developers.md) — the per-construct theory→code bridge each landing threads through.
- [workflows.md](workflows.md) — the per-task procedural recipes (recipe 1 for end-to-end landing, recipe 2 for paired fixtures, recipe 6 for projection-divergence debugging, recipe 7 for replay-determinism debugging, recipe 10 for promoting thin task records).
- [ideas-trove.md](../references/ideas-trove.md), [triage-backlog-os-level.md](../references/triage-backlog-os-level.md) — the captain's imaginative material indexed for v0.2a-relevant pulls.
- [milestones/v0.2a-multi-user-single-node.md](../milestones/v0.2a-multi-user-single-node.md), [milestones/v0.2b-drivers-observability-packaging.md](../milestones/v0.2b-drivers-observability-packaging.md) — per-milestone ship targets each landing closes or unblocks.
- [tasks/engineering/](../tasks/engineering/) — task records for pt-02, pt-04, pt-07, pt-08, pt-10, t02-110…145.
- [pypredcomp/AGENTS.md](../../../AGENTS.md) — anti-patterns each landing avoids.
