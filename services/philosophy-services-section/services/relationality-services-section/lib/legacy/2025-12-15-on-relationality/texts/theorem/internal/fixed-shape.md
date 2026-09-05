---
title: Relational Eigen Shape in the Profile
tags:
  - flow
  - nucleus
  - profile
  - implication
depends_on:
  - shuffle-geometry
  - shuffle-profile-semantics
  - shuffle-flow
  - shuffle-index-implication
  - fixed-shape
---
# Theorem (Relational Eigen Shape in the Profile)

Work inside the [ShuffleGeometry](../../acts/shuffle-geometry.md) and
[ShuffleProfileSemantics](../../acts/shuffle-profile-semantics.md) determined
by

- `ShuffleFlow = (Flow ShuffleTrace)`,
- `CommuteShuffleFlowAndNucleus = (ShuffleFlow Nucleate)`,
- `ShuffleGeometry = (StructureSemantics CommuteShuffleFlowAndNucleus)`,
- `ShuffleProfileRecognitions = (FixFlowNucleus CollapseShuffle)`, and
- `ShuffleProfileSemantics = (StructureSemantics ShuffleProfileRecognitions)`.

Let

- `ShuffleIndexImplication = (ShuffleFlow ImplyRecognition)`, and
- `FixedShape = (EnsureFixedPoint ShuffleIndexImplication)`.

Then:

1. **Existence in the profile.**  
   `FixedShape` lies in `ShuffleProfileRecognitions`: it is fixed by
   both `ShuffleFlow` and `Nucleate`, and depends only on shuffle
   classes of traces, not on any particular representative.

2. **Fixed-point property.**  
   `FixedShape` is a fixed point of `ShuffleIndexImplication`:
   iterating the shuffle-indexed implication along the trace leaves its
   recognitions unchanged.

3. **Uniqueness up to profile equivalence.**  
   If a recognition `R` in the shuffle profile has the same stabilized
   implication behaviour as `FixedShape` under
   `ShuffleIndexImplication`—that is,
   `EquateContexts` and `StabilizeRecognition` identify the iterates of `R`
   and `FixedShape`—then `R` and `FixedShape` are profile-equivalent.
   Thus within the profile, `FixedShape` is the unique nontrivial fixed point
   (up to the existing stabilization equivalence) of the
   shuffle-indexed implication dynamics.

## Proof sketch

1. `ShuffleProfileRecognitions = (FixFlowNucleus CollapseShuffle)` selects
   recognitions fixed by the combined action of `Flow`, `Nucleate`, and shuffle
   collapse.  `EnsureFixedPoint` constructs fixed points of a flow that satisfy
   `IterativePersistence`.  Applying it to `ShuffleIndexImplication` produces
   recognitions whose implication behaviour is stable under all shuffle-flow
   iterations.  Because `ShuffleIndexImplication` is built from
   `ShuffleFlow` and `ImplyRecognition`, and `ShuffleFlow` commutes with
   `Nucleate`, the resulting fixed points automatically lie in the
   profile.

2. By construction, `FixedShape` is defined via `EnsureFixedPoint`
   applied to `ShuffleIndexImplication`.  Its iterates under the indexed
   implication are eventually persistent along the trace and therefore fixed:
   applying `ShuffleIndexImplication` again does not change the stabilized
   recognition.

3. Suppose another recognition `R` in the shuffle profile has the same
   stabilized implication behaviour, so its iterates under
   `ShuffleIndexImplication` are identified with those of `FixedShape`
   by the stabilization recognitions (`StabilizeTrace`, `StabilizeJudgement`,
   `StabilizeContext`, `StabilizeTerm`, `StabilizeObservation`).  By the
   definition of profile equivalence and the fact that
   `ShuffleProfileRecognitions` arises from `FixFlowNucleus` and
   `CollapseShuffle`, `R` and `FixedShape` lie in the same stabilized
   equivalence class.  Thus there is, up to the existing quotienting, a single
   nontrivial shuffle-indexed implication shape in the profile, namely
   `FixedShape`.
