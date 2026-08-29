---
title: Stabilizing Fixed Invariant
act: FixedInvariant
slug: fixed-invariant
top: ProfileInvariant
bottom: FixedProfileRecognitions
summary: Pick out physics states that are both profile-invariant and lie inside the fixed recognitions by composing `ProfileInvariant` with `FixedProfileRecognitions`.
tags:
- act
layer: act
status: plan
---
# Stabilizing Fixed Invariant

`ProfileInvariant = (StabilizeInvariant ProfileRecognitions)` already records
states left unchanged by the global flow and recognised inside the potential
profile.  [FixedProfileRecognitions](fixed-profile-recognitions.md) further
restricts recognitions to the shuffle-stable fixed subset.  Composing them,
`(ProfileInvariant FixedProfileRecognitions)` earns
***FixedInvariant***.

Any state in `ProfileInvariant` is fixed by the global flow and lies in the base
profile, and any recognition in `FixedProfileRecognitions` is fixed by
`ShuffleFlow`, `Nucleate`, and compatible with `FixedShape`.  Their
composition picks states satisfying all constraints—they are genuine physical
states, fixed by the flow, and lie in the fixed recognition region.  These are
the fixed invariant states of the system.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
