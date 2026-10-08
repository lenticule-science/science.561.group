---
title: Ordering Profile Invariants
act: ProfileInvariantOrder
top: OrderRecognition
bottom: ProfileInvariant
summary: Restrict the recognition order to profile-invariant states by composing `OrderRecognition` with `ProfileInvariant`.
tags:
- act
layer: act
status: plan
description: Restrict the recognition order to profile-invariant states by composing `OrderRecognition` with `ProfileInvariant`.
---

`OrderRecognition = (RecognizeContext Recognition)` records when one recognition
subsumes another.  [ProfileInvariant](./profile-invariant.md) picks out the
flow-fixed physics states that lie in the active profile.  Composing them,
`(OrderRecognition ProfileInvariant)` earns
***ProfileInvariantOrder***.

This restricts the ambient order to the profile-invariant states.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
