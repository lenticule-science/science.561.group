---
title: "Work orchestration"
description: "Substrate vocabulary for organizing work: campaigns, milestones, goals, objectives, tasks. Hierarchy. Progress tracking. Dispatch integration."
kind: index
---


Substrate-resident vocabulary for organizing work over time and across people.
Campaigns (multi-month initiatives) decompose into milestones (delivery checkpoints) decompose into goals (outcomes) decompose into tasks (specific work units).
Dispatch routes tasks to offices.

This section establishes the **substrate vocabulary**.
The user-facing tasks/knowledge/dispatch apps at v0.7 build UIs on top of these primitives.

## Specs

- [campaign.md](campaign.md) — campaigns as substrate entities; quarterly/annual scope; office ownership; budget linkage.
- [milestone.md](milestone.md) — milestones as delivery checkpoints; campaign decomposition; target ords.
- [goal.md](goal.md) — goals as outcomes; milestone decomposition; success criteria.
- [objective.md](objective.md) — objectives in OKR-style; key results; alignment with campaigns.
- [task.md](task.md) — tasks as substrate entities; dispatch-ready units of work; lifecycle.
- [hierarchy.md](hierarchy.md) — relationships between campaign/milestone/goal/task; rollup and drill-down.
- [progress-tracking.md](progress-tracking.md) — completion %, burn-down, blockers, velocity.

## Theory grounding

The substrate-resident vocabulary established here is the *operational* face of [predicated-work](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/_index.md) — work as predication-settling over a work-themed predicate category.
The mapping from spec primitive to theory entity is direct; the spec is the realisation, the theory is the algebra.

### Concepts

The work vocabulary is grounded in predicated-work concepts:

- [dispatch-readiness](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/dispatch-readiness.md) — when a task may be dispatched (existential capability + scope + cadence-window).
- [capability-matching](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/capability-matching.md) — how an office's capability fiber matches a task's required-capability predicate.
- [cadence](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/cadence.md) and [cadence-as-modal-frame](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/cadence-as-modal-frame.md) — the temporal frame milestone/sprint cadence imposes on settlement.
- [work-regime](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/work-regime.md) — the regime classification (strict / aperiodic / cyclic / scott-continuous) a task or recurrent-practice falls under.
- [operational-evidence](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/operational-evidence.md) — what counts as a witness against a task's claim of completion.
- [closure-driven-coordination](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/closure-driven-coordination.md) — coordination across offices is a closure-rule property, not a scheduler.

### Spec ↔ morphism map

| Spec | Predicated-work morphism |
|---|---|
| [task.md](task.md) lifecycle, dispatch hand-off | [dispatch](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/dispatch.md) |
| [hierarchy.md](hierarchy.md) decomposition (campaign → milestone → goal → task) | [decompose-task](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/decompose-task.md) and [lift-task-to-plan](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/lift-task-to-plan.md) |
| [progress-tracking.md](progress-tracking.md) increment recording | [witness-as-increment](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/witness-as-increment.md) |
| [progress-tracking.md](progress-tracking.md) periodic settling | [settle-cycle](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/settle-cycle.md) |
| Witness-conflict resolution at the task scope | [adjudicate-witness-conflict](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/adjudicate-witness-conflict.md) |
| Office-capability projection consumed by [task.md](task.md)'s readiness check | [project-fiber-to-capability](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/project-fiber-to-capability.md) |
| Retrospective on closed [milestone.md](milestone.md) | [retrospect-via-cosettling](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/retrospect-via-cosettling.md) |

### Spec ↔ theorem map

| Theorem | Authorises |
|---|---|
| [completion-as-quiescence](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/completion-as-quiescence.md) | [progress-tracking.md](progress-tracking.md) reading "task is complete" as "settling has quiesced over the task's predicate column"; *not* a separate `state` field |
| [plan-completion-as-meet](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/plan-completion-as-meet.md) | [hierarchy.md](hierarchy.md) and [progress-tracking.md](progress-tracking.md) rolling up plan-level completion as the bilattice meet of constituent task completions |
| [decomposition-as-base-change](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/decomposition-as-base-change.md) | [hierarchy.md](hierarchy.md) drilling down: decomposition is base-change of the predication-fibration along the of-goal / of-milestone / of-campaign morphism, not ad-hoc tree-walk |
| [dispatch-monotonicity](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/dispatch-monotonicity.md) | [task.md](task.md) dispatch preserving the readiness order; once a task is dispatched, the office's fiber state can only advance |
| [capability-availability-from-existential](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/capability-availability-from-existential.md) | [task.md](task.md)'s required-capability check using the existential quantifier on the capability fiber, not an ACL membership query |
| [regime-of-task](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/regime-of-task.md) | [task.md](task.md) tagging each task with its regime, which determines the settling discipline that applies |
| [workflow-composition](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/workflow-composition.md) | [hierarchy.md](hierarchy.md) composing across spec primitives (a multi-step goal IS a composed workflow over its tasks) |
| [multi-agent-work-as-crdt](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/multi-agent-work-as-crdt.md) | shared-campaign federation in conformance §4 — convergence is forced by the underlying CRDT structure |
| [agent-team-as-bilattice-network-sheaf](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/agent-team-as-bilattice-network-sheaf.md) | cross-office collaboration on a shared goal as a sheaf over the office-network; conformance §4 federation is the sheaf-restricted-to-two-peers case |

### Subordinate citations (still in scope, narrower)

- [`agential-orchestration-platform/objects/dispatch-table`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/objects/dispatch-table.md) and [`agential-orchestration-platform/morphisms/dispatch-matching`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/morphisms/dispatch-matching.md) — the AgOP-stratum specialisations of `predicated-work/morphisms/dispatch` consumed by [task.md](task.md)'s router.
- [`predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) — authorises [hierarchy.md](hierarchy.md)'s rollup-fold (per [implementation/capability-ladder.md §7A](../../implementation/capability-ladder.md)).
- The captain's existing rsc-quiescent work-orchestration material in `operations/engineering/triage/operations/command/commands/rsc-quiescent/triage/work-orchestration/` — informal predecessor; predicated-work is now the formal grounding.

## Conformance

Work orchestration passes:

1. Campaign → milestone → goal → task hierarchy: query rolls up correctly. *Theory ground:* [plan-completion-as-meet](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/plan-completion-as-meet.md) — rollup is the bilattice meet across the cell-set defined by `decompose-task`.
2. Task dispatch routes to assigned office. *Theory ground:* [dispatch-monotonicity](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/dispatch-monotonicity.md) — the routing relation respects the readiness order.
3. Progress queries return current state deterministically. *Theory ground:* [completion-as-quiescence](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/completion-as-quiescence.md) — a query reads the quiescent value of the predicate column, not a stored derived field.
4. Federation: shared campaigns federate per joint-decision. *Theory ground:* [multi-agent-work-as-crdt](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/multi-agent-work-as-crdt.md) and [agent-team-as-bilattice-network-sheaf](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/agent-team-as-bilattice-network-sheaf.md).
5. Each task is regime-tagged on creation; the tag drives downstream settlement discipline. *Theory ground:* [regime-of-task](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/regime-of-task.md).
