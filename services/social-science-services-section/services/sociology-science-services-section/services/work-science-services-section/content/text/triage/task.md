---
id: task
description: "A goal-directed unit of work — decomposable into subtasks, terminating when the goal is achieved, failed, or abandoned."
defines: task
aliases: [tasks]
composes: goal, subtasks, plan
decomposes-to: task, operation
composes-into: workflow
terminates-on: goal-achieved, goal-failed, goal-abandoned
work-types: process, procedure, derivation, inquiry
date-created: 2026-03-29
---

A task is a unit of work organized around a goal. It has three parts: a goal (what counts as done), a set of subtasks or operations (what must happen to get there), and a plan (the order and conditions under which subtasks execute).

The goal defines the task. The task succeeds when the goal is achieved. The task fails when the goal becomes impossible. The task is abandoned when the agent releases the goal. Without a goal, there is activity but not a task — the goal is what gives the work its boundary.

Tasks decompose hierarchically. A task breaks into subtasks, which break into smaller subtasks, down to atomic operations that cannot be decomposed further. This hierarchy is the basic structure of all organized work — from military mission planning (mission → phases → tasks → subtasks) to software development (epic → story → task → subtask) to project management (project → work packages → activities).

The plan specifies how subtasks relate. Subtasks may be sequential (do A then B), conditional (if X then do A, else do B), concurrent (do A and B simultaneously), or cyclic (do A until condition Y). The plan is not always fully specified in advance — it may be elaborated as earlier subtasks complete and more information becomes available.

A task can contain any of the four work types. A task whose every subtask is a [process](./process.md) is itself a process. A task with conditional subtasks is a [procedure](./procedure.md). A task that includes open-ended investigation is an [inquiry](./inquiry.md). The task is the container; the work type characterizes what kind of work fills it.

Tasks compose into [workflows](./workflow.md). A workflow is a directed graph of tasks, where edges represent dependencies (task B cannot start until task A completes) or information flow (task B uses task A's output). A workflow is itself a task at a higher level of description — it has a goal, subtasks (the individual tasks), and a plan (the graph structure).

The stopping criterion for decomposition is practical, not formal. Annett and Duncan's $p \times c$ rule: stop decomposing when the probability of failure times the cost of failure falls below a threshold. High-risk operations get decomposed further. Low-risk operations are treated as atomic. The grain of decomposition matches the stakes, not any abstract standard of atomicity.
