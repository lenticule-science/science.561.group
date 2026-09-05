---

name: fixed-flow-profile
act: FixedFlowProfile
top: ShuffleFlow
bottom: FixedProfileRecognitions
summary: Restrict the shuffle flow to the fixed-profile recognitions by letting `ShuffleFlow` witness `FixedProfileRecognitions`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`FlowProfile = (Flow ProfileRecognitions)` restricts the global flow to a given
profile.  To specialize this to the fixed-profile recognitions we let
[ShuffleFlow](shuffle-flow.md) witness
[FixedProfileRecognitions](fixed-profile-recognitions.md):
`(ShuffleFlow FixedProfileRecognitions)` earns
***FixedFlowProfile***.

`ShuffleFlow` evolves admissible trace-shuffle classes along evaluation
contexts, and `FixedProfileRecognitions` picks out recognitions stabilized by
the same dynamics and fixed shape.  The composition restricts the shuffle
flow to this profile, yielding a dynamics where every state evolves according to
that trace structure while preserving the fixed shape.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
