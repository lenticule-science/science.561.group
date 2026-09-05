---
title: Normalizing
act: Normalization
index: 72
top: TailTrace
bottom: StepTrace
summary: >-
  *Step Trace* shows reductions propagate, yet we must detect when a term
  stabilizes. Forcing *Tail Trace* to witness *Step Trace* yields
  ***Normalization*** (`Normalization`).
strata:
  - term
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

*Step Trace* shows reductions propagate, yet we must detect when a term stabilizes.  Forcing *Tail Trace* to witness *Step Trace* yields ***Normalization*** ([Normalization](0072-normalization.md)).

This composition uses earned recognitions to signal stabilization, so *Normalization* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
