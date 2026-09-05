---

name: profile-measure
act: ProfileMeasure
top: NucleateProfile
bottom: ProfileInvariant
summary: Apply the profile nucleus to profile-invariant states by composing `NucleateProfile` with `ProfileInvariant`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

[Measure](measure.md) represents applying the nucleus to a physics state,
“idealizing” it.  For a specific profile we let
[NucleateProfile](nucleate-profile.md) witness the
[ProfileInvariant](profile-invariant.md) states:
`(NucleateProfile ProfileInvariant)` earns
***ProfileMeasure***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
