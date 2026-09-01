---
name: projecting-completion-date
description: Projects a completion date for a target work-item based on the depends-on chain length and historical velocity from the jsonl history.
specializing: closing-rule-positing-morphism
status: stub
---

A **projecting-completion-date** call is a closure-rule firing that combines finding-critical-path with a velocity estimate (work-items completed per day, from the jsonl history) to project a completion date for a target.
Produces a confidence interval, not a point estimate.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
