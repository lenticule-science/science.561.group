---

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
