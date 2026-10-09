import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Site.Basic
import Obsmetrologia.Site.Claim
import Obsmetrologia.Site.Intension
import Obsmetrologia.Site.Section
import Obsmetrologia.Site.Topic

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.PredicationCell.TermContext.Hom
open Obsmetrologia.PredicationCell.IntensionalFrame
open Obsmetrologia.Site
open Obsmetrologia.AssocSheaf

/-!
A teaching chapter for claim-sites as descent data.
-/

#doc (Manual) "Claim-site descent" =>

# Claim-Site Descent

This is the Grothendieckian reading of the manual. A claim is not understood by
its name, and not even by a single declaration. It is understood by the site on
which it descends.

The claim-site carried here is:

* claim-site: descent data over predication-cell site points and generated phase covers;
* phase: fibered and cohomological matter, after covers and sections are lawful;
* generating sites: clopen covers, fixed-fiber restriction, valuation masks,
  section separation, H1-zero gluing, and frontier obstruction;
* downstream uses: Page Law repair, frontier promotion, comparison-atlas entries,
  physical composite pages, and every phrase whose meaning depends on several
  carriers;
* Lean carriers: `Obsmetrologia.Site.Basic`, `Obsmetrologia.Site.Claim`,
  `Obsmetrologia.Site.Topic`, `Obsmetrologia.Site.Intension`,
  `Obsmetrologia.Site.Section`, and `Obsmetrologia.Site.Sheaf`;
* Blueprint/proof-tree nodes: Blueprint records incidence; Lean records
  settlement; Verso records descent for a reader; provenance records why the
  claim was sought;
* provenance: the Page Law in the root manual plus the bitopological-settling
  site and settling-associated-sheaf modules;
* familiar comparison: sheaf descent, effective descent, separated presheaf,
  gluing, and obstruction;
* reader closure: replace "what topic is this?" with "over which generated site
  does this claim descend?";
* frontier status: `PredicationCell` and `PredicationCell.SitePoint` now name the point/site split.
  `PredicationCell.Topic` now names a mathematical topic as a site-local claim concept.
  The full manual carrier family and its glued documentation section are still
  frontier structure over that split.

The governing sentence is:

> A stable page is an effective descent datum over its generated phase cover.

## Predication Cells And Site Points

The point/site split is now formal. A {name Obsmetrologia.PredicationCell}`PredicationCell` is the
predication-generated point. A {name Obsmetrologia.PredicationCell.SitePoint}`PredicationCell.SitePoint`
is that point placed in the settling site with a stratum and clopen support.

Checked:

```lean
example (q : PredicationCell) (tau : Nat) (U : Clopen) :
    (PredicationCell.sitePoint q tau U).q = q :=
  PredicationCell.sitePoint_claim q tau U

example (q : PredicationCell) (tau : Nat) (U : Clopen) :
    (PredicationCell.sitePoint q tau U).U = U :=
  PredicationCell.sitePoint_support q tau U

example {src dst : PredicationCell.SitePoint}
    (f : PredicationCell.FiberHom src dst) :
    f.support = src.U :=
  PredicationCell.fiberHom_support f
```

## Covers Are Not Names

The cover relation is not a list of topics. It is a fixed-fiber refinement:

{docstring Obsmetrologia.Site.Covers}

Pullback and transitivity are the beginning of the geometry:

{docstring Obsmetrologia.Site.covers_pullback}

{docstring Obsmetrologia.Site.covers_trans}

Checked:

```lean
example {U V : Clopen} {fam : List Clopen}
    (hcov : Covers U fam) (hVU : V ⊑ U) :
    Covers V (fam.map (meet V)) :=
  covers_pullback hcov hVU

example {U : Clopen} {fam : List Clopen}
    (subf : Clopen -> List Clopen)
    (hcov : Covers U fam)
    (hsub : forall Ui, Ui ∈ fam -> Covers Ui (subf Ui)) :
    Covers U (fam.flatMap subf) :=
  covers_trans subf hcov hsub
```

This is what the manual failed to do when it merely added subject pages. A
phrase like "keratinous disc" is not covered by adding three names to a paragraph.
It is covered only when the boundary, material, and topology pieces refine one
generated site and glue.

## Topics Are Localized Concepts

Here a topic is not a page bucket. It is a concept over a claim/term incidence
context, localized at a claim site point, with its clopen cover retained as data.

The term context supplies a generated term carrier:

{docstring Obsmetrologia.PredicationCell.TermContext}

The concept is FCA's closed extent/intent pair specialized to claims:

{docstring Obsmetrologia.PredicationCell.Concept}

The topic adds the site point and support cover:

{docstring Obsmetrologia.PredicationCell.Topic}

Topic restriction is the first site-level descent move for concepts:

{docstring Obsmetrologia.PredicationCell.Topic.restrict}

Each member of a topic's own cover generates a local restricted topic:

{docstring Obsmetrologia.PredicationCell.Topic.coverRestriction}

Two generated local topics agree in concept on their clopen overlap:

{docstring Obsmetrologia.PredicationCell.Topic.coverRestriction_overlap_concepts_agree}

Checked:

```lean
example (Term : Type) (I : PredicationCell -> Term -> Prop) :
    (PredicationCell.TermContext.ofIncidence Term I).Term = Term :=
  PredicationCell.TermContext.ofIncidence_Term Term I

example (C : PredicationCell.TermContext) (A : FCA.ExtSet PredicationCell) :
    FCA.closeA C.incidence
        (PredicationCell.Concept.ofExtent C A).extent =
      (PredicationCell.Concept.ofExtent C A).extent :=
  PredicationCell.Concept.extent_closed (PredicationCell.Concept.ofExtent C A)

example {C : PredicationCell.TermContext} (T : PredicationCell.Topic C) :
    (forall Ui, Ui ∈ T.cover -> Ui ⊑ T.point.U)
      /\ joinList T.cover = T.point.U :=
  PredicationCell.Topic.cover_is_fiber_local T

example {C : PredicationCell.TermContext}
    (T : PredicationCell.Topic C) {src : PredicationCell.SitePoint}
    (f : PredicationCell.FiberHom src T.point) :
    (PredicationCell.Topic.restrict T f).point = src :=
  rfl

example {C : PredicationCell.TermContext}
    (T : PredicationCell.Topic C) {src : PredicationCell.SitePoint}
    (f : PredicationCell.FiberHom src T.point) :
    (forall Ui,
        Ui ∈ (PredicationCell.Topic.restrict T f).cover ->
          Ui ⊑ src.U) /\
      joinList (PredicationCell.Topic.restrict T f).cover = src.U :=
  PredicationCell.Topic.restrict_cover_is_fiber_local T f

example {C : PredicationCell.TermContext}
    (T : PredicationCell.Topic C) (Ui : Clopen)
    (hUi : Ui ∈ T.cover) :
    (PredicationCell.Topic.coverRestriction T Ui hUi).concept =
      T.concept :=
  rfl

example {C : PredicationCell.TermContext}
    (T : PredicationCell.Topic C) (Ui : Clopen)
    (hUi : Ui ∈ T.cover) :
    (forall Wi,
        Wi ∈ (PredicationCell.Topic.coverRestriction
          T Ui hUi).cover ->
          Wi ⊑ Ui) /\
      joinList
        (PredicationCell.Topic.coverRestriction T Ui hUi).cover =
        Ui :=
  PredicationCell.Topic.coverRestriction_cover_is_fiber_local
    T Ui hUi

example {C : PredicationCell.TermContext}
    (T : PredicationCell.Topic C) (Ui Uj : Clopen)
    (hUi : Ui ∈ T.cover) (hUj : Uj ∈ T.cover) :
    (PredicationCell.Topic.coverRestriction
        (PredicationCell.Topic.coverRestriction T Ui hUi)
        (meet Ui Uj)
        (PredicationCell.Topic.coverOverlap_left_mem
          T Ui Uj hUi hUj)).concept =
      (PredicationCell.Topic.coverRestriction
        (PredicationCell.Topic.coverRestriction T Uj hUj)
        (meet Ui Uj)
        (PredicationCell.Topic.coverOverlap_right_mem
          T Ui Uj hUi hUj)).concept :=
  PredicationCell.Topic.coverRestriction_overlap_concepts_agree
    T Ui Uj hUi hUj
```

## Term Readings Are The First Intensional Surface

A bare term is only an element of a carrier. Its first readable surface is its
claim profile inside a term context:

{docstring Obsmetrologia.PredicationCell.TermContext.profile}

Closing that profile gives the generated concept:

{docstring Obsmetrologia.PredicationCell.TermContext.generatedConcept}

The generating term is not added back by hand; it is in the generated intent:

{docstring Obsmetrologia.PredicationCell.TermContext.generatedConcept_in_intent}

Moving readings between contexts requires explicit transport data:

{docstring Obsmetrologia.PredicationCell.TermContext.Hom}

Transport uses the valuation fibration rather than a second support convention:

{docstring Obsmetrologia.PredicationCell.TermContext.Hom.pullbackValuation}

{docstring Obsmetrologia.PredicationCell.TermContext.Hom.pullbackValuation_eq_self_of_claimMap_eq}

and that pullback commutes with lifted valuation closure:

{docstring Obsmetrologia.PredicationCell.TermContext.Hom.pullbackValuation_liftOp}

A term reading then records that the term belongs to the closed intent of a local
topic:

{docstring Obsmetrologia.PredicationCell.TermReading}

Restricting a term reading only restricts its topic; the term and intent witness
are retained:

{docstring Obsmetrologia.PredicationCell.TermReading.restrict}

Each cover member generates a local term reading:

{docstring Obsmetrologia.PredicationCell.TermReading.coverRestriction}

Those local readings agree in term on overlaps:

{docstring Obsmetrologia.PredicationCell.TermReading.coverRestriction_overlap_terms_agree}

A valuated term reading adds a valuation and keeps the support witness as data:

{docstring Obsmetrologia.PredicationCell.ValuatedTermReading}

Restricting a valuated reading keeps the valuation and support witness:

{docstring Obsmetrologia.PredicationCell.ValuatedTermReading.restrict}

Each cover member generates a local valuated reading:

{docstring Obsmetrologia.PredicationCell.ValuatedTermReading.coverRestriction}

  Those local valuated readings agree in valuation on overlaps:
  
  {docstring Obsmetrologia.PredicationCell.ValuatedTermReading.coverRestriction_overlap_valuations_agree}

  A valuated reading also gives the first honest bridge from topic covers to
  sheaf-style masks. A clopen is read through the valuation's positive and
  negative reading slots:

  {docstring Obsmetrologia.PredicationCell.ValuatedTermReading.clopenPatch}

  and finite clopen joins become finite unions of those patches:

  {docstring Obsmetrologia.PredicationCell.ValuatedTermReading.clopenPatch_joinList_true}

  The resulting carrier is relative to the topic support:

  {docstring Obsmetrologia.PredicationCell.ValuatedTermReading.PatchFamily}

  {docstring Obsmetrologia.PredicationCell.ValuatedTermReading.topicPatchFamily}

  It becomes a global sheaf cover only after full support is supplied:

  {docstring Obsmetrologia.PredicationCell.ValuatedTermReading.topicSheafCover}
  
  The first primary/secondary split is concept-valued. A primary reading lets the
  term vary with each context in a frame:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.TermFamily}

A secondary reading fixes an actual term and transports it into the other
contexts:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.AnchoredTerm}

The anchor also induces a primary term family by transport:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.AnchoredTerm.termFamily}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.AnchoredTerm.actual_pullbackValuation}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.AnchoredTerm.actual_supports_transport}

This is where the primary/secondary split becomes comparable:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.primaryConcept_from_anchor}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.primaryReading_from_anchor}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.primaryPatchFamily_from_anchor}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.primarySheafCover_from_anchor}

Both readings become site-local topics only after a site point is witnessed in
the generated concept extent:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.primaryTopic}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryTopic}

and then the generated intent supplies the term-reading witness:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.primaryReading}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryReading}

Valuation support then attaches to those readings:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.primaryValuatedReading}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryValuatedReading}

The same valuated readings now continue through the relative patch-family bridge:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.primaryPatchFamily}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryPatchFamily}

Their patches promote to global sheaf covers only under full support:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.primarySheafCover}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondarySheafCover}

and secondary support can be pulled back to the actual reading:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryActualPullbackValuatedReading}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryActualPullbackValuation_at_actual}

and then read as a patch family at the actual index:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryActualPullbackPatchFamily}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryActualPullbackPatchFamily_support_at_actual}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryActualPullbackPatchFamily_patches_at_actual}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryActualPullbackSheafCover}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.actualFullSupport_of_pullback}

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryActualPullbackSheafCover_patches_at_actual}

At the actual index, the secondary anchor is coherent with the actual term:

{docstring Obsmetrologia.PredicationCell.IntensionalFrame.secondaryConcept_actual}

Checked:

```lean
example (C : PredicationCell.TermContext) (t : C.Term) :
    FCA.closeA C.incidence
        (PredicationCell.TermContext.generatedConcept C t).extent =
      (PredicationCell.TermContext.generatedConcept C t).extent :=
  PredicationCell.TermContext.generatedConcept_extent_closed C t

example (C : PredicationCell.TermContext) (t : C.Term) :
    (PredicationCell.TermContext.generatedConcept C t).intent t :=
  PredicationCell.TermContext.generatedConcept_in_intent C t

example {C D : PredicationCell.TermContext}
    (F : PredicationCell.TermContext.Hom C D)
    {q : PredicationCell} {t : C.Term}
    (h : PredicationCell.TermContext.profile C t q) :
    PredicationCell.TermContext.profile D
      (F.termMap t) (F.claimMap q) :=
  PredicationCell.TermContext.Hom.profile_preserved F h

example {C : PredicationCell.TermContext} (R : PredicationCell.TermReading C) :
    (forall Ui, Ui ∈ R.topic.cover -> Ui ⊑ R.topic.point.U)
      /\ joinList R.topic.cover = R.topic.point.U :=
  PredicationCell.TermReading.cover_is_fiber_local R

example {C : PredicationCell.TermContext}
    (R : PredicationCell.TermReading C) {src : PredicationCell.SitePoint}
    (f : PredicationCell.FiberHom src R.topic.point) :
    (PredicationCell.TermReading.restrict R f).term = R.term :=
  rfl

example {C : PredicationCell.TermContext}
    (R : PredicationCell.TermReading C) {src : PredicationCell.SitePoint}
    (f : PredicationCell.FiberHom src R.topic.point) :
    (forall Ui,
        Ui ∈ (PredicationCell.TermReading.restrict
          R f).topic.cover ->
          Ui ⊑ src.U) /\
      joinList
        (PredicationCell.TermReading.restrict R f).topic.cover =
        src.U :=
  PredicationCell.TermReading.restrict_cover_is_fiber_local R f

example {C : PredicationCell.TermContext}
    (R : PredicationCell.TermReading C) (Ui : Clopen)
    (hUi : Ui ∈ R.topic.cover) :
    (PredicationCell.TermReading.coverRestriction R Ui hUi).term =
      R.term :=
  rfl

example {C : PredicationCell.TermContext}
    (R : PredicationCell.TermReading C) (Ui : Clopen)
    (hUi : Ui ∈ R.topic.cover) :
    (forall Wi,
        Wi ∈ (PredicationCell.TermReading.coverRestriction
          R Ui hUi).topic.cover ->
          Wi ⊑ Ui) /\
      joinList
        (PredicationCell.TermReading.coverRestriction
          R Ui hUi).topic.cover =
        Ui :=
  PredicationCell.TermReading.coverRestriction_cover_is_fiber_local
    R Ui hUi

example {C : PredicationCell.TermContext}
    (R : PredicationCell.TermReading C) (Ui Uj : Clopen)
    (hUi : Ui ∈ R.topic.cover) (hUj : Uj ∈ R.topic.cover) :
    (PredicationCell.TermReading.coverRestriction
        (PredicationCell.TermReading.coverRestriction R Ui hUi)
        (meet Ui Uj)
        (PredicationCell.Topic.coverOverlap_left_mem
          R.topic Ui Uj hUi hUj)).term =
      (PredicationCell.TermReading.coverRestriction
        (PredicationCell.TermReading.coverRestriction R Uj hUj)
        (meet Ui Uj)
        (PredicationCell.Topic.coverOverlap_right_mem
          R.topic Ui Uj hUi hUj)).term :=
  PredicationCell.TermReading.coverRestriction_overlap_terms_agree
    R Ui Uj hUi hUj

example {C D : PredicationCell.TermContext}
    (F : PredicationCell.TermContext.Hom C D)
    (v : Valuation) {q : PredicationCell} {t : C.Term}
    (hsupport : forall q',
      PredicationCell.TermContext.profile D (F.termMap t) q' ->
        Reading.isTruthFiring (v q') = true)
    (h : PredicationCell.TermContext.profile C t q) :
    Reading.isTruthFiring
      (PredicationCell.TermContext.Hom.pullbackValuation
        F v q) = true :=
  PredicationCell.TermContext.Hom.pullback_supports_profile
    F v hsupport h

example {C D : PredicationCell.TermContext}
    (F : PredicationCell.TermContext.Hom C D)
    (v : Valuation)
    (hclaim : forall q, F.claimMap q = q) :
    PredicationCell.TermContext.Hom.pullbackValuation F v = v :=
  pullbackValuation_eq_self_of_claimMap_eq F v hclaim

example {C D : PredicationCell.TermContext}
    (F : PredicationCell.TermContext.Hom C D)
    (c : Reading.Closure) (v : Valuation) :
    PredicationCell.TermContext.Hom.pullbackValuation F
        (Valuation.liftOp c.op v) =
      Valuation.liftOp c.op
        (PredicationCell.TermContext.Hom.pullbackValuation F v) :=
  PredicationCell.TermContext.Hom.pullbackValuation_liftOp
    F c v

example {C : PredicationCell.TermContext}
    (R : PredicationCell.ValuatedTermReading C) {q : PredicationCell}
    (h : PredicationCell.TermContext.profile C R.reading.term q) :
    Reading.isTruthFiring (R.valuation q) = true :=
  PredicationCell.ValuatedTermReading.supports_profile R h

example {C : PredicationCell.TermContext}
    (R : PredicationCell.ValuatedTermReading C)
    {src : PredicationCell.SitePoint}
    (f : PredicationCell.FiberHom src R.reading.topic.point) :
    (PredicationCell.ValuatedTermReading.restrict R f).valuation =
      R.valuation :=
  rfl

example {C : PredicationCell.TermContext}
    (R : PredicationCell.ValuatedTermReading C)
    {src : PredicationCell.SitePoint}
    (f : PredicationCell.FiberHom src R.reading.topic.point) :
    (forall Ui,
        Ui ∈
          (PredicationCell.ValuatedTermReading.restrict
            R f).reading.topic.cover ->
          Ui ⊑ src.U) /\
      joinList
        (PredicationCell.ValuatedTermReading.restrict
          R f).reading.topic.cover = src.U :=
  PredicationCell.ValuatedTermReading.restrict_cover_is_fiber_local
    R f

example {C : PredicationCell.TermContext}
    (R : PredicationCell.ValuatedTermReading C)
    {src : PredicationCell.SitePoint}
    (f : PredicationCell.FiberHom src R.reading.topic.point)
    {q : PredicationCell}
    (h :
      PredicationCell.TermContext.profile C
        (PredicationCell.ValuatedTermReading.restrict
          R f).reading.term q) :
    Reading.isTruthFiring
        ((PredicationCell.ValuatedTermReading.restrict
          R f).valuation q) =
      true :=
  PredicationCell.ValuatedTermReading.restrict_supports_profile
    R f h

namespace Obsmetrologia.PredicationCell.ValuatedTermReading

example {C : PredicationCell.TermContext}
    (R : PredicationCell.ValuatedTermReading C) (Ui : Clopen)
    (hUi : Ui ∈ R.reading.topic.cover) :
    (PredicationCell.ValuatedTermReading.coverRestriction
      R Ui hUi).valuation = R.valuation :=
  rfl

example {C : PredicationCell.TermContext}
    (R : PredicationCell.ValuatedTermReading C) (Ui : Clopen)
    (hUi : Ui ∈ R.reading.topic.cover) :
    (forall Wi,
        Wi ∈
          (PredicationCell.ValuatedTermReading.coverRestriction
            R Ui hUi).reading.topic.cover ->
          Wi ⊑ Ui) /\
      joinList
        (PredicationCell.ValuatedTermReading.coverRestriction
          R Ui hUi).reading.topic.cover =
        Ui :=
  coverRestriction_cover_is_fiber_local R Ui hUi

example {C : PredicationCell.TermContext}
    (R : PredicationCell.ValuatedTermReading C) (Ui : Clopen)
    (hUi : Ui ∈ R.reading.topic.cover) {q : PredicationCell}
    (h :
      PredicationCell.TermContext.profile C
        (PredicationCell.ValuatedTermReading.coverRestriction
          R Ui hUi).reading.term q) :
    Reading.isTruthFiring
        ((PredicationCell.ValuatedTermReading.coverRestriction
          R Ui hUi).valuation q) =
      true :=
  coverRestriction_supports_profile R Ui hUi h

  example {C : PredicationCell.TermContext}
      (R : PredicationCell.ValuatedTermReading C) (Ui Uj : Clopen)
      (hUi : Ui ∈ R.reading.topic.cover)
      (hUj : Uj ∈ R.reading.topic.cover) :
    (coverRestriction
        (coverRestriction R Ui hUi)
        (meet Ui Uj)
        (PredicationCell.Topic.coverOverlap_left_mem
          R.reading.topic Ui Uj hUi hUj)).valuation =
      (coverRestriction
        (coverRestriction R Uj hUj)
        (meet Ui Uj)
        (PredicationCell.Topic.coverOverlap_right_mem
          R.reading.topic Ui Uj hUi hUj)).valuation :=
    coverRestriction_overlap_valuations_agree
      R Ui Uj hUi hUj

  example (v : Valuation) (U V : Clopen)
      (φ : PredicationCell) :
      clopenPatch v (join U V) φ =
        (clopenPatch v U φ || clopenPatch v V φ) :=
    clopenPatch_join v U V φ

  example (v : Valuation) (φ : PredicationCell)
      {fam : List Clopen}
      (h : clopenPatch v (joinList fam) φ = true) :
      Exists fun U =>
        U ∈ fam /\ clopenPatch v U φ = true :=
    clopenPatch_joinList_true v φ h

  example {C : PredicationCell.TermContext}
      (R : PredicationCell.ValuatedTermReading C) :
      (topicPatchFamily R).support =
        clopenPatch R.valuation R.reading.topic.point.U :=
    rfl

  example {C : PredicationCell.TermContext}
      (R : PredicationCell.ValuatedTermReading C) :
      (forall φ,
          (topicPatchFamily R).support φ = true ->
            Exists fun p =>
              p ∈ (topicPatchFamily R).patches /\
                p φ = true) :=
    (topicPatchFamily R).covers_support

  example {C : PredicationCell.TermContext}
      (R : PredicationCell.ValuatedTermReading C)
      (hfull : forall φ,
        clopenPatch R.valuation
          R.reading.topic.point.U φ = true) :
      Sheaf.Cover :=
    topicSheafCover R hfull
  
  end Obsmetrologia.PredicationCell.ValuatedTermReading

example {F : PredicationCell.IntensionalFrame}
    (T : PredicationCell.IntensionalFrame.TermFamily F)
    (i : F.Index) :
    FCA.closeA (F.context i).incidence
        (PredicationCell.IntensionalFrame.primaryConcept T i).extent =
      (PredicationCell.IntensionalFrame.primaryConcept T i).extent :=
  PredicationCell.IntensionalFrame.primaryConcept_extent_closed T i

example {F : PredicationCell.IntensionalFrame}
    (T : PredicationCell.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.primaryConcept
        T i).extent point.q) :
    (forall Ui,
        Ui ∈ (PredicationCell.IntensionalFrame.primaryTopic
          T i point h).cover ->
          Ui ⊑ point.U) /\
      joinList
        (PredicationCell.IntensionalFrame.primaryTopic
          T i point h).cover = point.U :=
  PredicationCell.IntensionalFrame.primaryTopic_cover_is_fiber_local
    T i point h

example {F : PredicationCell.IntensionalFrame}
    (T : PredicationCell.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.primaryConcept
        T i).extent point.q) :
    (PredicationCell.IntensionalFrame.primaryReading
      T i point h).term = T.termAt i :=
  rfl

example {F : PredicationCell.IntensionalFrame}
    (T : PredicationCell.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.primaryConcept
        T i).extent point.q) :
    (forall Ui,
        Ui ∈ (PredicationCell.IntensionalFrame.primaryReading
          T i point h).topic.cover ->
          Ui ⊑ point.U) /\
      joinList
        (PredicationCell.IntensionalFrame.primaryReading
          T i point h).topic.cover = point.U :=
  PredicationCell.IntensionalFrame.primaryReading_cover_is_fiber_local
    T i point h

example {F : PredicationCell.IntensionalFrame}
    (T : PredicationCell.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.primaryConcept
        T i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile
        (F.context i) (T.termAt i) q ->
        Reading.isTruthFiring (v q) = true) :
    (forall Ui,
        Ui ∈ (PredicationCell.IntensionalFrame.primaryValuatedReading
          T i point h v hsupport).reading.topic.cover ->
          Ui ⊑ point.U) /\
      joinList
        (PredicationCell.IntensionalFrame.primaryValuatedReading
          T i point h v hsupport).reading.topic.cover =
        point.U :=
  primaryValuatedReading_cover_is_fiber_local
    T i point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (T : PredicationCell.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.primaryConcept
        T i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile
        (F.context i) (T.termAt i) q ->
        Reading.isTruthFiring (v q) = true) :
    PredicationCell.ValuatedTermReading.PatchFamily :=
  primaryPatchFamily T i point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (T : PredicationCell.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.primaryConcept
        T i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile
        (F.context i) (T.termAt i) q ->
        Reading.isTruthFiring (v q) = true) :
    forall φ,
      (primaryPatchFamily
        T i point h v hsupport).support φ =
        true ->
        Exists fun p =>
          p ∈ (primaryPatchFamily
            T i point h v hsupport).patches /\
            p φ = true :=
  primaryPatchFamily_covers_support T i point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (T : PredicationCell.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.primaryConcept
        T i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile
        (F.context i) (T.termAt i) q ->
        Reading.isTruthFiring (v q) = true)
    (hfull : forall φ,
      PredicationCell.ValuatedTermReading.clopenPatch
        v point.U φ = true) :
    Sheaf.Cover :=
  primarySheafCover T i point h v hsupport hfull

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) {q : PredicationCell}
    (h : PredicationCell.TermContext.profile
      (F.context A.actual) A.term q) :
    PredicationCell.TermContext.profile (F.context i)
      ((A.transport i).termMap A.term)
      ((A.transport i).claimMap q) :=
  PredicationCell.IntensionalFrame.secondary_profile_preserved A i h

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F) :
    PredicationCell.IntensionalFrame.secondaryConcept A A.actual =
      PredicationCell.TermContext.generatedConcept
        (F.context A.actual) A.term :=
  PredicationCell.IntensionalFrame.secondaryConcept_actual A

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) :
    (PredicationCell.IntensionalFrame.AnchoredTerm.termFamily
      A).termAt i =
      (A.transport i).termMap A.term :=
  rfl

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F) :
    (PredicationCell.IntensionalFrame.AnchoredTerm.termFamily
      A).termAt A.actual = A.term :=
  PredicationCell.IntensionalFrame.AnchoredTerm.termFamily_actual A

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (v : Valuation) :
    PredicationCell.TermContext.Hom.pullbackValuation
        (A.transport A.actual) v = v :=
  AnchoredTerm.actual_pullbackValuation A v

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile
        (F.context A.actual) A.term q ->
        Reading.isTruthFiring (v q) = true) :
    forall q,
      PredicationCell.TermContext.profile (F.context A.actual)
        ((A.transport A.actual).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true :=
  AnchoredTerm.actual_supports_transport A v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) :
    primaryConcept
        (PredicationCell.IntensionalFrame.AnchoredTerm.termFamily
          A) i =
      secondaryConcept A i :=
  primaryConcept_from_anchor A i

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    {q : PredicationCell}
    (h : PredicationCell.TermContext.profile
      (F.context A.actual) A.term q) :
    PredicationCell.TermContext.profile (F.context A.actual)
      ((A.transport A.actual).termMap A.term) q :=
  secondary_profile_preserved_at_actual A h

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A i).extent point.q) :
    (forall Ui,
        Ui ∈ (PredicationCell.IntensionalFrame.secondaryTopic
          A i point h).cover ->
          Ui ⊑ point.U) /\
      joinList
        (PredicationCell.IntensionalFrame.secondaryTopic
          A i point h).cover = point.U :=
  PredicationCell.IntensionalFrame.secondaryTopic_cover_is_fiber_local
    A i point h

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A i).extent point.q) :
    (PredicationCell.IntensionalFrame.secondaryReading
      A i point h).term =
      (A.transport i).termMap A.term :=
  rfl

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A i).extent point.q) :
    primaryReading
        (PredicationCell.IntensionalFrame.AnchoredTerm.termFamily A)
        i point h =
      secondaryReading A i point h :=
  primaryReading_from_anchor A i point h

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A i).extent point.q) :
    (forall Ui,
        Ui ∈ (PredicationCell.IntensionalFrame.secondaryReading
          A i point h).topic.cover ->
          Ui ⊑ point.U) /\
      joinList
        (PredicationCell.IntensionalFrame.secondaryReading
          A i point h).topic.cover = point.U :=
  secondaryReading_cover_is_fiber_local A i point h

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true) :
    (forall Ui,
        Ui ∈ (secondaryValuatedReading
          A i point h v hsupport).reading.topic.cover ->
          Ui ⊑ point.U) /\
      joinList
        (secondaryValuatedReading
          A i point h v hsupport).reading.topic.cover =
        point.U :=
  secondaryValuatedReading_cover_is_fiber_local
    A i point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true) :
    PredicationCell.ValuatedTermReading.PatchFamily :=
  secondaryPatchFamily A i point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true) :
    forall φ,
      (secondaryPatchFamily
        A i point h v hsupport).support φ =
        true ->
        Exists fun p =>
          p ∈ (secondaryPatchFamily
            A i point h v hsupport).patches /\
            p φ = true :=
  secondaryPatchFamily_covers_support A i point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true)
    (hfull : forall φ,
      PredicationCell.ValuatedTermReading.clopenPatch
        v point.U φ = true) :
    Sheaf.Cover :=
  secondarySheafCover A i point h v hsupport hfull

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true) :
    primaryPatchFamily
        (PredicationCell.IntensionalFrame.AnchoredTerm.termFamily A)
        i point h v hsupport =
      secondaryPatchFamily A i point h v hsupport :=
  primaryPatchFamily_from_anchor A i point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true)
    (hfull : forall φ,
      PredicationCell.ValuatedTermReading.clopenPatch
        v point.U φ = true) :
    primarySheafCover
        (PredicationCell.IntensionalFrame.AnchoredTerm.termFamily A)
        i point h v hsupport hfull =
      secondarySheafCover A i point h v hsupport hfull :=
  primarySheafCover_from_anchor
    A i point h v hsupport hfull

local notation "actualPullbackCoverLocal" =>
  secondaryActualPullbackReading_cover_is_fiber_local

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true) :
    (forall Ui,
        Ui ∈
          (secondaryActualPullbackValuatedReading
            A i point h v hsupport).reading.topic.cover ->
          Ui ⊑ point.U) /\
      joinList
        (secondaryActualPullbackValuatedReading
          A i point h v hsupport).reading.topic.cover =
        point.U :=
  actualPullbackCoverLocal A i point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context A.actual)
        ((A.transport A.actual).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true) :
    (secondaryActualPullbackValuatedReading
      A A.actual point h v hsupport).valuation = v :=
  secondaryActualPullbackValuation_at_actual
    A point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true) :
    PredicationCell.ValuatedTermReading.PatchFamily :=
  secondaryActualPullbackPatchFamily A i point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context A.actual)
        ((A.transport A.actual).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true) :
    (secondaryActualPullbackPatchFamily
        A A.actual point h v hsupport).support =
      (secondaryPatchFamily
        A A.actual point h v hsupport).support :=
  secondaryActualPullbackPatchFamily_support_at_actual
    A point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context A.actual)
        ((A.transport A.actual).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true) :
    (secondaryActualPullbackPatchFamily
        A A.actual point h v hsupport).patches =
      (secondaryPatchFamily
        A A.actual point h v hsupport).patches :=
  secondaryActualPullbackPatchFamily_patches_at_actual
    A point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true) :
    forall φ,
      (secondaryActualPullbackPatchFamily
        A i point h v hsupport).support φ = true ->
        Exists fun p =>
          p ∈ (secondaryActualPullbackPatchFamily
            A i point h v hsupport).patches /\
            p φ = true :=
  secondaryActualPullbackPatchFamily_covers_support
    A i point h v hsupport

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true)
    (hfull : forall φ,
      PredicationCell.ValuatedTermReading.clopenPatch
        (PredicationCell.TermContext.Hom.pullbackValuation
          (A.transport i) v) point.U φ = true) :
    Sheaf.Cover :=
  secondaryActualPullbackSheafCover
    A i point h v hsupport hfull

local notation "actualFullSupport" =>
  actualFullSupport_of_pullback

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (point : PredicationCell.SitePoint)
    (v : Valuation)
    (hfull : forall φ,
      PredicationCell.ValuatedTermReading.clopenPatch
        (PredicationCell.TermContext.Hom.pullbackValuation
          (A.transport A.actual) v) point.U φ = true) :
    forall φ,
      PredicationCell.ValuatedTermReading.clopenPatch
        v point.U φ = true :=
  actualFullSupport_of_pullback A point v hfull

example {F : PredicationCell.IntensionalFrame}
    (A : PredicationCell.IntensionalFrame.AnchoredTerm F)
    (point : PredicationCell.SitePoint)
    (h :
      (PredicationCell.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      PredicationCell.TermContext.profile (F.context A.actual)
        ((A.transport A.actual).termMap A.term) q ->
        Reading.isTruthFiring (v q) = true)
    (hfull : forall φ,
      PredicationCell.ValuatedTermReading.clopenPatch
        (PredicationCell.TermContext.Hom.pullbackValuation
          (A.transport A.actual) v) point.U φ = true) :
    (secondaryActualPullbackSheafCover
        A A.actual point h v hsupport hfull).patches =
      (secondarySheafCover
        A A.actual point h v hsupport
          (actualFullSupport A point v hfull)).patches :=
  secondaryActualPullbackSheafCover_patches_at_actual
    A point h v hsupport hfull
```

## Temporal Advance Is Not Cover

The site refuses a common documentation error: mistaking later vocabulary for a
cover of earlier vocabulary.

{docstring Obsmetrologia.Site.no_temporal_covers}

Checked:

```lean
example (U U' : Clopen) :
    Covers U [U'] <-> U' = U :=
  covers_singleton_iff U U'
```

This is the Page Law in mathematical form. A later word can be a morphism out of
an earlier site, but it is not automatically a cover. "Physics" does not cover
"closure"; "black hole" does not cover "causal order"; "keratin" does not cover
"lock history." The cover must be generated at the right fiber.

## Sections Are What Glue

The sheaf side says that local agreement on a cover determines a global section:

{docstring Obsmetrologia.AssocSheaf.cochain_separated}

and the associated sheaf bundles the restriction and gluing laws:

{docstring Obsmetrologia.AssocSheaf.settling_associated_sheaf}

Checked:

```lean
example (m : PredicationCell -> Bool) (c : Cochain) :
    Vanishes m (restrict m c) :=
  restrict_vanishes m c

example (c : Cochain) :
    restrict (fun _ => true) c = c :=
  restrict_id c
```

For the manual, a page is stable when its local carriers agree: Lean declarations,
Blueprint nodes, proof-tree ancestry, provenance notes, familiar comparison, and
reader closure all restrict to the same claim-site. If they do not, the page is
not a theorem surface. It is a frontier datum.

## Effective Descent And Non-Descent

Effective descent has a practical test:

* the generating phase is named;
* the cover is fixed at that phase, not borrowed from a later subject;
* restrictions to earlier carriers are visible;
* local examples agree on overlaps;
* a Lean theorem or construction carries the glued claim;
* the remaining non-glued part is named as frontier.

Non-effective descent is also useful. It says the phrase has compatible local
projections but no global carrier yet. The frontier is then not a vague TODO; it is
the missing object that would make the descent effective.

This is how the manual should treat ambitious phrases. A phrase may be
mathematically fertile long before it is a theorem. But the book must show
whether it descends.
