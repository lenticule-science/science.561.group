---
name: 0086-step-observation-head
act: StepObservationHead
index: 86
slug: step-observation-head
top: HeadTrace
bottom: StepObservationTail
summary: >-
  After tailing, we need the stabilized head of those bindings. Forcing *Head
  Trace* to witness *Step Observation Tail* yields ***Step Observation Head***
  (`StepObservationHead`).
strata:
  - observation
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

After tailing, we need the stabilized head of those bindings.  Forcing *Head Trace* to witness *Step Observation Tail* yields ***Step Observation Head*** ([StepObservationHead](0086-step-observation-head.md)).

This isolates the immediate stabilized binding, so *Step Observation Head* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
