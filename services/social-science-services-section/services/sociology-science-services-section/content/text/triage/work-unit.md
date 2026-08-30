---

title: "Work Unit"
description: "A concrete, fully specified instance of work — all parameters bound, one operation, one output. The most atomic executable thing in the work hierarchy."
defines: Work Unit
related: Work, Task, Process, Procedure
date-created: 2026-03-18
date-modified: 2026-04-03
---

A work unit is a concrete, fully specified instance of [work](./work.md). All parameters are bound to specific values: who does it, what they do it to, what operation they perform, and what output they produce. Nothing is left open.

## What makes something a work unit

The defining property is **complete specification**. A work unit names:

- **What goes in** — the specific input or material being worked on
- **What operation is performed** — the specific transformation applied
- **What comes out** — the specific output produced
- **What parameters govern execution** — the concrete values that distinguish this instance from any other

A task like "review the dispatch survey" is a work unit: the input (dispatch survey), the operation (review), and the expected output (review findings) are all specified. A task like "improve the documentation" is not a work unit — it leaves the operation and scope open.

## Relationship to tasks

A [task](./task.md) becomes a work unit when all of its parameters are bound. Many tasks are written as work units from the start. Others start partial ("research scheduling theory") and become work units as the plan is refined ("write a survey text covering CPM, PERT, and Goldratt, producing scheduling-theory-survey.md").

## Atomicity

A work unit is the most atomic executable thing in the work hierarchy. It cannot be decomposed further without losing its identity as a single operation producing a single output. If decomposition is needed, the result is multiple work units, not subdivisions of the original.

## Work type

Every work unit has a [work type](./work.md) — it is either a [process](./process.md) (fully determined), a [procedure](./procedure.md) (execution varies), a [derivation](./derivation.md) (output follows from rules but is not predetermined), or an [inquiry](./inquiry.md) (both meaning and execution are open). The work type determines how the unit should be dispatched, monitored, and reviewed.
