---
name: finding-claimable-work
description: Walks all work-items and returns those with no claimed-by cell — work the OS would let any actor pick up.
specializing: abstaining-positing-morphism
status: stub
---

A **finding-claimable-work** call is the abstaining positing (read-only) that scans the work-item cell space for entities with (e, has-status, open) and no (e, claimed-by, *) cell.
Returns an ordered list by priority and deadline.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
