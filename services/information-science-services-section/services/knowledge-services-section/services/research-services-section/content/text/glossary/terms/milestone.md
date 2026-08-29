---

specialization:
  - command-term
  - milestone
  - library/domains/humanities/domains/sociology/domains/work/terms/milestone.md
description: "How a command structure uses a milestone — the operational predicates a milestone carries beyond its library definition."
defines: milestone
plan-takes: plan
expected-task-contributions-takes: task
milestone-reached-takes: date
date-created: 2026-04-12
---

A milestone in a command context carries the library definition (a recognizable state of a plan marking meaningful progress) plus operational predicates: which plan it belongs to, which tasks must contribute to reaching it, what the gate condition is, and when it was reached.

The `expected-task-contributions` predicate lists task slugs whose completion is necessary for this milestone. The `gate` predicate is a prose description of the conditions (pending formalization as a computable predicate). The `milestone-reached` predicate records the date the milestone was achieved — its presence is the witnessing that the gate was passed.
