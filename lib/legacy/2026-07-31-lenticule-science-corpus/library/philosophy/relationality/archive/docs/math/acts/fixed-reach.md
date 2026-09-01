---
title: Fixed Reach
act: FixedReach
top: ProfileReach
bottom: FixedInvariant
summary: Restrict profile reachability to fixed invariants by composing `ProfileReach` with `FixedInvariant`.
tags:
- act
layer: act
status: plan
---

[Reach](reach.md) describes reachability for the unrestricted flow, and
[ProfileReach](profile-reach.md) restricts that closure to the potential profile.
[FixedInvariant](fixed-invariant.md) picks out states that are both
flow-invariant and compatible with `FixedShape`.  Composing them,
`(ProfileReach FixedInvariant)` earns
***FixedReach***,
recording reachability inside the fixed profile.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
