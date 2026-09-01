---
name: 0084-traced-step-observation
act: TracedStepObservation
index: 84
top: CompleteTrace
bottom: StepObservation
summary: >-
  Individual step-observation bindings must be recorded along the whole trace.
  *Complete Trace* therefore witnesses *Step Observation*, producing ***Traced
  Step Observation*** (`TracedStepObservation`).
strata:
  - observation
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Individual step-observation bindings must be recorded along the whole trace.  *Complete Trace* therefore witnesses *Step Observation*, producing ***Traced Step Observation*** ([TracedStepObservation](0084-traced-step-observation.md)).

This composition threads the bindings across the trace, establishing *Traced Step Observation*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
