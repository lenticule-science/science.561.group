---
title: Flowing Observation
description: Story.
---
# Flowing Observation

*Story.*  Closed observation traces exist, but we still need to see how they flow through evaluation contexts.  BuildEvaluationContext therefore witnesses TraceReentryClosure, producing FlowObservation.


FlowObservation = (BuildEvaluationContext TraceReentryClosure)


*Proof Sketch.*  This composition uses only earned recognitions and records the flow, so FlowObservation is forced.
