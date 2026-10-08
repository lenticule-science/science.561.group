---
name: plan
description: A commitment to a finite, dependency-ordered set of tasks toward a goal. An entity-form whose characteristic predication-shape names what must happen, in what order, and what completion looks like.
title: plan
---

## Pure form

A plan is a finite, dependency-ordered commitment of tasks toward a goal. The defining predication: `(plan, has-goal, goal-description)` together with `(plan, contains, task)` for each task in the plan. A plan without an explicit goal is a list; a plan without contained tasks is a wish.

Plans are partial — they specify some aspects of future action and leave others open for later specification. Plans are defeasible — they resist casual revision but can be abandoned or revised when reasons accumulate.

## Characteristic predication-shape

- `has-goal(plan, goal-description)` — what success looks like; the individuating predication.
- `contains(plan, task)` — task is in the plan.
- `task-depends-on(task, task)` — the dependency partial order within the plan; acyclic.
- `has-milestone(plan, milestone)` — a recognizable settlement state of the plan.
- `serves(plan, goal | objective)` — the higher work-item this plan advances.
- `part-of(plan, project | campaign)` — the container the plan belongs to.
- `has-status(plan, {draft | open | active | done | abandoned | revised})` — current lifecycle state.

## Finiteness

A plan commits to a *bounded* set of tasks. An open-ended intention is a strategy or policy, not a plan. Finiteness is what makes a plan communicable, hand-offable, and verifiable as complete.

## Defeasible stability

A plan once adopted constrains future deliberation — sessions do not re-deliberate from scratch. Revision requires *reasons*, not just preference. Silent revision is forbidden; an abandoned or revised plan leaves a witness predication.
