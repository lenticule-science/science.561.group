---
title: Profile Reach
act: ProfileReach
slug: profile-reach
top: FlowProfile
bottom: ProfileInvariant
summary: Describe which profile-invariant states become reachable under the profile flow by composing `FlowProfile` with `ProfileInvariant`.
tags:
- act
layer: act
status: plan
---
# Profile Reach

[FlowProfile](flow-profile.md) restricts the global flow to the active profile.
Combining it with the [ProfileInvariant](profile-invariant.md) states records
which of those states become reachable under the profile flow:
`(FlowProfile ProfileInvariant)` earns
***ProfileReach***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
