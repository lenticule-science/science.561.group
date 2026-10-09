---

specialization:
  - command-term
  - objective
  - library/domains/humanities/domains/sociology/domains/work/terms/objective.md
description: "How a command structure uses an objective — the operational predicates an objective carries beyond its library definition."
status-values: [open, on-track, achieved, missed, abandoned]
serves-takes: [goal, project, system]
subsumes-takes: objective
requires-takes: [term, tool, capability]
produces-takes: [term, text, tool, vocabulary]
enables-takes: [plan, objective]
depends-on-takes: [plan, objective]
horizon-values: [month, quarter, year]
date-created: 2026-04-12
---

An objective in a command context carries the library definition's predicates (metric, target, deadline, status) plus operational predicates: what goals or systems it serves, what it enables downstream, and what it depends on.

The `metric` predicate defines how progress is measured. The `target` predicate defines what counts as achieved. Together with `deadline`, these make the objective decidable — achieved or missed, no ambiguity.

Objective subsumption goes child-to-parent: a smaller objective declares `subsumed-by: <parent-slug>`. The substrate's `subsumed-by ↔ subsumes` inversion populates the parent's back-walk. An objective that subsumes children is achieved when all children are achieved; the achievement check walks the inverse fiber from the parent.
