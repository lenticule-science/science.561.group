---
title: Commuting Shuffle Flow With Nucleus
act: CommuteShuffleFlowAndNucleus
slug: commute-shuffle-flow-and-nucleus
top: ShuffleFlow
bottom: Nucleate
summary: Since Flow and Nucleate already commute, the induced shuffle flow on shuffle classes also commutes with the nucleus, yielding the geometry-level compatibility.
tags:
- act
layer: act
status: plan
---
# Commuting Shuffle Flow With Nucleus

[CommuteFlowAndNucleus](./commute-flow-and-nucleus.md) proves that the global
[Flow](./flow.md) and [Nucleate](./nucleate.md) are compatible, and
[CollapseShuffle](./collapse-shuffle.md) records that `Nucleate` collapses
precisely the admissible trace shuffles.  To obtain the shuffle geometry, we
exhibit the compatibility of [ShuffleFlow](./shuffle-flow.md) with the same
nucleus, restricted to shuffle classes, by composing them:
`(ShuffleFlow Nucleate)` earns
***CommuteShuffleFlowAndNucleus***.

`ShuffleFlow` applies `Flow` to the shuffle-structured trace classes while
`Nucleate` identifies members of the same class via `CollapseShuffle`.
Because `Flow` already commutes with `Nucleate` on underlying recognitions (by
`CommuteFlowAndNucleus`), the induced action on shuffle classes must also
commute: flowing a class and then collapsing gives the same result as collapsing
representatives and then flowing.  The act therefore records the derived
compatibility, yielding the shuffle nucleus geometry.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
