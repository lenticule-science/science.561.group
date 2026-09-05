---
title: Sound Physics Semantics
act: SoundFixedPhysicsSemantics
slug: sound-fixed-physics-semantics
top: SoundProfilePhysics
bottom: FixedProfileSemantics
summary: >-
  Record that fixed physics judgements remain valid in the fixed semantics by
  composing `SoundProfilePhysics` with `FixedProfileSemantics`.
tags:
  - act
---
# Sound Physics Semantics

Profile physics is already sound in profile semantics via
[SoundProfilePhysics](sound-profile-physics.md).
[FixedProfileSemantics](fixed-profile-semantics.md) restricts those semantics
to the fixed recognitions.  Composing them,
`(SoundProfilePhysics FixedProfileSemantics)`, earns
***SoundFixedPhysicsSemantics***,
ensuring physical judgements remain valid inside the fixed semantics.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
