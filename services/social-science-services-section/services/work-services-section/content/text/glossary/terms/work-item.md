---

title: "Work Item"
description: "An element of a task — either an atomic work unit or a composite workflow. Work items are the things that appear in queues, backlogs, and plans as trackable entries."
defines: Work Item
related: Work, WorkUnit, Workflow, Task, Queue, Backlog
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


---

<!-- source: _archive/discipline-intake/business/terms/work-item.md -->

## Imported source: _archive/discipline-intake/business/terms/work-item.md

---
id: work-item
description: "A WorkItem is what appears inside a Task: either atomic Work (a parameterized WorkUnit) or a Workflow (a closed composition of Work). WorkItems are recursive: a Workflow is itself a WorkItem."
defines: WorkItem
---

# WorkItem

*Spec-domain object*

## What it is

A WorkItem is the element of a [Task](task.md). It is either:

- **Atomic**: a parameterized [WorkUnit](work-unit.md) — concrete, executable, single named output. This is the base case.
- **Composite**: a [Workflow](workflow.md) — a set of WorkItems with the same type going in and out. This is the recursive case.

This makes WorkItem a recursive type: `WorkItem = WorkUnit | Workflow(WorkItem*)`. A Workflow is itself a WorkItem, so Tasks can contain both atoms and compounds at any depth.

A WorkItem that has been triaged, judged actionable, and placed in a Task is **committed**. Committed WorkItems have a status, an added date, and an action sentence. Items that are not yet committed are Ideas (in `IDEAS.md`).

## Required fields

Every WorkItem MUST have:

- **An identifier**: kebab-case descriptive name, unique within the file. Named by what the work produces, not by sequence position. No numeric schemes.
- **A title**: imperative noun phrase naming what is produced.
- **Added**: ISO 8601 date (YYYY-MM-DD) when this item was placed in PLANS.
- **Status**: exactly one of `open` or `deferred`. A deferred WorkItem MUST include a reason — either a **Why blocked:** sub-field or a note in the Action field.
- **Action**: one imperative sentence — the thing to do.

Every WorkItem SHOULD have:

- **Why**: one sentence of motivation, sufficient for any agent to understand why this work matters now.

The `Added` date is required because PLANS files rot. Without it there is no way to distinguish a stale item that has been sitting untouched for months from one added this session. An undated WorkItem is a compliance violation.

## Canonical format

```markdown
### {identifier}

**Added:** YYYY-MM-DD
**Status:** open | deferred
**Action:** imperative sentence describing the work.
**Why:** motivation sentence. (optional if obvious from context)
```

When a WorkItem is completed, it is deleted from the file. The work is in the repo; git history is the record. Do not leave a `**Status:** done` stub.

## Constraints

A WorkItem MUST NOT be ambiguous about what constitutes completion. If the work cannot be described in one Action sentence, it SHOULD be split into multiple WorkItems.

A WorkItem MUST NOT duplicate a `Message` that is still `unread` or `acknowledged` in `INBOX.md` — the improvement skill MUST triage INBOX before reading PLANS, so the Message gets converted to a WorkItem at that point.

A WorkItem with `**Status:** deferred` MUST include a reason: either a **Why blocked:** sub-field, or a note in the Action field explaining the condition that must be met before the item can proceed.

## Relationship to other types

- WorkItems live inside [Tasks](task.md); Tasks live inside [Plans](plan.md).
- WorkItems are produced by: the improvement skill during INBOX triage, the compliance audit, and the missing-spec discovery.
- WorkItems are consumed by: the improvement skill in its main work loop.
- An atomic WorkItem IS a committed [WorkUnit](work-unit.md) — the plan entry and the executable thing are the same object.
- A composite WorkItem IS a [Workflow](workflow.md) — it can appear anywhere an atomic WorkItem can.

## Pending

- No formal notion of WorkItem priority or ordering beyond document sequence. The improvement skill takes items in order; explicit priority marking may be needed once PLANS files become long.
