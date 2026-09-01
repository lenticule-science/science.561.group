---
name: work-item
description: A predication-shape whose inhabiting entities are units of work managed in the OS lifecycle. Defined by 9 characteristic cells — 3 required (has-kind, has-status, owned-by), 6 optional (assigned-to, has-priority, has-deadline, depends-on, contributes-to, blocked-by) — and a lifecycle state-machine on 8 status-objects. Derived in study-notes/work-item-as-predication-shape.md.
specializing: predication-shape
references:
  belnap1977:
    class: chapter
    authors: ["Belnap, Nuel D."]
    year: 1977
    title: "A useful four-valued logic"
    in: "Modern Uses of Multiple-Valued Logic"
    publisher: "D. Reidel"
---

A **work-item** is the predication-shape inhabited by entities the 561 OS treats as units of work — the things the OS plans, dispatches, tracks, completes, or abandons.
The shape is derived as Sig(F) per the predication-shape construction in [the bootstrapping-the-workflow-library project's study notes](../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md).

## Characteristic cells

| i | predicate | subject-sort | object-sort | cardinality |
|---|-----------|--------------|-------------|-------------|
| 1 | has-kind        | E_workitem | Σ_kind     | required, single-valued |
| 2 | has-status      | E_workitem | Σ_status   | required, single-valued |
| 3 | owned-by        | E_workitem | E_actor    | required, single-valued |
| 4 | assigned-to     | E_workitem | E_actor    | set-valued, optional |
| 5 | has-priority    | E_workitem | Σ_priority | optional, single-valued |
| 6 | has-deadline    | E_workitem | Σ_date     | optional, single-valued |
| 7 | depends-on      | E_workitem | E_workitem | set-valued, optional |
| 8 | contributes-to  | E_workitem | E_workitem | set-valued, optional |
| 9 | blocked-by      | E_workitem | Σ_reason   | optional, single-valued; present iff has-status = blocked |

Inhabitance criterion: e inhabits work-item iff the cell-graph at e contains (e, has-kind, k), (e, has-status, s), (e, owned-by, owner) — cells 4–9 refine but do not gate.

## Specializations

The 14 work-item kinds — task, goal, milestone, campaign, objective, project, expedition, plan, phase, sprint, question, decision, friction-note, triage-note — specialize work-item via predicate-specialization, each narrowing the has-kind cell to a single kind-slug and possibly adding kind-specific characteristic cells.
They live under [the library subdir](library/).

## Lifecycle

The lifecycle is realized as [lifecycle-state-machine](library/lifecycle-state-machine/lifecycle-state-machine.md) — a thin category on 8 status-objects whose morphisms are valid transitions.
All status-changing positings are contesting per Belnap's speech-act partition.

## Workflow predicates

The 9 workflow predicates form the object set of [workflow-predicate-category](../workflow-predicate-category/workflow-predicate-category.md) — a sub-category of the OS-wide predicate-category C with morphisms inherited from the four canonical generators.
