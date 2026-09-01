---

specialization:
  - command-term
  - project
  - library/domains/humanities/domains/sociology/domains/work/terms/project.md
  - contributes-to-project
description: "How a command structure uses a project — the operational predicates a project carries beyond its library definition."
inversion: has-plan
status-values: [active, completed, abandoned, archived]
contains-takes: plan
serves-takes: [goal, endeavor]
coordinated-by-takes: campaign
date-created: 2026-04-12
---

A project in a command context carries the library definition's predicates (status, goal, completion-criteria) plus operational predicates: what goals it serves and what campaign coordinates it.

A project is the highest-level grouping of work below goals. Constituent plans point at the project via their own `project: <project-slug>` claim; the substrate's `project ↔ has-plan` inversion populates the back-walk. Consumers walk `has-plan` from a project subject to find its plans. The project is complete when its goal is achieved — determined by its completion-criteria predicate.
