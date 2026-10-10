---
title: "Next-stretch plan: v0.7 productivity stack → v0.8 agential layer → v0.9 learning + publishing → v1.0 self-development"
description: "Continuation of next-stretch-v0.4-v0.6.md across the final four milestones. Same shape — each stage names the predicated-computing or predication-categories theorem that authorises it, the procedural steps, the conformance proof, and what the stage unlocks for the next. This stretch is where the captain's imaginative material (Voidfleet Academy, persona-agents, ideas-to-plans pipeline, world-sim, Predicated Zork, paracosms, gamification, token economy, daemon-world-tick) becomes substrate procedure rather than aspiration — by reducing each idea to an existing on-disk theorem rather than a new primitive."
kind: implementation-guide
status: active
authority: "theories/.../predicated-computing/, theories/.../predication-categories/, milestones/v0.7..v1.0, decisions/, references/ideas-trove.md, milestones/research-sidebar.md, surveys/theory-side-research-notes-2026-05-03*.md"
---

# Next-stretch plan — v0.7 → v1.0

This document is the **continuation** of [next-stretch-v0.4-v0.6.md](next-stretch-v0.4-v0.6.md), which itself continues [next-stretch.md](next-stretch.md).
Read both first; the cross-cutting threads A–H declared there continue to apply, and three further threads I, J, K are added at the end of this document for the longer horizon where research artefacts and imaginative material enter the procedural plan.

The same discipline applies: each stage names a theorem grounding, procedural steps, conformance proof, and the capability the stage unlocks for the next.
If you cannot reconstruct the chain (theorem → spec → ship target) for a stage, the plan is wrong, not the theory — surface it.

This stretch is also where the captain's imaginative-material pile (per [`references/ideas-trove.md`](../references/ideas-trove.md), [`references/triage-backlog-os-level.md`](../references/triage-backlog-os-level.md), [`milestones/research-sidebar.md`](../milestones/research-sidebar.md)) lands procedurally. **The discipline is reductive**: each imaginative idea — Voidfleet Academy, persona-agents, world-sim, Predicated Zork, paracosms, daemon-world-tick, gamification, token economy, ideas-to-plans pipeline, MCP-as-system-API — must be expressed as a specialisation of an on-disk theorem and an existing platform concept, never as a new substrate primitive.
Where the captain's notes name a "new" mechanism, the stage below names the existing theorem the mechanism is a corollary of, per Thread G (round-2 §1–§5).

## How this plan was derived

In addition to the four forces named in the predecessor docs, two further forces shape this stretch:

5. The **research-sidebar discipline** ([`milestones/research-sidebar.md`](../milestones/research-sidebar.md)): research artefacts (Predicated Zork, world-sim, Hevî Mala, Teraum, Okaga, paracosms, MUD architecture) are **conformance fixtures and content the OS hosts**, not OS components or release deliverables.
  A prior session shipped paracosms as `apps/`-shaped components; that was wrong.
  This plan re-routes the same energy: each research artefact appears below as a conformance fixture for the substrate property it stress-tests, not as a release scope item.
6. The **captain's idea-trove triage** (per [`references/ideas-trove.md`](../references/ideas-trove.md) and the per-domain idea files under `operations/engineering/triage/operations/command/ideas/triage/`): each cited idea is paired with the on-disk theorem it specialises, and routed into the substrate verb / closure-rule machinery rather than added as a new primitive.
  The trove is mined, not lifted; per the long-standing `[memory feedback]` recorded at the bottom of [`references/triage-backlog-os-level.md`](../references/triage-backlog-os-level.md), bulk-lifts from triage have produced disasters — the sprint stage is a fresh distillation.

---

## Stage 6 — Where this stretch begins

This stretch begins after [next-stretch-v0.4-v0.6.md Stage 6](next-stretch-v0.4-v0.6.md#stage-6--v06-third-party-sdk) closes:

- v0.6 is shipped; third-party developers can build for the OS.
- Capabilities are typed and non-amplifying at install time per `sdk-import-non-amplifying-via-modal-restriction-composition`.
- Packages are signed-and-distributable; docs are first-class substrate cells.
- The five fuel surfaces compose under the Lawvere quantale at every cross-boundary call.

The procedural question this plan answers from here is: **what is the smallest forward sequence of landings that makes v1.0 (self-developing OS) reachable, given that v0.7 (productivity stack), v0.8 (agential layer), and v0.9 (learning + publishing) sit between, and given that none of these four releases may smuggle in a new substrate primitive?**

---

## Stage 7 — v0.7 productivity stack

Reach state per [milestones/v0.7-561-productivity-stack.md](../milestones/v0.7-561-productivity-stack.md): the captain's daily-driver replacement layer ships as six SDK apps (tasks, knowledge, governance, dispatch, fleet, review).
The captain decommissions one external SaaS tool.
These are **user-stack apps written *on* the OS using the v0.6 SDK**; they are not OS components.
They are the existence proof that the v0.6 surface is real.

The hard discipline at v0.7 is **not adding kernel primitives for app convenience**.
Every app at v0.7 must reduce to (driver-cell + verb-extension + dashboard view + closure rules) per [next-stretch.md §3B](next-stretch.md#3b-first-bundled-apps-as-driver--verb--dashboard-tuples).
If an app needs a new primitive, the wrong layer is being touched — surface to the captain.

### 7A. Tasks app as the rollup-fold over the work hierarchy

**Theorem grounding.** [`cell-set-fold-as-graded-dispatch-specialization`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) (round-2 §1.4 corollary of [`graded-dispatch-via-q-enriched-fusion`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md) at the completion-grade quantale).
Rolling task completion up to goal-, milestone-, campaign-, objective-percent is a quantale-graded fold over the cell-set defined by the `of-goal` / `of-milestone` / `of-campaign` / `of-objective` chain — not a new "rollup" primitive.
The chain itself is the captain's `work-orchestration` spec; the fold is one closure rule per stratum.

**Procedural steps.**

1. Author [specs/apps/tasks.md](../specs/apps/tasks.md) as an SDK-app spec (driver-cell `kind-of-driver: tasks-app`, verb-extension `tasks/board`, dashboard `view:tasks-board`).
  No kernel changes.
2. Express the four rollup folds (task → goal, goal → milestone, milestone → campaign, campaign → objective) as four closure rules per [recipe 3](workflows.md#3-adding-a-closure-rule), each citing the cell-set-fold corollary in the rule body.
  The completion-grade quantale is `[0, 1] ⊂ ℝ` under min × bounded sum — a Lawvere quantale instance per [`cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md).
3. The hledger-style ledger reporting view (per `ideas-trove.md` → `double-entry-operational-accounting`, `operational-chart-of-accounts`) is a projection per `specs/kernel/projection-naturality.md`; the ledger is **not** a separate store.
  Rollups read from the projection; the chart of accounts is a substrate cell tree.
4. The SaaS migration step (Asana / Todoist / Linear / GitHub Issues, per `ideas-trove.md` → `cannibalize-pm-systems`, `github-issues-integration`) is one driver per upstream surface — `kind-of-driver: tasks-import` — composing with the activitypub / matrix / generic-http drivers from v0.4 via the same faithful-interfacer discipline (`doctrine-fidelity-via-faithful-interfacer-functor`).

**Conformance proof.** v0.7 conformance gate 2: the captain accomplishes a full week of work using only the productivity stack on the OS.
The structural fixture is `tests/conformance/test_tasks_rollup_fold.py`: a synthetic 4-deep work hierarchy with N=10 leaves at each layer; assert that task-status mutation propagates the correct rollup percentage to each ancestor in one closure-engine run, and that the final percentages match an independent fold computed in pytest.

**Enables next.** v0.7's other apps (7B–7F) and v0.8's auto-dispatch daemon (8C) all read from the rolled-up percentages as the readiness signal; without 7A's correctness gate, dispatch would chase stale rollups.

### 7B. Knowledge app as the back-link projection of the citation graph

**Theorem grounding.** [`access-patterns-as-temporal-2-category-limit-colimit-triad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/access-patterns-as-temporal-2-category-limit-colimit-triad.md).
The library's link/back-link/citation/cross-reference structure is a temporal-2-category instance; the knowledge app's "browse / search / back-link" verbs are the limit/colimit/triad reads.
No new index primitive is needed; the existing rule-index discipline per [`rule-index-soundness`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/rule-index-soundness.md) covers the rule cells, and `index-as-alexandrov-up-set` covers the cell-set indices.

**Procedural steps.**

1. Author [specs/apps/knowledge.md](../specs/apps/knowledge.md).
  Library cells (terms, texts, theorems, decisions, specs) already live in the substrate per the v0.5 self-host work; the app is a viewer + searcher + monograph builder.
2. The monograph builder (per `agent-mathematical-researcher` / `fars-math-compose-monograph`) is a graph-walk over `depends-on` edges, returning an ordered concatenation.
  Express it as a closure rule producing a transient `monograph-snapshot` cell from the chosen target's depends-on closure; cite [`cell-set-fold-as-graded-dispatch-specialization`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) (the dependency-walk is a fold).
3. Back-links are the inverse of the citation edge; per `access-patterns-as-temporal-2-category-limit-colimit-triad` they are the colimit read of the citation 2-cell.
  The projection materialiser per [specs/kernel/projection-naturality.md](../specs/kernel/projection-naturality.md) writes the back-link projection lazily.

**Conformance proof.** A library entity loads its outgoing citations and incoming back-links in one read against the projection — not two graph traversals — and the rendered monograph for any theorem is byte-identical across two runs against the same library snapshot.

**Enables next.** v0.8's persona-agents (8B) publish through the knowledge app's monograph builder rather than authoring their own export pipeline; v0.9's Hugo-style publishing (9C) reuses the monograph snapshot as the per-page input.

### 7C. Governance app as modal-decidable proposal flow

**Theorem grounding.** [`governance-decision-modal-decidability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/governance-decision-modal-decidability.md) plus [`governance-as-modal-restriction`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md).
A governance proposal is a substrate cell; an approval is a `respond` whose sender fiber has the relevant approval grade; the merge of N approvals to a `t` verdict is the modal-decidability theorem instantiated at the governance grade.

**Procedural steps.**

1. Author [specs/apps/governance.md](../specs/apps/governance.md).
  Proposal types (ADR, vote, charter-amendment, capability-grant, captain-priority-shift) are sub-kinds of `proposal-cell`; the verdict closure rule is one rule per type.
2. The triage-workflow surface is **inactive** at v0.7 — the pipeline-card substrate fiber is a v0.8 deliverable per [decisions/triage-promotes-via-pipeline-stages](../decisions/triage-promotes-via-pipeline-stages.md). v0.7 ships the dashboard view stub that v0.8 will activate; this avoids cross-version coupling.
3. The decision-register is a projection over `proposal-cell` settled at `t` with stratum tag `settled` per [specs/kernel/stratified-facts.md](../specs/kernel/stratified-facts.md).
  Re-opening a decision is *retraction* per the v0.2a inconsistency-repair discipline; never a destructive update.

**Conformance proof.** v0.7 deliverable evidence (the milestone's "An ADR is filed and approved through the governance app" deliverable): a real ADR is filed and approved through the governance app, and the approval byte-trail matches a hand-computed verdict per the modal-decidability theorem.
This is deliverable evidence, not a numbered gate; the v0.7 numbered gates are 1–3 per the milestone, and this evidence is necessary for gate 2 (full week of captain work on the stack) to be honest.

**Enables next.** v0.8's ideas-to-plans pipeline (8D) routes its `idea` → `review` → `plan-draft` → `spec-edit` → `integrated` stage transitions through the governance app's review queue; v0.9's continuous-learning promotions (9A) and v1.0's self-development merges (10A) all reuse this surface for captain review.
Without 7C the rest of the stretch has no review surface.

### 7D. Dispatch app as the office × task fiber composition

**Theorem grounding.** [`dispatch-as-closure-rule-system`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-as-closure-rule-system.md) plus [`dispatch-composes-authorization`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-composes-authorization.md).
Dispatch is *already* a closure-rule system over (office, task, capability) cells — the v0.7 app is the rationale-UI projection of that system, not a new dispatcher.

**Procedural steps.**

1. Author [specs/apps/dispatch.md](../specs/apps/dispatch.md).
  The "rationale UI" is a projection over the closure-engine's per-firing witness chain per [`witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md): the UI shows *why* an office got assigned a task by walking the witness chain from the dispatch firing back to the (office.capability ⇒ task.requirement) modal restriction that authorised it.
2. The auto-dispatch daemon (per `ideas-trove.md` → `auto-dispatch-daemon`, milestone task family `t07-30..t07-32`) ships in v0.7 as the **productivity-app surface** of the existing dispatch closure-rule system: the v0.7 deliverable is the "fire-on-readiness" closure rule wired into the heartbeat for the productivity-app workload (the captain's own tasks/projects), plus the rationale-UI projection over the per-firing witness chain.
  Cite [`dispatch-as-closure-rule-system`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-as-closure-rule-system.md). v0.8 (8C) **extends** the same daemon to the agential workload (office × task × persona dispatch with parallel firing per Husainov-acyclicity); the daemon machinery is shared, the workload broadens.

**Scope arbitration note (Stage 7D ↔ 8C).** A prior session draft of this plan deferred the auto-dispatch daemon entirely to v0.8, contradicting the v0.7 milestone task family.
The arbitration: the **closure-rule + heartbeat wiring + rationale UI** lands at v0.7 against the captain's productivity workload (one workload, single-fire dispatch); v0.8 broadens to the **agential workload** (offices × personas × parallel firings).
No daemon is re-authored at v0.8; the rule-set grows.
Future sessions: do not collapse this into a single stage.

**Conformance proof.** Per the v0.7 deliverable evidence: a task with three eligible offices and a known capability ranking dispatches to the highest-grade office, and the dispatch app's rationale view shows the witness chain from the firing back to the capability comparison.
`tests/conformance/test_dispatch_rationale.py`.
The v0.7 milestone-level conformance gates 1–3 (all v0.6 vectors pass; captain accomplishes a full week using only the stack; one SaaS tool decommissioned) close once the rationale-view + dispatch-firing fixture passes alongside the SaaS-migration evidence.

**Enables next.** v0.8's broadened daemon (8C) reads the same rationale projection as proof-of-eligibility; v0.8's office × task fiber composition (8E) adds the parallel-firing discipline per [`dispatch-table-parallel-firing-via-husainov-acyclicity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-table-parallel-firing-via-husainov-acyclicity.md) on top of v0.7's single-fire daemon.

### 7E. Fleet app as observability projection

**Theorem grounding.** [`observability-as-reads`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/observability-as-reads.md) plus [`heartbeat-quiescence-as-cohomological-calm`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/heartbeat-quiescence-as-cohomological-calm.md).
Fleet health is a read over the per-session telemetry projection — the same projection v0.5 SCADA uses, applied to sessions/agents instead of sensors.
Heartbeat quiescence is the cohomological-calm signal: no $\top$ cells in the per-session H¹ pass means the session is consistent.

**Procedural steps.**

1. Author [specs/apps/fleet.md](../specs/apps/fleet.md).
  The dashboard view aggregates (session-cell, latest-heartbeat, capability-fiber, recent-respond-count, current-cohomology-grade).
2. Real-time view is the projection's incremental materialisation per [`scott-continuity-as-checkpointability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuity-as-checkpointability.md).
  The "agent health metric" is one cell per agent of kind `agent-health-grade` whose value is the bilattice meet of (last-heartbeat-fresh, last-respond-success, no-top-in-fiber).

**Conformance proof.** Force a session into $\top$ at a known cell; the fleet view shows the session's grade flip from $t$ to $\top$ within one heartbeat tick, and the rationale view links to the offending cell.

**Enables next.** v0.9's gamification (9D) reads the agent-health-grade as one of its enrichment signals; v1.0's self-development cycle (10A) gates merges on per-session health staying $t$ throughout the proposal flow.

### 7F. Review app as the failure-analysis projection

**Theorem grounding.** [`audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md).
Failures are H¹ obstructions; the review app is the human-facing projection of the inconsistency-sheaf at the regime appropriate to the substrate.
The instinct-evolution UI is the v0.9 preview surface — at v0.7 it is read-only.

**Procedural steps.**

1. Author [specs/apps/review.md](../specs/apps/review.md).
  The dashboard groups H¹ obstructions by (subsystem, regime, age) and links each to its repair-resolution lifecycle per [specs/kernel/inconsistency-repair.md](../specs/kernel/inconsistency-repair.md).
2. The observation log is a tail over the event log filtered by `kind: observation-cell` — but `observation-cell` itself is **not yet a substrate type at v0.7**. v0.7 ships the view stub against an empty projection; v0.9 (9A) adds the cell type and the view goes live.

**Conformance proof.** v0.9 conformance gate 2 (the "end-to-end pipeline visible in the governance app review queue" gate) is carried back as the v0.7 stub-correctness check: a manually-asserted observation cell renders in the review app's view stub without erroring, demonstrating the v0.9 wire-up will be a closure-rule firing rather than an app re-author.

**Enables next.** v0.9's observe → instinct → skill → tool → hook pipeline (9A) lands its UI surface here; v1.0's self-development cycle (10A) reuses the H¹ surface as the gate before any agent-proposed merge is permitted.

### 7G. Persistent-session subsystem

**Theorem grounding.** [`scott-continuity-as-checkpointability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuity-as-checkpointability.md) + [`save-load-as-stab-and-portal-inclusion`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/save-load-as-stab-and-portal-inclusion.md).
A persistent session is a Scott-continuous process whose state is checkpointable at any settled moment; resume is a stab-and-portal inclusion that re-opens the prior sublocale at the persisted ordinal.

**Imaginative grounding.**

- **`persistent-first-officer-session`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain's framing: a session-with-context survives across captain availability — the conversation has substrate identity, not just process identity.
  Reduction: scott-continuity-as-checkpointability + save-load-as-stab-and-portal-inclusion.

**Procedural steps.**

1. Author `specs/agential/persistent-session.md` (sibling of `non-lm-models.md`, `skill-registry.md`, `ideas-to-plans-pipeline.md` listed in [agential/_index.md](../specs/agential/_index.md)).
  `kind: session-record` cells with persistent state; `open-session`, `resume-session` as substrate verbs in `specs/stdlib/`.
2. Resume is a stab-and-portal inclusion at the persisted ordinal — checkpointability gives the substrate-side anchor; the session-record cell carries the captain-readable continuity.
3. Wire to 7B knowledge-app: a persistent session's witness chain *is* the session's monograph, so the back-link projection from 7B already shows the session as a navigable knowledge surface.

**Conformance proof.** Resume-determinism fixture: open a session, perform 100 respond steps, persist, resume, perform 100 more steps; assert the witness chain after resume is identical (mod ordinal-shift) to the witness chain of an unbroken 200-step session.
Sublocale fixture: assert the resumed sublocale satisfies the time-bounded sublocale predicate from 8A's theorem.

**Enables next.** 7G is the load-bearing prerequisite for 8A's session-as-process spec — 8A formalises what 7G's verbs already presuppose.
Without 7G, 8A would have to introduce session persistence as a new agential primitive rather than a productivity-stack surface lifted into agential discipline.

### 7H. Parameterised MCP context

**Theorem grounding.** [`modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md).
MCP resources scoped to sender-identity at the modal layer — the capability fiber acts on the boundary so the MCP-context a sender sees is the modal restriction of the global MCP catalog to that sender's capability fiber.

**Imaginative grounding.**

- **`parameterized-agent-context`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain's claim: the MCP context an agent receives is not a global view filtered at read-time but a sender-scoped projection by construction.
  Already cited at L2 for the multi-user-authoring closure; 7H is the productivity-stack landing of the same algebra.
  Reduction: modal-restriction-as-substrate-authorization-primitive.

**Procedural steps.**

1. Extend `specs/drivers/mcp-driver.md` with the parameterised-context section: every MCP resource read takes a sender-cell as its first argument; the resource list returned is the modal restriction of the catalog to the sender's capability fiber.
2. Implement in `src/drivers/mcp_driver.py` as a closure-rule firing whose witness chain references both the sender-cell and the catalog version; no new dispatch primitive required.
3. Wire to 7C governance and 7D dispatch: any app whose surface accepts external requests routes through 7H so the MCP-context the app sees is sender-restricted before app-side code runs.

**Conformance proof.** MCP-context fixture: two sender-cells with different capability fibers issue the same MCP resource-list call; assert the returned lists are the modal restriction of the catalog to each sender's fiber, with witness chains that prove the restriction.
Non-amplification fixture: assert no app-side code can observe a resource outside the sender's restricted view.

**Enables next.** 7H is the MCP-context discipline that any app accepting external requests inherits — it is the surface form of the modal-restriction algebra L2 introduced.
Without 7H, app-side code would re-implement context-scoping per app and silently diverge.

### What v0.7 unlocks for v0.8 and beyond

After v0.7: the captain's daily work runs on the OS; six apps exist as proof of the v0.6 SDK; the governance / review / dispatch / fleet surfaces v0.8 needs are all live (with the v0.9-deferred sub-surfaces stubbed). v0.8 (agential layer) plugs into these surfaces rather than building parallel ones; the substrate has no "apps for the captain vs. apps for the agents" split because dispatch / fleet / governance / review are app-shaped surfaces over substrate-resident processes.

---

## Stage 8 — v0.8 agential layer

Reach state per [milestones/v0.8-agential-layer.md](../milestones/v0.8-agential-layer.md): sessions are OS-level processes; persona-agents publish under their own names; offices have formal capability fibers; Voidfleet Academy trains new agents on the OS; the Tier-2 invocation surface and the bundled MCP catalog wire into office work; the ideas-to-plans pipeline runs as a substrate process.

This release operationalises the full surface of the [agential-orchestration-platform](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/) theory. **The trap to avoid here**: the captain's imaginative material — `companion-instead-of-buddy`, `everything-is-messages-from-an-entity`, `parameterized-agent-context`, `persistent-first-officer-session`, `voidfleet-academy`, `daemon-world-tick`, `auto-dispatch-daemon`, `mcp-as-system-api` — reads as a list of new mechanisms.
Per Thread G + Thread J (below), each reduces to an existing platform construct.
Cite the construct, not the new name.

### 8A. Sessions as time-bounded sublocale processes

**Theorem grounding.** [`session-as-time-bounded-sublocale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/session-as-time-bounded-sublocale.md).
A session is a time-bounded sublocale of the substrate's predication site; promoting a session to a first-class OS process means giving it a stable cell-id, a per-session capability fiber, and event-log persistence that survives reboot.

**Procedural steps.**

1. Extend [specs/process/session.md](../specs/process/session.md) (already shipped in v0.2 stub form) with the multi-tier memory specification per `parameterized-agent-context` + `persistent-first-officer-session` (per `ideas-trove.md`).
  The four memory tiers (working, recent, distilled, archived) are four cell-strata projections of the same session-cell — *not* four storage backends.
  Cite [specs/kernel/stratified-facts.md](../specs/kernel/stratified-facts.md).
2. Full-attribution: every cell asserted in a session carries the session's cell-id in its provenance fiber per [`signature-binds-witness-to-identity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/signature-binds-witness-to-identity.md).
  The "session ed25519 keypair" is one substrate cell; rotation is retract+assert.
3. Inter-session messaging (per `ideas-trove.md` → `everything-is-messages-from-an-entity`) is `respond` from one session-cell to another per [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md).
  No new primitive.

**Conformance proof.** v0.8 conformance gate 2: sessions persist across reboots; capability fibers respect persona-vs-office-vs-personnel distinctions and survive the bootstrap-users + fiber-cache reconcile from v0.2a §4.2 unchanged.

**Enables next.** 8B persona-agents and 8C auto-dispatch both run inside session-shaped processes; without 8A the session would be ad-hoc state and reconcile would hit cohomology divergence.

### 8B. Persona-agents as substrate-resident publishing entities

**Theorem grounding.** [`agent-self-queueing-bounded-by-modal-restriction`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md) plus [decisions/persona-and-personnel-distinct](../decisions/persona-and-personnel-distinct.md).
A persona-agent is a sender-fiber that *isn't* a personnel record — it has its own capability fiber, its own publication channels, and its own attribution, but it's authored *by* personnel + offices via modal restriction.

**Procedural steps.**

1. Author [specs/agential/persona-agent.md](../specs/agential/persona-agent.md).
  The persona-agent record is a substrate cell of kind `persona-agent`; its capability fiber is the modal restriction of the authoring personnel's fiber by the persona's declared scope, per [`modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md).
  Persona fibers are *strictly weaker* than personnel fibers by construction; never the other way round.
2. Per `ideas-trove.md` → `companion-instead-of-buddy` and `user-as-boundary`: a persona-agent is a *boundary entity*, holographically projecting (auth, authz, attention, history) fibers — same theorem grounding as personnel, different fiber initialisation.
  Cite [decisions/identity-is-boundary-projection](../decisions/identity-is-boundary-projection.md).
3. ActivityPub publication uses the v0.4 ActivityPub driver (4B) with the persona-agent's cell-id as the actor; no new federation surface, no per-persona homeserver.
  The post is one substrate cell; the federation push is `respond` to the activitypub driver.

**Conformance proof.** v0.8 conformance gate 3: a persona-agent (e.g., Cassia Lorne) publishes a post that a stock Mastodon user can see and follow; the post's author byte-trail terminates at the persona's cell-id and the modal-restriction chain back to the authoring personnel is reproducible.

**Enables next.** v0.9's publishing (9C) reuses 8B's actor + post cells unchanged; v0.9's Hugo-style site generation reads the persona's published-post projection.

### 8C. Auto-dispatch daemon as the heartbeat firing of the dispatch closure-rule system

**Theorem grounding.** [`dispatch-as-closure-rule-system`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-as-closure-rule-system.md) plus [`heartbeat-quiescence-as-cohomological-calm`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/heartbeat-quiescence-as-cohomological-calm.md) plus [`just-in-time-orchestration-via-cohomological-vanishing`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/just-in-time-orchestration-via-cohomological-vanishing.md).
The "auto-dispatch daemon" of `ideas-trove.md` is a heartbeat-tick firing of the existing dispatch closure-rule system — no new daemon process, no new scheduler.

**Procedural steps.**

1. Extend [specs/scheduling/heartbeat.md](../specs/scheduling/heartbeat.md) with the per-tick dispatch invocation.
  The heartbeat already runs per [decisions/heartbeat-is-the-scheduler.md](../decisions/heartbeat-is-the-scheduler.md); the "daemon" is just a closure-rule that the heartbeat fires.
  The parallel-firing per [`dispatch-table-parallel-firing-via-husainov-acyclicity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-table-parallel-firing-via-husainov-acyclicity.md) discipline ensures concurrent dispatches don't violate Thread A determinism.
2. The `daemon-world-tick` idea (per `ideas-trove.md`) is the same heartbeat at the world-sim's tick-frequency-projection — the world-sim is a *fixture* (per Thread J) for the tick semantics, not a new tick mechanism.
  Cite [next-stretch-v0.4-v0.6.md Thread G] reduction: the world-tick is an instance of `closure-rule-system-realizes-closure-2-monad` at the world-sim's regime per the round-2 §5 corollary.
3. Per `just-in-time-orchestration-via-cohomological-vanishing`: a task fires when the local cohomology over its precondition cells vanishes (i.e., all preconditions settle to $t$).
  The auto-dispatch closure rule's premise is exactly this vanishing; no separate "is-ready" check is needed.

**Conformance proof.** v0.8 conformance gate 4: office × task dispatch fires correctly under capability constraints.
The daemon-world-tick fixture (per Thread J) replays a 100-tick world-sim trajectory and asserts that the per-tick fire set matches a hand-computed cohomology calculation.
This extends — does not replace — the v0.7 7D single-fire dispatch fixture; both pass at v0.8.

**Enables next.** v0.9's continuous-learning observations (9A) are emitted per heartbeat tick; v1.0's self-development cycle (10A) runs as a sequence of dispatches under the same daemon.

### 8D. Ideas-to-plans pipeline as five-stage closure-rule system

**Theorem grounding.** [`promote-is-strictly-cost-reducing`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/promote-is-strictly-cost-reducing.md) plus [`closure-rule-system-realizes-closure-2-monad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md).
Per [decisions/triage-promotes-via-pipeline-stages](../decisions/triage-promotes-via-pipeline-stages.md) and `ideas-trove.md` → `ideas-to-plans-pipeline`: the five stages (`idea` → `review` → `plan-draft` → `spec-edit` → `integrated`) are five closure-rule transitions.
The pipeline-card is a substrate cell; the catalogs `ideas-trove.md` and `triage-backlog-os-level.md` are queue projections of the pipeline-card fiber per the v0.8+ catalog discipline declared at the top of those files.

**Procedural steps.**

1. Author [specs/governance/triage-workflow.md](../specs/governance/triage-workflow.md) §6 and the pipeline-card cell type per [decisions/triage-promotes-via-pipeline-stages](../decisions/triage-promotes-via-pipeline-stages.md).
  The five stage-transitions are five closure rules; the four pipeline capabilities (propose, review, draft, integrate) are four capability cells per `modal-restriction-as-substrate-authorization-primitive`.
2. Backlink installation is a derived effect per [next-stretch.md §1A]: each stage-transition emits a `backlink` cell into the source idea pointing at the produced spec/plan, and into the produced spec pointing back at the idea — bidirectional closure rule, no manual link-keeping.
3. The catalog migration sweep (`t08-65`) walks pre-v0.8 `**(Integrated into ...)**` markers in `ideas-trove.md` and `triage-backlog-os-level.md` and creates retroactive pipeline-cards in stage `integrated`.
  The render script (`t08-66`) regenerates the catalogs from substrate state — *the catalogs become projections, not sources of truth*.
  Cite Thread B (single source of truth).
4. The two narrow bypasses (captain-direct edits and incident-response amendments) are *captured* in the spec, not avoided.
  They emit pipeline-card cells in stage `integrated` with provenance `bypass-captain-direct` or `bypass-incident-response` so the audit trail does not have a hole.
  Cite Thread H equivalent: never silently sidestep the recorded discipline.
5. The governance app (7C) activates its triage-workflow surface against this pipeline; the v0.7 stub becomes live without app-side change.

**Conformance proof.** v0.8 conformance gate 9 (the §19 ideas-to-plans pipeline conformance vectors).
A round-trip fixture: assert an idea cell, transition through all five stages, assert that the catalog markdown regenerated from substrate state byte-matches a hand-authored expected output, and assert that the bypass-captain-direct cell appears with the correct provenance fiber.

**Enables next.** v0.9's observe → instinct → skill → tool → hook pipeline (9A) is a *second instance* of the same five-stage discipline, with a different stage set and a different cost-reducing direction (per Thread G: instances of `promote-is-strictly-cost-reducing` at the agential cost quantale rather than the spec-completeness quantale).
Authoring 9A becomes mostly mechanical because the pipeline machinery already exists.

### 8E. Voidfleet Academy as office × training-program × certification fiber

**Theorem grounding.** [`skill-composition-cost-is-bounded-by-constituent-sum`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/skill-composition-cost-is-bounded-by-constituent-sum.md) plus [`settlement-path-as-regime-descent`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/settlement-path-as-regime-descent.md).
Voidfleet Academy (per `ideas-trove.md` → `voidfleet-academy`, `milestones/research-sidebar.md`) is a *substrate-resident application* whose curriculum cells are skill-cells composed under the bounded-sum discipline; certification is a regime-descent witness — the trainee progressed from a less-disciplined regime (e.g., aperiodic) to a more-disciplined one (e.g., Scott-continuous) over a defined corpus.

**Procedural steps.**

1. Author [specs/apps/voidfleet-academy.md](../specs/apps/voidfleet-academy.md) as an SDK-app (driver-cell `kind-of-driver: voidfleet-academy`).
  The training program is a tree of skill-cells; the trainee's progression is one fiber per (trainee, program); certification is a substrate cell of kind `certification` with the regime-descent witness in its body.
2. The "officer progression" semantics (per `ideas-trove.md` → `parameterized-agent-context`) is the trainee's per-skill capability fiber growing under modal-restriction composition — cite `sdk-import-non-amplifying-via-modal-restriction-composition` for the non-amplification property: a trainee cannot acquire authority their program does not declare.
  Per Thread G this is an *instance*, not a new theorem.
3. The ledger integration (per `ideas-trove.md` → `token-economy-from-predication`) uses the v0.7 hledger projection (7A); training events emit ledger entries against the trainee's account. **No new accounting primitive** — the ledger is already a projection.
4. The ECC continuous-learning preview is a read-only view over the v0.9 observation cells (which v0.8 doesn't yet have); the view stub displays "no observations yet" and goes live in v0.9 without app re-author per the same stubbing discipline 7C and 7F use.

**Conformance proof.** v0.8 deliverable evidence ("Voidfleet Academy is operational; a new agent has progressed through at least one training stage" per the milestone deliverable list): a new agent has progressed through at least one training stage; the stage-completion witness chain matches a hand-computed regime-descent calculation.
`tests/conformance/test_voidfleet_certification_witness.py`.

**Enables next.** v0.9's continuous-learning pipeline (9A) reads training-event cells as one of its observation sources; v1.0's self-development cycle (10A) requires that any agent submitting an OS-code modification has at least one Voidfleet certification on file in the relevant subsystem.

### 8F. Tier-2 invocation surface + cheapest-sufficient computation

**Theorem grounding.** [`promote-is-strictly-cost-reducing`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/promote-is-strictly-cost-reducing.md) plus [`cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) plus [decisions/cheapest-sufficient-computation-tier](../decisions/cheapest-sufficient-computation-tier.md).
The three tiers (Tier 1: algebraic substrate; Tier 2: statistical model; Tier 3: language-model inference) are three cost grades on the same Lawvere quantale; the routing rule selects the cheapest tier whose sufficiency-fiber settles to $t$.

**Procedural steps.**

1. Author [specs/process/computation-tiers.md](../specs/process/computation-tiers.md) (decision already filed).
  The model record cell type, the formality-layer refactor, and the office-level admissibility cells are all cell-shaped per Thread G — no new primitives.
2. Tier-3 substitution-on-replay: an LLM response captured at run-time is *itself* a substrate cell; replay reads the cell instead of re-invoking the LLM.
  Cite [`forward-migration-preserves-prior-content`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/forward-migration-preserves-prior-content.md): the captured LLM response is prior content, and replay preserves it.
3. The bundled MCP catalog (`mcp:sequential-thinking`, `mcp:playwright`, `mcp:evalview`, `mcp:omega-memory`, per `ideas-trove.md` → `mcp-as-system-api`, `mcp-verb-inventory`, `cells-as-models-mcp-as-io`) is wired as a set of driver-cells.
  Each MCP tool invocation is one `respond`; cells-as-models means the tool's deterministic algebraic part lives in the cell and only the non-algebraic part (e.g., browser session for playwright) escalates to a real MCP call.

**Conformance proof.** v0.8 conformance gates 5–8: the §12.2, §12.3, §12.5 vectors (Tier-2 routing, Tier-3 escalation-denied, Tier-3 substitution-on-replay) plus the §17 office-wiring vectors plus the §18.5 skill-registry vectors all pass.
Specifically, a routing decision made at Tier 2 produces byte-identical output across replays in both Python and Rust, and no Tier-3 LLM event is emitted.

**Enables next.** v0.9's Tier-2 model *training* surface (9B) produces the model records this invocation surface consumes; v1.0's self-development cycle (10A) uses the cheapest-sufficient routing to ensure agent-driven proposals don't trigger LLM invocation when the substrate can answer algebraically.

### 8G. Companion stratum

**Theorem grounding.** [`interfacer-counit-law`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law.md) + [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md).
A companion-agent is a personnel-stratum specialisation whose cross-session continuity is guaranteed by the faithful-interfacer functor — every companion invocation across sessions satisfies the same counit law as any other interfacer.

**Imaginative grounding.**

- **`companion-instead-of-buddy`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain's distinction: a companion has personnel-stratum standing (named, witnessed, has a duty record), where a buddy is a transient interaction shape.
  Reduction: interfacer-counit-law + uniformity.

**Procedural steps.**

1. Author `specs/agential/companion-agent.md` (sibling of `persona-agent.md` cited at 8B).
  `kind: companion-record` cells; capability-fiber declaration; cross-session continuity contract; duty-record reference.
2. The companion is a personnel-stratum specialisation, not a new primitive — it is one office × persona × duty composition that the existing AgOP fiber-composition produces.
  Per [security/persona-and-personnel.md](../specs/security/persona-and-personnel.md), the companion record is checked against the personnel-vs-office distinction; companions are personnel.
3. Wire to 8B persona-agent: persona-agent and companion-agent are two different personnel-stratum specialisations of the same fiber-composition; their distinguishing surface is the duty-record discipline (companion has standing duties; persona-agent has standing publishing rights).

**Conformance proof.** Companion-continuity fixture: invoke a companion across three separate sessions; assert the witness chain references the same companion-record cell at each invocation; assert the counit law holds (the companion's response to a captured input is byte-identical to the same response captured at a prior session).

**Enables next.** 8G pairs with 8H (agent-retirement): companion installation and agent retirement are dual operations on the same personnel-stratum.
8B's persona-agent and 8G's companion together populate the stratum that 8H operates on.

### 8H. Agent-retirement stratum

**Theorem grounding.** [`endomorphism-sheaf-acyclicity-inheritance`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/endomorphism-sheaf-acyclicity-inheritance.md) (math-side authority; the slug lives under `predication-categories/theorems/`, not `predicated-computing/theorems/`).
The operational form is [`cell-set-fold-as-graded-dispatch-specialization`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) at the predicated-computing scope: agent-retirement is a vocabulary fold that drops the agent's contribution from the active cell-set without losing its witness chain.
The endomorphism-sheaf inherits acyclicity through the fold, so the post-retirement substrate is dispatch-coherent by construction.

**Imaginative grounding.**

- **`retirement-as-vocabulary-fold`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain's framing: an agent leaving the substrate is *not* a deletion — the witness chain stays; the active vocabulary contracts.
  Reduction: endomorphism-sheaf-acyclicity-inheritance (math-side) + cell-set-fold-as-graded-dispatch-specialization (operational).

**Procedural steps.**

1. Author `specs/agential/agent-retirement.md`.
  `retire-agent` verb in `specs/stdlib/`; `kind: retirement-record` cell linking to the retired agent's last witness-chain leaf; vocabulary-fold closure rule.
2. The fold is non-destructive: every cell the retired agent authored remains; what changes is the active vocabulary the dispatch reads from.
  Future dispatch decisions never reach the retired agent's capability fiber, but historical replay is unchanged.
3. Wire to 8G companion and 8B persona-agent: retirement is the dual of installation; the same personnel-stratum fiber-composition that admits a new agent admits the contraction.

**Conformance proof.** Retirement-fold fixture: install a companion; have it author 50 cells; retire it; assert all 50 cells remain readable, the witness chain from each cell still resolves, but the dispatch table excludes the retired companion's capability fiber.
Acyclicity fixture: assert the post-retirement endomorphism-sheaf is acyclic, per the inheritance theorem.

**Enables next.** 8H closes the personnel-stratum lifecycle that 8B and 8G open.
With 8B, 8G, 8H in place, the personnel-stratum is a fully-realised vocabulary surface — agents come in, do witnessed work, and leave without leaving the substrate inconsistent.

### 8I. Sender-identity unification

**Theorem grounding.** [`signature-binds-witness-to-identity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/signature-binds-witness-to-identity.md) + [`closure-rule-system-realizes-closure-2-monad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md) + [`agent-self-queueing-bounded-by-modal-restriction`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md).
Dispatch, training, and gamification all read the same sender-identity composition: each is a closure-rule system whose firing carries the sender's signature, whose closure pass realises the same closure 2-monad, and whose self-queueing is bounded by the same modal-restriction algebra.

**Imaginative grounding.**

- **`unified-architecture-from-sender-identity`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain's architectural compaction: dispatch (8C), training (9B), gamification (9D) appear to be three independent subsystems, but they are three closure-rule systems composing under the same sender-identity algebra.
  Reduction: the three-theorem composition above (the dispatch-stratum specialisation theorem itself is not yet on disk; cite the closure-rule-system + self-queueing pair as the operational ground).

**Procedural steps.**

1. Author `specs/agential/sender-identity-unification.md`.
  The spec does *not* introduce new primitives — it documents the composition that L2, 8C, 9B, 9D already realise as instances of one algebra.
2. The unification surface is one rationalisation pass: extract the sender-identity composition step from each of 8C / 9B / 9D and replace with a call to the unified composition.
  No behaviour changes; the dispatch trace becomes one chain instead of three parallel chains.
3. The "specialisation theorem" — that dispatch, training, and gamification are *the same* closure-rule system at different gradings — is currently a captain claim; this rung opens a [questions/](../questions/) entry asking the math side to formalise the specialisation.
  Implementation can land on the existing three-theorem composition; the unification theorem is a forward-looking math-side authoring.

**Conformance proof.** Sender-identity fixture: trace one sender's action through dispatch, training (model retraining trigger), and gamification (enrichment-prioritiser update); assert the witness chain shows one sender-identity composition, not three.
Modal-restriction fixture: assert the bound on self-queueing applies uniformly across the three subsystems.

**Enables next.** 8I rationalises the boundary between L2 and 8B persona-agent fibers: the persona-agent's standing rights and L2's sender-as-boundary are two views of the same composition. v0.9 and v1.0 work consumes the unified surface, simplifying the auditing of "what did this sender actually cause".

### What v0.8 unlocks for v0.9 and beyond

After v0.8: agents inside the OS are first-class entities with capability fibers, persona-agents publish under their own names, the captain's existing harness machinery (`Claude Code` / `Codex` / specialist offices) lifts onto the OS as substrate-resident processes, the ideas-to-plans pipeline runs as substrate procedure rather than a discipline of attention, and Voidfleet Academy proves the curriculum/certification surface. v0.9 (continuous learning + publishing) closes the loop from "agents act" (v0.8) to "agents learn from acting" (v0.9); v1.0 (self-development) requires the agential layer to be load-bearing first.

---

## Stage 9 — v0.9 continuous learning + publishing

Reach state per [milestones/v0.9-publishing-and-learning.md](../milestones/v0.9-publishing-and-learning.md): observe → instinct → skill → tool → hook fully wired; Tier-2 model training surface; Hugo-style site generation; persona publication channels with subscription/feed support.

The captain's `ideas-trove.md` → `continuous-learning-pipeline` and `algebraic-learning-calculus` describe the substrate this release implements. **The discipline at v0.9**: the learning pipeline is a *second instance* of the v0.8 ideas-to-plans pipeline (8D), at a different cost-reducing direction.
Author it as such; do not re-derive the pipeline machinery.

### 9A. Observe → instinct → skill → tool → hook as five-stage closure-rule system

**Theorem grounding.** [`promote-is-strictly-cost-reducing`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/promote-is-strictly-cost-reducing.md) at the agential-cost quantale (Tier 3 → Tier 2 → Tier 1, per 8F).
Each promotion strictly reduces the per-future-invocation cost: an observation that becomes an instinct skips an explicit decision; an instinct that becomes a skill lifts to declarative form; a skill that becomes a tool lifts to MCP-callable; a tool that becomes a hook fires unconditionally.

**Procedural steps.**

1. Author [specs/agential/continuous-learning.md](../specs/agential/continuous-learning.md).
  The five cell types (observation, instinct, skill, tool, hook) and the four promotion closure rules are the v0.9 surface.
  Reuse the v0.8 pipeline-card machinery (8D) — the only new cells are the five kind-tags.
  Cite Thread G.
2. The captain's `algebraic-learning-calculus` (per `ideas-trove.md`) is the meta-theory: each promotion's witness chain is a proof in the calculus that the lifted artefact preserves the bilattice value of the original observation under all admissible inputs.
  Cite [`witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md).
3. The captain reviews each promotion through the v0.7 governance app (7C); the review verb is the same as for ADRs and decision-register entries — no new review surface.

**Conformance proof.** v0.9 conformance gate 2: end-to-end pipeline observation → instinct → skill → tool → hook, all visible in the governance app review queue, with the witness chain at each promotion settled at $t$.

**Enables next.** v0.9 publishing (9C) and gamification (9D) read promoted-skill cells; v1.0 self-development (10A) uses the promoted-tool surface to let agents propose OS modifications without first re-deriving the substrate machinery for each proposal.

### 9B. Tier-2 model training surface — the consumer of 8F's invocation surface

**Theorem grounding.** [`forward-migration-preserves-prior-content`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/forward-migration-preserves-prior-content.md) plus [`model-supersession-as-forward-migration-corollary`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/model-supersession-as-forward-migration-corollary.md) (round-2 §3 corollary).
Training a Tier-2 model produces a model-cell whose weights are derived from prior content; superseding it is forward migration; retracting it invalidates the dependent settled cells per the same theorem.

**Procedural steps.**

1. Author [specs/agential/tier-2-training.md](../specs/agential/tier-2-training.md).
  Two model families at v0.9: decision-forest and Markov chain.
  The training event is one substrate cell of kind `training-event`; the produced weights are a `produced-weights-cell` whose body is the canonical-JSON serialisation; the SHA-256 of the weights is the cell-id.
2. The federated-model-sync surface reuses v0.4's federation driver (4A).
  A model published to peers federates byte-identically; the receiving peer's settled-cell projections that depend on the weights either accept (signature verifies, weights match) or fall to $\bot$ (signature fails or weights don't match) — never silently re-train.
3. Retraction propagation per `model-supersession-as-forward-migration-corollary`: retracting a model invalidates every settled cell whose `derived_from` chain includes its weights — the dispatch scheduler stops selecting the model in the same heartbeat tick.
  No new invalidation primitive; this is `forward-migration-preserves-prior-content` applied at the model layer.

**Conformance proof.** v0.9 conformance gates 5 + 6: the §12.4 Tier-2 weights byte-identity vector and the §12.6 model-retraction vector pass.
A training event run twice from a clean store produces the same `produced-weights-cell` SHA-256 in both Python and Rust.

**Enables next.** v0.9's continuous-learning pipeline (9A) routes promoted skills with Tier-2 weight artefacts through this surface; v1.0's self-development cycle (10A) reuses Tier-2-routed inferences for OS-code analysis when the substrate's algebraic surface is insufficient.

### 9C. Publishing surface as the Hugo-shape projection over persona post-cells

**Theorem grounding.** [`access-patterns-as-temporal-2-category-limit-colimit-triad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/access-patterns-as-temporal-2-category-limit-colimit-triad.md).
Hugo-shaped site generation is a projection over `(persona-agent, post-cell)` pairs at the temporal limit (the per-page snapshot) and the colimit (the index pages, archive, RSS feed).

**Procedural steps.**

1. Author [specs/publishing/site-generation.md](../specs/publishing/site-generation.md).
  Site templates are substrate cells of kind `site-template`; the generation pass is a closure rule that emits per-page rendered cells.
2. Persona publication channels reuse the v0.4 ActivityPub driver (4B) and the v0.4 trust-graph (4E); subscriptions are sieves per [`scope-cover-via-grothendieck-site`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scope-cover-via-grothendieck-site.md) — no new subscription primitive.
3. RSS 2.0 feeds are a second projection of the same persona post-cells (the colimit at the feed-shape access pattern).
  Validation against the RSS 2.0 spec is gate 3 of v0.9.

**Conformance proof.** v0.9 conformance gates 3 + 4: a persona's site is live and reachable; RSS feed validates per RSS 2.0; a stock Mastodon user can follow the persona and receive new posts.

**Enables next.** v1.0's self-development cycle (10A) publishes its own changelog as a persona-shaped site (the OS as an authoring entity, per `ideas-trove.md` → `unified-architecture-from-sender-identity`).

### 9D. Gamification as enrichment-prioritiser closure rule

**Theorem grounding.** [`graded-dispatch-via-q-enriched-fusion`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md) at the enrichment-priority quantale (round-2 §1 corollary class).
Gamification (per `ideas-trove.md` → `gamification-as-enrichment-prioritizer`) is a quantale-grading on the dispatch table; not a separate scoring system.

**Procedural steps.**

1. Author [specs/agential/gamification.md](../specs/agential/gamification.md).
  The "score" of an agent on a task is the bilattice meet of (agent-health-grade from 7E, ledger-balance from 7A's hledger projection, training-certification-grade from 8E).
  No new score primitive; the meet is one closure rule.
2. The token-economy surface (per `ideas-trove.md` → `token-economy-from-predication`) is the v0.7 hledger projection (7A) consumed via this enrichment quantale: tokens are ledger entries per [decisions/operational-chart-of-accounts] (referenced via `ideas-trove.md`); the enrichment-priority is the bilattice meet of the agent's token balance with the task's token bid. **No new currency primitive** — tokens are accounting cells per the v0.7 chart of accounts.

**Conformance proof.** A property fixture: a synthetic dispatch with N agents and one task, where one agent has a higher (health × ledger × certification) grade — the enrichment-prioritiser closure rule selects that agent, and the rationale view (7D) shows the bilattice meet calculation in the witness chain.

**Enables next.** v1.0's self-development cycle (10A) prioritises agent-proposed merges by (agent-health × certification × prior-merge-success-ledger), reusing this surface unchanged.

### What v0.9 unlocks for v1.0

After v0.9: the system observes its own behaviour and improves; persona-agents have live publication channels; the Tier-2 training surface produces model artefacts the v0.8 invocation surface consumes; gamification routes work to the agents most likely to do it well. v1.0 (self-development) requires (1) agents that can read the substrate's own source cells, (2) agents that can propose modifications through governance, (3) a learning loop that promotes successful modifications, and (4) a publishing surface for the OS to publish its own changelog. v0.9 closes (3) and (4); v0.8 closed (1) and (2); v1.0 sequences them into a single cycle.

---

## Stage 10 — v1.0 self-developing OS

Reach state per [milestones/v1.0-self-hosting.md](../milestones/v1.0-self-hosting.md): agents inside the OS write OS code; 30 consecutive days of self-development; the v1.0 image build provenance shows only substrate events.

This release is the **convergence of every prior stage**.
Per Thread A determinism, the self-development cycle is a deterministic function of (v0.9 substrate state, captain decisions); per Thread B single-source-of-truth, the OS's source tree is a substrate fiber; per Thread G no-new-primitives, the self-development verbs are compositions of existing kernel verbs; per Thread H no-phantom-citations, every theorem the cycle leans on is on disk.

### 10A. Self-development cycle as the composition of every prior stage

**Theorem grounding.** [`witness-chain-as-proof-object`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md) plus [`governance-decision-modal-decidability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/governance-decision-modal-decidability.md) plus [`forward-migration-preserves-prior-content`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/forward-migration-preserves-prior-content.md) plus [`bootstrap-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md).
An agent-proposed change is a proposal-cell with a witness chain that the change preserves all currently-settled content under all admissible inputs; the captain's approval is a modal-decidable verdict; the merge is a forward migration; the rebuild is a deterministic bootstrap from the new event log.

**Procedural steps.**

1. Author [specs/self-development/cycle.md](../specs/self-development/cycle.md).
  The cycle is six closure rules:
   - **Read**: agent reads task → identifies source cells (the OS source is loaded as substrate cells per the v0.5 self-host work).
   - **Propose**: agent emits a `closure-rule-edit` cell (or `source-cell-edit`) with a `derived_from` chain back to the task.
   - **Verify**: the v0.7 review surface (7F) runs the affected conformance vectors against the proposed substrate state; the witness chain captures the test outcomes per `witness-chain-as-proof-object`.
   - **Govern**: the v0.7 governance app (7C) opens a captain-review proposal whose verdict closure rule is the v0.9 review queue (9A) routed through the v0.9 enrichment-prioritiser (9D).
   - **Approve**: the captain's approval is one `respond` whose sender fiber has the captain's grade per `governance-decision-modal-decidability`.
   - **Merge**: the merge is a forward migration per `forward-migration-preserves-prior-content`; previously-settled cells stay settled; the new closure rule fires from the next heartbeat.
2. Bootstrapping discipline (per [milestones/v1.0-self-hosting.md] task family `t10-10..t10-12`): no external compiler / editor / test infrastructure on the v1.0 image.
  The substrate source is fully introspectable + editable from inside; the build pipeline runs entirely on the OS via the v0.5 self-hosted toolchain (per [next-stretch.md §3C](next-stretch.md#3c-self-hosting--trusting-trust-witness-chain)).
3. The v1.0 image build provenance is a sequence of substrate events; replay reproduces the image byte-identically per `bootstrap-determinism` and `deployment-determinism`.
  Cite Thread A.

**Conformance proof.** v1.0 conformance gates 2 + 3 + 4: end-to-end self-development cycle demonstrated; v1.0 image build provenance shows only substrate events with no external invocation; captain attests to having reviewed and approved at least 10 substantive changes through the governance app during the v0.9 → v1.0 cycle.

**Enables next.** Beyond v1.0 the captain decides what 561 group computing looks like next; the OS supports them.
The substrate at v1.0 is *neutral with respect to that decision* — it can host whatever the captain authorises through the same six-step cycle, because every prior stage was authored as a closure-rule reduction rather than a bespoke mechanism.

### 10B. The research-sidebar fixtures as the v1.0 closing-of-the-loop demonstration

**Theorem grounding.** [`conformance-via-fiber-algebra-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/conformance-via-fiber-algebra-functor.md).
Per Thread J (below): research artefacts (Predicated Zork, world-sim, Hevî Mala, Teraum, Okaga, paracosms, MUD architecture) are conformance fixtures; v1.0 closes the loop by demonstrating that *every* fixture above has been load-bearing for at least one substrate property along the v0.2a → v1.0 stretch.

**Procedural steps.**

1. Audit `tests/fixtures/` for the per-fixture provenance: which substrate property does each fixture pin?
  The audit is a one-pass walk of the fixture index; the artefact is one row per fixture in [tests/fixtures/_index.md](../../../tests/fixtures/_index.md) of (fixture, substrate-property-pinned, stage-it-was-introduced, current-pass-status).
2. Predicated Zork: pins the cell-store ergonomics gate from v0.2a (250 entities, 72 closure rules, 20-test suite).
  Per `milestones/research-sidebar.md` the existing rule-based and pure algebraic engines are *both* maintained as fixtures: a divergence between the two is a substrate bug, not an engine bug.
3. World-sim (per `ideas-trove.md` → `predication-native-simulation`, `predication-world-sim`): pins the daemon-world-tick + heartbeat semantics gate from v0.8 (8C).
  The 880-line design is the fixture's narrative source; the substrate procedure is the v0.8 heartbeat firing.
4. Hevî Mala / Teraum / Okaga / Turntide Islands / Durham 2030 (per `milestones/research-sidebar.md`): each is a paracosm whose authoring exercises the v0.7 knowledge app (7B), the v0.8 persona-agent (8B), and the v0.9 publishing (9C) surfaces.
  They are *content* the OS hosts.
5. MUD architecture theory (driver/mudlib/map/recipes/builders pattern): is a *worked example* of the captain's `primitive-hierarchy` (per `ideas-trove.md`); the v0.6 SDK example app (6E predecessor) can include a MUD-toy demonstrating the SDK is ergonomic enough for game-substrate work.

**Conformance proof.** v1.0 ships with the fixture-provenance index; every fixture passes; the divergence between Predicated Zork's two engines is zero (or, if non-zero, the divergence is itself a captured substrate-bug fixture filed through the self-development cycle in 10A).

**Enables next.** The captain's imaginative pile is now substrate procedure rather than aspirational pile.
New paracosms / new MUDs / new worlds author themselves through the same SDK + persona-agent + publishing surfaces; no new substrate work is required to host them.

### 10C. Geometric-computation layer (deferred — math-side authoring required)

**Theorem grounding.** **(reduction-target theorem not yet on disk.)** Per Thread G, the implementation cannot be authorised until the math-side proves a theorem that the geometric-realisation layer reduces to.
The first move is to open a [questions/](../questions/) entry naming the missing theorem.

**Imaginative grounding.**

- **`fars-voidmath-geometric-computation`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain's long-horizon framing: a geometric realisation of the predication-graph as a topological space, with computation as continuous deformation.
  Reduction: pending math-side authoring.

**Procedural steps.**

1. Open a [questions/](../questions/) entry: "What theorem in [`library/.../predication-categories/theorems/`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/) must be proved before the geometric-realisation layer can be authorised, and what does its statement look like?"
2. The question's resolution feeds back into [`references/theory-for-developers.md`](../references/theory-for-developers.md) as a new row binding the geometric-computation surface to a named theorem.
3. *Do not author 10C implementation before the math-side answers.* Per Thread G, every claimed new primitive must reduce to an existing theorem; 10C currently has no such theorem.

**Conformance proof.** Not yet defined.
The conformance vector is itself one of the question's outputs.

**Enables next.** 10C is explicitly deferred — naming it on the ladder is the planning-side acknowledgement that the captain trove contains material the substrate has not yet committed to absorbing.
The discipline is: candidates with no on-disk theorem are *named* (so they're not lost), but they are *not implemented* (so the substrate doesn't accumulate primitives that aren't algebraic).

### What v1.0 unlocks

After v1.0: the OS develops itself.
The captain's daily computing happens inside the OS through six apps written for the OS.
Persona-agents publish under their own names.
Voidfleet Academy trains new agents.
The continuous-learning pipeline closes the loop.
The OS image builds itself byte-identically on every machine that has the v0.9 → v1.0 event-log.
The 561 group's compute substrate is live.

The captain decides what 561 group computing looks like next.

---

## Cross-cutting threads (continued)

Threads A–H from the predecessor plans continue to apply at every stage above.
Three further threads emerge at the v0.7-v1.0 horizon:

### Thread I: cheapest-sufficient computation tier discipline

[decisions/cheapest-sufficient-computation-tier](../decisions/cheapest-sufficient-computation-tier.md) per 8F.
Every stage above whose work involves an inference, a routing, or a "decide which option" — 7D dispatch rationale, 7E fleet health grade, 8C auto-dispatch firing, 8D pipeline-stage transition, 9A promotion verdict, 9D enrichment ranking, 10A propose / verify / govern — MUST attempt the routing in this order: (1) Tier-1 algebraic substrate (closure rules, modal restriction, bilattice operations); (2) Tier-2 model (decision-forest, Markov chain, the v0.9 model surface); (3) Tier-3 LLM.
Routing higher than necessary is a thread violation.
The substrate's audit trail per [`audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) records the chosen tier; periodic audit catches stages that drift to higher tiers than the substrate authorises.

### Thread J: research artefacts are conformance fixtures, never primitives

[`milestones/research-sidebar.md`](../milestones/research-sidebar.md) declares this discipline at the milestone scale; this thread carries it through every v0.7-v1.0 stage.
Predicated Zork, world-sim, Hevî Mala, Teraum, Okaga, paracosms, MUD architecture, the captain's `predication-native-simulation` / `voidskiff-multiplayer-terminal-game` / `zork-and-rogue-on-fars` / `teraum-okaga-as-predication-worlds` / `predication-world-sim` ideas — none of these become OS components.
Each pins a substrate property; each lives in `tests/fixtures/` (for the substrate-property test) or `operations/science/research/` (for the artefact narrative).
A prior session shipped paracosms as `apps/`-shaped components; that was wrong, per the [`milestones/research-sidebar.md`] explicit warning.
Re-reading: "build the OS first."

When a stage above mentions a research artefact, the citation is *the substrate property the artefact pins*, not the artefact as deliverable.
If a stage cannot identify the property, the fixture is decoration and should be removed from the stage rather than included as scope.

### Thread K: every imaginative idea is a corollary of an existing platform concept

This is Thread G (round-2 §1–§5 reductions) extended to the captain's `ideas-trove.md` content specifically.
Every v0.7-v1.0 stage above that cites an `ideas-trove.md` slug also names the existing platform-concept the slug is a specialisation of:

- `auto-dispatch-daemon` ⇒ heartbeat firing of `dispatch-as-closure-rule-system` (8C).
- `daemon-world-tick` ⇒ heartbeat at the world-sim regime (8C).
- `everything-is-messages-from-an-entity` ⇒ `respond` between sender-fiber cells (8A).
- `parameterized-agent-context` ⇒ four-stratum projection of the session-cell (8A).
- `persistent-first-officer-session` ⇒ session-cell with stable cell-id across reboots (8A).
- `companion-instead-of-buddy` + `user-as-boundary` ⇒ persona-agent as boundary-projection entity (8B).
- `voidfleet-academy` ⇒ skill-cell composition + regime-descent certification (8E).
- `mcp-as-system-api` + `mcp-verb-inventory` + `cells-as-models-mcp-as-io` ⇒ MCP tools as driver-cells under the v0.4 faithful-interfacer discipline (8F).
- `ideas-to-plans-pipeline` ⇒ five-stage closure-rule system (8D); `continuous-learning-pipeline` ⇒ second instance at the agential cost quantale (9A).
- `algebraic-learning-calculus` ⇒ witness-chain-as-proof-object at the learning-promotion verdict (9A).
- `gamification-as-enrichment-prioritizer` ⇒ `graded-dispatch-via-q-enriched-fusion` at the enrichment quantale (9D).
- `token-economy-from-predication` + `double-entry-operational-accounting` + `operational-chart-of-accounts` ⇒ ledger projection per `cell-set-fold-as-graded-dispatch-specialization` at the accounting quantale (7A, 9D).
- `predication-native-simulation` + `predication-world-sim` + `zork-and-rogue-on-fars` + `voidskiff-multiplayer-terminal-game` + `teraum-okaga-as-predication-worlds` ⇒ research-fixture per Thread J (10B).
- `unified-architecture-from-sender-identity` ⇒ persona-agent / personnel / office distinction grounded in `identity-is-boundary-projection` (8B).
- `faoh-self-composing-harness-installer` ⇒ Read step of the self-development cycle (10A).

If a v0.7-v1.0 stage adds a new `ideas-trove.md` reference, the stage's author MUST extend this list with the concept-reduction.
An idea cited without a reduction is a Thread G violation.
If the reduction genuinely fails *and* the failure is provable, escalate to the captain rather than authoring a new substrate primitive silently.

---

## Glossary of theorem slugs cited above

For paths and detail, follow the links in each stage.
Index here for cross-referencing; only on-disk theorems are listed (per Thread H).

| Slug | Path |
|---|---|
| `cell-set-fold-as-graded-dispatch-specialization` | [`predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) |
| `graded-dispatch-via-q-enriched-fusion` | [`predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md) |
| `cost-composition-via-lawvere-quantale` | [`predicated-computing/theorems/cost-composition-via-lawvere-quantale.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) |
| `access-patterns-as-temporal-2-category-limit-colimit-triad` | [`predicated-computing/theorems/access-patterns-as-temporal-2-category-limit-colimit-triad.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/access-patterns-as-temporal-2-category-limit-colimit-triad.md) |
| `rule-index-soundness` | [`predicated-computing/theorems/rule-index-soundness.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/rule-index-soundness.md) |
| `governance-decision-modal-decidability` | [`predicated-computing/theorems/governance-decision-modal-decidability.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/governance-decision-modal-decidability.md) |
| `governance-as-modal-restriction` | [`agential-orchestration-platform/theorems/governance-as-modal-restriction.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md) |
| `dispatch-as-closure-rule-system` | [`agential-orchestration-platform/theorems/dispatch-as-closure-rule-system.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-as-closure-rule-system.md) |
| `dispatch-composes-authorization` | [`agential-orchestration-platform/theorems/dispatch-composes-authorization.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-composes-authorization.md) |
| `dispatch-table-parallel-firing-via-husainov-acyclicity` | [`agential-orchestration-platform/theorems/dispatch-table-parallel-firing-via-husainov-acyclicity.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-table-parallel-firing-via-husainov-acyclicity.md) |
| `witness-chain-as-proof-object` | [`predicated-computing/theorems/witness-chain-as-proof-object.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md) |
| `observability-as-reads` | [`predicated-computing/theorems/observability-as-reads.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/observability-as-reads.md) |
| `heartbeat-quiescence-as-cohomological-calm` | [`agential-orchestration-platform/theorems/heartbeat-quiescence-as-cohomological-calm.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/heartbeat-quiescence-as-cohomological-calm.md) |
| `scott-continuity-as-checkpointability` | [`predicated-computing/theorems/scott-continuity-as-checkpointability.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuity-as-checkpointability.md) |
| `audit-content-via-inconsistency-sheaf-cohomology` | [`predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) |
| `session-as-time-bounded-sublocale` | [`agential-orchestration-platform/theorems/session-as-time-bounded-sublocale.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/session-as-time-bounded-sublocale.md) |
| `signature-binds-witness-to-identity` | [`predicated-computing/theorems/signature-binds-witness-to-identity.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/signature-binds-witness-to-identity.md) |
| `agent-self-queueing-bounded-by-modal-restriction` | [`predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md) |
| `modal-restriction-as-substrate-authorization-primitive` | [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) |
| `sdk-import-non-amplifying-via-modal-restriction-composition` | [`predicated-computing/theorems/sdk-import-non-amplifying-via-modal-restriction-composition.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/sdk-import-non-amplifying-via-modal-restriction-composition.md) |
| `just-in-time-orchestration-via-cohomological-vanishing` | [`predicated-computing/theorems/just-in-time-orchestration-via-cohomological-vanishing.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/just-in-time-orchestration-via-cohomological-vanishing.md) |
| `closure-rule-system-realizes-closure-2-monad` | [`predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md) |
| `promote-is-strictly-cost-reducing` | [`agential-orchestration-platform/theorems/promote-is-strictly-cost-reducing.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/promote-is-strictly-cost-reducing.md) |
| `skill-composition-cost-is-bounded-by-constituent-sum` | [`agential-orchestration-platform/theorems/skill-composition-cost-is-bounded-by-constituent-sum.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/skill-composition-cost-is-bounded-by-constituent-sum.md) |
| `settlement-path-as-regime-descent` | [`agential-orchestration-platform/theorems/settlement-path-as-regime-descent.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/settlement-path-as-regime-descent.md) |
| `forward-migration-preserves-prior-content` | [`predicated-computing/theorems/forward-migration-preserves-prior-content.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/forward-migration-preserves-prior-content.md) |
| `model-supersession-as-forward-migration-corollary` | [`predicated-computing/theorems/model-supersession-as-forward-migration-corollary.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/model-supersession-as-forward-migration-corollary.md) |
| `scope-cover-via-grothendieck-site` | [`predicated-computing/theorems/scope-cover-via-grothendieck-site.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scope-cover-via-grothendieck-site.md) |
| `bootstrap-determinism` | [`predicated-computing/theorems/bootstrap-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md) |
| `deployment-determinism` | [`predicated-computing/theorems/deployment-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/deployment-determinism.md) |
| `conformance-via-fiber-algebra-functor` | [`predicated-computing/theorems/conformance-via-fiber-algebra-functor.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/conformance-via-fiber-algebra-functor.md) |
| `save-load-as-stab-and-portal-inclusion` | [`predicated-computing/theorems/save-load-as-stab-and-portal-inclusion.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/save-load-as-stab-and-portal-inclusion.md) |
| `interfacer-counit-law` | [`predicated-computing/theorems/interfacer-counit-law.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law.md) |
| `interfacer-counit-law-uniformity` | [`predicated-computing/theorems/interfacer-counit-law-uniformity.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md) |
| `cell-set-fold-as-graded-dispatch-specialization` | [`predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) |
| `endomorphism-sheaf-acyclicity-inheritance` | [`predication-categories/theorems/endomorphism-sheaf-acyclicity-inheritance.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/endomorphism-sheaf-acyclicity-inheritance.md) |

## See also

- [next-stretch.md](next-stretch.md) — first predecessor (v0.2a residual → v0.2b → v0.3 on-ramp).
  Read first.
- [next-stretch-v0.4-v0.6.md](next-stretch-v0.4-v0.6.md) — second predecessor (v0.4 federation → v0.5 industrial control → v0.6 SDK).
  Read second.
- [theory-for-developers.md](../references/theory-for-developers.md) — per-construct theory→code bridge.
- [workflows.md](workflows.md) — per-task procedural recipes.
- [milestones/v0.7-561-productivity-stack.md](../milestones/v0.7-561-productivity-stack.md), [milestones/v0.8-agential-layer.md](../milestones/v0.8-agential-layer.md), [milestones/v0.9-publishing-and-learning.md](../milestones/v0.9-publishing-and-learning.md), [milestones/v1.0-self-hosting.md](../milestones/v1.0-self-hosting.md) — per-milestone ship targets this plan derives.
- [milestones/research-sidebar.md](../milestones/research-sidebar.md) — the parallel research-artefact track this plan reduces to fixtures (Thread J).
- [references/ideas-trove.md](../references/ideas-trove.md) — the captain's idea pile this plan reduces to corollaries of existing concepts (Thread K).
- [references/triage-backlog-os-level.md](../references/triage-backlog-os-level.md) — the OS-level triage curation this plan draws on without bulk-lifting.
- [pypredcomp/AGENTS.md](../../../AGENTS.md) — anti-patterns and session shape.
