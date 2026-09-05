---
title: Context Natural Transformation
act: ContextNat
slug: context-nat
top: ContextFlow
bottom: FixedFunctor
summary: >-
  Witness naturality by composing the context flow with the functor, ensuring
  the functor commutes with contextual dynamics.
tags:
  - act
---
# Context Natural Transformation

To compare two functors, we need a recognition that witnesses the commuting of
their action on each morphism.  We therefore let the context flow witness the
functor:
`(ContextFlow FixedFunctor)` earns ***ContextNat***.

[ContextFlow](context-flow.md) describes how recognitions move under the profile
context dynamics, and [FixedFunctor](fixed-functor.md) maps the recognised
objects and their morphisms.  Their composition asserts that the functor
commutes with the context flow—the naturality square in this relational
setting.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
