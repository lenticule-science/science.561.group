import InfomaterialManual.DocSetup
import Infomaterial.Cohomology.AlexandrovHusainov
import Infomaterial.Cohomology.AntiLandauerEntropy
import Infomaterial.Cohomology.CRDTCohomologicalCALM
import Infomaterial.Cohomology.Defect
import Infomaterial.Cohomology.LandauerEntropy
import Infomaterial.Cohomology.NegativeParaconsistentSheaf
import Infomaterial.Cohomology.TransfiniteCellComplex

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Cohomology
open Infomaterial.Alexandrov

/-!
A teaching chapter for the cohomology neighborhood as lawful claim-sites.
-/

#doc (Manual) "Cohomology claim-sites" =>

# Cohomology Claim-Sites

The cohomology neighborhood is large enough to tempt a subject tour. This page
refuses that temptation. It files the named cohomological constructions by their
claim-site in the gluing phase: order recovery, coordination cost, thermodynamic
projection, defect, negative mirror, and transfinite continuity.

The claim-site carried here is:

* claim-site: cohomology modules as lawful gluing and obstruction carriers;
* phase: fibered and cohomological matter;
* generating sites: valuation fiber, settling site, cover nerve, H1 vanishing,
  aperiodic classifying invariant, and finite-subcomplex directed systems;
* downstream uses: aperiodic persistence, physical obstruction pages,
  Landauer and anti-Landauer entropy projections, causal Alexandrov pages, and
  frontier diagnostics for non-effective gluing;
* Lean carriers: `Infomaterial.Cohomology.AlexandrovHusainov`,
  `Infomaterial.Cohomology.CoordinationCohomology`,
  `Infomaterial.Cohomology.LandauerEntropy`,
  `Infomaterial.Cohomology.Defect`,
  `Infomaterial.Cohomology.NegativeParaconsistentSheaf`,
  `Infomaterial.Cohomology.TransfiniteCellComplex`;
* Blueprint/proof-tree nodes: Blueprint cohomology nodes are incidence
  carriers; the proof tree supplies the primitive base but does not by itself
  prove these obstruction claims;
* provenance: settling cohomology, coordination cohomology, Landauer entropy,
  negative paraconsistent sheaf, and transfinite cell-complex notes;
* familiar comparison: Alexandrov topology, Cech cohomology, Landauer principle,
  defect theory, paraconsistent duality, filtered colimit;
* reader closure: identify whether a cohomology word names gluing, obstruction,
  cost, mirror symmetry, or limit continuity;
* frontier status: general sheaf cohomology, derived categories, analytic
  entropy, continuum defect theory, and arbitrary transfinite topology are not
  promoted by these finite carriers.

The governing sentence is:

> A cohomology phrase is lawful only when it says what failed, or succeeded, to
> glue.

## Alexandrov Recovery

Alexandrov language is lawful here because the order carrier has already been
generated. The topology is not an ambient space; it is the up-set topology of a
poset, and the specialization order recovers that poset.

{docstring Infomaterial.Alexandrov.AlexandrovTopology}

{docstring Infomaterial.Alexandrov.AlexandrovTopology.specializes_iff_le}

{docstring Infomaterial.Alexandrov.AlexandrovTopology.specializes_eq_le}

Checked:

```lean
example (T : AlexandrovTopology) :
    T.specializes = T.poset.le :=
  T.specializes_eq_le
```

This is why later causal Alexandrov intervals may be read as topology only
after causal order has generated the poset.

## Coordination Cost

A cover nerve measures gluing obstruction by cycle rank. The carrier is finite:
entities, cells, components, and the union-find bound.

{docstring Infomaterial.Cohomology.CoverNerve}

{docstring Infomaterial.Cohomology.CoverNerve.H1rank}

{docstring Infomaterial.Cohomology.CoverNerve.h1_vanishes_iff_forest}

{docstring Infomaterial.Cohomology.CoverNerve.h1rank_is_coordination_cost}

Checked:

```lean
example (N : CoverNerve) :
    N.H1rank =
      N.cells - (N.entities - N.components) :=
  (CoverNerve.h1rank_is_coordination_cost N).1

example (N : CoverNerve) :
    N.CoordinationFree <->
      N.entities = N.cells + N.components :=
  CoverNerve.coordinationFree_iff_forest N
```

The familiar comparison is Cech `H1`. The generated claim is smaller and sharper:
cycle rank is the coordination cost of a finite gluing nerve.

## Landauer Projection

Landauer entropy is admitted only as the thermodynamic reading of that
coordination obstruction.

{docstring Infomaterial.Landauer.landauerBits}

{docstring Infomaterial.Landauer.landauer_zero_iff_reversible}

{docstring Infomaterial.Landauer.landauer_eq_coordination_cost}

Checked:

```lean
example (N : CoverNerve) :
    Landauer.landauerBits N = N.H1rank :=
  rfl

example (N : CoverNerve) :
    Landauer.landauerBits N =
      N.cells - (N.entities - N.components) :=
  Landauer.landauer_eq_coordination_cost N
```

The page law is doing work here. The bit cost is not imported from statistical
mechanics. It is the physical reading of the already generated obstruction rank.

## Consensus Ledger

The same finite carrier has a signed reading. The consensus side is `H0`: the
component/global-section count. The contradiction side is `H1`: the cycle rank.
The Euler characteristic is the conserved net between them.

{docstring Infomaterial.AntiLandauer.consensusCharge}

{docstring Infomaterial.AntiLandauer.contradictionCharge}

{docstring Infomaterial.AntiLandauer.netCharge}

{docstring Infomaterial.AntiLandauer.net_charge_balance}

{docstring Infomaterial.AntiLandauer.vacuum_iff_charge_balance}

Checked:

```lean
example (N : CoverNerve) :
    (AntiLandauer.consensusCharge N : Int)
      - (AntiLandauer.contradictionCharge N : Int)
        = AntiLandauer.netCharge N :=
  AntiLandauer.net_charge_balance N

example (N : CoverNerve) :
    AntiLandauer.Vacuum N <->
      (AntiLandauer.consensusCharge N : Int)
        = (AntiLandauer.contradictionCharge N : Int) :=
  AntiLandauer.vacuum_iff_charge_balance N
```

The physical reading is deliberately finite here. Consensus is not an added
substance; it is the already proved `H0` side of the index theorem.

## Defect

A defect is not a material noun. In this carrier it is a nonzero classifying
invariant of a settling.

{docstring Infomaterial.Cohomology.Defect.HasDefect}

{docstring Infomaterial.Cohomology.Defect.no_defect_of_settles}

{docstring Infomaterial.Cohomology.Defect.hasDefect_curved}

{docstring Infomaterial.Cohomology.Defect.defect_exists}

Checked:

```lean
example :
    ∃ v : Persistence.Aperiodic.Settling,
      v.regime = ClosureRegime.aperiodic
        ∧ Defect.HasDefect v :=
  Defect.defect_exists
```

The implication is one-way. A defect forces curvature; curvature is not claimed
to force a defect. That missing converse would need its own carrier.

## Negative Paraconsistent Mirror

The negative sheaf is the falsity-side mirror of the Belnap-designated positive
sheaf. It is generated by negation on charges, not by adding a second unrelated
cohomology theory.

{docstring Infomaterial.NegSheaf.dNeg}

{docstring Infomaterial.NegSheaf.dNeg_eq_dFonly_or_dTop}

{docstring Infomaterial.NegSheaf.negative_sheaf_is_negation_mirror}

{docstring Infomaterial.NegSheaf.negative_paraconsistent_split}

Checked:

```lean
example (v : Valuation) (phi : PredicationCell) :
    NegSheaf.dNeg v phi =
      (NegSheaf.dFonly v phi || AssocSheaf.dTop v phi) :=
  NegSheaf.dNeg_eq_dFonly_or_dTop v phi

example (v : Valuation) (phi : PredicationCell) :
    NegSheaf.dNeg v phi =
      AssocSheaf.dK (negateVal v) phi :=
  NegSheaf.dNeg_eq_dK_negateVal v phi
```

The shared top component is the seam. If a later page uses negative evidence, it
must say whether it is reading this mirror or introducing a new frontier carrier.

## Transfinite Cell Complex

Transfinite cohomology language is lawful here only through a filtered finite
carrier. A large complex is read as the colimit of finite subcomplexes when a
covering family witnesses that every cell appears at some finite stage.

{docstring Infomaterial.CellComplex.CellComplex}

{docstring Infomaterial.CellComplex.FiniteSub}

{docstring Infomaterial.CellComplex.transfinite_complex_is_colimit_of_finite}

Checked:

```lean
example (X : CellComplex.CellComplex) :
    (∀ cover : ∀ _ : X.cells, CellComplex.FiniteSub X,
        (∀ σ : X.cells, (cover σ).mem σ) ->
          ∀ σ : X.cells, CellComplex.InColimit σ)
      ∧ (∀ S S' : CellComplex.FiniteSub X,
          ∃ T : CellComplex.FiniteSub X,
            S.Sub T ∧ S'.Sub T)
      ∧ (∀ σ : X.cells,
          CellComplex.InColimit σ <->
            ∃ S : CellComplex.FiniteSub X,
              σ ∈ S.cells_fin) :=
  CellComplex.transfinite_complex_is_colimit_of_finite X
```

This is not arbitrary transfinite topology. It is the precise finite-stage
descent law that later aperiodic and continuum-frontier pages may use.

## Repair Test

When a cohomological claim appears downstream, repair it by asking:

1. Is it a gluing theorem, obstruction rank, defect, mirror, or limit law?
2. Which local carrier is being glued?
3. Which theorem witnesses the obstruction or vanishing?
4. Which stronger familiar cohomology theorem is not being claimed?

If those answers are absent, the page is not yet promoted. It is frontier until
the missing carrier or gluing theorem is supplied.
