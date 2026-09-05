---
name: declaring-a-block
description: Writes (a, blocks, b) — equivalent to declaring-a-dependency in the converse direction (b depends-on a). Provided as an ergonomic alias.
specializing: asserting-positing-morphism
status: stub
---

A **declaring-a-block** call writes (a, blocks, b), which by the converse morphism in the workflow-predicate-category is the same cell as (b, depends-on, a).
The transformer normalizes to the depends-on direction in the stored cells so the depends-on graph remains canonical.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
