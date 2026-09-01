---
name: declaring-a-deadline
description: Writes (target, has-deadline, <iso-date>) — alias for scheduling-a-work-item. Provided for the framing 'I am declaring this is due then' as distinct from 'I am scheduling this'.
specializing: asserting-positing-morphism
status: stub
---

A **declaring-a-deadline** call is the asserting positing on (target, has-deadline, d).
Functionally identical to scheduling-a-work-item; the two names exist to support different framings (declaring vs scheduling) of the same act.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
