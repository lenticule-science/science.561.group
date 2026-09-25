---

extends: [record, work]
display:
  headline: title
  body: goal
  metadata: [status, work-type, part-of, depends-on, assigned-to]
  list: [input, output]
help-predicates: [id, goal, status, work-type, part-of, depends-on, subtasks]
restricts: work
description: "A goal-directed unit of work — decomposable into subtasks, terminating when the goal is achieved, failed, or abandoned."
aliases: [tasks]
composes: goal, subtasks, plan
decomposes-to: task, operation
composes-into: workflow
terminates-on: goal-achieved, goal-failed, goal-abandoned
work-types: process, procedure, derivation, inquiry
can-be-part-of: plan
can-be-assigned-to: office
has: [status, priority, goal, requires-concepts, requires-capabilities, requires-skills, subtasks, touches]
depends-on-takes: task
assigned-to-takes: office
requires-concepts-takes: term
requires-capabilities-takes: capability
requires-skills-takes: skill
subtasks-takes: task
date-created: 2026-03-29
date-modified: 2026-05-01
---

A task is a unit of work organized around a goal.
It has three parts: a goal (what counts as done), a set of subtasks or operations (what must happen to get there), and a plan (the order and conditions under which subtasks execute).

The goal defines the task.
The task succeeds when the goal is achieved.
The task fails when the goal becomes impossible.
The task is abandoned when the agent releases the goal.
Without a goal, there is activity but not a task — the goal is what gives the work its boundary.

Tasks decompose hierarchically.
A task breaks into subtasks, which break into smaller subtasks, down to atomic operations that cannot be decomposed further.
This hierarchy is the basic structure of all organized work — from military mission planning (mission → phases → tasks → subtasks) to software development (epic → story → task → subtask) to project management (project → work packages → activities).

The plan specifies how subtasks relate.
Subtasks may be sequential (do A then B), conditional (if X then do A, else do B), concurrent (do A and B simultaneously), or cyclic (do A until condition Y).
The plan is not always fully specified in advance — it may be elaborated as earlier subtasks complete and more information becomes available.

A task can contain any of the four work types.
A task whose every subtask is a [process](process.md) is itself a process.
A task with conditional subtasks is a [procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md).
A task that includes open-ended investigation is an [inquiry](inquiry.md).
The task is the container; the work type characterizes what kind of work fills it.

Tasks compose into [workflows](workflow.md).
A workflow is a directed graph of tasks, where edges represent dependencies (task B cannot start until task A completes) or information flow (task B uses task A's output).
A workflow is itself a task at a higher level of description — it has a goal, subtasks (the individual tasks), and a plan (the graph structure).

The stopping criterion for decomposition is practical, not formal.
Annett and Duncan's $p \times c$ rule: stop decomposing when the probability of failure times the cost of failure falls below a threshold.
High-risk operations get decomposed further.
Low-risk operations are treated as atomic.
The grain of decomposition matches the stakes, not any abstract standard of atomicity.

## The `subtasks:` field

When a task is composite — when its work-type is procedure or it requires multiple capabilities that no single agent provides — its subtasks become first-class entities.
The parent task's frontmatter declares `subtasks: [<subtask-id>, ...]
` and each subtask is its own file with its own atomic work-type, requires-capabilities, and assigned-to.

Dispatch of a composite parent is *dispatch-to-coordinator*: the coordinator agent (planner or first-officer, depending on the parent's domain) receives the parent and emits the subtask graph for ordinary dispatch.
Dispatch of a leaf subtask proceeds normally.

Example.
The task "build an achievement system" is procedure-type and requires both writing and review.
No single agent provides both capabilities.
The decomposition:

```yaml
# achievement-system.md (parent)
---
title: "Achievement system"
work-type: procedure
subtasks:
  - design-achievement-data-model     # derivation, architect
  - implement-achievement-trigger-hook # procedure, harness-optimizer
  - review-achievement-implementation # derivation, code-reviewer
  - document-achievement-system        # process, doc-updater
---
```

Each subtask file is independently dispatchable.
The parent's status derives from the subtasks: in-progress while any subtask is open, completed when all are completed.

## Task vs plan

A task with subtasks blurs the boundary toward [plan](plan.md).
The distinguishing heuristic: a task has a single completion (the goal is met or it isn't); a plan is a container that gains and loses tasks over time without ending.
A composite procedure task with a fixed subtask list is still a task.
A plan with an evolving task list is a plan.
When in doubt, model as a plan and let the tasks come and go.
