---
title: "Triage workflow"
description: "How the governance app surfaces the ideas-to-plans pipeline state. Queue projections, blocked-card lane, captain signoff, catalog migration."
kind: spec
status: normative
version: "0.7"
---

# Triage workflow

The ideas-to-plans pipeline is specified in [`agential/ideas-to-plans-pipeline.md`](../agential/ideas-to-plans-pipeline.md).
This spec describes the governance-app-facing surface: how the pipeline's substrate state is surfaced to operators, how the captain's signoff is collected, and how the existing triage catalogs (per [`references/ideas-trove.md`](../../references/ideas-trove.md) and [`references/triage-backlog-os-level.md`](../../references/triage-backlog-os-level.md)) become queue projections rather than parallel sources of truth.

The pipeline ships at v0.8; this surface ships at v0.7 inside the governance app shipped per [`milestones/v0.7-561-productivity-stack.md`](../../milestones/v0.7-561-productivity-stack.md).
The v0.7 governance app stubs the captain-signoff surface against an inactive pipeline; the v0.8 pipeline activates the cells the v0.7 app already surfaces.

## 1. App identity

The triage workflow is a sub-surface of the governance app, not a separate app:

- The app is `app:governance` per [`milestones/v0.7-561-productivity-stack.md`](../../milestones/v0.7-561-productivity-stack.md) §"Governance app".
- The triage workflow's routes live under the governance app's URL space (e.g., `/governance/triage/queue`, `/governance/triage/card/<slug>`, `/governance/triage/signoff`).
- The triage workflow's substrate predicates are scoped to `(pipeline-card:*, *, *)` as defined by [`agential/ideas-to-plans-pipeline.md`](../agential/ideas-to-plans-pipeline.md) §2.

The choice to host triage inside governance reflects the captain's framing that the pipeline is a governance discipline (the captain signs off on integrations) rather than an isolated planning tool.

## 2. Queue surface

The queue is the fiber projection `(pipeline-card:*, stage, *)` filtered and grouped for human consumption.
The default view groups by `stage`:

```
Idea (37 cards)            ← raw triage notes the sweep has discovered
Review (12 cards)          ← awaiting reviewer's coherence pass
Plan draft (5 cards)       ← awaiting fit-to-subsystem
Spec edit (3 cards)        ← awaiting captain signoff
Integrated (recent: 6)     ← rolling 30-day window of recently-integrated cards
```

Per-stage views project additional predicates:

| Stage | Additional columns |
|---|---|
| Idea | `source-file`, `created-at-ord`, candidate `merged-with` peers from a similarity search |
| Review | `review-notes-cell` excerpt, suggested `fitted-to-subsystem` from a Tier-2 classifier (per [`agential/non-lm-models.md`](../agential/non-lm-models.md)) when one exists |
| Plan draft | `fitted-to-release`, `fitted-to-subsystem`, planner who fitted, `depends-on` graph |
| Spec edit | `spec-anchors`, `decision-anchors`, `plan-task-anchors`, status of the captain-signoff decision |
| Integrated | `captain-signoff-decision`, `integrated-into-files`, source-idea backlink health (per §3) |

Filters: `fitted-to-release`, `fitted-to-subsystem`, `blocked`, `depends-on`, `merged-with`.

The queue surface is read-only; transitions are authored through the §3 signoff surface or the §5 stage-action surface, not by editing the queue directly.

## 3. Captain signoff surface

The signoff surface is the gate for `spec-edit → integrated` (per [`agential/ideas-to-plans-pipeline.md`](../agential/ideas-to-plans-pipeline.md) §3.4).

For each card in the `spec-edit` stage that lacks an approved signoff decision, the surface presents:

- The card's title, source-file, and source-cell hash.
- The full content of every named anchor (`spec-anchors`, `decision-anchors`, `plan-task-anchors`) rendered for review.
- A diff between the source file at `source-cell` and the source file's current bytes (so the captain sees whether triage has drifted since the card was opened).
- The reviewer's review-notes-cell, the planner's plan-fit rationale, and the spec-editor's edit-rationale (the cells named by `(card, *-rationale-cell, *)`).
- An "approve" / "request changes" / "reject" action.

"Approve" creates a new `decision` record per [`governance/decision-record.md`](../governance/decision-record.md) with `decision-class: "governance"`, `approval-required: "captain"`, and a `references-pipeline-card: pipeline-card:<slug>` cell.
The captain's signature on the decision-approval cell triggers the §3.4 transition rule.

"Request changes" appends a `(card, signoff-feedback-cell, cell:<text>) = True` cell.
The card **stays at `spec-edit`** — there is no backward transition.
The planner addresses the feedback by editing the already-registered spec/decision/plan-task anchor files in place (anchor *content* changes do not require a stage transition because the anchor cells themselves remain registered).
Re-submission for signoff is a fresh captain-signoff decision-record referencing the same card; the §3.4 pipeline transition rule fires once the new decision-record reaches approved status.
This matches the monotone-forward stage discipline declared in [`agential/ideas-to-plans-pipeline.md`](../agential/ideas-to-plans-pipeline.md) §1.

"Reject" appends a `(card, rejected-at-ord, <ord>)` cell and a `(card, active, False)` cell.
Rejected cards stay queryable but no longer surface in the open-queue view.
Rejection is reversible by retracting the `rejected-at-ord` cell with planner authority.

The signoff surface uses the standard captain-home authentication ([`security/user-as-boundary.md`](../security/user-as-boundary.md)) and signs the decision-approval cell with the captain's projection's keypair per [`security/persona-and-personnel.md`](../security/persona-and-personnel.md).

## 4. Blocked-card lane

Blocked cards (per [`agential/ideas-to-plans-pipeline.md`](../agential/ideas-to-plans-pipeline.md) §7) appear in a dedicated lane separate from the main stage groups.
Each blocked card displays:

- Current stage.
- `block-reason-cell` content.
- `depends-on` chain, with each dependency's current stage.
- An "unblock" action (planner authority) that retracts the `blocked` cell.

The lane is the captain's surface for "what is the pipeline waiting on" — a structural answer to the recurring question of which ideas are stuck and why.

## 5. Stage-action surface

Reviewers and planners advance cards through the stage-action surface.
Per stage, the available actions are:

| Stage | Action | Required capability |
|---|---|---|
| `idea` | Author review-notes; merge with peer card | `signal:pipeline:review-card` |
| `review` | Set `fitted-to-release`, `fitted-to-subsystem`; promote | `signal:pipeline:plan-fit` |
| `plan-draft` | Author spec/decision/plan-task; register anchors; promote | `signal:pipeline:spec-edit` |
| `spec-edit` | Submit for captain signoff (creates decision record) | `signal:pipeline:spec-edit` |
| `integrated` | Re-open for amendment (rare) | `signal:pipeline:integrate` (captain authority) |
| any | Block / unblock | `signal:pipeline:block` (any planner-authority surface) |

Each action emits the substrate cells the §3 closure rules consume; the rules then advance the card automatically on the next heartbeat tick.

The actions are deliberately granular — an action is not a stage transition; it is the authoring of substrate cells that *become* a transition once the closure rule's premise is satisfied.
This is what lets a card sit in `plan-draft` with anchors registered but `permits-tier` not yet asserted, without the substrate prematurely promoting it.

## 6. Catalog migration

The two catalogs at [`references/ideas-trove.md`](../../references/ideas-trove.md) and [`references/triage-backlog-os-level.md`](../../references/triage-backlog-os-level.md) currently double as both human-readable catalogs and ad-hoc integration trackers (using inline `**(Integrated into ...)**` markdown markers).

Under the pipeline, the catalogs become **queue projections**:

- The catalog files remain in the references directory as human-readable index documents.
- Each catalog entry's `**(Integrated into ...)**` marker is the legacy form of `pipeline-card.integrated-into-files`.
  New integrations from v0.8 onward MAY include the marker for human reading but MUST also produce the structured pipeline-card and the `integrated-into` frontmatter on the source file.
- The catalogs themselves are NOT the source of truth for "what's integrated"; the pipeline-card cells are.
  A render script (shipping at v0.8 alongside the pipeline) regenerates the catalog markdown from the pipeline-card fiber so the catalog stays consistent with substrate state.
- Existing integrations recorded only as inline catalog markers (per the v0.4–v0.7 era) are NOT retroactively rewritten.
  A migration sweep authors retrospective pipeline-cards in stage `integrated` for each catalog entry already marked, with `source-cell` set to the catalog entry's text and `captain-signoff-decision: decision:retroactive-pipeline-migration`.

The migration sweep is one-shot; it ships as a v0.8 plan task and runs once on first boot of the v0.8 image.
After the sweep, the catalogs are derived; the pipeline cells are canonical.

## 7. Federation

The triage workflow surface federates by the same discipline as the rest of the governance app:

- A confederacy peer's pipeline-cards are visible in the local queue if a `(peer:<peer>, derivation-trust, pipeline-card)` cell is asserted; otherwise they appear in a separate "from-peer" view that does not feed the local captain-signoff queue.
- Captain signoff is per-substrate; one peer's captain signing a card does NOT integrate the card on a sibling peer.
  Confederacy-level integrations use `joint-decision` per [`governance/joint-decision.md`](joint-decision.md) referencing the pipeline-card on each peer.
- The §3 decision-records federate as standard decision-records; a card integrated under joint signoff carries the joint-decision id in `captain-signoff-decision`.

## 8. Errors

| Code | Meaning |
|---|---|
| `PCS_TRIAGE_QUEUE_PROJECTION_FAILED` | The queue projection encountered an inconsistent pipeline-card cell (e.g., card with `stage: integrated` but missing `captain-signoff-decision`). |
| `PCS_TRIAGE_SIGNOFF_DECISION_INVALID` | The signoff surface attempted to create a decision-record that doesn't reference an existing pipeline-card. |
| `PCS_TRIAGE_CATALOG_MIGRATION_AMBIGUOUS` | The migration sweep encountered a catalog marker pointing at a triage source file whose source-cell hash doesn't match the marker's claimed snapshot. The sweep skips the entry and surfaces it for manual review. |
| `PCA_SCOPE_INSUFFICIENT` | The acting session lacks the §5 capability for the attempted action. |

## 9. Conformance

The triage workflow surface passes:

1. **Queue rendering.** The queue projection renders every card in the substrate at the documented stage with the documented per-stage columns; replay reproduces the rendered queue byte-identically (modulo wall-clock display).
2. **Signoff round-trip.** A card in `spec-edit`, when approved through the surface, produces a decision-record with the documented shape; the §3.4 closure rule fires within one heartbeat tick; the card transits to `integrated` and the §5 backlinks are installed.
3. **Blocked-lane visibility.** A card with `(card, blocked, True) = True` appears in the blocked lane and not in its stage's main view; unblocking restores it on the next render.
4. **Catalog migration idempotency.** Running the catalog migration sweep twice on the same substrate produces the same set of retroactive pipeline-cards (no duplicates, no drift).
5. **Federation isolation.** A peer's pipeline-cards do not appear in the local captain-signoff queue without a `derivation-trust` cell; absence is the audit-default.

## 10. Out of scope

- The pipeline's substrate-side stage transitions (specified in [`agential/ideas-to-plans-pipeline.md`](../agential/ideas-to-plans-pipeline.md) §3).
- The Tier-2 classifier that suggests `fitted-to-subsystem` (a v0.9 algebraic-learning-calculus task; the v0.7/v0.8 surface degrades gracefully when no classifier is present).
- The render script that regenerates the catalog markdown from substrate state (specified in the v0.8 plan task list).
- The migration of triage notes that are not yet pipeline-cards — that is the work the pipeline enables, not a surface concern.

## 11. Plan 9 / Unix analogue

| Unix concept | Triage-workflow analogue |
|---|---|
| `mailx` / `mutt` inbox grouped by folder | The queue's per-stage groups |
| `at` / cron jobs surfaced for operator approval | The captain-signoff surface |
| `make -n` dry-run showing what would change | The signoff surface's diff between `source-cell` and current source |
| Bug tracker's "blocked-by" relationship | The §4 blocked-card lane |
| `git log --decorate` showing branch/tag refs | The catalog rendering of `integrated-into` references |
