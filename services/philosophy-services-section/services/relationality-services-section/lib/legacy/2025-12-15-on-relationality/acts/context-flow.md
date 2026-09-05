---
title: Flowing Context
act: ContextFlow
slug: context-flow
top: FlowProfile
bottom: RecognizeContext
summary: >-
  Evolve contexts along the profile flow by composing `FlowProfile` with
  `RecognizeContext`.
tags:
  - act
---
# Flowing Context

Contexts evolve when their trace structure evolves under flow.  To define the
context dynamics, we let the profile flow witness
[RecognizeContext](recognize-context.md):
`(FlowProfile RecognizeContext)` earns ***ContextFlow***.

[FlowProfile](flow-profile.md) restricts the global flow to the earned
recognitions, so the composition evolves contexts along the profile trace
dynamics.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
