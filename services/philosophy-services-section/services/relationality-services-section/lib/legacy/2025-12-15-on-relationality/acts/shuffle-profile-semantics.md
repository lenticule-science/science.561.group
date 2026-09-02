---
title: Semantics of the Shuffle Profile
act: ShuffleProfileSemantics
slug: shuffle-profile-semantics
top: StructureSemantics
bottom: ShuffleProfileRecognitions
summary: >-
  Restrict the semantic calculus to recognitions stable under flow, nucleus, and
  shuffle collapse by letting `StructureSemantics` witness
  `ShuffleProfileRecognitions`.
tags:
  - act
---
# Semantics of the Shuffle Profile

The recognitions stabilized by a filter or profile inherit full semantic
structure; we saw this with
`ProfileSemantics = (StructureSemantics ProfileRecognitions)`.  To interpret the
the shuffle-stable recognitions, we let the semantic structure witness
[ShuffleProfileRecognitions](shuffle-profile-recognitions.md):
`(StructureSemantics ShuffleProfileRecognitions)` earns
***ShuffleProfileSemantics***.

[StructureSemantics](structure-semantics.md) already encodes the operations of
the semantic calculus.  `ShuffleProfileRecognitions` selects the closed
sub-collection of recognitions fixed by flow and nucleus and active under
trace-shuffle collapse.  The composition restricts the semantic operations to
that sub-collection, producing a semantic calculus in which all recognitions are
shuffle-stable—our shuffle profile semantics.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
