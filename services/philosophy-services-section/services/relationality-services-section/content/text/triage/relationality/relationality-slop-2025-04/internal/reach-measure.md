---
title: Reach and Measure
aliases:
  - Reach and Measure
  - reach and measure
date-created: "2026-03-04T00:00:00"
keywords:
  - reach
  - measure
depends_on:
  - measure
  - profile-measure
  - profile-integral
  - reach
---

# Theorem (Reach and Measure)

Working inside the fixed physics profile, with the earned acts

- `FixedInvariant = (StabilizeInvariant FixedProfileRecognitions)`,
- `FixedFlowProfile = (ShuffleFlow FixedProfileRecognitions)`,
- `FixedNucleateProfile = (Nucleate FixedProfileRecognitions)`,

we define

- `FixedReach = (FixedFlowProfile FixedInvariant)`,
- `FixedMeasure = (FixedNucleateProfile FixedInvariant)`.

Then:

1. **Reachability.**
   `FixedReach` witnesses which invariant states become reachable under
   repeated fixed-flow evolution.  These reachable states remain within the
   profile and preserve the fixed shape.

2. **Measurement.**
   `FixedMeasure` witnesses the action of the nucleus on invariant states.
   Every measurement collapses the state along a closure determined by the
   profile, retaining only the trace-shuffle- and `FixedShape`-compatible
   content.

3. **Compatibility.**
   `FixedReach` and `FixedMeasure` commute up to the existing nucleus–flow
   compatibility: measuring a reachable state yields the same recognition as
   reaching the measurement of the initial state, after stabilization.

## Proof sketch

1. `FixedReach = (FixedFlowProfile FixedInvariant)` evolves invariant states
   along the flow restricted to fixed recognitions.  Because both the flow and
   the invariant recognitions lie inside the fixed profile, all reachable
   states remain in that profile.

2. `FixedMeasure = (FixedNucleateProfile FixedInvariant)` restricts the
   nucleus to recognitions stabilised by `FixedShape`.  Applying it to
   invariant states yields the corresponding idealized recognitions.

3. In the underlying geometry,
   `FixedFlowProfile` and `FixedNucleateProfile` inherit the commutation
   property of `ShuffleFlow` and `Nucleate`
   (`CommuteShuffleFlowAndNucleus`).  Thus reachability and measurement
   commute up to stabilization, establishing the lemma.
