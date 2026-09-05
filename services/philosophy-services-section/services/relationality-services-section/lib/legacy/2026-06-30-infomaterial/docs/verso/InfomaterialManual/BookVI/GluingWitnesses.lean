import InfomaterialManual.DocSetup
import Infomaterial.Site.Section
import Infomaterial.Cohomology.SettlingCohomologyH1
import Infomaterial.Cohomology.BigradedTruthKnowledgeLES
import Infomaterial.Cohomology.InconsistencySheaf

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Bigraded

/-!
A teaching chapter for sites, sheaves, and cohomology as lawful gluing
witnesses after valuation fibers have been generated.
-/

#doc (Manual) "Gluing witnesses" =>

# Gluing Witnesses

Book VI is where the word "sheaf" first becomes lawful.

It is not lawful because topology has been imported as a new foundation. It is
lawful because a valuation fiber has already been generated over predication
cells, closure has already supplied settled sections, and the next question is
whether local settled sections glue.

The claim-site carried here is:

* claim-site: site, sheaf, and cohomology witnesses for settled valuation fibers;
* phase: fibered and cohomological matter;
* generating sites: predication cell, charge valuation, closure operator,
  valuation fiber, truth/knowledge designation masks;
* downstream uses: local constancy, classifying invariants, inconsistency
  sheaves, contextuality, vortex obstruction, plasma reconnection, aperiodic
  persistence, causal cohomology;
* Lean carriers: `Infomaterial.Site.Sheaf`, `Infomaterial.Site.Section`,
  `Infomaterial.Cohomology.SettlingCohomologyH1`,
  `Infomaterial.Cohomology.BigradedTruthKnowledgeLES`,
  `Infomaterial.Cohomology.InconsistencySheaf`;
* Blueprint/proof-tree nodes: Blueprint has `ch:sheaf`; the mark proof-tree is
  still upstream provenance, not a sheaf node;
* provenance: the older settling-associated-sheaf notes are refit here only
  after the valuation fiber and closure phase have generated the base;
* familiar comparison: Grothendieck site, sheaf separation, Cech `H^1`, short exact
  sequence, direct sum;
* reader closure: track which mask is active before reading a cohomology claim;
* frontier status: full graded long exact sequences over non-placeholder
  cohomology objects remain frontier beyond the degree-zero split.

The governing sentence is:

> Cohomology is the obstruction surface of already-settled local sections.

## The Site Is A Settling Site

The site carrier is not a space of points. It is a cover system over the
predication-cell base after valuation and closure have made sections meaningful.
The basic sheaf carrier is {name Infomaterial.Sheaf}`Sheaf`: a settled
valuation read as one coherent section.

and designation is a property of the section's charge at a predication cell:

{docstring Infomaterial.Sheaf.designated}

The cover carrier is {name Infomaterial.Sheaf.Cover}`Sheaf.Cover`: patches
whose union reaches every predication cell. The separation law is the first
lawful sheaf fact:

{docstring Infomaterial.Sheaf.separated}

Checked:

```lean
example (c : Sheaf.Cover) (v w : Valuation)
    (h : forall p, p ∈ c.patches -> Sheaf.agreeOn p v w) :
    v = w :=
  Sheaf.separated c v w h
```

The phase lesson is that sheaf language starts from restriction and agreement
over generated covers. It does not license arbitrary topological intuition.

## The Associated Sheaf Uses Masks

The associated sheaf is a cochain surface over the same predication base. It has
three designation masks:

{docstring Infomaterial.AssocSheaf.dT}

{docstring Infomaterial.AssocSheaf.dK}

{docstring Infomaterial.AssocSheaf.dTop}

They are not interchangeable. `dT` is truth-designation, `dTop` is
overdetermined inconsistency, and `dK` is their Belnap-designated union. The
split is a theorem, not a reading habit:

{docstring Infomaterial.AssocSheaf.dT_dTop_disjoint}

{docstring Infomaterial.AssocSheaf.dK_eq_dT_or_dTop}

Restriction is the presheaf operation:

{docstring Infomaterial.AssocSheaf.restrict}

{docstring Infomaterial.AssocSheaf.restrict_vanishes}

Checked:

```lean
example
    (m : PredicationCell -> Bool)
    (c : AssocSheaf.Cochain) :
    AssocSheaf.Vanishes m
      (AssocSheaf.restrict m c) :=
  AssocSheaf.restrict_vanishes m c

example (v : Valuation) (phi : PredicationCell) :
    ¬ (AssocSheaf.dT v phi = true
      ∧ AssocSheaf.dTop v phi = true) :=
  AssocSheaf.dT_dTop_disjoint v phi
```

The reader closure is to keep the support mask visible. A cohomology statement
that forgets its mask has already lost the phase.

## H1 Vanishing Is Gluing, Not Decoration

Cech data for settling cohomology is local section data over a cover:

{docstring Infomaterial.Cohomology.Cech1}

The cocycle condition says the locals agree on overlaps:

{docstring Infomaterial.Cohomology.Cocycle}

The coboundary condition says the locals come from one global section:

{docstring Infomaterial.Cohomology.Coboundary}

The gluing theorem is:

{docstring Infomaterial.Cohomology.h1_vanishes}

Checked:

```lean
example (D : Cohomology.Cech1) :
    Cohomology.H1Vanishes D :=
  Cohomology.h1_vanishes D
```

This is the strict-side gluing lesson. It says an agreeing local family has a
unique global section in the present carrier. It does not say every future
aperiodic or physical obstruction vanishes.

## H0 Counts Designated Global Content

Degree zero is the settled global content count over a finite cell support:

{docstring Infomaterial.Cohomology.H0}

{docstring Infomaterial.Cohomology.h0_is_designated_count}

Checked:

```lean
example (v : Valuation) (cells : List PredicationCell) :
    Cohomology.H0 v cells
      = cells.countP
          (fun phi => Charge.isTruthFiring (v phi)) :=
  (Cohomology.h0_is_designated_count v cells).1
```

The familiar comparison is `H^0` as global sections. The Infomaterial carrier is
more concrete: a designated-cell count in the generated valuation fiber.

## The Truth Knowledge Split

The bigraded page promotes the degree-zero split from prose into Lean. Knowledge
sections split into truth sections and overdetermined sections:

{docstring Infomaterial.Bigraded.truth_knowledge_section_decomposition}

and the current graded statement records the honest boundary:

{docstring Infomaterial.Bigraded.truth_knowledge_graded_decomposition}

Checked:

```lean
example (v : Valuation) :
    (forall c : KSec v,
        merge v (split v c) = c)
      ∧ (forall p :
          TSec v × TopSec v,
        split v (merge v p) = p) :=
  truth_knowledge_section_decomposition v
```

The frontier boundary is important. Degree zero has real objects. The full
graded long exact sequence over a non-placeholder cochain complex is not claimed
here.

## Inconsistency Is A Cokernel Witness

The inconsistency sheaf is not a mood. It is the `dTop` side of the split:

{docstring Infomaterial.InconSheaf.IsSection}

{docstring Infomaterial.InconSheaf.inconsistency_sheaf_is_cokernel}

Its degree-zero count is:

{docstring Infomaterial.InconSheaf.H0top}

{docstring Infomaterial.InconSheaf.h0top_is_inconsistency_count}

Checked:

```lean
example (v : Valuation) (cells : List PredicationCell) :
    Infomaterial.InconSheaf.H0top v cells
      = cells.countP
          (fun phi => Charge.isInconsistency (v phi)) :=
  (Infomaterial.InconSheaf.h0top_is_inconsistency_count
    v cells).1
```

The downstream pages use this boundary repeatedly. Quantum contextuality, fluid
vortices, reconnection, and aperiodic persistence may all look like obstruction
stories, but each must say which carrier obstructs gluing and which cohomology
object witnesses it.

## Repair Path

If this chapter fails, repair in this order:

1. Return to Book III for `PredicationCell`, `Charge`, and `Valuation`.
2. Return to Book IV for closure and the pointwise valuation lift.
3. Read Book VI's valuation-fiber page for the truth-order algebra.
4. Then read `Infomaterial.Site.Sheaf` and `Infomaterial.Site.Section`.
5. Only then read cohomology pages and physical obstruction pages.

The generated law is simple: no sheaf before local sections, no cohomology before
gluing, and no obstruction claim without a named carrier.
