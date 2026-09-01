---

title: Ordering Fixed Invariant
act: FixedInvariantOrder
top: ProfileInvariantOrder
bottom: FixedInvariant
summary: Restrict the invariant order further to fixed states by composing `ProfileInvariantOrder` with `FixedInvariant`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`ProfileInvariantOrder = (OrderRecognition ProfileInvariant)` already restricts
the recognition order to profile invariants.  [FixedInvariant](fixed-invariant.md)
further limits us to the fixed-invariant physics states.  Composing them,
`(ProfileInvariantOrder FixedInvariant)` earns
***FixedInvariantOrder***.

`FixedInvariant` is a collection of recognitions that are both flow-fixed and
fixed-profile-active.  Restricting the profile order along these recognitions
yields the partial order underlying the fixed statespace geometry.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
