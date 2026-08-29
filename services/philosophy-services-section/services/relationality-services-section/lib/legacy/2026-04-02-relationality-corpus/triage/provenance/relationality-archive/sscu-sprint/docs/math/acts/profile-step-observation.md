---

name: profile-step-observation
act: ProfileStepObservation
slug: profile-step-observation
top: StepObservation
bottom: ProfileRecognitions
summary: Restrict the observation-step act to the potential profile by composing `StepObservation` with `ProfileRecognitions`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`StepObservation = (RecognizeObservation StepTrace)` records how observations
advance along traces.  To work inside the profile filter we restrict it via
[ProfileRecognitions](profile-recognitions.md):
`(StepObservation ProfileRecognitions)` earns
***ProfileStepObservation***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
