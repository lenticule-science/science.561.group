---

name: step-observation-head
act: StepObservationHead
top: HeadTrace
bottom: StepObservationTail
summary: After tailing, we need the stabilized head of those bindings. Forcing *Head Trace* to witness *Step Observation Tail* yields ***Step Observation Head*** (`StepObservationHead`).
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

After tailing, we need the stabilized head of those bindings.  Forcing *Head Trace* to witness *Step Observation Tail* yields ***Step Observation Head*** ([StepObservationHead](step-observation-head.md)).

This isolates the immediate stabilized binding, so *Step Observation Head* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
