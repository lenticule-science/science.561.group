---

title: Recognizing Fixed Observation
act: FixedObservationRecognitions
top: ProfileObservationRecognitions
bottom: FixedProfileRecognitions
summary: "Further restrict the profile\u2019s observation recognitions to the fixed subset by composing `ProfileObservationRecognitions` with `FixedProfileRecognitions`."
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

[ProfileObservationRecognitions](profile-observation-recognitions.md) gathers
the observation witnesses permitted by the potential profile, while
[FixedProfileRecognitions](fixed-profile-recognitions.md) further restricts
them to the fixed subset.  Composing them,
`(ProfileObservationRecognitions FixedProfileRecognitions)` earns
***FixedObservationRecognitions***.

The profile observation recognitions already respect the flow–nucleus filter,
and `FixedProfileRecognitions` tightens the admissible contexts to the fixed
geometry, so only fixed observations remain.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
