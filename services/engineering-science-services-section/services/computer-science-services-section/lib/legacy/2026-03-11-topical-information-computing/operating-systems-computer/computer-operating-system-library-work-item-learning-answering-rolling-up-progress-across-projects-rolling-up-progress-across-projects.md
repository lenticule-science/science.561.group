---
name: rolling-up-progress-across-projects
description: Computes completion percentages for goals/milestones/campaigns/objectives from their contributes-to children's has-status cells. A closure-rule firing over the contribution edges.
specializing: closing-rule-positing-morphism
status: stub
---

A **rolling-up-progress-across-projects** call is a closure-rule firing — it walks the contributes-to dependency graph from leaf work-items (tasks) upward, computing per-parent the fraction of children with (child, has-status, done).
Equivalent to the completion-rollup closure rule described in the work-item-as-predication-shape derivation.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
