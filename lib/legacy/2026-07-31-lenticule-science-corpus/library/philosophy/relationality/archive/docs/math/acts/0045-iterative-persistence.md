---
title: Persisting Iteratively
act: IterativePersistence
index: 45
slug: iterative-persistence
top: ReflexStepPersistence
bottom: CompleteTrace
summary: >-
  Persistence captures exactly when the iterated reflex step stabilizes along
  the entire trace, so we let the act *Reflex Step Persistence* witness the
  act *Complete Trace*.
strata:
  - trace
phase: free
keywords:
  - act
---
# Persisting Iteratively

## Interpretation

Persistence captures exactly when the iterated reflex step stabilizes along the entire trace, so we let the act *Reflex Step Persistence* witness the act *Complete Trace*.

The composition `(ReflexStepPersistence CompleteTrace)` explicitly places the persistence witness across the whole trace.  This records the condition “after finitely many steps the behaviour stays the same everywhere,” hence the name *Iterative Persistence*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
