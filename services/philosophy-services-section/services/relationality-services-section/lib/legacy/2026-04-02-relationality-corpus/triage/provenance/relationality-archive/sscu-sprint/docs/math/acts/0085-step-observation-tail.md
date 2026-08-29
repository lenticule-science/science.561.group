---
name: 0085-step-observation-tail
act: StepObservationTail
index: 85
slug: step-observation-tail
top: TailTrace
bottom: TracedStepObservation
summary: >-
  The full binding trace exists, but we must capture the accumulated
  remainder. Letting *Tail Trace* witness *Traced Step Observation* yields
  ***Step Observation Tail*** (`StepObservationTail`).
strata:
  - observation
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

The full binding trace exists, but we must capture the accumulated remainder.  Letting *Tail Trace* witness *Traced Step Observation* yields ***Step Observation Tail*** ([StepObservationTail](0085-step-observation-tail.md)).

This composition records the accumulating remainder, so *Step Observation Tail* is earned.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
