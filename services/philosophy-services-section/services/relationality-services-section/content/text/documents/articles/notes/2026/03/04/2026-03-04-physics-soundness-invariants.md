---
title: Physics soundness and Invariants
aliases:
  - Physics soundness and Invariants
  - physics soundness and invariants
date-created: "2026-03-04T00:00:00"
keywords:
  - profile
  - geometry
  - physics
  - invariant
depends-on:
  - fixed-profile-recognitions
  - profile-semantics
  - fixed-profile-semantics
  - fixed-flow-profile
  - fixed-nucleate-profile
  - fixed-geometry-profile
  - fixed-physics-profile
  - sound-profile-physics
  - sound-fixed-physics-semantics
  - sound-fixed-physics-geometry
  - fixed-invariant
description: In the setting of the fixed physics profile, with acts
---

# Theorem (Physics Soundness and Invariants)

In the setting of the fixed physics profile, with acts

- `FixedProfileRecognitions = (ShuffleProfileRecognitions FixedShape)`,
- `ProfileSemantics = (StructureSemantics ProfileRecognitions)`,
- `FixedProfileSemantics = (ProfileSemantics FixedProfileRecognitions)`,
- `FixedFlowProfile = (ShuffleFlow FixedProfileRecognitions)`,
- `FixedNucleateProfile = (Nucleate FixedProfileRecognitions)`,
- `FixedGeometryProfile = (FixedFlowProfile FixedNucleateProfile)`,
- `FixedPhysicsProfile = (FlowObservation FixedFlowProfile)`,

and the derived acts

- `SoundProfilePhysics = (PhysicsProfile ProfileSemantics)`,
- `SoundFixedPhysicsSemantics = (SoundProfilePhysics FixedProfileSemantics)`,
- `SoundFixedPhysicsGeometry = (FixedPhysicsProfile FixedGeometryProfile)`,
- `FixedInvariant = (StabilizeInvariant FixedProfileRecognitions)`,

the following hold:

1. **Semantic soundness.**  
   `SoundFixedPhysicsSemantics` witnesses that every judgement realised by
   `FixedPhysicsProfile` is valid in `FixedProfileSemantics`: fixed-physical
   evolutions and observations never leave the fixed profile semantics.

2. **Geometric soundness.**  
   `SoundFixedPhysicsGeometry` witnesses that fixed physics respects
   `FixedGeometryProfile`: the flow used by `FixedPhysicsProfile` remains
   compatible with the fixed nucleus, and all observed behaviours satisfy the
   geometric laws captured by `FixedGeometryProfile`.

3. **Fixed invariant states.**  
   `FixedInvariant` picks out precisely those physics states that are fixed by
   the global flow (`StabilizeInvariant`) and recognised inside the fixed
   profile (`FixedProfileRecognitions`).  These are the **fixed invariant
   states**: states whose evolution is both dynamically stable and compatible
   with `FixedShape`.

## Proof sketch

1. `ProfileSemantics = (StructureSemantics ProfileRecognitions)` interprets the
   recognition algebra in any profile, and
   `SoundProfilePhysics = (PhysicsProfile ProfileSemantics)` records that
   profile-level physics stays within those semantics.
   `FixedProfileSemantics = (ProfileSemantics FixedProfileRecognitions)`
   further restricts the semantics to the fixed recognitions, so composing it
   with `SoundProfilePhysics` cannot produce a judgement outside that calculus.
   The act `SoundFixedPhysicsSemantics` records this preservation.

2. `FixedGeometryProfile` packages the compatible pair
   `(FixedFlowProfile, FixedNucleateProfile)`.  `FixedPhysicsProfile` uses
   `FixedFlowProfile` as its dynamical backbone, and `FlowObservation` was
   constructed to respect the same commutation with the nucleus (via
   `CommuteFlowAndNucleus` and its shuffle specialization).  Thus the
   observations produced by `FixedPhysicsProfile` satisfy the same compatibility
   laws as the geometry, and `SoundFixedPhysicsGeometry` records this geometric
   soundness.

3. `StabilizeInvariant = (FixFlow PhysicsState)` identifies states fixed by the
   global flow, while `FixedProfileRecognitions` identifies recognitions that
   lie inside the fixed profile.  Their composite `FixedInvariant` therefore
   selects states that simultaneously (a) are genuine physical states with
   globally fixed dynamics and (b) are recognised inside the fixed region
   determined by `FixedShape`.  No other states satisfy both constraints,
   so these are exactly the fixed invariant states.
