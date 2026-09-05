---

name: fixed-exponential
act: FixedExponential
top: ProfileExponential
bottom: FixedProfileRecognitions
summary: Restrict the profile exponentials further to fixed recognitions by composing `ProfileExponential` with `FixedProfileRecognitions`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

The profile already has internal exponentials via
[ProfileExponential](profile-exponential.md).  To work entirely inside the
fixed profile we restrict those exponentials to
[FixedProfileRecognitions](fixed-profile-recognitions.md):
`(ProfileExponential FixedProfileRecognitions)` earns
***FixedExponential***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
