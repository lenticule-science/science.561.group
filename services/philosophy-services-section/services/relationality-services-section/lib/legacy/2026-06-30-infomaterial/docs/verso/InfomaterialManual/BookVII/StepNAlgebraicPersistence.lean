import InfomaterialManual.DocSetup
import Infomaterial.Persistence.Aperiodic.StepN.Recurrence
import Infomaterial.Persistence.Aperiodic.StepN.SubstitutionMatrix
import Infomaterial.Persistence.Aperiodic.SubstitutionPrimitivity
import Infomaterial.Persistence.Aperiodic.StepN.MetallicMean
import Infomaterial.Persistence.Aperiodic.StepN.MetallicReal
import Infomaterial.Persistence.Aperiodic.StepN.MetallicRoot
import Infomaterial.Persistence.Aperiodic.StepN.MetallicPowerLens
import Infomaterial.Persistence.Aperiodic.StepN.Salem
import Infomaterial.Persistence.Aperiodic.StepN.SalemRegime
import Infomaterial.Persistence.Aperiodic.StepN.SalemRoot
import Infomaterial.Persistence.Aperiodic.ColorPredictor

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Persistence.Aperiodic
open Infomaterial.Persistence.Aperiodic.StepN
open Infomaterial.Persistence.Aperiodic.Universality
open Infomaterial.Real.Internal

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
  persistence, shroud-indexed keratin, infohole diagnostics, and any later
  claim that an inflation has a settling or non-settling internal direction;
* Lean declarations: `StepNData`, `mkStepN`, `charPolyFib`,
  `charPolyPad`, `substMatrix`, `fibonacciMatrix`, `padovanMatrix`,
  `Primitive`, `metallicMatrix`, `metallicNum`, `cassiniVal`, `metallicZ`,
  `charPolySalem`, `salemTrace`, `inflationRegime`,
  `color_predictor_evidence`;
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
* frontier status: full spectral theory, complex conjugates, diffraction type,
  and general Perron-Frobenius eigenvectors are not present. Promoting them
  requires the missing carriers for spectra, complex roots, measure/diffraction,
  or a full ordered-vector Perron-Frobenius construction.

The governing sentence is:

> Step-depth becomes persistent only when the algebraic witness survives as a
> generated carrier, not when an external algebraic resemblance is noticed.

This matters for later books. If a page says that a horizon, material phase, or
infohole has an inflationary persistence profile, the lawful upstream object is
this page's carrier: a substitution rule with a matrix, a primitive positive
power when contraction is claimed, a polynomial identity when algebraic growth
is claimed, and a regime theorem when the strict/aperiodic split is claimed.

## Co-Incrementing Data

The step parameter is not a label pasted onto unrelated data. The canonical
bundle makes matrix dimension, recurrence depth, alphabet size, and
cohomological rank equal to the same `n`.

{docstring Infomaterial.Persistence.Aperiodic.StepN.StepNData}

{docstring Infomaterial.Persistence.Aperiodic.StepN.mkStepN}

{docstring Infomaterial.Persistence.Aperiodic.StepN.mkStepN_all_eq}

The low-step characteristic polynomials carry the degree side of the same
claim-site.

{docstring Infomaterial.Persistence.Aperiodic.StepN.charPolyFib}

{docstring Infomaterial.Persistence.Aperiodic.StepN.charPolyPad}

{docstring Infomaterial.Persistence.Aperiodic.StepN.substitution_growth_degree_n}

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

{docstring Infomaterial.Persistence.Aperiodic.StepN.substMatrix}

{docstring Infomaterial.Persistence.Aperiodic.StepN.fibonacciMatrix}

{docstring Infomaterial.Persistence.Aperiodic.StepN.padovanMatrix}

{docstring Infomaterial.Persistence.Aperiodic.StepN.cayleyHamilton_fibonacci}

{docstring Infomaterial.Persistence.Aperiodic.StepN.cayleyHamilton_padovan}

{docstring Infomaterial.Persistence.Aperiodic.StepN.padovanMatrix_is_chu_incidence}

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

{docstring Infomaterial.Persistence.Aperiodic.StepN.NonnegativeMatrix}

{docstring Infomaterial.Persistence.Aperiodic.StepN.PositiveMatrix}

{docstring Infomaterial.Persistence.Aperiodic.StepN.Primitive}

{docstring Infomaterial.Persistence.Aperiodic.StepN.fibonacciMatrix_primitive}

{docstring Infomaterial.Persistence.Aperiodic.StepN.padovanMatrix_primitive}

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

{docstring Infomaterial.Persistence.Aperiodic.StepN.metallicMatrix}

{docstring Infomaterial.Persistence.Aperiodic.StepN.metallic_quadratic}

{docstring Infomaterial.Persistence.Aperiodic.StepN.charPolyMetallic}

{docstring Infomaterial.Persistence.Aperiodic.StepN.cayleyHamilton_metallic}

The integer recurrence is the inflation engine:

{docstring Infomaterial.Persistence.Aperiodic.StepN.metallicNum}

{docstring Infomaterial.Persistence.Aperiodic.StepN.metallicMatrix_pow_succ}

{docstring Infomaterial.Persistence.Aperiodic.StepN.metallicNum_pos}

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

{docstring Infomaterial.Persistence.Aperiodic.StepN.cassiniVal}

{docstring Infomaterial.Persistence.Aperiodic.StepN.metallic_cassini}

{docstring Infomaterial.Persistence.Aperiodic.StepN.metallic_root}

{docstring Infomaterial.Persistence.Aperiodic.StepN.metallicZ}

{docstring Infomaterial.Persistence.Aperiodic.StepN.metallicZ_sq}

{docstring Infomaterial.Persistence.Aperiodic.StepN.metallic_power_expansion}

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

{docstring Infomaterial.Persistence.Aperiodic.StepN.reciprocal}

{docstring Infomaterial.Persistence.Aperiodic.StepN.charPolySalem}

{docstring Infomaterial.Persistence.Aperiodic.StepN.salemTrace}

{docstring Infomaterial.Persistence.Aperiodic.StepN.charPolySalem_reciprocal}

{docstring Infomaterial.Persistence.Aperiodic.StepN.charPolyMetallic_not_reciprocal}

{docstring Infomaterial.Persistence.Aperiodic.StepN.salem_vs_pisot}

{docstring Infomaterial.Persistence.Aperiodic.StepN.det_salem_vs_pisot}

{docstring Infomaterial.Persistence.Aperiodic.StepN.salemCompanion_cayley_hamilton}

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

{docstring Infomaterial.Persistence.Aperiodic.StepN.inflationRegimeData}

{docstring Infomaterial.Persistence.Aperiodic.StepN.inflationRegime}

{docstring Infomaterial.Persistence.Aperiodic.StepN.inflation_pisot}

{docstring Infomaterial.Persistence.Aperiodic.StepN.inflation_salem}

{docstring Infomaterial.Persistence.Aperiodic.StepN.salem_vs_pisot_regime}

The Salem trace root is also constructed as a real witness:

{docstring Infomaterial.Persistence.Aperiodic.StepN.salem_trace_root}

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

## Predictor-Level Color

The color predictor is now a proved bundle, but only at predictor level. It
packages the Salem high-angle trace evidence, the golden/Pisot contracting
trace evidence, the strict/aperiodic regime split, and the metallization
dichotomy. It does not say that the Fourier-dual diffraction measure has an
atom at the predicted frequency.

{docstring Infomaterial.Persistence.Aperiodic.TraceSignChange}

{docstring Infomaterial.Persistence.Aperiodic.PredictorLevelColorEvidence}

{docstring Infomaterial.Persistence.Aperiodic.color_predictor_evidence}

Checked:

```lean
example :
    PredictorLevelColorEvidence :=
  color_predictor_evidence

example :
    TraceSignChange salemTrace (-2) 0 :=
  color_predictor_evidence.salem_high_angle_trace

example :
    TraceSignChange (charPolyMetallic 1) (-1) 0 :=
  color_predictor_evidence.golden_contracting_trace
```

The open instrument is the readout: construct the Fourier-side measure and prove
that the predicted frequency has positive atomic mass. Until that carrier exists,
the manual may say "predictor-level color line"; it may not say that the
spectrometer has read the atom.

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
* a predictor-level color claim only through `color_predictor_evidence`; a
  measured spectral atom still requires the Fourier-dual readout theorem.

It does not promote resemblance. A visually growing pattern, a named metallic
ratio, or an analogy to a horizon is not a theorem. The missing carrier must be
named, and the construction that would promote it must be supplied.
