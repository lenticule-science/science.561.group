import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Site.Basic
import Obsmetrologia.Site.Claim
import Obsmetrologia.Site.Intension
import Obsmetrologia.Site.Section
import Obsmetrologia.Site.Topic

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Claim.TermContext.Hom
open Obsmetrologia.Claim.IntensionalFrame
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

* claim-site: descent data over claim site points and generated phase covers;
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
* frontier status: `Claim` and `Claim.SitePoint` now name the point/site split.
  `Claim.Topic` now names a mathematical topic as a site-local claim concept.
  The full manual carrier family and its glued documentation section are still
  frontier structure over that split.

The governing sentence is:

> A stable page is an effective descent datum over its generated phase cover.

## Claim Points And Site Points

The point/site split is now formal. A {name Obsmetrologia.Claim}`Claim` is the
predication-generated point. A {name Obsmetrologia.Claim.SitePoint}`Claim.SitePoint`
is that point placed in the settling site with a stratum and clopen support.

Checked:

```lean
example (q : Claim) (tau : Nat) (U : Clopen) :
    (Claim.sitePoint q tau U).q = q :=
  Claim.sitePoint_claim q tau U

example (q : Claim) (tau : Nat) (U : Clopen) :
    (Claim.sitePoint q tau U).U = U :=
  Claim.sitePoint_support q tau U

example {src dst : Claim.SitePoint}
    (f : Claim.FiberHom src dst) :
    f.support = src.U :=
  Claim.fiberHom_support f
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

{docstring Obsmetrologia.Claim.TermContext}

The concept is FCA's closed extent/intent pair specialized to claims:

{docstring Obsmetrologia.Claim.Concept}

The topic adds the site point and support cover:

{docstring Obsmetrologia.Claim.Topic}

Topic restriction is the first site-level descent move for concepts:

{docstring Obsmetrologia.Claim.Topic.restrict}

Each member of a topic's own cover generates a local restricted topic:

{docstring Obsmetrologia.Claim.Topic.coverRestriction}

Two generated local topics agree in concept on their clopen overlap:

{docstring Obsmetrologia.Claim.Topic.coverRestriction_overlap_concepts_agree}

Checked:

```lean
example (Term : Type) (I : Claim -> Term -> Prop) :
    (Claim.TermContext.ofIncidence Term I).Term = Term :=
  Claim.TermContext.ofIncidence_Term Term I

example (C : Claim.TermContext) (A : FCA.ExtSet Claim) :
    FCA.closeA C.incidence
        (Claim.Concept.ofExtent C A).extent =
      (Claim.Concept.ofExtent C A).extent :=
  Claim.Concept.extent_closed (Claim.Concept.ofExtent C A)

example {C : Claim.TermContext} (T : Claim.Topic C) :
    (forall Ui, Ui ∈ T.cover -> Ui ⊑ T.point.U)
      /\ joinList T.cover = T.point.U :=
  Claim.Topic.cover_is_fiber_local T

example {C : Claim.TermContext}
    (T : Claim.Topic C) {src : Claim.SitePoint}
    (f : Claim.FiberHom src T.point) :
    (Claim.Topic.restrict T f).point = src :=
  rfl

example {C : Claim.TermContext}
    (T : Claim.Topic C) {src : Claim.SitePoint}
    (f : Claim.FiberHom src T.point) :
    (forall Ui,
        Ui ∈ (Claim.Topic.restrict T f).cover ->
          Ui ⊑ src.U) /\
      joinList (Claim.Topic.restrict T f).cover = src.U :=
  Claim.Topic.restrict_cover_is_fiber_local T f

example {C : Claim.TermContext}
    (T : Claim.Topic C) (Ui : Clopen)
    (hUi : Ui ∈ T.cover) :
    (Claim.Topic.coverRestriction T Ui hUi).concept =
      T.concept :=
  rfl

example {C : Claim.TermContext}
    (T : Claim.Topic C) (Ui : Clopen)
    (hUi : Ui ∈ T.cover) :
    (forall Wi,
        Wi ∈ (Claim.Topic.coverRestriction
          T Ui hUi).cover ->
          Wi ⊑ Ui) /\
      joinList
        (Claim.Topic.coverRestriction T Ui hUi).cover =
        Ui :=
  Claim.Topic.coverRestriction_cover_is_fiber_local
    T Ui hUi

example {C : Claim.TermContext}
    (T : Claim.Topic C) (Ui Uj : Clopen)
    (hUi : Ui ∈ T.cover) (hUj : Uj ∈ T.cover) :
    (Claim.Topic.coverRestriction
        (Claim.Topic.coverRestriction T Ui hUi)
        (meet Ui Uj)
        (Claim.Topic.coverOverlap_left_mem
          T Ui Uj hUi hUj)).concept =
      (Claim.Topic.coverRestriction
        (Claim.Topic.coverRestriction T Uj hUj)
        (meet Ui Uj)
        (Claim.Topic.coverOverlap_right_mem
          T Ui Uj hUi hUj)).concept :=
  Claim.Topic.coverRestriction_overlap_concepts_agree
    T Ui Uj hUi hUj
```

## Term Readings Are The First Intensional Surface

A bare term is only an element of a carrier. Its first readable surface is its
claim profile inside a term context:

{docstring Obsmetrologia.Claim.TermContext.profile}

Closing that profile gives the generated concept:

{docstring Obsmetrologia.Claim.TermContext.generatedConcept}

The generating term is not added back by hand; it is in the generated intent:

{docstring Obsmetrologia.Claim.TermContext.generatedConcept_in_intent}

Moving readings between contexts requires explicit transport data:

{docstring Obsmetrologia.Claim.TermContext.Hom}

Transport uses the valuation fibration rather than a second support convention:

{docstring Obsmetrologia.Claim.TermContext.Hom.pullbackValuation}

{docstring Obsmetrologia.Claim.TermContext.Hom.pullbackValuation_eq_self_of_claimMap_eq}

and that pullback commutes with lifted valuation closure:

{docstring Obsmetrologia.Claim.TermContext.Hom.pullbackValuation_liftOp}

A term reading then records that the term belongs to the closed intent of a local
topic:

{docstring Obsmetrologia.Claim.TermReading}

Restricting a term reading only restricts its topic; the term and intent witness
are retained:

{docstring Obsmetrologia.Claim.TermReading.restrict}

Each cover member generates a local term reading:

{docstring Obsmetrologia.Claim.TermReading.coverRestriction}

Those local readings agree in term on overlaps:

{docstring Obsmetrologia.Claim.TermReading.coverRestriction_overlap_terms_agree}

A valuated term reading adds a valuation and keeps the support witness as data:

{docstring Obsmetrologia.Claim.ValuatedTermReading}

Restricting a valuated reading keeps the valuation and support witness:

{docstring Obsmetrologia.Claim.ValuatedTermReading.restrict}

Each cover member generates a local valuated reading:

{docstring Obsmetrologia.Claim.ValuatedTermReading.coverRestriction}

  Those local valuated readings agree in valuation on overlaps:
  
  {docstring Obsmetrologia.Claim.ValuatedTermReading.coverRestriction_overlap_valuations_agree}

  A valuated reading also gives the first honest bridge from topic covers to
  sheaf-style masks. A clopen is read through the valuation's positive and
  negative charge slots:

  {docstring Obsmetrologia.Claim.ValuatedTermReading.clopenPatch}

  and finite clopen joins become finite unions of those patches:

  {docstring Obsmetrologia.Claim.ValuatedTermReading.clopenPatch_joinList_true}

  The resulting carrier is relative to the topic support:

  {docstring Obsmetrologia.Claim.ValuatedTermReading.PatchFamily}

  {docstring Obsmetrologia.Claim.ValuatedTermReading.topicPatchFamily}

  It becomes a global sheaf cover only after full support is supplied:

  {docstring Obsmetrologia.Claim.ValuatedTermReading.topicSheafCover}
  
  The first primary/secondary split is concept-valued. A primary reading lets the
  term vary with each context in a frame:

{docstring Obsmetrologia.Claim.IntensionalFrame.TermFamily}

A secondary reading fixes an actual term and transports it into the other
contexts:

{docstring Obsmetrologia.Claim.IntensionalFrame.AnchoredTerm}

The anchor also induces a primary term family by transport:

{docstring Obsmetrologia.Claim.IntensionalFrame.AnchoredTerm.termFamily}

{docstring Obsmetrologia.Claim.IntensionalFrame.AnchoredTerm.actual_pullbackValuation}

{docstring Obsmetrologia.Claim.IntensionalFrame.AnchoredTerm.actual_supports_transport}

This is where the primary/secondary split becomes comparable:

{docstring Obsmetrologia.Claim.IntensionalFrame.primaryConcept_from_anchor}

{docstring Obsmetrologia.Claim.IntensionalFrame.primaryReading_from_anchor}

{docstring Obsmetrologia.Claim.IntensionalFrame.primaryPatchFamily_from_anchor}

{docstring Obsmetrologia.Claim.IntensionalFrame.primarySheafCover_from_anchor}

Both readings become site-local topics only after a site point is witnessed in
the generated concept extent:

{docstring Obsmetrologia.Claim.IntensionalFrame.primaryTopic}

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryTopic}

and then the generated intent supplies the term-reading witness:

{docstring Obsmetrologia.Claim.IntensionalFrame.primaryReading}

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryReading}

Valuation support then attaches to those readings:

{docstring Obsmetrologia.Claim.IntensionalFrame.primaryValuatedReading}

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryValuatedReading}

The same valuated readings now continue through the relative patch-family bridge:

{docstring Obsmetrologia.Claim.IntensionalFrame.primaryPatchFamily}

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryPatchFamily}

Their patches promote to global sheaf covers only under full support:

{docstring Obsmetrologia.Claim.IntensionalFrame.primarySheafCover}

{docstring Obsmetrologia.Claim.IntensionalFrame.secondarySheafCover}

and secondary support can be pulled back to the actual reading:

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryActualPullbackValuatedReading}

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryActualPullbackValuation_at_actual}

and then read as a patch family at the actual index:

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryActualPullbackPatchFamily}

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryActualPullbackPatchFamily_support_at_actual}

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryActualPullbackPatchFamily_patches_at_actual}

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryActualPullbackSheafCover}

{docstring Obsmetrologia.Claim.IntensionalFrame.actualFullSupport_of_pullback}

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryActualPullbackSheafCover_patches_at_actual}

At the actual index, the secondary anchor is coherent with the actual term:

{docstring Obsmetrologia.Claim.IntensionalFrame.secondaryConcept_actual}

Checked:

```lean
example (C : Claim.TermContext) (t : C.Term) :
    FCA.closeA C.incidence
        (Claim.TermContext.generatedConcept C t).extent =
      (Claim.TermContext.generatedConcept C t).extent :=
  Claim.TermContext.generatedConcept_extent_closed C t

example (C : Claim.TermContext) (t : C.Term) :
    (Claim.TermContext.generatedConcept C t).intent t :=
  Claim.TermContext.generatedConcept_in_intent C t

example {C D : Claim.TermContext}
    (F : Claim.TermContext.Hom C D)
    {q : Claim} {t : C.Term}
    (h : Claim.TermContext.profile C t q) :
    Claim.TermContext.profile D
      (F.termMap t) (F.claimMap q) :=
  Claim.TermContext.Hom.profile_preserved F h

example {C : Claim.TermContext} (R : Claim.TermReading C) :
    (forall Ui, Ui ∈ R.topic.cover -> Ui ⊑ R.topic.point.U)
      /\ joinList R.topic.cover = R.topic.point.U :=
  Claim.TermReading.cover_is_fiber_local R

example {C : Claim.TermContext}
    (R : Claim.TermReading C) {src : Claim.SitePoint}
    (f : Claim.FiberHom src R.topic.point) :
    (Claim.TermReading.restrict R f).term = R.term :=
  rfl

example {C : Claim.TermContext}
    (R : Claim.TermReading C) {src : Claim.SitePoint}
    (f : Claim.FiberHom src R.topic.point) :
    (forall Ui,
        Ui ∈ (Claim.TermReading.restrict
          R f).topic.cover ->
          Ui ⊑ src.U) /\
      joinList
        (Claim.TermReading.restrict R f).topic.cover =
        src.U :=
  Claim.TermReading.restrict_cover_is_fiber_local R f

example {C : Claim.TermContext}
    (R : Claim.TermReading C) (Ui : Clopen)
    (hUi : Ui ∈ R.topic.cover) :
    (Claim.TermReading.coverRestriction R Ui hUi).term =
      R.term :=
  rfl

example {C : Claim.TermContext}
    (R : Claim.TermReading C) (Ui : Clopen)
    (hUi : Ui ∈ R.topic.cover) :
    (forall Wi,
        Wi ∈ (Claim.TermReading.coverRestriction
          R Ui hUi).topic.cover ->
          Wi ⊑ Ui) /\
      joinList
        (Claim.TermReading.coverRestriction
          R Ui hUi).topic.cover =
        Ui :=
  Claim.TermReading.coverRestriction_cover_is_fiber_local
    R Ui hUi

example {C : Claim.TermContext}
    (R : Claim.TermReading C) (Ui Uj : Clopen)
    (hUi : Ui ∈ R.topic.cover) (hUj : Uj ∈ R.topic.cover) :
    (Claim.TermReading.coverRestriction
        (Claim.TermReading.coverRestriction R Ui hUi)
        (meet Ui Uj)
        (Claim.Topic.coverOverlap_left_mem
          R.topic Ui Uj hUi hUj)).term =
      (Claim.TermReading.coverRestriction
        (Claim.TermReading.coverRestriction R Uj hUj)
        (meet Ui Uj)
        (Claim.Topic.coverOverlap_right_mem
          R.topic Ui Uj hUi hUj)).term :=
  Claim.TermReading.coverRestriction_overlap_terms_agree
    R Ui Uj hUi hUj

example {C D : Claim.TermContext}
    (F : Claim.TermContext.Hom C D)
    (v : Valuation) {q : Claim} {t : C.Term}
    (hsupport : forall q',
      Claim.TermContext.profile D (F.termMap t) q' ->
        Charge.isTruthFiring (v q') = true)
    (h : Claim.TermContext.profile C t q) :
    Charge.isTruthFiring
      (Claim.TermContext.Hom.pullbackValuation
        F v q) = true :=
  Claim.TermContext.Hom.pullback_supports_profile
    F v hsupport h

example {C D : Claim.TermContext}
    (F : Claim.TermContext.Hom C D)
    (v : Valuation)
    (hclaim : forall q, F.claimMap q = q) :
    Claim.TermContext.Hom.pullbackValuation F v = v :=
  pullbackValuation_eq_self_of_claimMap_eq F v hclaim

example {C D : Claim.TermContext}
    (F : Claim.TermContext.Hom C D)
    (c : Charge.Closure) (v : Valuation) :
    Claim.TermContext.Hom.pullbackValuation F
        (Valuation.liftOp c.op v) =
      Valuation.liftOp c.op
        (Claim.TermContext.Hom.pullbackValuation F v) :=
  Claim.TermContext.Hom.pullbackValuation_liftOp
    F c v

example {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C) {q : Claim}
    (h : Claim.TermContext.profile C R.reading.term q) :
    Charge.isTruthFiring (R.valuation q) = true :=
  Claim.ValuatedTermReading.supports_profile R h

example {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C)
    {src : Claim.SitePoint}
    (f : Claim.FiberHom src R.reading.topic.point) :
    (Claim.ValuatedTermReading.restrict R f).valuation =
      R.valuation :=
  rfl

example {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C)
    {src : Claim.SitePoint}
    (f : Claim.FiberHom src R.reading.topic.point) :
    (forall Ui,
        Ui ∈
          (Claim.ValuatedTermReading.restrict
            R f).reading.topic.cover ->
          Ui ⊑ src.U) /\
      joinList
        (Claim.ValuatedTermReading.restrict
          R f).reading.topic.cover = src.U :=
  Claim.ValuatedTermReading.restrict_cover_is_fiber_local
    R f

example {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C)
    {src : Claim.SitePoint}
    (f : Claim.FiberHom src R.reading.topic.point)
    {q : Claim}
    (h :
      Claim.TermContext.profile C
        (Claim.ValuatedTermReading.restrict
          R f).reading.term q) :
    Charge.isTruthFiring
        ((Claim.ValuatedTermReading.restrict
          R f).valuation q) =
      true :=
  Claim.ValuatedTermReading.restrict_supports_profile
    R f h

namespace Obsmetrologia.Claim.ValuatedTermReading

example {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C) (Ui : Clopen)
    (hUi : Ui ∈ R.reading.topic.cover) :
    (Claim.ValuatedTermReading.coverRestriction
      R Ui hUi).valuation = R.valuation :=
  rfl

example {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C) (Ui : Clopen)
    (hUi : Ui ∈ R.reading.topic.cover) :
    (forall Wi,
        Wi ∈
          (Claim.ValuatedTermReading.coverRestriction
            R Ui hUi).reading.topic.cover ->
          Wi ⊑ Ui) /\
      joinList
        (Claim.ValuatedTermReading.coverRestriction
          R Ui hUi).reading.topic.cover =
        Ui :=
  coverRestriction_cover_is_fiber_local R Ui hUi

example {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C) (Ui : Clopen)
    (hUi : Ui ∈ R.reading.topic.cover) {q : Claim}
    (h :
      Claim.TermContext.profile C
        (Claim.ValuatedTermReading.coverRestriction
          R Ui hUi).reading.term q) :
    Charge.isTruthFiring
        ((Claim.ValuatedTermReading.coverRestriction
          R Ui hUi).valuation q) =
      true :=
  coverRestriction_supports_profile R Ui hUi h

  example {C : Claim.TermContext}
      (R : Claim.ValuatedTermReading C) (Ui Uj : Clopen)
      (hUi : Ui ∈ R.reading.topic.cover)
      (hUj : Uj ∈ R.reading.topic.cover) :
    (coverRestriction
        (coverRestriction R Ui hUi)
        (meet Ui Uj)
        (Claim.Topic.coverOverlap_left_mem
          R.reading.topic Ui Uj hUi hUj)).valuation =
      (coverRestriction
        (coverRestriction R Uj hUj)
        (meet Ui Uj)
        (Claim.Topic.coverOverlap_right_mem
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

  example {C : Claim.TermContext}
      (R : Claim.ValuatedTermReading C) :
      (topicPatchFamily R).support =
        clopenPatch R.valuation R.reading.topic.point.U :=
    rfl

  example {C : Claim.TermContext}
      (R : Claim.ValuatedTermReading C) :
      (forall φ,
          (topicPatchFamily R).support φ = true ->
            Exists fun p =>
              p ∈ (topicPatchFamily R).patches /\
                p φ = true) :=
    (topicPatchFamily R).covers_support

  example {C : Claim.TermContext}
      (R : Claim.ValuatedTermReading C)
      (hfull : forall φ,
        clopenPatch R.valuation
          R.reading.topic.point.U φ = true) :
      Sheaf.Cover :=
    topicSheafCover R hfull
  
  end Obsmetrologia.Claim.ValuatedTermReading

example {F : Claim.IntensionalFrame}
    (T : Claim.IntensionalFrame.TermFamily F)
    (i : F.Index) :
    FCA.closeA (F.context i).incidence
        (Claim.IntensionalFrame.primaryConcept T i).extent =
      (Claim.IntensionalFrame.primaryConcept T i).extent :=
  Claim.IntensionalFrame.primaryConcept_extent_closed T i

example {F : Claim.IntensionalFrame}
    (T : Claim.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.primaryConcept
        T i).extent point.q) :
    (forall Ui,
        Ui ∈ (Claim.IntensionalFrame.primaryTopic
          T i point h).cover ->
          Ui ⊑ point.U) /\
      joinList
        (Claim.IntensionalFrame.primaryTopic
          T i point h).cover = point.U :=
  Claim.IntensionalFrame.primaryTopic_cover_is_fiber_local
    T i point h

example {F : Claim.IntensionalFrame}
    (T : Claim.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.primaryConcept
        T i).extent point.q) :
    (Claim.IntensionalFrame.primaryReading
      T i point h).term = T.termAt i :=
  rfl

example {F : Claim.IntensionalFrame}
    (T : Claim.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.primaryConcept
        T i).extent point.q) :
    (forall Ui,
        Ui ∈ (Claim.IntensionalFrame.primaryReading
          T i point h).topic.cover ->
          Ui ⊑ point.U) /\
      joinList
        (Claim.IntensionalFrame.primaryReading
          T i point h).topic.cover = point.U :=
  Claim.IntensionalFrame.primaryReading_cover_is_fiber_local
    T i point h

example {F : Claim.IntensionalFrame}
    (T : Claim.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.primaryConcept
        T i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile
        (F.context i) (T.termAt i) q ->
        Charge.isTruthFiring (v q) = true) :
    (forall Ui,
        Ui ∈ (Claim.IntensionalFrame.primaryValuatedReading
          T i point h v hsupport).reading.topic.cover ->
          Ui ⊑ point.U) /\
      joinList
        (Claim.IntensionalFrame.primaryValuatedReading
          T i point h v hsupport).reading.topic.cover =
        point.U :=
  primaryValuatedReading_cover_is_fiber_local
    T i point h v hsupport

example {F : Claim.IntensionalFrame}
    (T : Claim.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.primaryConcept
        T i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile
        (F.context i) (T.termAt i) q ->
        Charge.isTruthFiring (v q) = true) :
    Claim.ValuatedTermReading.PatchFamily :=
  primaryPatchFamily T i point h v hsupport

example {F : Claim.IntensionalFrame}
    (T : Claim.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.primaryConcept
        T i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile
        (F.context i) (T.termAt i) q ->
        Charge.isTruthFiring (v q) = true) :
    forall φ,
      (primaryPatchFamily
        T i point h v hsupport).support φ =
        true ->
        Exists fun p =>
          p ∈ (primaryPatchFamily
            T i point h v hsupport).patches /\
            p φ = true :=
  primaryPatchFamily_covers_support T i point h v hsupport

example {F : Claim.IntensionalFrame}
    (T : Claim.IntensionalFrame.TermFamily F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.primaryConcept
        T i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile
        (F.context i) (T.termAt i) q ->
        Charge.isTruthFiring (v q) = true)
    (hfull : forall φ,
      Claim.ValuatedTermReading.clopenPatch
        v point.U φ = true) :
    Sheaf.Cover :=
  primarySheafCover T i point h v hsupport hfull

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) {q : Claim}
    (h : Claim.TermContext.profile
      (F.context A.actual) A.term q) :
    Claim.TermContext.profile (F.context i)
      ((A.transport i).termMap A.term)
      ((A.transport i).claimMap q) :=
  Claim.IntensionalFrame.secondary_profile_preserved A i h

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F) :
    Claim.IntensionalFrame.secondaryConcept A A.actual =
      Claim.TermContext.generatedConcept
        (F.context A.actual) A.term :=
  Claim.IntensionalFrame.secondaryConcept_actual A

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) :
    (Claim.IntensionalFrame.AnchoredTerm.termFamily
      A).termAt i =
      (A.transport i).termMap A.term :=
  rfl

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F) :
    (Claim.IntensionalFrame.AnchoredTerm.termFamily
      A).termAt A.actual = A.term :=
  Claim.IntensionalFrame.AnchoredTerm.termFamily_actual A

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (v : Valuation) :
    Claim.TermContext.Hom.pullbackValuation
        (A.transport A.actual) v = v :=
  AnchoredTerm.actual_pullbackValuation A v

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile
        (F.context A.actual) A.term q ->
        Charge.isTruthFiring (v q) = true) :
    forall q,
      Claim.TermContext.profile (F.context A.actual)
        ((A.transport A.actual).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true :=
  AnchoredTerm.actual_supports_transport A v hsupport

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) :
    primaryConcept
        (Claim.IntensionalFrame.AnchoredTerm.termFamily
          A) i =
      secondaryConcept A i :=
  primaryConcept_from_anchor A i

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    {q : Claim}
    (h : Claim.TermContext.profile
      (F.context A.actual) A.term q) :
    Claim.TermContext.profile (F.context A.actual)
      ((A.transport A.actual).termMap A.term) q :=
  secondary_profile_preserved_at_actual A h

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A i).extent point.q) :
    (forall Ui,
        Ui ∈ (Claim.IntensionalFrame.secondaryTopic
          A i point h).cover ->
          Ui ⊑ point.U) /\
      joinList
        (Claim.IntensionalFrame.secondaryTopic
          A i point h).cover = point.U :=
  Claim.IntensionalFrame.secondaryTopic_cover_is_fiber_local
    A i point h

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A i).extent point.q) :
    (Claim.IntensionalFrame.secondaryReading
      A i point h).term =
      (A.transport i).termMap A.term :=
  rfl

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A i).extent point.q) :
    primaryReading
        (Claim.IntensionalFrame.AnchoredTerm.termFamily A)
        i point h =
      secondaryReading A i point h :=
  primaryReading_from_anchor A i point h

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A i).extent point.q) :
    (forall Ui,
        Ui ∈ (Claim.IntensionalFrame.secondaryReading
          A i point h).topic.cover ->
          Ui ⊑ point.U) /\
      joinList
        (Claim.IntensionalFrame.secondaryReading
          A i point h).topic.cover = point.U :=
  secondaryReading_cover_is_fiber_local A i point h

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true) :
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

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true) :
    Claim.ValuatedTermReading.PatchFamily :=
  secondaryPatchFamily A i point h v hsupport

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true) :
    forall φ,
      (secondaryPatchFamily
        A i point h v hsupport).support φ =
        true ->
        Exists fun p =>
          p ∈ (secondaryPatchFamily
            A i point h v hsupport).patches /\
            p φ = true :=
  secondaryPatchFamily_covers_support A i point h v hsupport

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true)
    (hfull : forall φ,
      Claim.ValuatedTermReading.clopenPatch
        v point.U φ = true) :
    Sheaf.Cover :=
  secondarySheafCover A i point h v hsupport hfull

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true) :
    primaryPatchFamily
        (Claim.IntensionalFrame.AnchoredTerm.termFamily A)
        i point h v hsupport =
      secondaryPatchFamily A i point h v hsupport :=
  primaryPatchFamily_from_anchor A i point h v hsupport

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A i).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true)
    (hfull : forall φ,
      Claim.ValuatedTermReading.clopenPatch
        v point.U φ = true) :
    primarySheafCover
        (Claim.IntensionalFrame.AnchoredTerm.termFamily A)
        i point h v hsupport hfull =
      secondarySheafCover A i point h v hsupport hfull :=
  primarySheafCover_from_anchor
    A i point h v hsupport hfull

local notation "actualPullbackCoverLocal" =>
  secondaryActualPullbackReading_cover_is_fiber_local

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true) :
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

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context A.actual)
        ((A.transport A.actual).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true) :
    (secondaryActualPullbackValuatedReading
      A A.actual point h v hsupport).valuation = v :=
  secondaryActualPullbackValuation_at_actual
    A point h v hsupport

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true) :
    Claim.ValuatedTermReading.PatchFamily :=
  secondaryActualPullbackPatchFamily A i point h v hsupport

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context A.actual)
        ((A.transport A.actual).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true) :
    (secondaryActualPullbackPatchFamily
        A A.actual point h v hsupport).support =
      (secondaryPatchFamily
        A A.actual point h v hsupport).support :=
  secondaryActualPullbackPatchFamily_support_at_actual
    A point h v hsupport

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context A.actual)
        ((A.transport A.actual).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true) :
    (secondaryActualPullbackPatchFamily
        A A.actual point h v hsupport).patches =
      (secondaryPatchFamily
        A A.actual point h v hsupport).patches :=
  secondaryActualPullbackPatchFamily_patches_at_actual
    A point h v hsupport

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true) :
    forall φ,
      (secondaryActualPullbackPatchFamily
        A i point h v hsupport).support φ = true ->
        Exists fun p =>
          p ∈ (secondaryActualPullbackPatchFamily
            A i point h v hsupport).patches /\
            p φ = true :=
  secondaryActualPullbackPatchFamily_covers_support
    A i point h v hsupport

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (i : F.Index) (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context i)
        ((A.transport i).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true)
    (hfull : forall φ,
      Claim.ValuatedTermReading.clopenPatch
        (Claim.TermContext.Hom.pullbackValuation
          (A.transport i) v) point.U φ = true) :
    Sheaf.Cover :=
  secondaryActualPullbackSheafCover
    A i point h v hsupport hfull

local notation "actualFullSupport" =>
  actualFullSupport_of_pullback

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (point : Claim.SitePoint)
    (v : Valuation)
    (hfull : forall φ,
      Claim.ValuatedTermReading.clopenPatch
        (Claim.TermContext.Hom.pullbackValuation
          (A.transport A.actual) v) point.U φ = true) :
    forall φ,
      Claim.ValuatedTermReading.clopenPatch
        v point.U φ = true :=
  actualFullSupport_of_pullback A point v hfull

example {F : Claim.IntensionalFrame}
    (A : Claim.IntensionalFrame.AnchoredTerm F)
    (point : Claim.SitePoint)
    (h :
      (Claim.IntensionalFrame.secondaryConcept
        A A.actual).extent point.q)
    (v : Valuation)
    (hsupport : forall q,
      Claim.TermContext.profile (F.context A.actual)
        ((A.transport A.actual).termMap A.term) q ->
        Charge.isTruthFiring (v q) = true)
    (hfull : forall φ,
      Claim.ValuatedTermReading.clopenPatch
        (Claim.TermContext.Hom.pullbackValuation
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
