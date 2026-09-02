---
title: Shaping Fixed Shape
act: FixedShape
slug: fixed-shape
top: EnsureFixedPoint
bottom: ShuffleIndexImplication
summary: >-
  Apply the fixed-point construction to shuffle-indexed implication to obtain
  recognitions whose implication behaviour is invariant under repeated flow
  steps, capturing the intrinsic fixed shape.
tags:
  - act
---
# Shaping Fixed Shape

[ShuffleIndexImplication](shuffle-index-implication.md) describes how
recognitions transform when their premises are pushed one shuffle step
forward.  [EnsureFixedPoint](ensure-fixed-point.md) records that persistent
iterations of a flow yield fixed points.  To isolate the fixed shape, we apply
the fixed-point construction to the shuffle-indexed implication, obtaining
the recognitions whose implication behaviour does not change under repeated
shuffle stepping:
`(EnsureFixedPoint ShuffleIndexImplication)` earns
***FixedShape***.

`EnsureFixedPoint = (FixFlow IterativePersistence)` says that if iterating a
flow stabilizes along the trace, the stabilized recognitions form a fixed set
for that flow.  `ShuffleIndexImplication` is a specific flow-like act: it
moves implication structure forward one shuffle step before comparing
recognitions.  Composing them applies the fixed-point construction to that
indexed implication dynamics, yielding exactly those recognitions whose
implication behaviour is invariant under arbitrarily many shuffle steps—the
fixed shape induced by the relational dynamics.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
