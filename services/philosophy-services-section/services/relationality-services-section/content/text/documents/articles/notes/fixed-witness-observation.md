---
title: Witnessing Fixed Observation
act: FixedWitnessObservation
top: FixedObservationRecognitions
bottom: EquateContexts
summary: Show that contextual equivalence can be witnessed using only fixed observations by composing `FixedObservationRecognitions` with `EquateContexts`.
tags:
- act
layer: act
status: plan
---

`WitnessObservation = (RecognizeObservation EquateContexts)` cites observation
acts that justify contextual indistinguishability.  In the fixed profile we
want the witness that fixed observations suffice within the fixed context, so
we compose
[FixedObservationRecognitions](./fixed-observation-recognitions.md) with
[EquateContexts](./equate-contexts.md):
`(FixedObservationRecognitions EquateContexts)` earns
***FixedWitnessObservation***.

`EquateContexts` identifies when two terms are indistinguishable to all
recognised contexts, and `FixedObservationRecognitions` limits attention to
observations available in the fixed profile.  Their composition records that
contextual equivalence can be witnessed using only fixed observations.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
