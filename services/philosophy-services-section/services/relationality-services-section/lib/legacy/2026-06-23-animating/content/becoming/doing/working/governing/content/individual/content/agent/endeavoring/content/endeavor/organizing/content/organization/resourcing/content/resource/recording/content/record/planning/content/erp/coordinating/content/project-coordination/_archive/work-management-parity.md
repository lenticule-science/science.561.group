---
name: work-management-parity
specialization: objective
serves-system: cross-cutting
date-created: 2026-04-05
serves: [operations-loop, work-operations]
metric: "Plans have definition-of-done, milestones with dates, dependencies. Tasks have acceptance criteria, effort estimates, assignment, comment history."
requires: [respond, knowledge-graph, plan, task, milestone, depth-filtration]
produces: [plan-tracking, task-management, forecasting, assignment-history]
enables: [erp-capabilities, ops-loop-functional]
depends-on:
  - ops-vocabulary-complete
  - work-vocabulary-grounded
  - writable-datastore
  - fars-architecture-coherence
horizon: quarter
architecture-note: "Under architecture.md Phase 4: plan-status, Gantt, kanban, dispatch-board are all respond()-composition formatters. Asana parity = Phase 4 completion. Each feature maps to a fibered-topos construct: dependencies = partial order, milestones = depth-filtration levels, forecasts = projected stationarity, assignment = officer-trace."
---

Work-management features map onto the nuclear quartet and the history monoid:

- **Task dependencies** = the partial order on histories (step $t_1$ must precede $t_2$).
  A task's ready-state is $\mathrm{Fix}(\sigma)$: its truth is forced by all preceding tasks being settled.
- **Definition-of-done** = the fixed fiber $H^*$ for the plan.
  A plan is done when every constituent task is in both $\mathrm{Fix}(\sigma)$ (prerequisites discharged) and $\mathrm{Fix}(\Delta)$ (result persists through all forward extensions — the outcome cannot be undone by what comes next).
- **Milestones** = named levels of the depth filtration.
  Reaching a milestone = reaching a specific level $n$ in the tower where a named proposition becomes settled.
- **Acceptance criteria** = a set of propositions at the task's fiber whose joint truth determines $\mathrm{Fix}(\Delta)$ membership.
- **Forecasts** = computing projected stationarity under the detailed balance condition (throughput = absorbing rate).
- **Comment history** = the sub-monoid of conversational steps attached to the task entity.
- **Assignment** = a specific officer-trace (office × task) extending the history.

The parity is achieved not by reimplementing Asana but by exposing these mathematical structures as operational UI: each feature is a rendering of the corresponding fibered-topos construct.
Parity is met when these structures are queryable via MCP and visible in the bridge.
