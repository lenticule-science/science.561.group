---
name: declaring-a-contribution-to-a-goal
description: Writes (a, contributes-to, parent) — asserts that a contributes to parent in the work hierarchy. Used by rolling-up-progress for completion derivation.
specializing: asserting-positing-morphism
status: stub
---

A **declaring-a-contribution-to-a-goal** call is the asserting positing that adds parent to a's contributes-to set.
The naming says 'goal' but the transformer is parent-kind-agnostic — a can contribute to a goal, milestone, campaign, objective, project, plan, phase, or sprint.
The contribution edges form a forest (possibly DAG with multi-contribution); rolling-up-progress walks it.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
