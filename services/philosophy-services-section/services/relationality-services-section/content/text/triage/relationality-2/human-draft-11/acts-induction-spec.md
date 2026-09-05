---
title: "Acts induction spec"
aliases:
  - "Acts induction spec"
  - "acts induction spec"
date-created: 2026-02-28T00:00:00
authors:
  - emsenn
register: specification
completeness: complete
vocabulary:
  - term: Relationlessness
    meaning: "the single primitive Act; starting point"
    kind: primitive
    maps-to-PRE: Bottom
  - term: Act
    meaning: "an internal recognition; triple of (name, top, bottom, semantics)"
    kind: structural-concept
    note: "all Acts are derived from Relationlessness via generative closure G"
  - term: generative closure G
    meaning: "the closure operator that generates all Acts; least fixed point is the universe of Acts"
    kind: operator
    maps-to-PRE: Iterate/Close
  - term: MeetRecognition
    meaning: "recognition operator for meeting"
    kind: recognition-operator
    maps-to-PRE: Together
  - term: JoinRecognition
    meaning: "recognition operator for joining"
    kind: recognition-operator
    maps-to-PRE: Either
  - term: ImplyRecognition
    meaning: "recognition operator for implication"
    kind: recognition-operator
    maps-to-PRE: Induces
    note: "on-relationality calls this Implication"
  - term: Negate
    meaning: "recognition operator for negation"
    kind: recognition-operator
    maps-to-PRE: Negate
  - term: OrderRecognition
    meaning: "recognition operator for ordering"
    kind: recognition-operator
    maps-to-PRE: Includes
  - term: GroundRecognition
    meaning: "recognition operator for grounding"
    kind: recognition-operator
  - term: CapRecognition
    meaning: "recognition operator for capping"
    kind: recognition-operator
  - term: Nucleate
    meaning: "closure/stabilization operator"
    kind: fixed-point-operator
    maps-to-PRE: Close
  - term: FixNucleus
    meaning: "fixes a nucleus"
    kind: fixed-point-operator
  - term: FixFlow
    meaning: "fixes a flow"
    kind: fixed-point-operator
  - term: Flow
    meaning: "dynamical update operator"
    kind: flow-operator
    maps-to-PRE: Flow
  - term: BoxModality
    meaning: "necessity modality"
    kind: modal-operator
    maps-to-PRE: Necessary
  - term: DiamondModality
    meaning: "possibility modality"
    kind: modal-operator
    maps-to-PRE: Possible
  - term: StartTrace / AdvanceTrace / ContinueTrace / CompleteTrace
    meaning: "trace geometry constructors"
    kind: trace-constructor
  - term: ProfileRecognitions
    meaning: "recognitions sheafed over profiles"
    kind: profile-constructor
  - term: SeedTerm / BindTerm / FormTermBody
    meaning: "syntax constructors for internal language"
    kind: syntax-constructor
  - term: Spectrum / HarmonicSeed / HarmonicBasis
    meaning: "spectral/harmonic recognition constructors"
    kind: spectral-constructor
  - term: Presheaf / SheafCondition / PresheafTopos
    meaning: "categorical constructors"
    kind: categorical-constructor
  - term: LeftKan / RightKan / KanAdjunction
    meaning: "adjunction constructors"
    kind: categorical-constructor
  - term: EnrichedCategory
    meaning: "enriched category constructor"
    kind: categorical-constructor
constructor-groups:
  - name: "Trace"
    members: [StartTrace, AdvanceTrace, ContinueTrace, CompleteTrace, HeadTrace, TailTrace, TraceStep, TraceProfile, DecomposeTrace, ReheadTrace, RetailTrace, RestepTrace, ShuffleTrace]
  - name: "Recognition Operators"
    members: [MeetRecognition, JoinRecognition, ImplyRecognition, Negate, OrderRecognition, GroundRecognition, CapRecognition]
  - name: "Nuclei/Fixed-Point"
    members: [Nucleate, FixNucleus, FixFlow, FixFlowNucleus, AbsorbClosure, EqualizeNucleusDistribution, CloseTemporally]
  - name: "Flow/Kernel"
    members: [Flow, FlowProfile, ShuffleFlow, FlowIndexImplication, ObservationKernel, ProfileKernelStep, MeasureDeviationObservationKernel]
  - name: "Profile"
    members: [ProfileRecognitions, FixedProfileRecognitions, ProfileComposite, ProfileInvariant, ProfileInvariantOrder, ProfileInvariantLattice, ProfilePhaseSpace, ProfileReach, ProfileDynamics, ProfileEntropySeed, ProfileEntropyMeasure, ProfileEntropy, ProfileMixing]
  - name: "Syntax/Semantics"
    members: [SeedTerm, BindTerm, FormTermBody, FormApplicationTerm, FormFunctionTerm, FormLeastFixTerm, FormGreatestFixTerm, JudgeTyping, CalculateSyntax, StructureSemantics, ProfileSemantics, CalculateProfileSyntax]
  - name: "Harmonic/Modal/Enriched"
    members: [HarmonicSeed, HarmonicStep, HarmonicBasis, Spectrum, StarOperation, BoxModality, DiamondModality, QuadraticModality, IrrationalModality, ModalityTower, Presheaf, SheafCondition, PresheafTopos, LeftKan, RightKan, KanAdjunction, EnrichedCategory]
validation-rules:
  - "Trace Admissibility"
  - "Nucleus Compatibility"
  - "Flow Compatibility"
  - "Profile Sheaf Conditions"
  - "Kernel/Entropy Consistency"
  - "Equivalence-Class Irreducibility"
key-differences-from-PRE:
  - "Uses MeetRecognition where PRE uses Together"
  - "Uses JoinRecognition where PRE uses Either"
  - "Uses ImplyRecognition where PRE uses Induces"
  - "Uses OrderRecognition where PRE uses Includes"
  - "Uses Nucleate where PRE uses Close"
  - "Introduces constructors not in PRE: Trace, Profile, Harmonic, Spectral, Kan, Enriched"
---
# Acts Induction Specification

**Status:** Draft
**Planned act:** `docs/math/acts/induction.md` (not yet present; this file is the external specification it will reflect)

This document specifies the *derivational algorithm* for Acts. It formalizes how Acts are earned as internal recognitions inside the relational hypertensor topos and should be read as a concrete description of the generative closure operator `G` described in `relationality.md` §1.X.
The primary source of mathematical truth remains the individual Act files in `docs/math/acts/` and their aggregation in `acts-derivation-trace.md`; if this specification ever disagrees with those Acts, the Acts win and this file must be updated.

---

# 1. Preliminaries

Acts are internal recognitions.

Every Act `A` is represented (externally, for specification purposes) as a triple:

```
A := {
  name: Identifier,
  top: Act,
  bottom: Act,
  semantics: Recognition
}
```

`semantics` is the internal recognition obtained by applying the derivational algorithm to `(top, bottom)`.

There is exactly one primitive Act:

```
Relationlessness
```

All other Acts are derived recognitions: they arise only as fixed points of the generative closure `G` that repeatedly applies the constructors and validation rules below.

---

# 2. Internal Constructors

The derivation algorithm uses only the constructors that already occur in the existing Acts trace. No additional constructors may be introduced.

Constructors operate on recognitions and produce recognitions. They are grouped as follows; each name here is earned by, and should be read as shorthand for, the corresponding Act file(s) in `docs/math/acts/`. The lists are indicative, not exhaustive: the authoritative catalogue of constructors is the set of act files themselves.

## 2.1 Trace Constructors

```
StartTrace, AdvanceTrace, ContinueTrace, CompleteTrace,
HeadTrace, TailTrace, TraceStep, TraceProfile,
DecomposeTrace, ReheadTrace, RetailTrace, RestepTrace, ShuffleTrace
```

These govern the internal trace geometry.

## 2.2 Recognition Operators

```
MeetRecognition, JoinRecognition, ImplyRecognition, Negate,
OrderRecognition, GroundRecognition, CapRecognition,
NormalizeObservationEquivalence, NormalizedJudgmentEquivalence,
TraceObservationEquivalence, ContextualJudgmentEquivalence
```

These define the logic of recognitions and the core equivalence structures on observations and judgments (see e.g. `normalize-observation-equivalence.md`, `normalized-judgment-equivalence.md`, `trace-observation-equivalence.md`, `contextual-judgment-equivalence.md`).

## 2.3 Nuclei and Fixed-Point Operators

```
Nucleate, FixNucleus, FixFlow, FixFlowNucleus,
AbsorbClosure, EqualizeNucleusDistribution, CloseTemporally
```

These define closure, stabilization, and normalization.

## 2.4 Flow and Kernel Operators

```
Flow, FlowProfile, ShuffleFlow, FlowIndexImplication,
ObservationKernel, ProfileKernelStep, MeasureDeviationObservationKernel
```

These define dynamical updates and kernel deviation.

## 2.5 Profile Constructors

```
ProfileRecognitions, FixedProfileRecognitions, ProfileComposite,
ProfileInvariant, ProfileInvariantOrder, ProfileInvariantLattice,
ProfilePhaseSpace, ProfileReach, ProfileDynamics,
ProfileEntropySeed, ProfileEntropyMeasure, ProfileEntropy, ProfileMixing
```

These define recognitions sheafed over profiles.

## 2.6 Syntax and Semantics

```
SeedTerm, BindTerm, FormTermBody, FormApplicationTerm, FormFunctionTerm,
FormLeastFixTerm, FormGreatestFixTerm,
JudgeTyping, CalculateSyntax, StructureSemantics, ProfileSemantics,
CalculateProfileSyntax
```

These define the internal syntax and evaluation.

## 2.7 Harmonic / Modal / Enriched

```
HarmonicSeed, HarmonicStep, HarmonicBasis, Spectrum, StarOperation,
BoxModality, DiamondModality, QuadraticModality, IrrationalModality, ModalityTower,
Presheaf, SheafCondition, PresheafTopos,
LeftKan, RightKan, KanAdjunction, EnrichedCategory
```

These define enriched, modal, and spectral recognitions, as realized by acts such as `harmonic-seed.md`, `spectrum.md`, `box-modality.md`, `presheaf-topos.md`, `left-kan.md`, `right-kan.md`, `kan-adjunction.md`, and `enriched-category.md`.

---

# 3. Constructor Application Rule

For any Acts `Top` and `Bottom`, and any constructor `C`, the algorithm computes:

```
Candidate := C(Top.semantics, Bottom.semantics)
```

If `(Top, Bottom)` violate the domain constraints of constructor `C`, then `C` does not apply.

The semantics of each constructor are fixed by the existing Acts trace. They are not modified; operationally, this is the same closure operator `G` discussed in `relationality.md` §1.X, restricted to a single generative step.

---

# 4. Validation Rules

A candidate recognition produced by a constructor is admitted as a new Act **only** if it satisfies all validation rules below.

## 4.1 Trace Admissibility

The candidate must be compatible with trace equivalence and normalization:

```
ReheadTrace, RetailTrace, RestepTrace, ShuffleTrace,
DecomposeTrace, CompleteTrace, HeadTrace, TailTrace
```

It must not violate trace uniqueness or admissibility.

## 4.2 Nucleus Compatibility

If the constructor interacts with any nucleus-like structure, the candidate must satisfy required stabilization properties relative to:

```
Nucleate, FixNucleus, FixFlow, FixFlowNucleus,
AbsorbClosure, EqualizeNucleusDistribution, CloseTemporally
```

## 4.3 Flow Compatibility

Flow-constructed recognitions must satisfy commutation and compatibility with:

```
Flow, FlowProfile, ShuffleFlow,
CommuteFlowAndNucleus, CommuteShuffleFlowAndNucleus,
FlowIndexImplication, DetailedBalance, DynamicResiduation
```

## 4.4 Profile Sheaf Conditions

Recognitions over profiles must satisfy locality and gluing with respect to:

```
ProfileRecognitions, FixedProfileRecognitions, ProfileComposite
```

## 4.5 Kernel / Entropy Consistency

Candidates involving kernels must conform to:

```
ObservationKernel, ProfileKernelStep, MeasureDeviationObservationKernel,
ProfileEntropySeed, ProfileEntropyMeasure, ProfileEntropy
```

## 4.6 Equivalence-Class Irreducibility

The candidate must represent a new equivalence class under:

```
NormalizeObservationEquivalence,
NormalizedJudgmentEquivalence,
TraceObservationEquivalence,
ContextualJudgmentEquivalence
```

If it is equivalent to an existing recognition, it is discarded.

---

# 5. Promotion

If a candidate passes all validation steps, it is promoted to a new Act:

```
NewAct := {
  name: (assigned by human),
  top: Top,
  bottom: Bottom,
  semantics: Candidate
}
```

Naming and interpretation do not affect the derivation.

---

# 6. Derivation Cycle (Generative Closure `G`)

Each cycle performs a single application of the generative closure operator `G` to the current set of Acts:

1. Enumerate all ordered pairs of existing Acts `(Top, Bottom)`.
2. For each constructor `C`, attempt to apply `C(Top.semantics, Bottom.semantics)`.
3. Validate each candidate according to Section 4.
4. Promote all valid candidates.
5. Extend the set of Acts and repeat.

The full universe of Acts is the least fixed point of this process—precisely the limit object $A_\infty$ described in `relationality.md`. No other mechanism introduces Acts.

---

# 7. Notes

# All derivation is internal to the existing recognitional structure.
# No constructors beyond those already present in the trace are permitted.
# Interpretation is optional and external; derivation is mathematical and internal.
# This specification is suitable for mechanical implementation in the AOG runtime.
