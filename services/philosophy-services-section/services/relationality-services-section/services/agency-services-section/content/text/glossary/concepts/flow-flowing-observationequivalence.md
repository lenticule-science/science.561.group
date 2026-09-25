---
title: Flowing ObservationEquivalence
description: Story.
---
# Flowing ObservationEquivalence

*Story.*  Closed observation-equivalence traces must flow through evaluation contexts.  BuildEvaluationContext therefore witnesses TraceObservationEquivalenceClosure, yielding FlowObservationEquivalence.


FlowObservationEquivalence = (BuildEvaluationContext TraceObservationEquivalenceClosure)


*Proof Sketch.*  The composition records those flows, forcing FlowObservationEquivalence.
