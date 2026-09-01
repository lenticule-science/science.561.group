---

title: Meeting Profile Invariants
act: ProfileInvariantMeet
top: MeetRecognition
bottom: ProfileInvariant
summary: Restrict the meet operation to profile-invariant states by composing `MeetRecognition` with `ProfileInvariant`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`MeetRecognition = (OrderRecognition Entry)` captures greatest lower bounds.
Restricting it to [ProfileInvariant](profile-invariant.md) states gives the meet
operation on profile invariants:
`(MeetRecognition ProfileInvariant)` earns
***ProfileInvariantMeet***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
