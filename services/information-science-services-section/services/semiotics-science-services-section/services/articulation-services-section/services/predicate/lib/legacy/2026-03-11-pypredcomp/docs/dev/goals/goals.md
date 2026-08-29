---
title: "Goals"
description: "Outcome statements under each milestone. Active milestones (v0.2a, v0.2b) decompose into multiple goals; far-horizon milestones carry a single coarse goal until activated."
kind: index
---

# Goals

A goal is an outcome statement under a milestone.
Per [specs/work-orchestration/goal.md](../specs/work-orchestration/goal.md), a goal is concrete enough that "done" is a checkable predicate; it is *not* an executable unit (those live under [tasks/](../tasks/)).

## Active milestones — decomposed goals

### v0.2a — multi-user single-node

- [v0.2a-kernel-frozen.md](v0.2a-kernel-frozen.md)
- [v0.2a-multi-user-authoring.md](v0.2a-multi-user-authoring.md)
- [v0.2a-fixture-coverage.md](v0.2a-fixture-coverage.md)

### v0.2b — drivers, observability, packaging-prep

- [v0.2b-driver-model-and-three-drivers.md](v0.2b-driver-model-and-three-drivers.md)
- [v0.2b-observability-dashboards.md](v0.2b-observability-dashboards.md)
- [v0.2b-stdlib-and-dispatch-shell.md](v0.2b-stdlib-and-dispatch-shell.md)
- [v0.2b-packaging-skeleton.md](v0.2b-packaging-skeleton.md)
- [v0.2b-network-stubs.md](v0.2b-network-stubs.md)

## Coarse goals — one per far-horizon milestone

- [v0.1-substrate-shipped.md](v0.1-substrate-shipped.md) — `done`.
- [v0.3-userland-daily-driver-ready.md](v0.3-userland-daily-driver-ready.md)
- [v0.4-federate-two-nodes.md](v0.4-federate-two-nodes.md)
- [v0.5-first-physical-binding.md](v0.5-first-physical-binding.md)
- [v0.6-third-party-app-workflow.md](v0.6-third-party-app-workflow.md)
- [v0.7-productivity-stack-replaces-saas.md](v0.7-productivity-stack-replaces-saas.md)
- [v0.8-agential-runtime.md](v0.8-agential-runtime.md)
- [v0.9-learn-and-publish.md](v0.9-learn-and-publish.md)
- [v1.0-self-host.md](v1.0-self-host.md)

When a far-horizon milestone activates, the coarse goal SHOULD be replaced by multiple decomposed goals matching the milestone's scope sections.

## Theory grounding

Per [predicated-work](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/_index.md), the goal record kind is grounded as follows:

- A goal *under* a milestone is an instance of [decompose-task](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/decompose-task.md) — specifically, the goal layer is what `decompose-task` produces when its input is a milestone-scope plan.
  The "Active milestones — decomposed goals" structure above is `decompose-task` made explicit; the "Coarse goals — one per far-horizon milestone" structure is the *not-yet-applied* `decompose-task` (the morphism is licensed but has not been used).
  [`specs/work-orchestration/_index.md`](../specs/work-orchestration/_index.md) cites the same morphism at the spec layer.
- The "concrete enough that 'done' is a checkable predicate" definition is exactly [completion-as-quiescence](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/completion-as-quiescence.md) read at goal scope: a goal is well-formed iff its completion is recoverable as a quiescence query over its predicate column.
  A goal that lacks a checkable-predicate "done" criterion is not yet a goal — it is an objective fragment.
- Goal-level rollup of constituent task completion uses [plan-completion-as-meet](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/plan-completion-as-meet.md): a goal's completion is the bilattice meet of its tasks' completions, *not* an integer percentage stored on the goal record.
- The coarse-vs-decomposed distinction reflects [regime-of-task](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/regime-of-task.md): a coarse goal carries no settled task regime (so its settling discipline is undefined and it cannot be dispatched), whereas a decomposed goal inherits regime from its tasks.
  Activation of a far-horizon milestone is precisely the act of regime-tagging the previously coarse goal so its tasks become dispatchable.
