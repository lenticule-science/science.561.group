---

name: "Work Item"
description: "An element of a task — either an atomic work unit or a composite workflow. Work items are the things that appear in queues, backlogs, and plans as trackable entries."
date-created: 2026-03-18
date-modified: 2026-04-03
---

A work item is an element of a [task](./task.md). It is either:

- **Atomic**: a [work unit](./work-unit.md) — concrete, executable, producing a single named output
- **Composite**: a [workflow](./workflow.md) — a structured composition of work items with defined inputs and outputs

This makes work item a recursive type: a workflow is itself a work item, so tasks can contain both atoms and compounds at any depth.

## What makes something a work item

A work item is a piece of work that has been judged actionable and placed somewhere trackable — a [queue](./queue.md), a [backlog](./backlog.md), or a [plan](./plan.md). The key transition: raw input (an idea, a request, a problem noticed) becomes a work item when someone decides "this needs doing" and commits it to the system.

Every work item has:

- **An identifier** — what distinguishes it from other items
- **A description of the work** — what action to take, stated in imperative form
- **A status** — at minimum, whether it is open, in progress, or completed

## Relationship to other concepts

Work items are the things that flow through the operations loop. They are created during planning, placed in queues during dispatch, advanced during execution, observed during tracking, assessed during review, and potentially revised during feedback.

A work item is not the same as a task, though the terms are often used interchangeably. A [task](./task.md) is a planning-level container that may hold multiple work items. A work item is the individual trackable entry. In practice, simple tasks contain a single work item and the distinction collapses.

## See also

- [work unit](./work-unit.md) — the atomic case
- [workflow](./workflow.md) — the composite case
- [task](./task.md) — the planning container
- [queue](./queue.md) — where work items wait for dispatch
