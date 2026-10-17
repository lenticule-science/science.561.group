---
name: finding-blocked-work-rooted-at-me
description: Walks work-items owned by or assigned to the caller and returns the ones in blocked status, with their blocking reasons.
specializing: abstaining-positing-morphism
status: stub
---

A **finding-blocked-work-rooted-at-me** call is the abstaining positing that scans the work-item cell space for entities with (e, owned-by, caller) ∪ (e, assigned-to, caller) and (e, has-status, blocked).
Returns the entities with their (e, blocked-by, reason) cells for diagnostic.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
