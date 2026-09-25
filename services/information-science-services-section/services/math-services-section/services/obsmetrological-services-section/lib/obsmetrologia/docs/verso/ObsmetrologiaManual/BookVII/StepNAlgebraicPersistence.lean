import ObsmetrologiaManual.DocSetup
import Obsmetrologia.AperiodicOrder.Tiling.StepN.Recurrence
import Obsmetrologia.AperiodicOrder.Tiling.StepN.SubstitutionMatrix
import Obsmetrologia.AperiodicOrder.Tiling.SubstitutionPrimitivity
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicMean
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicReal
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicRoot
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicPowerLens
import Obsmetrologia.AperiodicOrder.Tiling.StepN.Salem
import Obsmetrologia.AperiodicOrder.Tiling.StepN.SalemRegime
import Obsmetrologia.AperiodicOrder.Tiling.StepN.SalemRoot
import Obsmetrologia.AperiodicOrder.Tiling.StepN.CLehmer
import Obsmetrologia.AperiodicOrder.Tiling.ColorPredictor
import Obsmetrologia.AperiodicOrder.Tiling.Diffraction

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Discrete
open Obsmetrologia.AperiodicOrder.Tiling
open Obsmetrologia.AperiodicOrder.Tiling.StepN
open Obsmetrologia.AperiodicOrder.Tiling.Universality
open Obsmetrologia.Real.Internal

/-!
A teaching chapter for the algebraic carriers that make step-depth persistence
lawful.
-/

#doc (Manual) "Step-n algebraic persistence" =>

# Step-N Algebraic Persistence

The preceding page teaches aperiodic persistence through hulls, towers,
condensates, and step-depth colimits. This page supplies one of the carriers
that makes that persistence algebraically visible: a step-n substitution rule is
not just a named example. It locks recurrence depth, alphabet size, matrix
dimension, cohomology rank, characteristic polynomial degree, primitive
positive powers, and inflation regime into one generated claim-site.

The claim-site carried here is:

* claim-site: algebraic persistence of step-depth substitutions;
* phase: persistence after non-Scott settling, before spacetime or physical
  horizon language;
* generating sites: step-n recurrence data, substitution matrices as FOUR-valued
  Chu incidence projections, primitive matrix powers, metallic/Pisot recurrences,
  Salem reciprocal traces, closure-regime classification;
* downstream uses: aperiodic classification, universality classes, material
  persistence, shroud-indexed keratin, hole diagnostics, and any later
  claim that an inflation has a settling or non-settling internal direction;
* Lean declarations: `StepNData`, `mkStepN`, `charPolyFib`,
  `charPolyPad`, `substMatrix`, `fibonacciMatrix`, `padovanMatrix`,
  `Primitive`, `metallicMatrix`, `metallicNum`, `cassiniVal`, `metallicZ`,
  `charPolySalem`, `salemTraceResolvent`, `inflationRegime`,
  `color_predictor_evidence`, `finiteFourierDual_color_readout`,
  `cLehmer_green_skeleton`, `SalemRootRegimeGap`,
  `salemRootRegimeGap_iff_noSalemApproach`,
  `cLehmerStatement_iff_pisotReceipt_and_salemRootRegimeGap`,
  `cLehmer_of_finiteReduction`;
* Blueprint/proof-tree nodes: the step-n and substitution-universality corpus
  nodes supply the intended generators; the primitive proof tree supplies only
  the mark floor, not these algebraic persistence theorems;
* provenance: step-n substitution recurrence, substitution rule, classifying
  invariant, substitution universality class, metallic mean, Pisot/Salem split;
* familiar mathematical comparison: substitution matrices, Perron-Frobenius
  primitivity, Pisot contraction, Salem unit-circle neutrality, Cayley-Hamilton,
  real algebraic roots;
* reader closure: read "growth rate" here only through the carrier that has been
  generated: integer matrices, polynomial identities, real root witnesses, and
  regime data;
* frontier status: the finite Fourier-side readout is present; full analytic
  spectral theory, complex conjugates, translation-bounded diffraction measures,
  and general Perron-Frobenius eigenvectors are not present. Promoting them
  requires the missing carriers for spectra, complex roots, analytic
  measure/diffraction, or a full ordered-vector Perron-Frobenius construction.

The governing sentence is:

> Step-depth becomes persistent only when the algebraic witness survives as a
> generated carrier, not when an external algebraic resemblance is noticed.

This matters for later books. If a page says that a horizon, material phase, or
hole has an inflationary persistence profile, the lawful upstream object is
this page's carrier: a substitution rule with a matrix, a primitive positive
power when contraction is claimed, a polynomial identity when algebraic growth
is claimed, and a regime theorem when the strict/aperiodic split is claimed.

## Co-Incrementing Data

The step parameter is not a label pasted onto unrelated data. The canonical
bundle makes matrix dimension, recurrence depth, alphabet size, and
cohomological rank equal to the same `n`.

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.StepNData}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.mkStepN}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.mkStepN_all_eq}

The low-step characteristic polynomials carry the degree side of the same
claim-site.

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.charPolyFib}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.charPolyPad}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.substitution_growth_degree_n}

Checked:

```lean
example (n : Nat) :
    (mkStepN n).matrixDim
      = (mkStepN n).recurrenceDepth
      ∧ (mkStepN n).recurrenceDepth
        = (mkStepN n).alphabetSize
      ∧ (mkStepN n).alphabetSize
        = (mkStepN n).cohRank :=
  mkStepN_all_eq n

example : degreeN charPolyFib 2 ∧ monic charPolyFib :=
  ⟨charPolyFib_degree, charPolyFib_monic⟩
```

The phase lesson is that the step-n index is a generated synchronization. It is
not licensed by a familiar sequence name. A later page may say "step-depth" only
after it can point back to a carrier where the relevant depths co-increment.

## Matrix Realization

The next promotion is from coefficient list to matrix. The substitution matrix
is the abelianized count of letters in images, and in this library it is also
read as the positive-incidence projection of a FOUR-valued Chu relation.

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.substMatrix}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.fibonacciMatrix}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.padovanMatrix}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cayleyHamilton_fibonacci}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cayleyHamilton_padovan}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.padovanMatrix_is_chu_incidence}

Checked:

```lean
example :
    evalMatPoly charPolyFib fibonacciMatrix
      = matZero :=
  cayleyHamilton_fibonacci

example :
    ∀ i j, padovanMatrix i j
      = (if (padovanChu.r i j).pos then 1 else 0) :=
  padovanMatrix_is_chu_incidence
```

This is a lawful claim-site for algebraic persistence because the polynomial is
now a polynomial of a generated matrix. Without this step, "golden", "plastic",
or "growth" is only comparison language.

## Primitivity Before Perron Language

The dependency-free core does not import a general Perron-Frobenius theorem.
What it can prove is the finite combinatorial precondition: some power of the
matrix is strictly positive.

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.NonnegativeMatrix}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.PositiveMatrix}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.Primitive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.fibonacciMatrix_primitive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.padovanMatrix_primitive}

Checked:

```lean
example : Primitive fibonacciMatrix :=
  fibonacciMatrix_primitive

example : Primitive padovanMatrix :=
  padovanMatrix_primitive
```

The reader closure is strict: primitivity is a proved finite witness. It does
not by itself construct the dominant eigenvalue, its eigenvector, or a spectral
gap theorem. Those remain promotion requirements for pages that need them.

## Metallic Pisot Engine

The metallic family gives a uniform algebraic engine. The matrix
`[[n,1],[1,0]]` satisfies `M^2 = nM + I`, and its characteristic polynomial
annihilates the matrix.

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.metallicMatrix}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.metallic_quadratic}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.charPolyMetallic}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cayleyHamilton_metallic}

The integer recurrence is the inflation engine:

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.metallicNum}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.metallicMatrix_pow_succ}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.metallicNum_pos}

Checked:

```lean
example (n : Int) :
    evalMatPoly (charPolyMetallic n) (metallicMatrix n)
      = matZero :=
  cayleyHamilton_metallic n

example {n : Int} (hn : 1 ≤ n) (k : Nat) :
    1 ≤ metallicNum n (k + 1) :=
  metallicNum_pos hn k
```

Now the word "Pisot" has a local role: this is the contracting side of the
algebraic persistence split. The full analytic theorem is not smuggled in. The
manual only uses what the carrier has generated.

## Real Witnesses And Power Lens

The real layer appears only after the recurrence and matrix have generated it.
The Cassini identity gives the unit witness for convergent gaps, the metallic
root theorem constructs the real root, and the power lens grades powers of the
metallic double by coefficient pairs.

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cassiniVal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.metallic_cassini}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.metallic_root}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.metallicZ}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.metallicZ_sq}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.metallic_power_expansion}

Checked:

```lean
example (n : Int) (k : Nat) :
    cassiniVal n k = 1 ∨ cassiniVal n k = -1 :=
  metallic_cassini n k

example (n : Nat) :
    metallicZ n * metallicZ n
      = twoN n * metallicZ n + four :=
  metallicZ_sq n

example (n k : Nat) :
    zpow (metallicZ n) k
      = (coef n k).1 * metallicZ n + (coef n k).2 :=
  metallic_power_expansion n k
```

This section is where real-number language becomes lawful. It is not an API
tour of `RReal`; it is the promotion of an integer substitution witness into a
real algebraic witness.

## Salem Neutrality

The Salem side is not another metallic example. It is the boundary where the
internal direction stops contracting. The carrier is the reciprocal polynomial,
its trace resolvent, and the determinant/sign-change evidence that separates it
from the metallic/Pisot family.

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.reciprocal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.charPolySalem}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.salemTraceResolvent}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.charPolySalem_reciprocal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.charPolyMetallic_not_reciprocal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.salem_vs_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.det_salem_vs_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.salemCompanion_cayley_hamilton}

Checked:

```lean
example :
    reciprocal charPolySalem
      ∧ ¬ reciprocal (charPolyMetallic 1) :=
  by
    exact ⟨charPolySalem_reciprocal,
      charPolyMetallic_not_reciprocal 1⟩

example :
    det4 salemCompanion = 1
      ∧ det2 (metallicMatrix 1) = -1 :=
  det_salem_vs_pisot
```

The familiar comparison is Salem/Pisot spectral theory. The theorem in this library
is narrower and cleaner: reciprocal versus non-reciprocal polynomial data,
integer sign changes, determinant signature, and a companion-matrix identity.

## Regime Split

The regime page connects the algebraic split to closure language. An off-circle
contracting direction is strict. A unit-circle neutral direction is aperiodic.

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.inflationRegimeData}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.inflationRegime}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.inflation_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.inflation_salem}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.salem_vs_pisot_regime}

The Salem trace root is also constructed as a real witness:

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.salem_trace_root}

Checked:

```lean
example :
    inflationRegime true = ClosureRegime.aperiodic
      ∧ inflationRegime false = ClosureRegime.strict :=
  ⟨inflation_salem, inflation_pisot⟩

example :
    let s := Real.Internal.sqrtNat 13
    (RReal.one + s) * (RReal.one + s)
      = (s + s)
        + RReal.ofRat (Real.Internal.Rat.ofNat 14) := by
  dsimp
  exact salem_trace_root
```

This is the lawful crossing into regime speech. Later pages may use
"contracting", "neutral", "settling", and "aperiodic" for an inflation only
when they can supply the relevant carrier or explicitly mark the claim as
frontier.

## Predictor-Level Color And Finite Readout

The color predictor is now a proved bundle. It packages the Salem high-angle
trace evidence, the golden/Pisot contracting trace evidence, the
strict/aperiodic regime split, and the metallization dichotomy. The finite
diffraction module then promotes that predictor to the finite readout the
library currently proves: the finite Fourier-side component is pure-point exactly
on the Pisot side, singular-continuous exactly on the Salem side, and the Salem
component carries the trace-localized line read as `theta = arccos(root / 2)`.
The atom mass is the total finite diffraction mass, hence positive.

{docstring Obsmetrologia.AperiodicOrder.Tiling.TraceSignChange}

{docstring Obsmetrologia.AperiodicOrder.Tiling.PredictorLevelColorEvidence}

{docstring Obsmetrologia.AperiodicOrder.Tiling.color_predictor_evidence}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finiteFourierDualKind_purePoint_iff_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finiteFourierDualKind_singularContinuous_iff_salem}

{docstring Obsmetrologia.AperiodicOrder.Tiling.salemTraceAngleLine}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finiteFourierDualReadout_mass}

{docstring Obsmetrologia.AperiodicOrder.Tiling.salem_finiteFourierDualReadout_carries_line}

{docstring Obsmetrologia.AperiodicOrder.Tiling.homometric_finiteFourierDualReadout_atomMass_eq}

{docstring Obsmetrologia.AperiodicOrder.Tiling.finiteFourierDual_color_readout}

Checked:

```lean
example :
    PredictorLevelColorEvidence :=
  color_predictor_evidence

example :
    TraceSignChange salemTraceResolvent (-2) 0 :=
  color_predictor_evidence.salem_high_angle_trace

example :
    TraceSignChange (charPolyMetallic 1) (-1) 0 :=
  color_predictor_evidence.golden_contracting_trace

example (s : Bool) :
    finiteFourierDualKind s
      = FiniteDiffractionKind.purePoint
      ↔ IsPisotInflation s :=
  finiteFourierDualKind_purePoint_iff_pisot s

example (s : Bool) :
    finiteFourierDualKind s
      = FiniteDiffractionKind.singularContinuous
      ↔ IsSalemInflation s :=
  finiteFourierDualKind_singularContinuous_iff_salem s

example (n : Nat) (w : Fin (n + 1) → Bool) :
    (finiteFourierDualReadout n w true).line =
      some salemTraceAngleLine :=
  (salem_finiteFourierDualReadout_carries_line n w).2.1

example (n : Nat) (w : Fin (n + 1) → Bool) :
    0 < (finiteFourierDualReadout n w true).atomMass :=
  (salem_finiteFourierDualReadout_carries_line n w).2.2.2
```

This is the point where the finite spectrometer has a readout. What remains
frontier is the analytic promotion: construct the Fourier transform of a
translation-bounded reading autocorrelation measure and identify the
Bombieri-Taylor component there.

## C-Lehmer Reduction

The Lehmer-side claim is not proved here as an analytic number-theoretic
theorem. What the current Obsmetrologia Lean carrier proves is the finite
reduction shape over the Salem/Pisot spine. The carrier has two sides: the
contracting Pisot side and the neutral Salem side. The proved skeleton says that
the approach-to-unit-circle classifier, the Mahler-side receipt label currently
visible to Lean, the strict/aperiodic regime split, and the finite diffraction
readout all select the same split.

The new promotion is that the open part is no longer only an unnamed field in a
structure. It is a named claim-site:

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.SalemRootRegimeGap}

This is the exact role played by the Collatz residue inequality on the Collatz
page: the surrounding reduction is green, while the frontier is a named
predicate that must be supplied before the headline statement can be discharged.

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.CLehmerSide}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cLehmerApproachClassifier}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.CLehmerMahlerFace}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.CLehmerStatement}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.SalemRootRegimeStatement}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.salemRootRegimeStatement_iff_gap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.salemRootRegimeGap_iff_noSalemApproach}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cLehmer_green_skeleton}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.CLehmerFiniteReduction}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.MahlerSalemReduction}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cLehmerFiniteReduction_iff_mahlerSalemReduction}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cLehmerStatement_iff_pisotReceipt_and_salemRootRegimeGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cLehmerStatement_iff_pisotReceipt_and_noSalemApproach}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cLehmer_of_finiteReduction}

{docstring Obsmetrologia.AperiodicOrder.Tiling.StepN.cLehmer_of_mahlerSalemReduction}

Checked:

```lean
example (s : CLehmerSide) :
    cLehmerApproachClassifier s = true <->
      IsSalemInflation s :=
  cLehmerApproachClassifier_spec s

example (s : CLehmerSide) :
    cLehmerMahlerFace s =
        CLehmerMahlerFace.dominantRoot <->
      IsPisotInflation s :=
  cLehmerMahlerFace_dominantRoot_iff_pisot s

example :
    inflationRegime true = ClosureRegime.aperiodic /\
      inflationRegime false = ClosureRegime.strict :=
  cLehmer_green_skeleton.2.2.2.1

example (approaches : CLehmerSide -> Prop) :
    SalemRootRegimeStatement approaches <->
      SalemRootRegimeGap approaches :=
  salemRootRegimeStatement_iff_gap approaches

example (approaches : CLehmerSide -> Prop) :
    SalemRootRegimeGap approaches <->
      Not (approaches cLehmerSalem) :=
  salemRootRegimeGap_iff_noSalemApproach approaches

example (approaches : CLehmerSide -> Prop) :
    CLehmerStatement approaches <->
      (forall s : CLehmerSide,
        IsPisotInflation s -> Not (approaches s)) /\
        SalemRootRegimeGap approaches :=
  cLehmerStatement_iff_pisotReceipt_and_salemRootRegimeGap
    approaches

example (approaches : CLehmerSide -> Prop) :
    CLehmerStatement approaches <->
      (forall s : CLehmerSide,
        IsPisotInflation s -> Not (approaches s)) /\
        Not (approaches cLehmerSalem) :=
  cLehmerStatement_iff_pisotReceipt_and_noSalemApproach
    approaches

example (approaches : CLehmerSide -> Prop)
    (h : CLehmerFiniteReduction approaches) :
    CLehmerStatement approaches :=
  cLehmer_of_finiteReduction approaches h

example (approaches : CLehmerSide -> Prop)
    (h : MahlerSalemReduction approaches) :
    CLehmerStatement approaches :=
  cLehmer_of_mahlerSalemReduction approaches h
```

The named hole is therefore precise: supply `SalemRootRegimeGap approaches` in
the relevant approach predicate, or build a stronger Mahler-measure carrier in
Lean that removes that field. Until then, C-Lehmer is green only as a finite
reduction over the Step-N Salem spine. If the approach predicate is decidable,
the gap statement is the decidable finite-regime statement
`Not (approaches cLehmerSalem)`; the analytic work is choosing and proving the
right predicate, not deciding the current two-point carrier.

## Promotion Boundary

This page promotes a substitution from a finite rule to an algebraic
persistence witness when it supplies:

* a step-n bundle or a step-depth carrier;
* a substitution matrix generated from the rule;
* a polynomial identity for that matrix;
* primitivity when Perron-style language is invoked;
* a real root witness only after the real carrier is constructed;
* a Salem/Pisot or strict/aperiodic classification only through the regime
  theorem.
* a predictor-level color claim through `color_predictor_evidence`;
* a finite measured spectral atom through `finiteFourierDual_color_readout`.
* a C-Lehmer reduction only through `cLehmer_green_skeleton`,
  `cLehmerStatement_iff_pisotReceipt_and_salemRootRegimeGap`, and the explicit
  Salem-root-regime gap required by `CLehmerFiniteReduction`.

It does not promote resemblance. A visually growing pattern, a named metallic
ratio, or an analogy to a horizon is not a theorem. The missing carrier must be
named, and the construction that would promote it must be supplied.
