---

title: Sound Physics Semantics
act: SoundFixedPhysicsSemantics
slug: sound-fixed-physics-semantics
top: SoundProfilePhysics
bottom: FixedProfileSemantics
summary: Record that fixed physics judgments remain valid in the fixed semantics by composing `SoundProfilePhysics` with `FixedProfileSemantics`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

Profile physics is already sound in profile semantics via
[SoundProfilePhysics](sound-profile-physics.md).
[FixedProfileSemantics](fixed-profile-semantics.md) restricts those semantics
to the fixed recognitions.  Composing them,
`(SoundProfilePhysics FixedProfileSemantics)`, earns
***SoundFixedPhysicsSemantics***,
ensuring physical judgments remain valid inside the fixed semantics.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
