---
title: Superseded Plans Audit
description: Plan to audit existing plans in texts/plans/, identify superseded plans, add bidirectional supersession relations to frontmatter, and archive retired plans.
date-created: 2026-05-01
type: note
name: superseded-plans-audit
keywords:
  - plan-supersession
  - plan-audit
  - plan-archival
  - frontmatter-fields
  - work-graph
specialization: plan
horizon: week
work-type: derivation
serves: [operations-loop, library-as-knowledge-base]
depends-on: []
contributes-to: []
produces: explicit-supersession-graph
status: draft
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---

Existing plans in `texts/plans/` accumulate without explicit retirement. `agent-governance-enrichment.md`, `agentic-orchestration.md`, `agentic-to-fars-refactor.md`, plus my recent `operational-records-as-dag.md`, `dispatch-graph-completion.md`, `workflow-task-decomposition.md`, `dispatch-script-evolution.md`, `office-officer-persona-split.md` — many overlap, several supersede earlier takes implicitly. There is no `superseded-by:` field used anywhere in the corpus.

Without explicit supersession, the planner agent dispatches against stale plans, the cartographer renders a misleading work graph, and new contributors can't tell which plan is current.

## Tasks

- `audit-list-all-existing-plans` — produce a list of every plan in `texts/plans/` (and subdirs) with date-created, status, and one-line description
- `audit-cluster-plans-by-topic` — group plans that touch the same topic (dispatch, agent governance, library structure, etc.); identify supersession candidates
- `audit-add-superseded-by-frontmatter-field` — for each older plan that's been overtaken, add `superseded-by: <newer-plan-id>` and update its `status:` to `superseded`
- `audit-add-supersedes-frontmatter-field` — the newer plans declare `supersedes: [<older-plan-id>, ...]`
- `audit-archive-cleanly-retired-plans` — plans whose intent is fully captured elsewhere move to `texts/plans/archive/` (which already exists per the dir listing)

## Acceptance

- A clear list exists of which plans are current vs. superseded
- The supersession relation is bidirectional and queryable from frontmatter
- Archive contains only plans that are truly retired, not duplicates of current intent
