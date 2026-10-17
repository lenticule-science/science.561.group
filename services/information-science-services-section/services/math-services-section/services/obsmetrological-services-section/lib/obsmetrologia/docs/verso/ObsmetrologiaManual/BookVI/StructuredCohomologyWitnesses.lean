import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Cohomology.KZCoherentSheaf
import Obsmetrologia.Cohomology.BigradedSettlingCohomology
import Obsmetrologia.Cohomology.LawvereHarmonicCohomology
import Obsmetrologia.Cohomology.FrobeniusTQFT

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.KZSheaf
open Obsmetrologia.Temporal
open Obsmetrologia.Bigraded
open Obsmetrologia.Cohomology
open Obsmetrologia.Cohomology.FrobeniusTQFT

/-!
A teaching chapter for structured cohomology witnesses generated after settled
sheaf descent.
-/

#doc (Manual) "Structured cohomology witnesses" =>

# Structured Cohomology Witnesses

The first gluing page makes sheaf and cohomology language lawful. This page
teaches the next layer: extra structure on the same generated gluing surface.
KZ coherence, bigrading, Lawvere harmonic H0, and Frobenius/TQFT structure are
not four imported theories. They are four ways of strengthening the claim-site
once local settled sections, covers, masks, and degree-zero/degree-one
cohomology already exist.

The claim-site carried here is:

* claim-site: structured cohomology witnesses over settled sheaf descent;
* phase: fibered and cohomological matter, after valuation fibers and gluing
  witnesses are lawful;
* generating sites: temporal one-cells, KZ 2-cells, designation rows, truth and
  inconsistency masks, Lawvere Laplacian fixed points, Cech classifying
  invariant, truncated `H0/H1` cohomology, and the `Z = Int x Int` worked
  Frobenius carrier;
* downstream uses: aperiodic 2-cell descent, truth/knowledge LES frontier,
  harmonic cohomology claims, TQFT projection entries, physical wave/plasma pages,
  and frontier moduli diagnostics;
* Lean declarations: `KZSheaf.KZCoherent`,
  `KZSheaf.kz_coherent_descent_predCat`, `Bigraded.Designation`,
  `Bigraded.dv`, `Bigraded.bigraded_two_row_mapping_cone`,
  `Bigraded.bigraded_refines_h1`,
  `Cohomology.lawvere_harmonic_section_classifying_invariant_zero`,
  `FrobeniusTQFT.settling_frobenius_algebra`,
  `FrobeniusTQFT.commutative_frobenius_is_tqft`;
* Blueprint/proof-tree nodes: structured cohomology nodes remain downstream of
  the sheaf/gluing node; full truth-knowledge LES and general Abrams
  equivalence remain frontier nodes;
* provenance: KZ coherent sheaf, bigraded settling cohomology, Lawvere harmonic
  cohomology, and settling Frobenius structure notes;
* familiar mathematical comparison: KZ/lax-idempotent descent, bicomplex mapping
  cone, Hodge `ker Delta = H0`, commutative Frobenius algebra, Abrams 2D TQFT;
* reader closure: identify which already-generated section maps, rows, fixed
  points, or finite algebra carrier make the structure lawful;
* frontier status: nontrivial aperiodic KZ 2-cells, full induced LES machinery,
  real Hilbert cochain Laplacians, general commutative-Frobenius/TQFT
  equivalence, and continuous moduli of Laplacianizers are not built here.

The governing sentence is:

> Structured cohomology is lawful only as extra structure on generated gluing.

## KZ Coherence

The KZ page pushes temporal 2-cell content up to the sheaf level. A KZ-coherent
sheaf identifies section maps along parallel one-cells connected by a KZ 2-cell.
In the strict/Scott regime every such 2-cell collapses to equality of one-cells,
so every sheaf is coherent; aperiodic nontriviality remains the frontier.

{docstring Obsmetrologia.KZSheaf.KZCoherent}

{docstring Obsmetrologia.KZSheaf.kz_coherent_descent_predCat}

Checked:

```lean
example {V W : Type} :
    (∀ (F : Sheaf predCat lamPreorder V),
      KZCoherent predCat lamPreorder F ↔
        ∀ {X Y : ZeroCell predCat lamPreorder}
          (f f' : OneCell predCat lamPreorder X Y),
          KZ2Cell predCat lamPreorder f f'
            → F.sec f = F.sec f')
    ∧ (∀ (F : Sheaf predCat lamPreorder V),
        KZCoherent predCat lamPreorder F) :=
  kz_coherent_descent_predCat (V := V) (W := W)
```

The reader closure is that KZ coherence is not a free sheaf adjective. It is a
descent condition on section maps along temporal routes.

## Two-Row Bigrading

The bigraded carrier is a two-row mapping-cone input. The designation grade is
not a number. It is the two-element truth/inconsistency designation, and the
vertical differential vanishes because the truth and inconsistency masks are
disjoint. The row index is
{name Obsmetrologia.Bigraded.Designation}`Designation`, the two-element
truth/inconsistency grade.

{docstring Obsmetrologia.Bigraded.dv}

{docstring Obsmetrologia.Bigraded.dv_zero}

{docstring Obsmetrologia.Bigraded.bigraded_two_row_mapping_cone}

Checked:

```lean
example (v : Valuation) (c : AssocSheaf.Cochain) :
    dv v c = AssocSheaf.zeroCochain :=
  dv_zero v c
```

This proves the cochain-level input to a mapping cone. It does not prove the
full cohomology-level long exact sequence.

## Refinement Of H1

The bigrading refines single-graded settling cohomology only after the regime
gate says cohomology vanishes, which is exactly the strict/Scott side.

{docstring Obsmetrologia.Bigraded.bigraded_refines_h1}

Checked:

```lean
example (r : ClosureRegime)
    (hr : Obsmetrologia.cohomologyVanishes r = true) :
    (Row .truth = AssocSheaf.Cochain
      ∧ Row .inconsistency = AssocSheaf.Cochain)
    ∧ (Obsmetrologia.cohomologyVanishes r = true ↔
        (r = ClosureRegime.strict
          ∨ r = ClosureRegime.scott))
    ∧ (r = ClosureRegime.strict
      ∨ r = ClosureRegime.scott)
    ∧ (∀ d : Designation,
      d = Designation.truth
        ∨ d = Designation.inconsistency)
    ∧ (∀ D : Cohomology.Cech1,
      Cohomology.Cocycle D →
        (∃ g : AssocSheaf.Cochain,
          Cohomology.Coboundary D g)
          ∧ (∀ g g' : AssocSheaf.Cochain,
            Cohomology.Coboundary D g →
            Cohomology.Coboundary D g' → g = g')) :=
  bigraded_refines_h1 r hr
```

The frontier line is explicit: this is the refinement theorem the current
dependency-free model can state. The full truth-knowledge LES over induced
cohomology maps remains a construction task.

## Lawvere Harmonic H0

The Lawvere harmonic page welds two independently generated surfaces: the
order-Laplacian kernel and the Cech classifying invariant. In a vanishing
regime, the settled section is harmonic, its classifying invariant is a
coboundary, and `H0` counts truth-firing cells.

{docstring Obsmetrologia.Cohomology.lawvere_harmonic_section_classifying_invariant_zero}

Checked:

```lean
example (M : Valuation.ModalFrame) (seed : Valuation)
    (r : ClosureRegime)
    (hr : Obsmetrologia.cohomologyVanishes r = true)
    (c : Sheaf.Cover) (cells : List PredicationCell) :
    LawvereLaplacian.IsHarmonic M (M.settle seed)
    ∧ (r = ClosureRegime.strict
      ∨ r = ClosureRegime.scott)
    ∧ Cohomology.Cocycle
      (clInvDatum (M.settle seed) c)
    ∧ Cohomology.Coboundary
      (clInvDatum (M.settle seed) c)
      (identityCochain (M.settle seed))
    ∧ (∀ g g' : AssocSheaf.Cochain,
      Cohomology.Coboundary
        (clInvDatum (M.settle seed) c) g →
      Cohomology.Coboundary
        (clInvDatum (M.settle seed) c) g' →
      g = g')
    ∧ H0 (M.settle seed) cells
      = cells.countP
        (fun φ =>
          Reading.isTruthFiring ((M.settle seed) φ)) :=
  lawvere_harmonic_section_classifying_invariant_zero
    M seed r hr c cells
```

This is the inner-product-free Hodge projection. It does not promote a real
Hilbert-space Hodge theorem.

## Settling Frobenius And TQFT Projection

The Frobenius page provides a finite worked algebra `Z = Int x Int`, read as
`H0` on the unit axis and `H1` on the top axis. The Abrams/TQFT statement is an
instance for this worked commutative Frobenius algebra, not the general
categorical equivalence.

{docstring Obsmetrologia.Cohomology.FrobeniusTQFT.settling_frobenius_algebra}

{docstring Obsmetrologia.Cohomology.FrobeniusTQFT.commutative_frobenius_is_tqft}

Checked:

```lean
example :
    settling_frobenius_algebra.Z.A = Z2 :=
  settling_frobenius_algebra.carrier_is_Z2

example :
    frobeniusTqftCorrespondence.tqft.A
      = frobeniusTqftCorrespondence.cfa.A
    ∧ frobeniusTqftCorrespondence.tqft
      = tqftOfCommutative
        frobeniusTqftCorrespondence.cfa :=
  commutative_frobenius_is_tqft
```

The physical reading is a 2D TQFT. The lawful carrier is the worked Frobenius
algebra with proven operations and the generated correspondence instance.

## Reader Closure

When a later page invokes structured cohomology, test it by asking:

* Which section maps are being equated?
* Which designation row carries the claim?
* Which regime permits vanishing or collapse?
* Which finite carrier realizes the algebraic structure?
* Which general theorem is still only a familiar comparison?

If the answer is absent, the claim is still frontier.
