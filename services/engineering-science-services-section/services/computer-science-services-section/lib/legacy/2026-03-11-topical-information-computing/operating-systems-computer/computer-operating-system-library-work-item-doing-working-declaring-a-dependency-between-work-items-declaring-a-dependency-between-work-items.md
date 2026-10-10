---
name: declaring-a-dependency-between-work-items
description: Writes (a, depends-on, b) — a typed predication cell asserting a depends on b. Future block-propagation closure rules can fire on this edge.
specializing: asserting-positing-morphism
status: stub
---

A **declaring-a-dependency-between-work-items** call is the asserting positing that adds an entry to a's depends-on cell pointing at b.
Per the workflow-predicate-category, depends-on is a workflow predicate; this transformer is its primary writer.
Cycles are forbidden — a separate validating transformer checks the depends-on graph remains a DAG.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
