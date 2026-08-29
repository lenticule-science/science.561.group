---
id: task
description: "A Task is a named, bounded collection of WorkItems within a Plan, with a stated completion condition. The planning container; corresponds to what PLANS.md currently renders as a workflow section."
defines: Task
---

# Task

## What it is

A **Task** is a named group of [WorkItems](work-item.md) within a [Plan](plan.md).
It has a name, a completion condition, and a status. When all its WorkItems are
done and the completion condition holds, the Task is complete and its named output
exists.

Tasks are the planning-level containers. They are what you read when you open
PLANS.md and see `### heading / **Produces:** / **Complete when:**` sections.

## Structure

```markdown
### {task-name}

**Added:** YYYY-MM-DD
**Produces:** {named output -- what exists when this task is complete}
**Complete when:** {condition -- how to know the task is done}
**Status:** open | complete | blocked | abandoned

- [ ] {work item}
- [x] {work item} -- done
```

## MUST

- Name its output — a Task that does not state what it produces cannot be
  known to be complete
- State a completion condition — without one, the Task loops indefinitely
- Contain only WorkItems that contribute to its named output

## CAN

- Contain WorkItems of any type: atomic WorkUnits or composite Workflows
- Spawn new WorkItems during execution (via post-work-update)
- Be blocked — a valid state, not a failure
- Be abandoned with an explicit reason

## CANNOT

- Have an unnamed output — "do things in spec/" is not a Task output
- Span multiple departments without a named handshake artifact —
  cross-department work MUST be split into one Task per department

