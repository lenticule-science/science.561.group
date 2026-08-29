---
title: Profile Observation Recognitions
act: ProfileObservationRecognitions
slug: profile-observation-recognitions
top: RecognizeObservation
bottom: ProfileRecognitions
summary: Restrict observation recognitions to the active profile by composing `RecognizeObservation` with `ProfileRecognitions`.
tags:
- act
layer: act
status: plan
---
# Profile Observation Recognitions

[RecognizeObservation](recognize-observation.md) gathers the contextual
observations that witness indistinguishability.  To keep only those observations
available inside the active profile filter, we compose it with
[ProfileRecognitions](./profile-recognitions.md):
`(RecognizeObservation ProfileRecognitions)` earns
***ProfileObservationRecognitions***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
