---
name: finding-critical-path
description: Computes the longest chain of depends-on edges among open work-items contributing to a target. The critical-path determines the minimum completion time.
specializing: closing-rule-positing-morphism
status: stub
---

A **finding-critical-path** call is a closure-rule firing that walks the depends-on graph rooted at a target work-item, finds the longest dependency chain that is not yet done, and returns its sequence.
Standard critical-path-method computation over the dependency DAG.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
