---
name: plan

description: "A Plan is an ordered sequence of Tasks within a Project. It corresponds to a PLANS.md file in a department."
defines: Plan
---

## What it is

A **Plan** is an ordered collection of [Tasks](task.md) belonging to a [Project](project.md).
It has a name, an owning department, and a sequence of Tasks that specify the work to
be done. When all its Tasks are complete, the Plan's stated output exists.

A Plan corresponds exactly to a `PLANS.md` file in a department.
The file IS the Plan. There is one Plan per department.

## Structure

```markdown
# PLANS_{department}.md  (or PLANS.md)

## {task-name}

**Added:** YYYY-MM-DD
**Produces:** {named output}
**Complete when:** {condition}
**Status:** open | complete | blocked | abandoned

- [ ] {work item}
- [x] {work item} -- done
```

Plans are grouped by Task. Every entry in a Plan is a Task heading followed by
its WorkItems. Tasks appear in order; Tasks MUST NOT be reordered without explicit
intent, because order encodes dependency.

## MUST

- Be owned by exactly one department — a Plan that spans departments is two Plans
  with a named handshake artifact passed via INBOX
- Be named `PLANS.md` in its department directory — no other naming is valid
- Record all open Tasks before completed ones — completed Tasks may be archived or
  deleted; they are not the current state of the department
- Contain only Tasks — no floating WorkItems outside a Task heading

## CAN

- Be empty — an empty Plan is valid; it means the department has no active work
- Contain a mix of open, blocked, and abandoned Tasks
- Reference another Plan's output as a dependency (via INBOX message)

## CANNOT

- Span multiple departments without a named artifact at the boundary
- Contain Tasks that are not ultimately traceable to the Project's goal
- Have unnumbered "to-do" items floating outside a Task heading

## Relationship to PLANS.md

Each `PLANS.md` file in the repo IS a Plan. The file format is the serialized form.
The loader parses it into `WorkflowContent` (Task headers) and `WorkUnitContent`
(checklist items) Unit records in the hot store. The serializer writes them back.

## Pending

- Whether Plan-level status (all Tasks complete ⇒ Plan complete) should be
  tracked explicitly or derived from Task statuses at read time
