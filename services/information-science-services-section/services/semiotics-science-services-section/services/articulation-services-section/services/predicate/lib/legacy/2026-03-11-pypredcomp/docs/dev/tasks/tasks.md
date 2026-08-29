---
title: "Tasks"
description: "Concrete buildable units in the work-orchestration kind: task shape. Organized by area: engineering, governance, operational, research."
kind: index
---

# Tasks

Concrete buildable units.
Each task is a leaf executable unit in the work-orchestration `kind: task` shape per [specs/work-orchestration/task.md](../specs/work-orchestration/task.md), with `of-goal` / `of-milestone` / `area` / `owned-by-office` / `status` / `horizon` frontmatter.

## Areas

- **[engineering/](engineering/)** — kernel/driver/spec implementation work.
  Most pt-NN entries live here.
- **[governance/](governance/)** — captain decisions, blocking questions, pipeline-stage tasks.
- **[operational/](operational/)** — skill packs, runbooks, MCP catalog wiring, supervision routines.
- **[research/](research/)** — research-shaped work (surveys, theorem audits, gap analyses).
  State-of-the-project records also live under [../surveys/](../surveys/).
- **[admin/](admin/)** — *non-`kind: task`* operational runbooks (`kind: runbook`) — tested sequences for sysadmins (deploy fresh, add member, restore from backup).
  Excluded from work-graph audits.
- **[mining/](mining/)** — *non-`kind: task`* triage-mining tasks per [references/triage-backlog-os-level.md](../references/triage-backlog-os-level.md): each lifts material from the captain's triage corpus into a dev-doc spec or decision.
  Excluded from work-graph audits.

## Reading order

1. Read the milestone you care about under [../milestones/](../milestones/); its "Carried project tasks" section names the per-task records.
2. Read the goal under [../goals/](../goals/); its "Backed by tasks" section names the same.
3. Walk the relevant area directory for the task records themselves.
4. For unowned candidate work (no `of-goal`), see [../backlog/](../backlog/).

## tasks/ vs backlog/

Placement is decided primarily by `horizon`, with ownership splitting the `soon` horizon between the two locations:

- `tasks/<area>/` — *owned* items (carry `of-goal` + `of-milestone`) with `horizon: doing` or `horizon: soon`; on the active cadence.
- `backlog/<horizon>/` — everything else: `horizon: later \| captured \| done \| abandoned` regardless of ownership, *plus* `horizon: soon` items that are *unowned* (no `of-goal`).
  Per [backlog/_index.md](../backlog/_index.md), `backlog/soon/` holds next-milestone-shaped unowned candidates; once such an item is claimed by a goal, it migrates to `tasks/<area>/`.

## Theory grounding

Per [predicated-work](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/_index.md), a task in this directory is the *leaf executable unit* of the work hierarchy:

- Every task carries a regime tag per [regime-of-task](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/regime-of-task.md); the regime determines the settling discipline that applies and is the precondition for dispatch.
  A task without a regime is not yet a task — it is a candidate.
- Placement here (vs `backlog/<horizon>/`) is gated by [dispatch-readiness](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/dispatch-readiness.md): only tasks whose readiness predicate (existential capability + scope + cadence-window) holds at the active cadence belong under `tasks/<area>/`.
  The `_conventions.md` placement rule is precisely the operational form of that predicate.
- Strict separation between dispatch-ready and not-yet-ready (the `tasks/` vs `backlog/` boundary) is [dispatch-readiness-regime-is-strict](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/dispatch-readiness-regime-is-strict.md): the readiness regime admits no intermediate state, which is why an item is exactly one of "in `tasks/<area>/`" or "in `backlog/<horizon>/`" and never both.
- The `owned-by-office` + `area` resolution that routes a task to its handler is [capability-availability-from-existential](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/capability-availability-from-existential.md) plus the [capability-matching](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/capability-matching.md) discipline: the office's capability fiber must existentially cover the task's required-capability predicate.
- Task hand-off to the assigned office is [dispatch](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/dispatch.md), and once dispatched the office's fiber state can only advance — that is [dispatch-monotonicity](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/dispatch-monotonicity.md), which is what licenses the `status` lifecycle to be append-only rather than freely re-writable.
- The four areas (`engineering`, `governance`, `operational`, `research`) partition the dispatchable surface by the office that holds the matching capability fiber — they are *not* the four-regime classification of [work-stream-count-as-four-regime-classification](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/work-stream-count-as-four-regime-classification.md) (which classifies regimes, not areas); the area split is operational-routing, the regime tag is per-task.

The two non-`kind: task` siblings here (`admin/` runbooks, `mining/` triage) are excluded from work-graph audits precisely because they are not regime-tagged tasks — they live in a different category that the work hierarchy invariants do not constrain.
