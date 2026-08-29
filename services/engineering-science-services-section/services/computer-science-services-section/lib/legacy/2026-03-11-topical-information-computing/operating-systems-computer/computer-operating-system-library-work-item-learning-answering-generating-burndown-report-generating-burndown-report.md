---
name: generating-burndown-report
description: Generates a burn-down report for a project/campaign showing remaining-work over time. Derived from the work-item jsonl's transition history.
specializing: closing-rule-positing-morphism
status: stub
---

A **generating-burndown-report** call is a closure-rule firing that aggregates the work-item.jsonl transition history into a time-bucketed series of (date, remaining-open-tasks, completed-tasks) tuples for a given target project or campaign.
Produces a plot-ready table.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
