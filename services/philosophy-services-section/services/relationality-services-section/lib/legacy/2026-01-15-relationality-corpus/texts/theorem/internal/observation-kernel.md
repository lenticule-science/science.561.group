---

title: Observation Kernel
tags:
  - flow
  - measure
  - kernel
depends-on:
  - fixed-invariant
  - fixed-flow-profile
  - fixed-measure
  - flow-measure-step
  - transition-law
  - observation-kernel
  - fixed-kernel
form: research
# Theorem (Observation Kernel)

Inside the fixed physics profile, with the earned acts

- `FixedInvariant = (StabilizeInvariant FixedProfileRecognitions)`,
- `FixedFlowProfile = (ShuffleFlow FixedProfileRecognitions)`,
- `FixedMeasure = (FixedNucleateProfile FixedInvariant)`,
- `FlowMeasureStep = (FixedMeasure FixedFlowProfile)`,
- `TransitionLaw = (FlowMeasureStep FixedInvariant)`,
- `ObservationKernel = (FixedObservationRecognitions TransitionLaw)`,
- `FixedKernel = (EnsureFixedPoint ObservationKernel)`,

and with the invariant lattice

- `FixedInvariantLattice = (StructureSemantics FixedInvariantOrder)`,
- `TransitionGeometry = (FixedInvariantLattice TransitionLaw)`,

the following hold:

1. **Flow–measure property.**  
   `ObservationKernel` assigns to each fixed invariant state an observational
   distribution determined by one flow step followed by measurement.  This
   ensures future evolution depends only on the current state.

2. **Kernel stabilization.**  
   `FixedKernel` is a fixed point of `ObservationKernel`: repeated
   updates stabilise to the same recognition class, representing the stationary
   distribution of invariant states.

3. **Geometric consistency.**  
   The transition law respects the invariant lattice:
   `TransitionGeometry` witnesses that transitions preserve the order, meets,
   and joins of invariant states up to stabilization.

4. **Unique stationarity up to equivalence.**  
   In any model respecting positivity/monotonicity of the profile, the
   stationary kernel corresponds semantically to the unique eigenvector of the
   indexed implication dynamics (as shown in the fixed-shape corollary).

## Proof sketch

1. `FlowMeasureStep = (FixedMeasure FixedFlowProfile)` encodes one
   evolve–measure step, and `TransitionLaw = (FlowMeasureStep FixedInvariant)`
   maps invariant states to successor sets.  `ObservationKernel = (FixedObservationRecognitions TransitionLaw)`
   attaches observational distributions, giving an internal kernel.

2. `FixedKernel = (EnsureFixedPoint ObservationKernel)` uses the
   persistent-iteration fixed point machinery to obtain a stationary kernel.

3. `FixedInvariantLattice` gives the meet–join structure, and
   `TransitionGeometry` records how the kernel’s transitions interact with
   that lattice.

4. Combined with the fixed-shape semantic corollary, the stationary kernel
   corresponds to the eigenvector of the indexed implication operator.

This establishes the complete flow–measure structure inside the fixed physics
profile.
