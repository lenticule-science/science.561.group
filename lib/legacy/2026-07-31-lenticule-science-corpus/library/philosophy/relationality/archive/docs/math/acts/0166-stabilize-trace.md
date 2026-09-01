---
title: Stabilizing Trace
act: StabilizeTrace
index: 166
top: CompleteTrace
bottom: TraceObservationEquivalenceClosure
summary: >-
  *Trace Observation Equivalence Closure* ensures that observation-equivalent
  traces close, but it does not yet identify traces with identical closed
  behaviour. Letting *Complete Trace* witness *Trace Observation Equivalence
  Closure* produces ***Stabilize Trace*** (`StabilizeTrace`).
strata:
  - stability
phase: free
keywords:
  - act
---

## Interpretation

*Trace Observation Equivalence Closure* ensures that observation-equivalent traces close, but it does not yet identify traces with identical closed behaviour.  Letting *Complete Trace* witness *Trace Observation Equivalence Closure* produces ***Stabilize Trace*** ([StabilizeTrace](0166-stabilize-trace.md)).

Composing the whole trace with its closure identifies any two traces that share the same closed observation acts, so *Stabilize Trace* is earned using only prior recognitions.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
