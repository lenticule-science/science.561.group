---
title: Meeting Fixed Invariant
act: FixedInvariantMeet
slug: fixed-invariant-meet
top: ProfileInvariantMeet
bottom: FixedInvariant
summary: >-
  Restrict the meet operation to fixed invariant states by composing
  `ProfileInvariantMeet` with `FixedInvariant`.
tags:
  - act
---
# Meeting Fixed Invariant

`ProfileInvariantMeet = (MeetRecognition ProfileInvariant)` already computes
meets for profile invariants.  Restricting it along
[FixedInvariant](fixed-invariant.md) gives the meet on fixed invariants:
`(ProfileInvariantMeet FixedInvariant)` earns ***FixedInvariantMeet***.

`ProfileInvariantMeet` defines meets with respect to the restricted order, and
`FixedInvariant` limits the domain to the fixed states.  Their composition
produces the meet operation on fixed invariant states: the greatest fixed
invariant below any given pair.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
