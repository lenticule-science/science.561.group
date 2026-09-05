---

specialization:
  - command-term
  - plan
  - library/domains/humanities/domains/sociology/domains/work/terms/plan.md
  - contributes-to-plan
description: "How a command structure uses a plan — the operational predicates a plan carries beyond its library definition."
inversion: has-task
status-values: [draft, active, blocked, paused, completed, abandoned, archived]
assigned-to-takes: office
work-type-takes: [inquiry, derivation, procedure, process]
department-takes: [command, science, engineering]
serves-takes: [goal, objective, system]
depends-on-takes: [plan, task]
produces-takes: [term, text, function, tool, enriched-fiber]
requires-takes: [term, tool, function]
enabled-by-takes: plan
project-takes: project
method-takes: term
horizon-values: [session, week, month, quarter, year, indefinite]
date-created: 2026-04-12
---

A plan in a command context carries the library definition's predicates (goal, definition-of-done, milestones, ordering, requires-concepts) plus operational predicates that the library doesn't define: who owns it (`assigned-to`), what kind of work it involves (`work-type`), which department it belongs to (`department`), what goals or systems it serves (`serves`), what it depends on and what it produces.

The `status` predicate governs the plan's lifecycle. Valid values are defined by the status terms in the library; a command structure recognizes: draft (not yet adopted), active (adopted, in progress), blocked (adopted but cannot advance), paused (adopted, deliberately suspended), completed (goal achieved), abandoned (goal released), archived (historical, no longer tracked).

A plan's constituent tasks point at it via their own `plan: <plan-slug>` claim. The plan does not list its tasks; the substrate's `plan ↔ has-task` inversion populates the back-walk at the plan's subject. Consumers walk `has-task` to find the plan's tasks (and any other entities whose `plan:` predicate names this plan, e.g. milestones — filter by `specialization` to disambiguate).

Task ordering is carried by each task's `depends-on:` claim, not by a plan-level ordering predicate. The dependency DAG is the union of task-level dependencies, walkable from any task without consulting the plan.

The `method` predicate points to a library term that grounds how the plan proceeds — e.g., a convergent-enrichment plan points to the convergent-enrichment method term.
