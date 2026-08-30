---

title: "Project"
extends: [container, work]
restricts: endeavor
description: "A named container of related plans oriented toward a single stated goal. The highest-level grouping of work below organizational goals."
defines: Project
related: Plan, Task, Goal, Objective, Campaign
contains: plan
serves: goal
can-be-part-of: campaign
has: [status, goal, completion-criteria]
coordinated-by-takes: campaign
date-created: 2026-03-20
date-modified: 2026-04-06
---

A project is a named container of related [plans](./plan.md) oriented toward a single stated goal. It is the highest-level grouping of work below organizational goals — a project says "this is the thing we are trying to accomplish" and the plans within it say how.

## What makes something a project

A project has three defining properties:

1. **A stated goal.** The goal says what success looks like when the project is complete. Without a goal, a project is just a label on a pile of work — there is no way to know when it is finished.

2. **A bounded set of plans.** A project names its plans explicitly. Plans do not self-assign to projects. Each plan belongs to exactly one project, establishing clear ownership and preventing scope confusion.

3. **Completion criteria.** A project is complete when its plans are complete and its goal is satisfied. Because plans contain [tasks](./task.md) with defined completion states, project completion rolls up deterministically.

## Default work

Some projects designate certain plans as "default" — work to fall back to when no other task is urgent. Default plans capture north-star work: important, perpetually open, never urgent, but always worth doing when the potential queue is clear. This prevents the system from idling when all urgent work is done.

## Hierarchy

Projects sit between goals and plans in the work hierarchy:

- **Goal** → the organizational ambition (e.g., "modernize the records management system")
- **[Objective](./objective.md)** → a measurable target that serves a goal
- **Project** → a named body of work toward a goal, containing plans
- **[Plan](./plan.md)** → a structured commitment to actions, containing tasks
- **[Task](./task.md)** → a concrete unit of work

A single goal may have multiple projects. A project may have multiple plans. This hierarchy allows work to be tracked at every level — from "is the organization making progress on its mission?" down to "is this specific task done?"

## Coordination

Projects serve as coordination boundaries. Different agents can work on different plans within a project without stepping on each other, because the project's goal provides shared context and the plan boundaries prevent interference. Cross-project dependencies are possible but should be explicit and minimized.

## See also

- [plan](./plan.md) — the structured commitment within a project
- [task](./task.md) — the unit of work within a plan
- [work](./work.md) — the base concept


---

<!-- source: _archive/discipline-intake/business/terms/project.md -->

## Imported source: _archive/discipline-intake/business/terms/project.md

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
