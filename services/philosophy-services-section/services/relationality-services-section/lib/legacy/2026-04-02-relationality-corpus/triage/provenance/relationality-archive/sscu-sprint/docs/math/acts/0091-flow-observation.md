---
name: 0091-flow-observation
act: FlowObservation
index: 91
slug: flow-observation
top: BuildEvaluationContext
bottom: TraceReentryClosure
summary: >-
  Closed observation traces exist, but we still need to see how they flow
  through evaluation contexts. *Build Evaluation Context* therefore witnesses
  *Trace Reentry Closure*, producing ***Flow Observation***
  (`FlowObservation`).
strata:
  - observation
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Closed observation traces exist, but we still need to see how they flow through evaluation contexts.  *Build Evaluation Context* therefore witnesses *Trace Reentry Closure*, producing ***Flow Observation*** ([FlowObservation](0091-flow-observation.md)).

This composition uses only earned recognitions and records the flow, so *Flow Observation* is forced.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
