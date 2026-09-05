---

title: "Project"
extends: [container, work]
restricts: endeavor
description: "A named container of related plans oriented toward a single stated goal. The highest-level grouping of work below organizational goals."
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
