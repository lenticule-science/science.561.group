---
title: Stabilizing Trace
act: StabilizeTrace
slug: stabilize-trace
top: CompleteTrace
bottom: TraceObservationEquivalenceClosure
summary: >-
  *Trace Observation Equivalence Closure* ensures that observation-equivalent
  traces close, but it does not yet identify traces with identical closed
  behaviour. Letting *Complete Trace* witness *Trace Observation Equivalence
  Closure* produces ***Stabilize Trace*** (`StabilizeTrace`).
tags:
  - act
---
# Stabilizing Trace

## Interpretation

*Trace Observation Equivalence Closure* ensures that observation-equivalent traces close, but it does not yet identify traces with identical closed behaviour.  Letting *Complete Trace* witness *Trace Observation Equivalence Closure* produces ***Stabilize Trace*** ([StabilizeTrace](stabilize-trace.md)).

Composing the whole trace with its closure identifies any two traces that share the same closed observation acts, so *Stabilize Trace* is earned using only prior recognitions.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
