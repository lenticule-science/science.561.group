---
id: project
description: "A Project is a named set of Plans with a stated goal and an optional DefaultPlan list. The top-level container for all work in a department or across the system."
defines: Project
---

# Project

## What it is

A **Project** is a named set of [Plans](plan.md) oriented toward a single stated goal.
It is the top-level work container: Projects contain Plans, Plans contain
[Tasks](task.md), Tasks contain [WorkItems](work-item.md).

A Project has:

- A **name** — human-readable identifier
- A **goal** — one sentence: what success looks like when the Project is complete
- A **set of Plans** — the Plans that constitute this Project's work
- An optional **DefaultPlan list** — Plans to work on when the normal task queue is
  empty; may include an optional sort function to prioritize among them

## DefaultPlan

A DefaultPlan is not a special kind of Plan. It is a designation: this Project's
Plans to fall back to when no other work is urgent. A Project can designate zero or
more of its Plans as default. When multiple Plans are default, an optional sort
function determines priority (e.g., prefer the Plan with the most open WorkItems, or
always start with a specific Plan).

The DefaultPlan concept captures "north star" work: important, perpetually open,
never urgent — but always worth doing when the queue is otherwise clear.

## Structure (conceptual)

```
Project: {name}
  goal: {one sentence — what success looks like}
  plans:
    - {plan-id}          # references PLANS_*.md files or named plan units
    - {plan-id}
  default_plans:
    - plan: {plan-id}
      sort: {optional: "by_open_count" | "by_added_date" | none}
```

Projects are not currently serialized as a separate file type. The immediate
representation is via `ProjectContent` in the Unit store and the department
directory structure (one department ≈ one Project).

## MUST

- Have a stated goal — a Project without a goal cannot be known to be complete
- Name its Plans explicitly — Plans do not self-assign to Projects
- Have at most one DefaultPlan sort function — multiple sort functions conflict

## CAN

- Span multiple departments when Plans have named handshake artifacts via INBOX
- Have zero Plans (empty Project, not yet started)
- Have all Plans designated as default (entire Project is "north star" work)
- Be abandoned with an explicit reason

## CANNOT

- Have an unnamed goal — "work on things" is not a Project goal
- Share a Plan with another Project — Plans have exactly one owning Project

## Relationship to the repo structure

The repo currently treats each department (math, proof, spec, src, root) as an
implicit Project. The `PLANS_*.md` files are that Project's Plans. Making Projects
explicit allows:

- Cross-department Projects (e.g., "relational machine v1") that own Plans in
  multiple departments
- Explicit DefaultPlan designation at the repo level (currently `texture-c4-components`)
- Project-level status: goal achieved when all Plans are complete

## Pending

- Formal serialization format for Project metadata (currently implicit in directory
  structure; may become a `PROJECT.md` file per department or a root-level registry)
- Whether the repo-level "work anywhere when queue is empty" policy should be a
  single root Project or a cross-cutting DefaultPlan designation
