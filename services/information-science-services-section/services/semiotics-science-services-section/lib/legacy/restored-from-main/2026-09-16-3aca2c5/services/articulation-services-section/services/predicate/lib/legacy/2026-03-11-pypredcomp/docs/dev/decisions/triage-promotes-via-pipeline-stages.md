---
title: "Triage promotes via pipeline stages"
description: "Raw triage notes flow into normative sprint material through five formality-graded stages — idea, review, plan-draft, spec-edit, integrated — each gated by capability and witnessed in the substrate. The pipeline is the normal path; bypass is permitted only for captain-direct edits and incident-response amendments."
kind: decision
date: "2026-05-02"
status: committed
---


## What

Promotion of a triage note (anywhere under `operations/engineering/triage/operations/command/ideas/triage/` or adjacent triage directories) into normative sprint material (a spec, a decision record, a plan-task entry) flows through a substrate-resident pipeline of five formality-graded stages: `idea`, `review`, `plan-draft`, `spec-edit`, `integrated`.

Specifically:

- Each stage is a value of the `pipeline-stage` predicate on a `pipeline-card` substrate cell.
  The card observes the source triage file via a content-addressed `source-cell` snapshot, but the source file itself remains the canonical text until integration.
- Stage transitions are closure-rule firings per [`specs/agential/ideas-to-plans-pipeline.md`](../specs/agential/ideas-to-plans-pipeline.md) §3.
  Each transition has a documented capability requirement: `idea → review` needs `signal:pipeline:review-card`; `review → plan-draft` needs `signal:pipeline:plan-fit` (default-granted to `office:planner`); `plan-draft → spec-edit` needs `signal:pipeline:spec-edit`; `spec-edit → integrated` needs an approved captain-signoff decision-record (per [`specs/governance/decision-record.md`](../specs/governance/decision-record.md)) authored through the governance-app surface at [`specs/governance/triage-workflow.md`](../specs/governance/triage-workflow.md) §3.
- Integration installs reciprocal backlinks: the source triage file's frontmatter gains `integrated-into: [...]
  `; each authored sprint file's frontmatter gains `source-idea: <triage-path>`.
  The §11 conformance vectors of [`specs/agential/ideas-to-plans-pipeline.md`](../specs/agential/ideas-to-plans-pipeline.md) enforce the symmetry; asymmetry surfaces `PCS_PIPELINE_BACKLINK_ASYMMETRY`.
- Two narrow bypass forms are permitted: **captain-direct edits** (the captain edits a sprint file in-line, attributing `source-idea: captain-direct` or naming the triage source the edit integrates) and **incident-response amendments** (a sprint file edited during an active incident per [`specs/governance/incident-management.md`](../specs/governance/incident-management.md), attributing `source-idea: incident:<slug>`; the pipeline-card is created retrospectively on incident close).
- The existing references catalogs at [`references/ideas-trove.md`](../specs/../references/ideas-trove.md) and [`references/triage-backlog-os-level.md`](../specs/../references/triage-backlog-os-level.md) become **queue projections** of the pipeline-card fiber rather than parallel sources of truth.
  A migration sweep authors retroactive pipeline-cards in stage `integrated` for the existing `**(Integrated into ...)**` markers per [`specs/governance/triage-workflow.md`](../specs/governance/triage-workflow.md) §6.

The full normative content lives in [`specs/agential/ideas-to-plans-pipeline.md`](../specs/agential/ideas-to-plans-pipeline.md) (the substrate-side stages, predicates, capability discipline, conformance) and [`specs/governance/triage-workflow.md`](../specs/governance/triage-workflow.md) (the governance-app-facing surface).
The captain's source idea is [`ideas-to-plans-pipeline.md`](../../../engineering/triage/operations/command/ideas/triage/ideas-to-plans-pipeline.md) (2026-04-04).

## Why

The captain's source idea names the symptom: years of accumulated triage notes describing what the OS is growing into, sitting unconnected to the planning system.
The notes are real engineering material — ActivityPub servers, Reiki services, Guix/Guile composition layers, the entire `beyond-language-models-for-agent-computation` framing — but they have no structural relationship to the sprint surface that decides what the OS actually ships next.

The current process for moving a note into the sprint is *exactly this task and the tasks like it*: a planning-seat occupant (an agent under captain authority) reads the note, decides where it fits, drafts the spec, writes the decision, edits the plan, and updates the catalogs.
The work is real; the discipline is informal.
Without formalisation:

- **Drift accumulates.** Notes that *have* been integrated still appear in the catalogs as if open; notes that have *not* been integrated look the same as ones that have.
  The captain cannot answer "what's in the queue" without re-reading every catalog entry.
- **Authority is implicit.** Whoever is in the planning seat decides what to integrate.
  The captain's signoff happens in chat, not in the substrate.
  There is no audit chain from "this clause of this spec" back to "the captain approved its integration on date D."
- **Bypass is silent.** A captain-direct edit and a piped-through-review edit are indistinguishable in the resulting file.
  The two are legitimately different (the captain's edit doesn't need review; the piped edit does); without the pipeline, the substrate cannot tell them apart.
- **Operational skill packs (project tasks #6 through #11) compete with sprint planning.** The skill packs are themselves operational documents that need to be promoted; without a shared discipline, they accumulate alongside (and overlap) sprint planning rather than feeding into it.

The pipeline-as-substrate framing is structurally analogous to existing substrate disciplines:

- [`inter-session-messaging-is-substrate-cells`](inter-session-messaging-is-substrate-cells.md) — typed messages between sessions are EAVT cells, not entries in a separate inbox queue.
  The pipeline-card is the same shape applied to triage notes.
- [`bundled-mcp-catalog-is-normative`](bundled-mcp-catalog-is-normative.md) — bundled MCP servers are substrate cells with default profiles.
  The pipeline says triage notes are substrate cells with stage profiles.
- [`skills-have-manifest-contracts`](skills-have-manifest-contracts.md) — every skill carries a manifest.
  The pipeline says every triage-to-spec promotion carries a pipeline-card with documented anchors and signoff.
- [`self-representation-everywhere`](self-representation-everywhere.md) — every operative element of the system is a substrate entity.
  A triage-promotion workflow is operative; making it substrate-resident is mandatory under this principle.

The five-stage progression matches the captain's framing in the source idea: ready ideas become plans with tasks (stages `plan-draft` and `spec-edit`); ideas needing research stay at `review` until the research card unblocks them; overlapping ideas merge at `review` (the §3.5 transition).
The formality grading aligns with the existing F0–F6 office-discipline scale per [`specs/process/computation-tiers.md`](../specs/process/computation-tiers.md) §3 (informally: `idea` is F0 raw material, `review` is F1 reviewed, `plan-draft` is F2 fitted, `spec-edit` is F3 normatively authored, `integrated` is the post-discipline state where the work has settled into the sprint surface).

The captain-direct bypass is necessary because the captain's authority is the substrate's source of authority for spec edits (per [`identity-is-boundary-projection`](identity-is-boundary-projection.md) and the captain's role in [`specs/security/persona-and-personnel.md`](../specs/security/persona-and-personnel.md)); requiring the captain to author a pipeline-card to amend a typo in a sprint spec would invert the authority relationship.
The bypass is narrow: it covers captain-direct edits and incident response, both of which are auditable through their own discipline (signed captain edits, incident-record chains).

The decision is committed at v0.8 because that is when the pipeline ships as a live substrate process; the v0.7 governance app surfaces a stub against an inactive pipeline so the surface is in-place before the substrate cells are populated.

Source: this conversation (2026-05-02); the captain's [`ideas-to-plans-pipeline.md`](../../../engineering/triage/operations/command/ideas/triage/ideas-to-plans-pipeline.md) (2026-04-04); the pattern of integration markers on existing entries in [`references/ideas-trove.md`](../references/ideas-trove.md) (the informal precedent the structured pipeline replaces).

## What it rules out

- An "integrate this note" verb that bypasses the stage progression.
  Every promotion either flows through the pipeline or is one of the two declared bypasses; there is no hidden third path.
- A separate triage-tracking service with its own consistency rules.
  The pipeline-card cells ARE the registry; queries are standard substrate projections.
- Catalog files (`references/ideas-trove.md`, `references/triage-backlog-os-level.md`) as authoritative integration trackers.
  They become rendered projections of the pipeline-card fiber from v0.8 onward; pre-v0.8 markers are migrated retrospectively.
- Captain signoff happening informally (in chat, in commit messages, in undocumented voice memos).
  Signoff is a decision-record per [`specs/governance/decision-record.md`](../specs/governance/decision-record.md) authored through the governance-app surface; the substrate refuses the `spec-edit → integrated` transition without the decision in `approved` status.
- A sprint file with a `source-idea: <triage-path>` frontmatter pointer that does not have a corresponding pipeline-card.
  The conformance vector enforces the symmetry; CI fails on asymmetry.
- The pipeline being a queue *UI*.
  The UI is the v0.7 governance app's triage workflow surface; the pipeline itself is the substrate cells and closure rules.
  The two ship in different releases for a reason.

## What it does not constrain

- The specific natural-language matching algorithm used by the queue's similarity-search to suggest merge candidates at `idea → review`.
  A v0.9 Tier-2 model is anticipated; the v0.7/v0.8 surface degrades gracefully without one.
- Whether `office:planner` and `office:specifier` are distinct offices or the same office under different aliases.
  The capability declarations in [`specs/agential/ideas-to-plans-pipeline.md`](../specs/agential/ideas-to-plans-pipeline.md) §4 grant the relevant capabilities to both; per-deployment composition is normal substrate state.
- The rendering of the catalog markdown files.
  The render script ships at v0.8; its output format may evolve without amending this decision.
- Per-confederacy variation in signoff authority.
  A peer with multiple captains, or an org with rotating planning seats, may amend the §3.4 closure rule's required capability.
  The substrate-cell approach makes this a substrate edit, not an engine change.
- Whether to mine the existing triage backlog automatically (e.g., a sweep that creates pipeline-cards for every triage file lacking `integrated-into`) or wait for human-authored cards.
  The default is "the sweep runs at v0.8 boot for cards lacking pipeline-cards"; per-deployment policy may defer.
- The body content of source triage files.
  The pipeline observes them via `source-cell` and respects whatever shape the captain authored them in.
- Whether operational skill packs (project tasks #6 through #11) author their own pipeline-cards or are integrated as decision-record amendments to existing pipeline-cards.
  The pipeline accommodates both; the skill-pack tasks themselves choose.
