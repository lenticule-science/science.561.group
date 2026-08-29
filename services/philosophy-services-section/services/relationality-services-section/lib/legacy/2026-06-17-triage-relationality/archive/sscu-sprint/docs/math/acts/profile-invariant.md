---

title: Stabilizing Profile Invariant
act: ProfileInvariant
slug: profile-invariant
top: StabilizeInvariant
bottom: ProfileRecognitions
summary: Pick out physics states that are flow-invariant and lie inside the potential profile by composing `StabilizeInvariant` with `ProfileRecognitions`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`StabilizeInvariant = (FixFlow PhysicsState)` records states left unchanged by
the global flow.  [ProfileRecognitions](profile-recognitions.md) restrict the
system to the recognitions preserved by the potential filter.  Composing them,
`(StabilizeInvariant ProfileRecognitions)` earns
***ProfileInvariant***.

The resulting states are genuine physics states fixed by the flow and recognised
within the chosen profile.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
