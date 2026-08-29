---

name: evaluate-observation
act: EvaluateObservation
slug: evaluate-observation
top: RecognizeValue
bottom: FlowObservation
summary: '*Flow Observation* traces still lack their specific evaluations. Forcing *Recognize Value* to witness *Flow Observation* yields ***Evaluate Observation*** (`EvaluateObservation`).'
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

*Flow Observation* traces still lack their specific evaluations.  Forcing *Recognize Value* to witness *Flow Observation* yields ***Evaluate Observation*** ([EvaluateObservation](evaluate-observation.md)).

This act evaluates the flowed observations via existing recognitions, establishing *Evaluate Observation*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
