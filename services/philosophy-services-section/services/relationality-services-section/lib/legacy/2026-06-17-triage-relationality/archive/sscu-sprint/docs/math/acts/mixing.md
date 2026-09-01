---

title: Mixing
act: Mixing
top: ProfileMixing
bottom: Entropy
summary: Specialize profile mixing to the entropy by composing `ProfileMixing` with `Entropy`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

A system is mixing if states eventually become independent under long flow.
[ProfileMixing](profile-mixing.md) already records this property for any
profile.  Restricting it to the entropy,
`(ProfileMixing Entropy)`, earns
***Mixing***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
