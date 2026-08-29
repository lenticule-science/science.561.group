---

title: Fixed Profile Recognitions
act: FixedProfileRecognitions
slug: fixed-profile-recognitions
top: ShuffleProfileRecognitions
bottom: FixedShape
summary: Restrict the shuffle profile to the recognitions shaped by the fixed spectral shape by letting `ShuffleProfileRecognitions` witness `FixedShape`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

[ShuffleProfileRecognitions](shuffle-profile-recognitions.md) already selects
recognitions fixed by `ShuffleFlow`, `Nucleate`, and the collapse of
trace shuffles.  [FixedShape](fixed-shape.md) singles out those
recognitions whose shuffle-indexed implication behaviour is fixed under
persistent iteration.  Intersecting these gives the recognitions of the fixed
profile: recognitions that are both shuffle-profile stable and shaped by the
fixed shape.  Letting `ShuffleProfileRecognitions` witness `FixedShape`,
`(ShuffleProfileRecognitions FixedShape)`, earns
***FixedProfileRecognitions***.

`ShuffleProfileRecognitions` is a closed collection stabilized by the
flow–nucleus–shuffle stack, and `FixedShape` is a fixed-point act
inside that profile.  Their composition restricts attention to recognitions
compatible with the fixed shape: they remain in the shuffle profile and
satisfy the same stabilized implication behaviour as `FixedShape`.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
