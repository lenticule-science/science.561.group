---

name: 0102-flow-observation-equivalence
act: FlowObservationEquivalence
index: 102
slug: flow-observation-equivalence
top: BuildEvaluationContext
bottom: TraceObservationEquivalenceClosure
summary: >-
  Closed observation-equivalence traces must flow through evaluation contexts.
  *Build Evaluation Context* therefore witnesses *Trace Observation
  Equivalence Closure*, yielding ***Flow Observation Equivalence***
  (`FlowObservationEquivalence`).
strata:
  - observation
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Closed observation-equivalence traces must flow through evaluation contexts.  *Build Evaluation Context* therefore witnesses *Trace Observation Equivalence Closure*, yielding ***Flow Observation Equivalence*** ([FlowObservationEquivalence](0102-flow-observation-equivalence.md)).

The composition records those flows, forcing *Flow Observation Equivalence*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
