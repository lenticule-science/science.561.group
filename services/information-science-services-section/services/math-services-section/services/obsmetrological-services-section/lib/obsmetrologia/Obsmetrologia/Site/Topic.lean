import Obsmetrologia.Calculus.Order.FormalConceptAnalysis
import Obsmetrologia.Site.Claim

/-!
# Predication cell topics

A topic is not added as a primitive name. It is the site-local form of an FCA
concept generated from a claim/term incidence context: a bundled concept, a claim
site point lying in its extent, and an explicit cover of that point's clopen
support.

## Main definitions

* `PredicationCell.TermContext`
* `PredicationCell.Concept`
* `PredicationCell.Topic`

## Main results

* `PredicationCell.Concept.extent_closed`
* `PredicationCell.Topic.selfCover`
* `PredicationCell.Topic.restrict`
* `PredicationCell.Topic.coverRestriction`
* `PredicationCell.Topic.coverRestriction_overlap_concepts_agree`
* `PredicationCell.Topic.cover_is_fiber_local`
-/

namespace Obsmetrologia
namespace PredicationCell

/-- A term context: a generated term carrier together with incidence against claim points. -/
structure TermContext where
  /-- The carrier of terms for this context. -/
  Term : Type
  /-- Incidence: a claim point bears a term. -/
  incidence : PredicationCell -> Term -> Prop

namespace TermContext

/-- Build a term context from a carrier and an incidence relation. -/
def ofIncidence (Term : Type) (incidence : PredicationCell -> Term -> Prop) : TermContext where
  Term := Term
  incidence := incidence

@[simp] theorem ofIncidence_Term (Term : Type) (incidence : PredicationCell -> Term -> Prop) :
    (ofIncidence Term incidence).Term = Term := rfl

@[simp] theorem ofIncidence_incidence (Term : Type) (incidence : PredicationCell -> Term -> Prop) :
    (ofIncidence Term incidence).incidence = incidence := rfl

end TermContext

/-- A claim concept is an FCA concept over claim points and the context's term carrier. -/
abbrev Concept (C : TermContext) : Type :=
  FCA.Concept PredicationCell C.Term C.incidence

namespace Concept

/-- The FCA closure of any claim extent yields a claim concept. -/
def ofExtent (C : TermContext) (A : FCA.ExtSet PredicationCell) : Concept C :=
  FCA.conceptOfExtent C.incidence A

/-- The extent of a claim concept is closed under the context's derivation closure. -/
theorem extent_closed {C : TermContext} (c : Concept C) :
    FCA.closeA C.incidence c.extent = c.extent :=
  FCA.Concept.extent_closed c

end Concept

/-- A topic is a concept localized at a claim site point with an explicit support cover. -/
structure Topic (C : TermContext) where
  /-- The closed claim/term concept. -/
  concept : Concept C
  /-- The site point where the topic is being read. -/
  point : SitePoint
  /-- The point's claim lies in the concept extent. -/
  in_extent : concept.extent point.q
  /-- A covering family for the point's clopen support. -/
  cover : List Site.Clopen
  /-- The cover really covers the point support. -/
  covers : Site.Covers point.U cover

namespace Topic

/-- Any concept member has the trivial local topic cover by its own support. -/
def selfCover {C : TermContext} (concept : Concept C) (point : SitePoint)
    (h : concept.extent point.q) : Topic C where
  concept := concept
  point := point
  in_extent := h
  cover := [point.U]
  covers := Site.covers_self point.U

@[simp] theorem selfCover_concept {C : TermContext} (concept : Concept C)
    (point : SitePoint) (h : concept.extent point.q) :
    (selfCover concept point h).concept = concept := rfl

@[simp] theorem selfCover_point {C : TermContext} (concept : Concept C)
    (point : SitePoint) (h : concept.extent point.q) :
    (selfCover concept point h).point = point := rfl

@[simp] theorem selfCover_cover {C : TermContext} (concept : Concept C)
    (point : SitePoint) (h : concept.extent point.q) :
    (selfCover concept point h).cover = [point.U] := rfl

/-- Topic covers stay inside the clopen fiber and join back to the point support. -/
theorem cover_is_fiber_local {C : TermContext} (T : Topic C) :
    (∀ Ui ∈ T.cover, Ui ⊑ T.point.U) ∧ Site.joinList T.cover = T.point.U :=
  Site.covers_is_fiber_local T.covers

/-- Restrict a topic along a fixed-claim, fixed-stratum clopen inclusion. -/
def restrict {C : TermContext} (T : Topic C) {src : SitePoint}
    (f : FiberHom src T.point) : Topic C where
  concept := T.concept
  point := src
  in_extent := by
    simpa [f.same_q] using T.in_extent
  cover := T.cover.map (Site.meet src.U)
  covers := Site.covers_pullback T.covers f.incl

@[simp] theorem restrict_concept {C : TermContext} (T : Topic C) {src : SitePoint}
    (f : FiberHom src T.point) :
    (restrict T f).concept = T.concept := rfl

@[simp] theorem restrict_point {C : TermContext} (T : Topic C) {src : SitePoint}
    (f : FiberHom src T.point) :
    (restrict T f).point = src := rfl

@[simp] theorem restrict_cover {C : TermContext} (T : Topic C) {src : SitePoint}
    (f : FiberHom src T.point) :
    (restrict T f).cover = T.cover.map (Site.meet src.U) := rfl

/-- Restricting a topic preserves the fiber-local cover law at the source point. -/
theorem restrict_cover_is_fiber_local {C : TermContext} (T : Topic C)
    {src : SitePoint} (f : FiberHom src T.point) :
    (∀ Ui ∈ (restrict T f).cover, Ui ⊑ src.U) ∧
      Site.joinList (restrict T f).cover = src.U :=
  cover_is_fiber_local (restrict T f)

/-- The claim site point over a member of a topic's cover. -/
def coverPoint {C : TermContext} (T : Topic C) (Ui : Site.Clopen)
    (_hUi : Ui ∈ T.cover) : SitePoint :=
  sitePoint T.point.q T.point.tau Ui

@[simp] theorem coverPoint_support {C : TermContext} (T : Topic C)
    (Ui : Site.Clopen) (hUi : Ui ∈ T.cover) :
    (coverPoint T Ui hUi).U = Ui := rfl

/-- The fiber inclusion from a cover member's site point back to the topic point. -/
def coverFiberHom {C : TermContext} (T : Topic C) (Ui : Site.Clopen)
    (hUi : Ui ∈ T.cover) : FiberHom (coverPoint T Ui hUi) T.point where
  support := Ui
  support_eq_src := rfl
  same_q := rfl
  same_tau := rfl
  incl := T.covers.1 Ui hUi

/-- The local topic induced on a member of the topic's own cover. -/
def coverRestriction {C : TermContext} (T : Topic C) (Ui : Site.Clopen)
    (hUi : Ui ∈ T.cover) : Topic C :=
  restrict T (coverFiberHom T Ui hUi)

@[simp] theorem coverRestriction_concept {C : TermContext} (T : Topic C)
    (Ui : Site.Clopen) (hUi : Ui ∈ T.cover) :
    (coverRestriction T Ui hUi).concept = T.concept := rfl

@[simp] theorem coverRestriction_point {C : TermContext} (T : Topic C)
    (Ui : Site.Clopen) (hUi : Ui ∈ T.cover) :
    (coverRestriction T Ui hUi).point = coverPoint T Ui hUi := rfl

/-- A topic restricted to a member of its cover is fiber-local over that member. -/
theorem coverRestriction_cover_is_fiber_local {C : TermContext} (T : Topic C)
    (Ui : Site.Clopen) (hUi : Ui ∈ T.cover) :
    (∀ Wi ∈ (coverRestriction T Ui hUi).cover, Wi ⊑ Ui) ∧
      Site.joinList (coverRestriction T Ui hUi).cover = Ui := by
  exact restrict_cover_is_fiber_local T (coverFiberHom T Ui hUi)

/-- The left-side overlap of two cover members is a cover member of the left local topic. -/
theorem coverOverlap_left_mem {C : TermContext} (T : Topic C)
    (Ui Uj : Site.Clopen) (hUi : Ui ∈ T.cover) (hUj : Uj ∈ T.cover) :
    Site.meet Ui Uj ∈ (coverRestriction T Ui hUi).cover :=
  List.mem_map.mpr ⟨Uj, hUj, rfl⟩

/-- The same overlap is a cover member of the right local topic. -/
theorem coverOverlap_right_mem {C : TermContext} (T : Topic C)
    (Ui Uj : Site.Clopen) (hUi : Ui ∈ T.cover) (hUj : Uj ∈ T.cover) :
    Site.meet Ui Uj ∈ (coverRestriction T Uj hUj).cover :=
  List.mem_map.mpr ⟨Ui, hUi, Site.meet_comm Uj Ui⟩

/-- The two local topics induced by cover members agree in concept on their overlap. -/
theorem coverRestriction_overlap_concepts_agree {C : TermContext} (T : Topic C)
    (Ui Uj : Site.Clopen) (hUi : Ui ∈ T.cover) (hUj : Uj ∈ T.cover) :
    (coverRestriction (coverRestriction T Ui hUi) (Site.meet Ui Uj)
        (coverOverlap_left_mem T Ui Uj hUi hUj)).concept =
      (coverRestriction (coverRestriction T Uj hUj) (Site.meet Ui Uj)
        (coverOverlap_right_mem T Ui Uj hUi hUj)).concept := by
  simp

end Topic

end PredicationCell
end Obsmetrologia
