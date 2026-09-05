import ObsmetrologiaManual.DocSetup
import Obsmetrologia.AperiodicOrder.Tiling.CommonBaseClassification
import Obsmetrologia.AperiodicOrder.Tiling.GeometricMldComplete
import Obsmetrologia.AperiodicOrder.Tiling.Universality

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.AperiodicOrder.Tiling
open Obsmetrologia.AperiodicOrder.Tiling.CommonBase
open Obsmetrologia.AperiodicOrder.Tiling.Moduli
open Obsmetrologia.AperiodicOrder.Tiling.Universality

/-!
A teaching chapter for aperiodic classification, moduli, and universality.
-/

#doc (Manual) "Aperiodic classification and moduli" =>

# Aperiodic Classification And Moduli

The first aperiodic page teaches persistence by hulls, towers, condensates, and
colimits. This page teaches the classification surface that those witnesses
press toward. It is still Book VII material: the question is not "what is the
subject called?" but "what survives as a classifying carrier after non-Scott
settling?"

The claim-site carried here is:

* claim-site: aperiodic classification by classifying invariant, moduli point,
  and universality class;
* phase: persistence after non-Scott closure and cohomological gluing;
* generating sites: settling regime, H1 carrier, cohomological equivalence,
  local derivability, step-depth substack, shift equivalence;
* downstream uses: comparison atlas entries for tiling classification, frontier
  diagnostics for MLD completeness, and physical persistence pages that use
  "universality" or "moduli" language;
* Lean carriers: `Obsmetrologia.AperiodicOrder.Tiling.H1Carrier`,
  `Obsmetrologia.AperiodicOrder.Tiling.Settling`,
  `Obsmetrologia.AperiodicOrder.Tiling.CohEquiv`,
  `Obsmetrologia.AperiodicOrder.Tiling.LocalDerivability`,
  `Obsmetrologia.AperiodicOrder.Tiling.Moduli.StepRule`,
  `Obsmetrologia.AperiodicOrder.Tiling.Moduli.ModuliPoint`,
  `Obsmetrologia.AperiodicOrder.Tiling.Universality.SE`;
* Blueprint/proof-tree nodes: the classification converse is the frontier node
  `thm:aperiodic-mld-classification`; the primitive proof tree supplies the
  mark floor, not the classification theorem;
* provenance: aperiodic-regime classification, step-n moduli, and substitution
  universality notes;
* familiar comparison: Anderson-Putnam cohomology, MLD, moduli stack, RG fixed
  point, shift equivalence, symbolic-dynamics universality;
* reader closure: keep the proved refinement separate from the open converse;
* frontier status: `cl-inv` equality is proved as a coarse carrier, but full
  MLD completeness remains frontier unless the missing morphism construction is
  supplied.

The governing sentence is:

> Classification is lawful here only as a carrier of persistent descent.

## Classifying Invariant

A settling does not name a bare invariant. It carries a cocycle witness, and the
classifying invariant is read from that carrier.

The class carrier is:

{docstring Obsmetrologia.AperiodicOrder.Tiling.H1Carrier}

and a settling derives its invariant from the carrier:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Settling}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Settling.clInv}

The aperiodic nonzero witness is concrete:

{docstring Obsmetrologia.AperiodicOrder.Tiling.aperiodicWitness}

{docstring Obsmetrologia.AperiodicOrder.Tiling.aperiodicWitness_clinv_nonzero}

Checked:

```lean
example :
    aperiodicWitness.regime = ClosureRegime.aperiodic :=
  rfl

example :
    aperiodicWitness.clInv ≠ H1Class.zero :=
  aperiodicWitness_clinv_nonzero
```

The phase boundary is important. A nonzero classifying invariant is a
persistence witness. It is not automatically a complete classification of all
settling morphisms.

## Cohomological Equivalence And MLD

The proved relation is cohomological equivalence: equality of `cl-inv`.

{docstring Obsmetrologia.AperiodicOrder.Tiling.CohEquiv}

Its equivalence laws are formal:

{docstring Obsmetrologia.AperiodicOrder.Tiling.cohEquiv_refl}

{docstring Obsmetrologia.AperiodicOrder.Tiling.cohEquiv_symm}

{docstring Obsmetrologia.AperiodicOrder.Tiling.cohEquiv_trans}

The structural relation, mutual local derivability, is carried abstractly:

{docstring Obsmetrologia.AperiodicOrder.Tiling.LocalDerivability}

The proved direction is only the easy refinement:

{docstring Obsmetrologia.AperiodicOrder.Tiling.mld_refines_cohEquiv}

Checked:

```lean
example (D : LocalDerivability) {v v' : Settling}
    (h : D.Mld v v') :
    CohEquiv v v' :=
  mld_refines_cohEquiv D h

example (v : Settling) :
    CohEquiv v v :=
  cohEquiv_refl v
```

This is the honest frontier line. MLD implies equal classifying invariant. Equal
classifying invariant implying MLD is the missing promotion.

That line has since split into three precise statements. For the abstract
carrier above, the promoted theorem is still only the refinement direction. On a
common base, the library has a converse:

{docstring Obsmetrologia.AperiodicOrder.Tiling.CommonBase.baseMLD_of_clInv_eq}

{docstring Obsmetrologia.AperiodicOrder.Tiling.CommonBase.common_base_classification}

For the geometric carrier, the relation is packaged as complete:

{docstring Obsmetrologia.AperiodicOrder.Tiling.geometricMld_iff_cohEquiv}

{docstring Obsmetrologia.AperiodicOrder.Tiling.geometric_mld_complete}

Checked:

```lean
example {s s' : BaseSettling}
    (h : baseClInv s = baseClInv s') :
    BaseMLD s s' :=
  baseMLD_of_clInv_eq h

example (v v' : Settling) :
    geometricMld v v' ↔ CohEquiv v v' :=
  geometricMld_iff_cohEquiv v v'
```

The remaining frontier is therefore not "no converse exists." The common-base
and geometric converses exist. What remains frontier is the global identification
that transports the manual's direct settling readout through the primitive
closure iteration required by the named classification node.

## Regime Dichotomy

The strict and Scott regimes force vanishing. Aperiodic settling can carry a
nonzero class.

{docstring Obsmetrologia.AperiodicOrder.Tiling.clinv_zero_of_settles}

{docstring Obsmetrologia.AperiodicOrder.Tiling.clinv_dichotomy}

Checked:

```lean
example (v : Settling)
    (h : v.regime = ClosureRegime.strict
      ∨ v.regime = ClosureRegime.scott) :
    v.clInv = H1Class.zero :=
  clinv_zero_of_settles v h

example :
    ∃ v : Settling,
      v.regime = ClosureRegime.aperiodic
        ∧ v.clInv ≠ H1Class.zero :=
  clinv_dichotomy.2
```

So "aperiodic" does not mean "mysterious". It means the earlier vanishing
regimes no longer erase the classifying carrier.

## Step-N Moduli

A step-n substitution rule realizes an aperiodic settling and then a moduli
point.

{docstring Obsmetrologia.AperiodicOrder.Tiling.Moduli.StepRule}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Moduli.toSettling}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Moduli.ModuliPoint}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Moduli.toModuli}

The step-shift preserves the moduli point:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Moduli.stepShift}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Moduli.toModuli_stepShift}

Checked:

```lean
example {n : Nat} (r : StepRule n) :
    toModuli (stepShift r) = toModuli r :=
  toModuli_stepShift r

example {n : Nat} {p : ModuliPoint}
    (h : Moduli.M n p) :
    Moduli.M (n + 1) p :=
  M_stepShift_mono h
```

The point of the step-shift is not a larger alphabet. It is persistence of the
same moduli point across the generated depth.

## Stratification And Residue

The moduli phase separates points that are realized by some primitive step-n
rule from points that remain residue.

{docstring Obsmetrologia.AperiodicOrder.Tiling.Moduli.Stratified}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Moduli.Residue}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Moduli.stratified_or_residue}

Checked:

```lean
example (p : ModuliPoint) :
    (Stratified p -> Not (Residue p))
      ∧ (Residue p -> Not (Stratified p))
      ∧ (Not (Stratified p) -> Residue p)
      ∧ Not (Stratified p ∧ Residue p) :=
  stratified_or_residue p
```

Residue is not a trash category. It is the precisely named complement of the
step-n generated substacks. A residue point can be promoted only by constructing
a primitive step-n representative or by strengthening the moduli carrier.

## Universality Class

Substitution universality is carried as shift equivalence of substitution
matrices. This is a projection of symbolic dynamics, but in the manual it belongs
here because the invariant is being held by the persistence/moduli phase.

The matrix and relation carriers are:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Universality.Mat}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Universality.SE}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Universality.UniversalityClass}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Universality.toClass}

Checked:

```lean
example {n : Nat} (A : Mat n) :
    SE A A :=
  se_refl A

example {n : Nat} {A B : Mat n}
    (h : SE A B) :
    toClass A = toClass B :=
  toClass_eq_of_se h
```

The bundled theorem records both the equivalence-class reading and the
cohomological invariant tie:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Universality.universality_class_se_invariance}

The frontier boundary remains explicit. Fixed-dimension shift equivalence is
settled here. Cross-dimension shift equivalence, complete Čech recomputation for
every class, and the full MLD converse are not smuggled in by the word
"universality".

## Promotion Test

A classification page is promoted only when it can answer four questions:

1. What carrier holds the invariant?
2. Which relation is actually proved?
3. Which stronger relation is only a familiar comparison?
4. What construction would turn the frontier converse into a theorem?

For the present phase, the answer is: `cl-inv` equality is formal, MLD
refinement is formal, step-depth persistence is formal, and the complete MLD
classification remains frontier.
