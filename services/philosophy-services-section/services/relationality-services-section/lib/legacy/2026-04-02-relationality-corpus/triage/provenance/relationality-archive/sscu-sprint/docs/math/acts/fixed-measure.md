---

name: fixed-measure
act: FixedMeasure
top: ProfileMeasure
bottom: FixedInvariant
summary: Restrict the profile measure to fixed invariant states by composing `ProfileMeasure` with `FixedInvariant`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

[ProfileMeasure](profile-measure.md) already applies the profile nucleus to the
profile-invariant states.  Restricting it along
[FixedInvariant](fixed-invariant.md) yields the fixed measure:
`(ProfileMeasure FixedInvariant)` earns ***FixedMeasure***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
