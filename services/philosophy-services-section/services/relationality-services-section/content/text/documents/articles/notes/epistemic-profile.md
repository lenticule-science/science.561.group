---
title: Epistemic Profile
id: epistemic-profile
role: structure
status: plan
proof_refs: []
derives-from: math/structure/profile-topos
description: Profile whose recognitions are interpreted as epistemic states—what an agent or group takes to be possible, necessary, or ruled out—and equipped with the modal structure needed for epistemic operators.
---



Profile whose recognitions are interpreted as epistemic states—what an agent or
group takes to be possible, necessary, or ruled out—and equipped with the modal
structure needed for epistemic operators.

## Definition
- Carrier: the fixed-profile recognitions inside the [Profile Topos](./profile-topos.md),
  tagged as epistemic states.
- Observations: observation acts restricted to the profile
  ([Observation](observation.md)); epistemic updates refine the carrier by
  intersecting with observed evidence.
- Modal structure: inherits necessity/possibility operators from
  [Modal Structure](modal-structure.md) to interpret epistemic modalities.

## Invariants
- Closure: closed under profile flow/nucleus and modal operators; epistemic
  recognitions remain inside the profile.
- Consistency: epistemic states respect observation compatibility in the
  profile topos; contradictions collapse to bottom.
- Monotonicity: observations and modal operators are monotone on epistemic
  recognitions.

## Proof
- Derived from: [Profile Topos](./profile-topos.md), restricting recognitions to
  epistemic interpretations and importing modal structure.
- Uses: [Observation](observation.md) to scope evidence; [Modal Structure](modal-structure.md)
  to supply necessity/possibility.
- Shows that: epistemic states form a stable subprofile suitable for knowledge
  and belief operators.
