---
title: "Ideas-to-plans pipeline"
description: "The substrate-resident workflow that promotes raw triage notes through review, plan-fit, and spec-edit into integrated sprint material. Stages, predicate vocabulary, capability discipline, and the integration backlink protocol."
kind: spec
status: normative
version: "0.8"
---


The captain has accumulated years of triage notes under `operations/engineering/triage/operations/command/ideas/triage/` and adjacent directories.
Each note describes something the OS is growing into; a note becomes load-bearing only when it has been reviewed, fitted to a release, written into a normative spec, and backlinked from triage to the sprint surface so the source file is no longer the source of truth.

The work of moving a note through that progression has been done manually, ad hoc, by whoever held the planning seat.
This spec lifts that workflow into the substrate as a sequence of stage transitions on a single cell kind, with each transition gated by capability and witnessed in the standard event chain.

The captain's source idea is [`ideas-to-plans-pipeline.md`](../../../../engineering/triage/operations/command/ideas/triage/ideas-to-plans-pipeline.md) (2026-04-04).
The framing is committed by [`decisions/triage-promotes-via-pipeline-stages.md`](../../decisions/triage-promotes-via-pipeline-stages.md).
The governance-app-facing surface is in [`governance/triage-workflow.md`](../governance/triage-workflow.md).

## 1. Stages

The pipeline has five stages, each a value of the `pipeline-stage` predicate on a `pipeline-card` cell:

| Stage | Slug | Meaning | Where it lives |
|---|---|---|---|
| Idea | `idea` | Raw triage note; no formality yet. | The triage source file is canonical; the pipeline-card observes it. |
| Review | `review` | Reviewed for coherence and overlap; merge candidates identified. | Pipeline-card carries `merged-with` and review notes. |
| Plan draft | `plan-draft` | Fitted to a sprint subsystem and a release version. | Pipeline-card names the target sprint plan and subsystem. |
| Spec edit | `spec-edit` | Written into the sprint as one or more normative specs, decision records, and plan task entries. | Pipeline-card names the spec/decision/plan-task anchors. |
| Integrated | `integrated` | Captain has signed off; backlinks installed on both ends; the source file is marked integrated. | Pipeline-card carries the signoff decision; source file's frontmatter carries `integrated-into`. |

The stage progression is **monotone forward** during normal operation.
A card at `spec-edit` does not regress to `plan-draft` when the captain requests changes; instead the card **stays at `spec-edit`** with a `signoff-feedback-cell` appended (per [`governance/triage-workflow.md`](../governance/triage-workflow.md) §3), and the planner addresses the feedback by editing the anchored spec/decision/plan-task files in place.
Anchor edits do not require a stage transition because the anchors are already registered; only the anchored *content* changes.
A re-submission for signoff is a fresh captain-signoff decision-record referencing the same card.

Two narrowly-scoped backward movements exist as substrate edits, NOT as closure-rule transitions:

1. **`integrated → spec-edit` re-opening** — a typo fix or amendment to an already-integrated spec.
  The captain authors a substrate edit retracting the card's `(card, stage, integrated)` cell and asserting `(card, stage, spec-edit, True)`.
  This requires the `signal:pipeline:integrate` capability (captain authority) and a fresh signoff decision-record on re-integration.
2. **Anchor retract for merge or refit** — to merge cards already at `plan-draft` or `spec-edit`, or to refit a card to a different sprint subsystem, the planner first retracts the affected `spec-anchors` / `decision-anchors` / `plan-task-anchors` / `fitted-to-*` cells via substrate edits with planner authority.
  The substrate's saturation step then re-derives the card's stage from the (now-empty) premises, dropping it back to the highest stage whose §3 premise still holds.
  Without an explicit retract, the substrate refuses with `PCS_PIPELINE_STAGE_REGRESSION` or `PCS_PIPELINE_MERGE_AFTER_FIT`.

The §3 closure rules themselves never fire backwards.
Backward movement is always a substrate edit with documented capability discipline; the §11 conformance vectors verify both the forward-rule monotonicity and the substrate-edit retract paths.

## 2. Pipeline-card record

Each card is one substrate cell of `kind = "pipeline-card"` with EAVT predicates encoding the stage progression and the integration anchors:

```json
{
  "kind": "pipeline-card",
  "id": "<sha256>",
  "slug": "pipeline-card:<source-slug>",
  "title": "<lifted from the source file's frontmatter>",
  "source-file": "operations/engineering/triage/.../<source-slug>.md",
  "source-cell": "cell:<sha256-of-source-content-at-card-creation>",
  "stage": "idea | review | plan-draft | spec-edit | integrated",
  "stage-since-ord": 5234,
  "merged-with": ["pipeline-card:..."],
  "fitted-to-release": "v0.8",
  "fitted-to-subsystem": "specs/agential",
  "spec-anchors": ["specs/agential/ideas-to-plans-pipeline.md"],
  "decision-anchors": ["decisions/triage-promotes-via-pipeline-stages.md"],
  "plan-task-anchors": ["plan:v0.8-agential-layer:t08-60"],
  "captain-signoff-decision": "decision:integrate-pipeline-card-<slug>",
  "integrated-into-files": ["operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/.../..md"],
  "blocked": false,
  "block-reason-cell": null,
  "active": true,
  "retired-at-ord": null
}
```

| Field | Meaning |
|---|---|
| `slug` | Lower-kebab-case per [`decisions/slug-alphabet-lower-kebab.md`](../../decisions/slug-alphabet-lower-kebab.md); typically derived from the source file's basename. |
| `source-file` | The triage path the card observes. May be null for cards born inside the pipeline (captain notes authored as cards directly). |
| `source-cell` | Content-addressed snapshot of the source file's bytes at card creation. Lets reviewers detect when triage drifts from the card's premises. |
| `stage` | One of the §1 values. Transitions are stamped by §3 closure rules. |
| `merged-with` | Other pipeline-cards this one merges with (a many-to-one or many-to-many relation; the substrate's `merged-with` graph is symmetric closure). Merged cards do NOT retire; both halves remain queryable, with stage equal to the highest reached on either side. |
| `fitted-to-release` / `fitted-to-subsystem` | Required by the time the card reaches `plan-draft`; null at earlier stages. |
| `spec-anchors` / `decision-anchors` / `plan-task-anchors` | The sprint locations the card has authored. Required by the time the card reaches `spec-edit`; at least one anchor must be non-empty. |
| `captain-signoff-decision` | The decision-record id (per [`governance/decision-record.md`](../governance/decision-record.md)) carrying the captain's signoff. Required at `integrated`. |
| `integrated-into-files` | Mirror of `spec-anchors` plus any other markdown file the source has been integrated into. The §5 backlink protocol uses this. |
| `blocked` / `block-reason-cell` | Per §7, a card may be blocked at any stage; the block reason cell explains why. |

A card does not carry the source idea's text itself; the source file is canonical.
Long-form review notes, plan-fit rationale, and spec-edit notes live in linked content cells (`(pipeline-card:<slug>, review-notes-cell, cell:<id>)` and similar), not on the card record.

## 3. Stage transitions as closure rules

Each transition is a single closure rule firing on substrate state.
The rules are themselves substrate cells per [`decisions/self-representation-everywhere.md`](../../decisions/self-representation-everywhere.md), so the captain may amend the discipline without code changes.

The five canonical transitions:

### 3.1 `idea → review`

```json
{
  "kind": "rule",
  "name": "promote-pipeline-card-idea-to-review",
  "premise": [
    {"s": "$card", "p": "kind", "o": "pipeline-card", "v": "True"},
    {"s": "$card", "p": "stage", "o": "idea", "v": "True"},
    {"s": "$card", "p": "review-notes-cell", "o": "$notes", "v": "True"},
    {"s": "$session", "p": "authored", "o": "$notes", "v": "True"},
    {"s": "$session", "p": "has-capability", "o": "signal:pipeline:review-card", "v": "True"}
  ],
  "conclusion": [
    {"s": "$card", "p": "stage", "o": "review", "v": "True"},
    {"s": "$card", "p": "stage-since-ord", "o": "now-ord()", "v": "True"}
  ]
}
```

A reviewer authors a `review-notes-cell` and the substrate detects the transition.
The required capability is `signal:pipeline:review-card`, granted by default to `office:planner` and any office that holds the duty `triage-review`.

### 3.2 `review → plan-draft`

Premise additionally requires `fitted-to-release` and `fitted-to-subsystem` to be non-null on the card, plus the session's authority fiber to include `signal:pipeline:plan-fit` — granted by default to `office:planner` and any office holding the duty `sprint-fit` per §4.
This is the F2 transition: the captain's framing names planner authority as the gate, but the gate is the capability, not office membership.

If multiple cards have been merged at the review stage, only the surviving lead card needs fitting; merged followers inherit `fitted-to-release` and `fitted-to-subsystem` via the `merged-with` symmetric closure.
The substrate emits a `(pipeline-card:<follower>, fitting-inherited-from, pipeline-card:<lead>)` cell at the saturated stratum so the audit chain remains explicit.

### 3.3 `plan-draft → spec-edit`

Premise additionally requires at least one of `spec-anchors`, `decision-anchors`, `plan-task-anchors` to be non-empty, and the named anchors to resolve to actual files in the repository (the sprint-substrate's filesystem driver verifies each path on session-open).
The session's authority fiber must include `signal:pipeline:spec-edit` — that capability is granted by default to `office:planner` and `office:specifier` per §4, but the gate is the capability, not office membership.
The acting office must additionally `permit-tier: tier-1` or `tier-3` for spec authoring per [`process/computation-tiers.md`](../process/computation-tiers.md) §3 (the spec body is itself authored either by the algebraic substrate or by an LLM under the office's discipline; the pipeline does not constrain which).

A `spec-edit` card carries the integration commitment but is not yet integrated; the source file's frontmatter does not yet carry `integrated-into`.
This stage exists so reviewers can inspect the spec edit before the captain signs off.

### 3.4 `spec-edit → integrated`

Premise additionally requires `captain-signoff-decision` to point at an approved `decision` record (per [`governance/decision-record.md`](../governance/decision-record.md)) whose `approval-required: "captain"` field has been satisfied by a captain signature.
The decision-record is created by the governance-app's pipeline-signoff surface (per [`governance/triage-workflow.md`](../governance/triage-workflow.md) §3) and references the pipeline-card by id.

The transition's conclusion additionally asserts:

```json
{"s": "$card", "p": "integrated-at-ord", "o": "now-ord()", "v": "True"}
```

and triggers the §5 backlink installation as a derived effect.

### 3.5 `idea → idea (merge)`

A reviewer may merge two `idea`-stage or `review`-stage cards by appending `(card-A, merged-with, card-B) = True`.
The substrate's saturation step emits the symmetric cell `(card-B, merged-with, card-A) = True`.
The closure rule promotes both cards' stage to `review` if either was at `idea`, and the lead card (lexicographically lowest slug among the merged set) becomes the carrier for downstream stages.

Merging at `plan-draft` or later requires retracting the affected anchors first; the substrate refuses (`PCS_PIPELINE_MERGE_AFTER_FIT`) without an explicit retract so accidental merges cannot silently invalidate sprint commitments.

## 4. Capability discipline

The pipeline declares four capability-fiber predicates that gate the transitions:

| Capability | Granted to (default) | Gates |
|---|---|---|
| `signal:pipeline:review-card` | `office:planner`, any office holding duty `triage-review` | §3.1 |
| `signal:pipeline:plan-fit` | `office:planner` | §3.2 |
| `signal:pipeline:spec-edit` | `office:planner`, `office:specifier` | §3.3 |
| `signal:pipeline:integrate` | `office:captain` (the boundary projection holding captain authority per [`security/persona-and-personnel.md`](../security/persona-and-personnel.md)) | §3.4 |

A session lacking the relevant capability surfaces `PCA_SCOPE_INSUFFICIENT` per [`security/capability-model.md`](../security/capability-model.md) §8 — the same code raised by every other capability-bounded surface.

The pipeline does NOT introduce a privileged scheduler privilege for stage transitions; it composes against the standard $\Rightarrow$ algebra.
The captain's signoff for `spec-edit → integrated` is a *governance* signature, not a *substrate* privilege; the governance app is the authoring surface.

## 5. Integration backlink protocol

When a card transitions to `integrated`, the substrate installs backlinks on both ends:

### 5.1 Triage-side: `integrated-into` frontmatter

The source file's YAML frontmatter gets an `integrated-into` array listing every spec/decision/plan-task path the card has authored:

```yaml
---
title: "Ideas → Plans Pipeline — Process Accumulated Ideas into Records"
specialization: idea
date-created: 2026-04-04
serves: operations-loop
relates-to:
  - cl-pipeline
  - unified-record-sketch
integrated-into:
  - operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/agential/ideas-to-plans-pipeline.md
  - operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/governance/triage-workflow.md
  - operations/engineering/tools/predication-computer/pypredcomp/docs/dev/decisions/triage-promotes-via-pipeline-stages.md
  - operations/engineering/tools/predication-computer/pypredcomp/docs/dev/milestones/v0.8-agential-layer.md
integrated-at-ord: 5832
integrated-via-pipeline-card: pipeline-card:ideas-to-plans-pipeline
---
```

The frontmatter edit is itself a substrate-attributed action: the integration closure rule emits a `(triage-file:<path>, frontmatter-edited-by-pipeline, pipeline-card:<slug>)` cell so the file edit is replayable.

### 5.2 Sprint-side: `source-idea` frontmatter

Each spec/decision/plan-task file the card authored gets a `source-idea` array (or string) in its frontmatter pointing back at the triage source:

```yaml
---
title: "Ideas-to-plans pipeline"
status: normative
version: "0.8"
source-idea: operations/engineering/triage/operations/command/ideas/triage/ideas-to-plans-pipeline.md
source-pipeline-card: pipeline-card:ideas-to-plans-pipeline
---
```

A spec/decision/plan-task that names a triage source via `source-idea` MUST be reachable from that triage file's `integrated-into` chain; the §6 conformance vectors enforce the symmetry.

### 5.3 Existing informal markers

Earlier integrations (per [`references/ideas-trove.md`](../../references/ideas-trove.md)) used inline `**(Integrated into ...)**` markdown markers on the catalog entry.
Those markers remain valid; the pipeline does not retroactively rewrite them.
New integrations from v0.8 onward use the structured frontmatter form.
The catalog-cell migration is per [`governance/triage-workflow.md`](../governance/triage-workflow.md) §6.

## 6. Pipeline-card lifecycle and queries

### 6.1 Card creation

A pipeline-card is created by appending the asserted cells of its record (per §2).
Two creation paths:

- **From triage**: a sweep job (`pipeline-card-from-triage`, a substrate stdlib verb shipping at v0.8) walks the triage directories, computes `source-cell` SHA-256s, and emits a card for each file lacking an `integrated-into` frontmatter and lacking an existing pipeline-card.
  The sweep is idempotent: re-running produces no new cards if the cell store is unchanged.
- **Captain-direct**: the captain authors a card directly via the governance app. The card's `source-file` may be null; `source-cell` is then the cell holding the captain's note text.

### 6.2 Querying open cards

The fiber projection `(pipeline-card:*, stage, *)` answers "what cards are at what stage."
The governance app's queue surface ([`governance/triage-workflow.md`](../governance/triage-workflow.md) §2) is exactly this projection plus filters on `fitted-to-release`, `fitted-to-subsystem`, and `blocked`.

The fiber projection `(pipeline-card:*, captain-signoff-decision, *)` answers "what cards are awaiting captain signoff" — used by the captain-home dashboard.

### 6.3 Replay and federation

Cards federate by the same rules as any other cell.
A confederacy peer sees the same pipeline cards and the same stage-transition events, with one peer's authoring boundary preserved through the standard signing chain.
Replay through the event log reproduces stage history byte-identically.

## 7. Blocking and unblocking

A card may be blocked at any stage.
Reviewer or planner asserts:

```json
{"s": "pipeline-card:<slug>", "p": "blocked", "o": "True", "v": "True"}
{"s": "pipeline-card:<slug>", "p": "block-reason-cell", "o": "cell:<reason-text>", "v": "True"}
```

The §3 transition rules guard their premises with `(card, blocked, False) = True`, so blocked cards halt at their current stage.
Unblocking retracts the `blocked` cell.

Common block reasons:

- The source idea contradicts a current sprint commitment; the contradiction must resolve before the card proceeds.
- The named subsystem doesn't exist yet (e.g., a card fitted to a v1.1 subsystem that hasn't been planned).
- The card depends on another card that is also unintegrated; the dependency is recorded as `(card-A, depends-on, card-B)` and the substrate refuses to advance A past B's current stage.

The governance app surfaces blocked cards in a dedicated lane per [`governance/triage-workflow.md`](../governance/triage-workflow.md) §4.

## 8. Bypassing the pipeline

The pipeline is the *normal* path for triage-to-spec promotion.
Two narrow bypass forms are permitted by [`decisions/triage-promotes-via-pipeline-stages.md`](../../decisions/triage-promotes-via-pipeline-stages.md):

1. **Captain-direct edit.** The captain may edit a sprint spec/decision/plan-task directly without an intervening pipeline card.
  The edited file gains `source-idea: captain-direct` (or names a triage file the captain is integrating in-line).
  A retroactive pipeline-card MAY be authored after the fact for queue accounting.
2. **Substrate-edit emergency.** During incident response (per [`governance/incident-management.md`](../governance/incident-management.md) §3) a sprint document may be amended with `source-idea: incident:<slug>`.
  The pipeline-card is created on incident close.

All other promotions go through the pipeline.
The §9 conformance vectors enforce that any sprint file with `source-idea` pointing at a triage path has a corresponding pipeline-card in stage `integrated`.

## 9. Errors

| Code | Meaning |
|---|---|
| `PCS_PIPELINE_STAGE_REGRESSION` | A transition was attempted that would move a card backwards (e.g., `spec-edit → review` without retracting the spec-anchors). |
| `PCS_PIPELINE_FIT_MISSING` | A `review → plan-draft` transition was attempted without `fitted-to-release` or `fitted-to-subsystem`. |
| `PCS_PIPELINE_ANCHOR_MISSING` | A `plan-draft → spec-edit` transition was attempted without at least one resolvable anchor. |
| `PCS_PIPELINE_SIGNOFF_MISSING` | A `spec-edit → integrated` transition was attempted without an approved captain-signoff decision. |
| `PCS_PIPELINE_BACKLINK_ASYMMETRY` | Sprint file's `source-idea` points at a triage file whose `integrated-into` does not include the sprint file (or vice versa). |
| `PCS_PIPELINE_MERGE_AFTER_FIT` | Merge attempted on cards already at `plan-draft` or later without an explicit retract of fit/anchor cells. |
| `PCA_SCOPE_INSUFFICIENT` | The acting session lacks the §4 capability for the attempted transition. |

## 10. Implementation

### Python (v0.8+)

- `pipeline-card` records as pydantic models in `pc_agential.pipeline`.
- The §3 closure rules ship as substrate cells under `boot/rules/pipeline/`.
- `pipeline-card-from-triage` sweep verb in `pc_stdlib.pipeline.sweep`.
- The backlink installation in §5 uses the standard frontmatter editor in `pc_stdlib.frontmatter` (already shipped at v0.2 for spec authoring).

### Rust (v0.8+)

- `PipelineCard` as a serde struct.
- The closure rules are loaded as substrate cells through the standard kernel boot path; no Rust-specific code is required for the transitions.
- The sweep verb's Rust implementation walks the configured triage roots and computes content-addressed source-cell hashes through the kernel's blob store.

## 11. Conformance

The pipeline passes:

1. **Stage progression (forward monotonicity).** A pipeline-card transits `idea → review → plan-draft → spec-edit → integrated` under the §3 rules with the §4 capabilities; replay reproduces every stage cell byte-identically.
  The §3 closure rules never fire backwards.
2. **Capability denial.** A session lacking `signal:pipeline:plan-fit` attempting `review → plan-draft` surfaces `PCA_SCOPE_INSUFFICIENT`; the card stays at `review`.
  The same denial applies to a session lacking `signal:pipeline:spec-edit` for the `plan-draft → spec-edit` transition, regardless of office membership: a session in `office:specifier` holding `signal:pipeline:spec-edit` succeeds, while a session in `office:planner` whose `spec-edit` capability has been denied via $\Rightarrow$ fails.
  The gate is the capability, not the office.
3. **Captain signoff gating.** A card at `spec-edit` whose signoff decision is not approved cannot transit to `integrated`; the substrate returns `PCS_PIPELINE_SIGNOFF_MISSING`.
  "Request changes" appends a `signoff-feedback-cell` and the card stays at `spec-edit`; the §3.4 rule does not fire backwards.
  Re-submission with a fresh approved decision-record fires the rule normally.
4. **Backlink symmetry.** After integration, querying `(triage-file:<path>, integrated-into, *)` and `(sprint-file:<path>, source-idea, *)` returns reciprocal sets; an asymmetry surfaces `PCS_PIPELINE_BACKLINK_ASYMMETRY`.
5. **Merge.** Two cards merged at `review` produce a symmetric `merged-with` graph; the lead card's fitting and anchors propagate to followers.
  Merge attempted at `plan-draft` or later without an explicit anchor-retract surfaces `PCS_PIPELINE_MERGE_AFTER_FIT`.
6. **Substrate-edit backward movement.** The two narrowly-scoped backward paths declared in §1 (re-opening an integrated card, anchor retract for refit) succeed when authored as substrate edits with the documented capabilities; absent the capability or the explicit retract, the substrate refuses with `PCS_PIPELINE_STAGE_REGRESSION`.
  Re-derivation after a retract drops the card to the highest stage whose §3 premise still holds.
7. **Federation.** A peer's pipeline cards are absorbed under the standard receive path; stage history is preserved across replay on either peer.

## 12. Out of scope

- Mining or processing the actual ideas currently in the triage backlog.
  The pipeline specifies *how* to do it; the doing is the work the pipeline enables.
- LLM-driven idea-summarization at the `idea → review` transition.
  The pipeline accommodates one (the Tier-3 LLM-call would emit the `review-notes-cell` and stamp it with `computation-tier: tier-3`), but the specifier of that surface is a separate task.
- A queue UI.
  The governance app's queue surface ships at v0.7 per [`governance/triage-workflow.md`](../governance/triage-workflow.md); the pipeline-as-substrate ships at v0.8 and consumes the v0.7 surface.
- Integration with GitHub Issues.
  A separate driver covers the GitHub-issue ↔ pipeline-card binding.

## 13. Plan 9 / Unix analogue

| Unix concept | Pipeline analogue |
|---|---|
| `inbox` → `triage` → `processed` mail flow | `idea` → `review` → `plan-draft` → `spec-edit` → `integrated` stages |
| `make` dependency graph | The `merged-with` and `depends-on` graph between cards |
| `git rebase` to integrate a feature branch | The §5 backlink installation at `integrated` |
| `cap_set` granting capability for a privileged operation | `signal:pipeline:integrate` capability gating captain signoff |
| Editorial style sheet enforcing consistent doc structure | The `source-idea` ↔ `integrated-into` symmetry conformance vector |
