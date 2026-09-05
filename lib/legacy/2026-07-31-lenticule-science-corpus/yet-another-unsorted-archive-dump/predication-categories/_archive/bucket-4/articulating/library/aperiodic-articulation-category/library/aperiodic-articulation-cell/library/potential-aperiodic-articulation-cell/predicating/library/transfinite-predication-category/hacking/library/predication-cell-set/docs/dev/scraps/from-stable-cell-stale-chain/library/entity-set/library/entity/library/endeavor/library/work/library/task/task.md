---
name: task
description: A goal-directed container for work. An entity-form whose characteristic predication-shape names what counts as done, what work is organized within it, and what other tasks must precede it.
---

## Pure form

A task is a named unit of organization around a goal. The defining predication: `(task, has-goal, goal-description)`. Without a goal predication, there is no task — only a collection of work with no termination condition.

A task terminates when its goal is achieved (completed), when the goal becomes impossible (failed), or when the agent releases the goal (abandoned).

## Characteristic predication-shape

- `has-goal(task, goal-description)` — what counts as done; the individuating predication.
- `has-status(task, status)` — current lifecycle state.
- `contains(task, work)` — the work organized within this task.
- `decomposes-into(task, subtask)` — subtask relation; acyclic.
- `depends-on(task, task)` — another task that must complete before this one can proceed.
- `assigned-to(task, agent)` — dispatch relation; lives on an Assignment entity per the referencing-entity pattern, not directly on the task.

## Decomposition

Tasks decompose into subtasks acyclically. A parent task's goal is settled when its subtasks' goals are settled (AND-decomposition by default). Decomposition does not commit to execution order; ordering is expressed via `depends-on` between subtasks.
