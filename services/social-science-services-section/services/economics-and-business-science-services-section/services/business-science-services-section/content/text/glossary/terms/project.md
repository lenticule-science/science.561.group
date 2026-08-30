---
id: project
description: "A Project is a named set of Plans with a stated goal and an optional DefaultPlan list. The top-level container for all work in a locale or across the system."
defines: Project
uses: Plan
params:
  goal: relational-universe
  plans: relational-universe
output: relational-universe
ast:
  relational-universe-morphism:
    - goal
    - plans
---

# Project

## What it is

A **Project** is a named set of [Plans](./plan.md) oriented toward a single stated goal.
It is the top-level work container: Projects contain Plans, Plans contain [Tasks](./task.md), Tasks contain [OperationItems](./operation-item.md).

A Project MUST have a stated goal — without one it cannot be known when the Project is complete.
A Project MUST name its Plans explicitly — Plans do not self-assign to Projects.
A Project MUST have at most one DefaultPlan sort function — multiple sort functions conflict.
A Project CANNOT have an unnamed goal.
A Project CANNOT share a Plan with another Project — each Plan has exactly one owning Project.

A Project has:

- A **name** — human-readable identifier
- A **goal** — one sentence: what success looks like when the Project is complete
- A **set of Plans** — the Plans that constitute this Project's work
- An optional **DefaultPlan list** — Plans to work on when the normal task queue is empty; may include an optional sort function to prioritize among them

## DefaultPlan

A DefaultPlan is not a special kind of Plan.
It is a designation: this Project's Plans to fall back to when no other work is urgent.
A Project can designate zero or more of its Plans as default.
When multiple Plans are default, an optional sort function determines priority (for example, prefer the Plan with the most open OperationItems, or always start with a specific Plan).

The DefaultPlan concept captures "north star" work: important, perpetually open, never urgent — but always worth doing when the queue is otherwise clear.

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

Projects are not currently serialized as a separate file type.
The immediate representation is via `ProjectContent` in the Unit store and the locale directory structure (one locale ≈ one Project).

## Relationship to the repo structure

The repo currently treats each locale (math, proof, spec, src, root) as an implicit Project.
The `PLANS_*.md` files are that Project's Plans.
Making Projects explicit allows:

- Cross-locale Projects (for example, "relational machine v1") that own Plans in multiple locales
- Explicit DefaultPlan designation at the repo level (currently `texture-c4-components`)
- Project-level status: goal achieved when all Plans are complete

## Open questions

- Formal serialization format for Project metadata (currently implicit in directory structure; may become a `PROJECT.md` file per locale or a root-level registry)
- Whether the repo-level "work anywhere when queue is empty" policy should be a single root Project or a cross-cutting DefaultPlan designation
