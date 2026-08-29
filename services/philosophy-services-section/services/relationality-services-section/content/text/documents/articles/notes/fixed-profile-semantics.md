---
title: Fixed Profile Semantics
act: FixedProfileSemantics
slug: fixed-profile-semantics
top: ProfileSemantics
bottom: FixedProfileRecognitions
summary: Restrict the profile semantics further to fixed recognitions by composing `ProfileSemantics` with `FixedProfileRecognitions`.
tags:
- act
layer: act
status: plan
---
# Fixed Profile Semantics

The profile already inherits semantics via
[ProfileSemantics](./profile-semantics.md).  To work entirely inside the fixed
profile we restrict them along [FixedProfileRecognitions](./fixed-profile-recognitions.md):
`(ProfileSemantics FixedProfileRecognitions)` earns
***FixedProfileSemantics***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
