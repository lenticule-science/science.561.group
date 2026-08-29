---

title: Joining Profile Invariants
act: ProfileInvariantJoin
slug: profile-invariant-join
top: JoinRecognition
bottom: ProfileInvariant
summary: Restrict the join operation to profile-invariant states by composing `JoinRecognition` with `ProfileInvariant`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`JoinRecognition = (OrderRecognition ContextualizeTrace)` captures least upper
bounds.  Restricting it to [ProfileInvariant](profile-invariant.md) gives the
join on profile invariants:
`(JoinRecognition ProfileInvariant)` earns
***ProfileInvariantJoin***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
