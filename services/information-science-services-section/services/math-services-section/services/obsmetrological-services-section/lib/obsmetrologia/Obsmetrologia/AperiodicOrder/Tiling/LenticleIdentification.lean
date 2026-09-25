import Obsmetrologia.Site.Basic
import Obsmetrologia.AperiodicOrder.Tiling.ChromaticLorentzian
import Obsmetrologia.AperiodicOrder.Tiling.WeaveDraft
import Obsmetrologia.Cohomology.InconsistencySheaf

/-!
# Lenticle identification

This module gives the first formal carrier for the lenticle frontier: a lenticle
of two clopen patches is exactly their overlap, cover pullback restricts a
two-member cover to that overlap, and a definite pair of local charges has
inconsistent knowledge-join exactly when the two charges disagree.

## Main definitions

* `Lenticle` — the overlap `meet U₁ U₂`.
* `DefiniteCharge` / `ChargeDisagreement` — the local charge-section condition used
  by the first tractable branch of the conjecture.

## Main results

* `covers_pullback_to_lenticle` — the site-level pullback cover on the overlap.
* `definite_joinK_inconsistency_iff_disagreement` — local disagreement is exactly
  `Charge.isInconsistency` of the knowledge-join for definite charges.
* `lenticle_miscrossing_isInconsistency` — the lenticle-local mis-crossing bridge
  reuses `AperiodicOrder.Tiling.miscrossing_isInconsistency`.
* `lenticleCrossingCharge_inconsistency_iff_both_over` — the lenticle crossing
  is inconsistent exactly in the mis-crossing case where both strands assert
  over-crossing.
* `lenticleSection_miscrossing_somewhere_iff_disagreement` — on a finite lenticle
  support, two definite charge-valued sections disagree somewhere exactly when
  their pointwise knowledge-join is inconsistent somewhere.
* `pairwiseLenticleCensus_eq_h0top` — a finite family of lenticle supports counts
  exactly as `H0top` on the flattened induced support.
* `pairwiseLenticleCensus_is_inconsistency_count` — the same global census is
  explicitly the inconsistency count supplied by
  `InconSheaf.h0top_is_inconsistency_count`.
* `finiteSiteCover_pairwise_lenticle_census_eq_h0top` — the same census after
  extracting all pairwise lenticle supports from a finite cover list of a `SiteObj`.
* `lenticleBranch_diffraction_iff_disagreement` — the refraction/diffraction branch
  is determined by the local disagreement condition for definite charges.
* `SiteLenticleIdentificationRealization.conditional_carrier` — the raw
  `SiteObj` two-cover setup has the local, global, and dynamical carrier
  once the finite support, sections, compatible valuation, and singleton
  lenticle support are supplied.
* `SiteLenticleIdentificationRealization.strengthened_conditional_carrier` —
  the same raw setup with the global census stated directly as the
  inconsistency count and the full non-idempotent chromatic dichotomy packaged.
* `StoneSiteLenticleIdentificationRealization.conditional_carrier` — the same
  raw two-cover carrier when the finite support realization is derived from a
  finite Stone-side active-cell model.
* `StoneSiteLenticleIdentificationRealization.strengthened_conditional_carrier`
  — the strengthened raw carrier through the Stone-side support model.
* `FiniteCoverLenticleCensusRealization.global_carrier` — for an arbitrary
  finite realized cover with section entries on all pairwise lenticles, the
  total mis-crossing lenticle census is exactly the induced `H⁰_⊤` count.
* `FiniteCoverLenticleCensusRealization.global_carrier_is_inconsistency_count`
  — the same global census stated directly as the inconsistency-cell count
  provided by `InconSheaf.h0top_is_inconsistency_count`.
  Its carried entries also inherit the refraction/diffraction branch law from
  their local disagreement condition.

## Tags

lenticle, overlap, cover pullback, mis-crossing, inconsistency sheaf
-/

namespace Obsmetrologia

/-- The **lenticle** of two clopen patches is literally their overlap. -/
def Lenticle (U₁ U₂ : Site.Clopen) : Site.Clopen := Site.meet U₁ U₂

@[simp] theorem lenticle_eq_overlap (U₁ U₂ : Site.Clopen) :
    Lenticle U₁ U₂ = Site.meet U₁ U₂ := rfl

/-- The lenticle lies under its left patch. -/
theorem lenticle_sub_left (U₁ U₂ : Site.Clopen) : Site.sub (Lenticle U₁ U₂) U₁ :=
  Site.meet_sub_left U₁ U₂

/-- The lenticle lies under its right patch. -/
theorem lenticle_sub_right (U₁ U₂ : Site.Clopen) : Site.sub (Lenticle U₁ U₂) U₂ :=
  Site.meet_sub_right U₁ U₂

/-- A lenticle of a two-member cover lies under the covered clopen. -/
theorem lenticle_sub_cover {U U₁ U₂ : Site.Clopen} (hcov : Site.Covers U [U₁, U₂]) :
    Site.sub (Lenticle U₁ U₂) U := by
  have hU₁ : Site.sub U₁ U := (Site.covers_is_fiber_local hcov).1 U₁ (by simp)
  exact Site.sub_trans (lenticle_sub_left U₁ U₂) hU₁

/-- Pulling a two-member cover back to the lenticle gives the overlap cover. -/
theorem covers_pullback_to_lenticle {U U₁ U₂ : Site.Clopen}
    (hcov : Site.Covers U [U₁, U₂]) :
    Site.Covers (Lenticle U₁ U₂) (List.map (Site.meet (Lenticle U₁ U₂)) [U₁, U₂]) :=
  Site.covers_pullback hcov (lenticle_sub_cover hcov)

/-- The pulled-back two-member family is the duplicated overlap. -/
theorem lenticle_pullback_pair (U₁ U₂ : Site.Clopen) :
    List.map (Site.meet (Lenticle U₁ U₂)) [U₁, U₂] =
      [Lenticle U₁ U₂, Lenticle U₁ U₂] := by
  unfold Lenticle
  simp only [List.map_cons, List.map_nil]
  rw [Site.meet_comm (Site.meet U₁ U₂) U₁, Site.meet_of_sub (Site.meet_sub_left U₁ U₂)]
  rw [Site.meet_comm (Site.meet U₁ U₂) U₂, Site.meet_of_sub (Site.meet_sub_right U₁ U₂)]

/-- The lenticle itself is covered by the two restricted members of a two-member cover. -/
theorem covers_lenticle_pair {U U₁ U₂ : Site.Clopen} (hcov : Site.Covers U [U₁, U₂]) :
    Site.Covers (Lenticle U₁ U₂) [Lenticle U₁ U₂, Lenticle U₁ U₂] := by
  rw [← lenticle_pullback_pair U₁ U₂]
  exact covers_pullback_to_lenticle hcov

/-! ## Lenticle as a fiber-local site object -/

/-- The site object obtained by replacing a site's clopen support while keeping
the same predicate and stratum. -/
def PatchSite {Q : Type} (S : Site.SiteObj Q) (U : Site.Clopen) : Site.SiteObj Q where
  q := S.q
  tau := S.tau
  U := U

/-- The lenticle site object: same predicate and stratum as `S`, with clopen
support the overlap of the two patches. -/
def LenticleSite {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen) :
    Site.SiteObj Q :=
  PatchSite S (Lenticle U₁ U₂)

/-- The fiber morphism from the lenticle site into its left patch site. -/
def lenticleToLeftFiberHom
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen) :
    Site.FiberHom Q (LenticleSite S U₁ U₂) (PatchSite S U₁) where
  support := Lenticle U₁ U₂
  support_eq_src := rfl
  same_q := rfl
  same_tau := rfl
  incl := lenticle_sub_left U₁ U₂

/-- The fiber morphism from the lenticle site into its right patch site. -/
def lenticleToRightFiberHom
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen) :
    Site.FiberHom Q (LenticleSite S U₁ U₂) (PatchSite S U₂) where
  support := Lenticle U₁ U₂
  support_eq_src := rfl
  same_q := rfl
  same_tau := rfl
  incl := lenticle_sub_right U₁ U₂

/-- A two-member cover also gives a fiber morphism from the lenticle site into
the covered site object. -/
def lenticleToCoveredFiberHom
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂]) :
    Site.FiberHom Q (LenticleSite S U₁ U₂) S where
  support := Lenticle U₁ U₂
  support_eq_src := rfl
  same_q := rfl
  same_tau := rfl
  incl := lenticle_sub_cover hcov

/-- The left lenticle inclusion has the expected inclusion leg. -/
@[simp] theorem lenticleToLeftFiberHom_incl
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen) :
    (lenticleToLeftFiberHom S U₁ U₂).incl = lenticle_sub_left U₁ U₂ := rfl

/-- The right lenticle inclusion has the expected inclusion leg. -/
@[simp] theorem lenticleToRightFiberHom_incl
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen) :
    (lenticleToRightFiberHom S U₁ U₂).incl = lenticle_sub_right U₁ U₂ := rfl

/-- The cover-level lenticle inclusion has the inclusion leg supplied by cover
fiber-locality. -/
@[simp] theorem lenticleToCoveredFiberHom_incl
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂]) :
    (lenticleToCoveredFiberHom S U₁ U₂ hcov).incl = lenticle_sub_cover hcov := rfl

/-- The original nonempty-overlap hypothesis for a lenticle. -/
def LenticleNonempty (U₁ U₂ : Site.Clopen) : Prop :=
  Lenticle U₁ U₂ ≠ Site.bot

/-- A two-member cover whose lenticle is a, non-bottom overlap. -/
structure OverlappingTwoCover (Q : Type) where
  /-- The site object being covered. -/
  site : Site.SiteObj Q
  /-- The left member of the two-member cover. -/
  left : Site.Clopen
  /-- The right member of the two-member cover. -/
  right : Site.Clopen
  /-- The two clopens cover the site's support. -/
  covers : Site.Covers site.U [left, right]
  /-- The overlap is not bottom. -/
  nonempty : LenticleNonempty left right

namespace OverlappingTwoCover

/-- The lenticle of an overlapping two-cover is literally the clopen overlap. -/
theorem lenticle_eq_overlap {Q : Type} (C : OverlappingTwoCover Q) :
    Lenticle C.left C.right = Site.meet C.left C.right :=
  Obsmetrologia.lenticle_eq_overlap C.left C.right

/-- Pulling the two-member cover back to its own lenticle gives the duplicated
lenticle cover. -/
theorem covers_lenticle_pair {Q : Type} (C : OverlappingTwoCover Q) :
    Site.Covers (Lenticle C.left C.right)
      [Lenticle C.left C.right, Lenticle C.left C.right] :=
  Obsmetrologia.covers_lenticle_pair C.covers

/-- The bundled non-bottom overlap witness. -/
theorem lenticle_nonempty {Q : Type} (C : OverlappingTwoCover Q) :
    LenticleNonempty C.left C.right :=
  C.nonempty

end OverlappingTwoCover

/-- A local charge is definite when it is one of the two truth poles. -/
def DefiniteCharge (c : Charge) : Prop := c = Charge.tTop ∨ c = Charge.tBot

/-- Two definite local charges disagree when they occupy opposite truth poles. -/
def ChargeDisagreement (c₁ c₂ : Charge) : Prop :=
  (c₁ = Charge.tTop ∧ c₂ = Charge.tBot) ∨
    (c₁ = Charge.tBot ∧ c₂ = Charge.tTop)

/-- For definite local charges, knowledge-join is inconsistent exactly at disagreement. -/
theorem definite_joinK_inconsistency_iff_disagreement
    (c₁ c₂ : Charge) (h₁ : DefiniteCharge c₁) (h₂ : DefiniteCharge c₂) :
    Charge.isInconsistency (Charge.joinK c₁ c₂) = true ↔ ChargeDisagreement c₁ c₂ := by
  rcases h₁ with rfl | rfl <;> rcases h₂ with rfl | rfl <;>
    simp [ChargeDisagreement, Charge.isInconsistency, Charge.joinK, Charge.tTop, Charge.tBot,
      Charge.kTop, Charge.ofSlots, Charge.pos, Charge.neg, Articulating.Corner.toStatus,
      Articulating.Corner.ofStatus]

/-- Boolean form of local charge disagreement for finite-support counts. -/
def ChargeDisagreementBool (c₁ c₂ : Charge) : Bool :=
  ((decide (c₁ = Charge.tTop)) && (decide (c₂ = Charge.tBot))) ||
    ((decide (c₁ = Charge.tBot)) && (decide (c₂ = Charge.tTop)))

/-- The boolean disagreement test is the computable form of `ChargeDisagreement`. -/
theorem chargeDisagreementBool_iff (c₁ c₂ : Charge) :
    ChargeDisagreementBool c₁ c₂ = true ↔ ChargeDisagreement c₁ c₂ := by
  unfold ChargeDisagreementBool ChargeDisagreement
  cases c₁ <;> cases c₂ <;> decide

/-- Pointwise knowledge-join of two charge-valued local sections. -/
def LenticleJoinSection (c₁ c₂ : PredicationCell → Charge) : Valuation :=
  fun φ => Charge.joinK (c₁ φ) (c₂ φ)

/-- Two local sections disagree at a cell when their charges occupy opposite truth poles. -/
def LenticleSectionDisagreement (c₁ c₂ : PredicationCell → Charge) (φ : PredicationCell) :
    Bool :=
  ChargeDisagreementBool (c₁ φ) (c₂ φ)

/-- Restrict a charge-valued section to a mask, using a specified value off the mask.
The off-mask value is irrelevant for lenticle-local theorems that quantify only over
the realized finite support. -/
def RestrictChargeSection
    (m : PredicationCell → Bool) (offMask : Charge) (s : PredicationCell → Charge) :
    PredicationCell → Charge :=
  fun φ => if m φ then s φ else offMask

/-- Restriction preserves a charge section at every cell selected by the mask. -/
theorem restrictChargeSection_eq_of_mask
    (m : PredicationCell → Bool) (offMask : Charge) (s : PredicationCell → Charge)
    {φ : PredicationCell} (hφ : m φ = true) :
    RestrictChargeSection m offMask s φ = s φ := by
  simp [RestrictChargeSection, hφ]

/-- Pointwise form: a joined section is inconsistent at exactly the disagreement
cell, assuming the two charges at that cell are definite. -/
theorem lenticleSection_inconsistency_eq_disagreement_at
    (c₁ c₂ : PredicationCell → Charge) (φ : PredicationCell)
    (h₁ : DefiniteCharge (c₁ φ)) (h₂ : DefiniteCharge (c₂ φ)) :
    Charge.isInconsistency (LenticleJoinSection c₁ c₂ φ) =
      LenticleSectionDisagreement c₁ c₂ φ := by
  unfold LenticleJoinSection LenticleSectionDisagreement
  have hiff := definite_joinK_inconsistency_iff_disagreement (c₁ φ) (c₂ φ) h₁ h₂
  cases hb : ChargeDisagreementBool (c₁ φ) (c₂ φ)
  · have hn : ¬ ChargeDisagreement (c₁ φ) (c₂ φ) := fun h => by
      have ht := (chargeDisagreementBool_iff (c₁ φ) (c₂ φ)).2 h
      rw [hb] at ht
      contradiction
    cases hi : Charge.isInconsistency (Charge.joinK (c₁ φ) (c₂ φ))
    · rfl
    · exact False.elim (hn (hiff.1 hi))
  · exact hiff.2 ((chargeDisagreementBool_iff (c₁ φ) (c₂ φ)).1 hb)

/-- The pointwise joined section is inconsistent at exactly the disagreement cells. -/
theorem lenticleSection_inconsistency_eq_disagreement
    (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, DefiniteCharge (c₁ φ)) (h₂ : ∀ φ, DefiniteCharge (c₂ φ))
    (φ : PredicationCell) :
    Charge.isInconsistency (LenticleJoinSection c₁ c₂ φ) =
      LenticleSectionDisagreement c₁ c₂ φ :=
  lenticleSection_inconsistency_eq_disagreement_at c₁ c₂ φ (h₁ φ) (h₂ φ)

/-- The joined section has a mis-crossing somewhere exactly when the sections disagree somewhere. -/
def LenticleMiscrossingSomewhere
    (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge) : Bool :=
  cells.any (fun φ => Charge.isInconsistency (LenticleJoinSection c₁ c₂ φ))

/-- Two sections disagree somewhere on a finite lenticle support. -/
def LenticleDisagreementSomewhere
    (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge) : Bool :=
  cells.any (fun φ => LenticleSectionDisagreement c₁ c₂ φ)

/-- On finite supports, local mis-crossing somewhere is equivalent to section disagreement somewhere. -/
theorem lenticleSection_miscrossing_somewhere_iff_disagreement
    (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, DefiniteCharge (c₁ φ)) (h₂ : ∀ φ, DefiniteCharge (c₂ φ)) :
    LenticleMiscrossingSomewhere cells c₁ c₂ = true ↔
      LenticleDisagreementSomewhere cells c₁ c₂ = true := by
  have h :
      LenticleMiscrossingSomewhere cells c₁ c₂ =
        LenticleDisagreementSomewhere cells c₁ c₂ := by
    unfold LenticleMiscrossingSomewhere LenticleDisagreementSomewhere
    induction cells with
    | nil => rfl
    | cons φ rest ih =>
        simp only [List.any_cons, lenticleSection_inconsistency_eq_disagreement c₁ c₂ h₁ h₂ φ,
          ih]
  rw [h]

/-- On finite supports, local mis-crossing somewhere is equivalent to section
disagreement somewhere when definiteness is known only on that support. -/
theorem lenticleSection_miscrossing_somewhere_iff_disagreement_on_support
    (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ cells → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ cells → DefiniteCharge (c₂ φ)) :
    LenticleMiscrossingSomewhere cells c₁ c₂ = true ↔
      LenticleDisagreementSomewhere cells c₁ c₂ = true := by
  have h :
      LenticleMiscrossingSomewhere cells c₁ c₂ =
        LenticleDisagreementSomewhere cells c₁ c₂ := by
    revert h₁ h₂
    induction cells with
    | nil =>
        intro _ _
        rfl
    | cons φ rest ih =>
        intro h₁ h₂
        have hhead :
            Charge.isInconsistency (LenticleJoinSection c₁ c₂ φ) =
              LenticleSectionDisagreement c₁ c₂ φ :=
          lenticleSection_inconsistency_eq_disagreement_at c₁ c₂ φ
            (h₁ φ (by simp)) (h₂ φ (by simp))
        have hrest₁ : ∀ ψ, ψ ∈ rest → DefiniteCharge (c₁ ψ) := by
          intro ψ hψ
          exact h₁ ψ (List.mem_cons.2 (Or.inr hψ))
        have hrest₂ : ∀ ψ, ψ ∈ rest → DefiniteCharge (c₂ ψ) := by
          intro ψ hψ
          exact h₂ ψ (List.mem_cons.2 (Or.inr hψ))
        have hrest := ih hrest₁ hrest₂
        unfold LenticleMiscrossingSomewhere LenticleDisagreementSomewhere at hrest ⊢
        simp only [List.any_cons, hhead, hrest]
  rw [h]

/-- A lenticle-local crossing charge is the existing crossing charge read at the overlap. -/
def lenticleCrossingCharge (_U₁ _U₂ : Site.Clopen) (warpOver weftOver : Bool) : Charge :=
  AperiodicOrder.Tiling.crossingCharge warpOver weftOver

/-- The lenticle-local crossing charge is definitionally the existing crossing charge;
the clopen parameters only record the overlap locus where it is read. -/
@[simp] theorem lenticleCrossingCharge_eq_crossingCharge
    (U₁ U₂ : Site.Clopen) (warpOver weftOver : Bool) :
    lenticleCrossingCharge U₁ U₂ warpOver weftOver =
      AperiodicOrder.Tiling.crossingCharge warpOver weftOver := rfl

/-- The lenticle-local mis-crossing is the existing mis-crossing theorem at the overlap. -/
theorem lenticle_miscrossing_isInconsistency (U₁ U₂ : Site.Clopen) :
    Charge.isInconsistency (lenticleCrossingCharge U₁ U₂ true true) = true :=
  by simpa using AperiodicOrder.Tiling.miscrossing_isInconsistency

/-- The lenticle-local crossing charge is inconsistent exactly in the
mis-crossing case: both strands assert the over-crossing. -/
theorem lenticleCrossingCharge_inconsistency_iff_both_over
    (U₁ U₂ : Site.Clopen) (warpOver weftOver : Bool) :
  Charge.isInconsistency (lenticleCrossingCharge U₁ U₂ warpOver weftOver) = true ↔
      warpOver = true ∧ weftOver = true := by
  cases warpOver <;> cases weftOver
  · simp [lenticleCrossingCharge, AperiodicOrder.Tiling.hole_is_kBot, Charge.isInconsistency,
      Charge.kBot, Charge.kTop]
  · simp [lenticleCrossingCharge, AperiodicOrder.Tiling.crossingCharge, Charge.isInconsistency,
      Charge.kTop, Articulating.FourCorner.toCorner, Articulating.Corner.ofStatus]
  · simp [lenticleCrossingCharge, AperiodicOrder.Tiling.crossingCharge, Charge.isInconsistency,
      Charge.kTop, Articulating.FourCorner.toCorner, Articulating.Corner.ofStatus]
  · simpa using lenticle_miscrossing_isInconsistency U₁ U₂

/-- A defect-free lenticle-local crossing carries no inconsistency. -/
theorem lenticle_defectFree_consistent (U₁ U₂ : Site.Clopen) (b : Bool) :
    Charge.isInconsistency (lenticleCrossingCharge U₁ U₂ b (!b)) = false := by
  simpa [lenticleCrossingCharge] using AperiodicOrder.Tiling.defectFree_consistent b

/-- The one-cell lenticle census is the `H⁰_⊤` inconsistency count. -/
theorem lenticle_singleton_h0top_count (v : Valuation) (φ : PredicationCell) :
    InconSheaf.H0top v [φ] =
      [φ].countP (fun ψ => Charge.isInconsistency (v ψ)) :=
  (InconSheaf.h0top_is_inconsistency_count v [φ]).1

/-! ## Finite lenticle census -/

/-- The mis-crossing census over one finite lenticle support. -/
def LenticleCensus (v : Valuation) (cells : List PredicationCell) : Nat :=
  cells.countP (fun φ => Charge.isInconsistency (v φ))

/-- The number of disagreement cells between two local sections on a finite support. -/
def LenticleDisagreementCount
    (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge) : Nat :=
  cells.countP (fun φ => LenticleSectionDisagreement c₁ c₂ φ)

/-- The `H⁰_⊤` count of the joined section is exactly the section-disagreement count. -/
theorem lenticleSection_h0top_eq_disagreement_count
    (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, DefiniteCharge (c₁ φ)) (h₂ : ∀ φ, DefiniteCharge (c₂ φ)) :
    InconSheaf.H0top (LenticleJoinSection c₁ c₂) cells =
      LenticleDisagreementCount cells c₁ c₂ := by
  rw [(InconSheaf.h0top_is_inconsistency_count (LenticleJoinSection c₁ c₂) cells).1]
  unfold LenticleDisagreementCount
  induction cells with
  | nil => rfl
  | cons φ rest ih =>
      simp only [List.countP_cons, lenticleSection_inconsistency_eq_disagreement c₁ c₂ h₁ h₂ φ,
        ih]

/-- `H⁰_⊤` is additive over concatenated finite supports. -/
theorem h0top_append (v : Valuation) (xs ys : List PredicationCell) :
    InconSheaf.H0top v (xs ++ ys) =
      InconSheaf.H0top v xs + InconSheaf.H0top v ys := by
  rw [(InconSheaf.h0top_is_inconsistency_count v (xs ++ ys)).1]
  rw [(InconSheaf.h0top_is_inconsistency_count v xs).1]
  rw [(InconSheaf.h0top_is_inconsistency_count v ys).1]
  exact List.countP_append

/-- One finite pairwise lenticle support with the two charge-valued sections
whose knowledge-join induces its local inconsistency-sheaf valuation. -/
structure LenticleSectionEntry where
  /-- The finite support of the pairwise lenticle. -/
  cells : List PredicationCell
  /-- The left restricted charge-valued section. -/
  left : PredicationCell → Charge
  /-- The right restricted charge-valued section. -/
  right : PredicationCell → Charge

namespace LenticleSectionEntry

/-- The local valuation induced by joining the two restricted sections. -/
def joined (E : LenticleSectionEntry) : Valuation :=
  LenticleJoinSection E.left E.right

/-- The local disagreement census for this lenticle entry. -/
def disagreementCount (E : LenticleSectionEntry) : Nat :=
  LenticleDisagreementCount E.cells E.left E.right

/-- Whether this lenticle entry mis-crosses somewhere on its finite support. -/
def miscrossing (E : LenticleSectionEntry) : Bool :=
  LenticleMiscrossingSomewhere E.cells E.left E.right

/-- This entry represents one counted lenticle locus rather than a multi-cell
support exactly when its finite support is a singleton. -/
def SingletonSupport (E : LenticleSectionEntry) : Prop :=
  ∃ φ, E.cells = [φ]

/-- Definiteness of both restricted sections on the finite lenticle support. -/
def DefiniteOnSupport (E : LenticleSectionEntry) : Prop :=
  (∀ φ, φ ∈ E.cells → DefiniteCharge (E.left φ)) ∧
    (∀ φ, φ ∈ E.cells → DefiniteCharge (E.right φ))

/-- A global induced valuation is compatible with an entry when it agrees with
the joined restricted sections on that entry's finite support. -/
def Compatible (v : Valuation) (E : LenticleSectionEntry) : Prop :=
  ∀ φ, φ ∈ E.cells → v φ = E.joined φ

/-- A compatible induced valuation has `H⁰_⊤` equal to the entry's local
disagreement count. -/
theorem h0top_eq_disagreement_count_of_compatible
    (v : Valuation) (E : LenticleSectionEntry)
    (hdef : E.DefiniteOnSupport) (hcompat : E.Compatible v) :
    InconSheaf.H0top v E.cells = E.disagreementCount := by
  cases E with
  | mk cells left right =>
  dsimp [DefiniteOnSupport, Compatible, joined, disagreementCount] at hdef hcompat ⊢
  rw [(InconSheaf.h0top_is_inconsistency_count v cells).1]
  unfold LenticleDisagreementCount
  rcases hdef with ⟨hleft, hright⟩
  induction cells with
  | nil =>
      rfl
  | cons φ rest ih =>
      have hv : v φ = LenticleJoinSection left right φ := hcompat φ (by simp)
      have hhead :
          Charge.isInconsistency (v φ) =
            LenticleSectionDisagreement left right φ := by
        rw [hv]
        exact lenticleSection_inconsistency_eq_disagreement_at left right φ
          (hleft φ (by simp)) (hright φ (by simp))
      have hleft_rest : ∀ ψ, ψ ∈ rest → DefiniteCharge (left ψ) := by
        intro ψ hψ
        exact hleft ψ (List.mem_cons.2 (Or.inr hψ))
      have hright_rest : ∀ ψ, ψ ∈ rest → DefiniteCharge (right ψ) := by
        intro ψ hψ
        exact hright ψ (List.mem_cons.2 (Or.inr hψ))
      have hcompat_rest : ∀ ψ, ψ ∈ rest → v ψ = LenticleJoinSection left right ψ := by
        intro ψ hψ
        exact hcompat ψ (List.mem_cons.2 (Or.inr hψ))
      have ih' := ih hcompat_rest hleft_rest hright_rest
      simp only [List.countP_cons, hhead, ih']

/-- An entry's own joined valuation is compatible with that entry. -/
theorem joined_compatible (E : LenticleSectionEntry) :
    E.Compatible E.joined := by
  intro φ _hφ
  rfl

/-- The entry-local version: `H⁰_⊤` of the joined restricted sections is the
local disagreement census. -/
theorem h0top_joined_eq_disagreement_count
    (E : LenticleSectionEntry) (hdef : E.DefiniteOnSupport) :
    InconSheaf.H0top E.joined E.cells = E.disagreementCount :=
  E.h0top_eq_disagreement_count_of_compatible E.joined hdef E.joined_compatible

/-- For a singleton-support lenticle entry, the cell-level disagreement census
collapses to the entry-level mis-crossing indicator. -/
theorem disagreementCount_eq_miscount_of_singleton
    (E : LenticleSectionEntry) (hdef : E.DefiniteOnSupport)
    (hsingleton : E.SingletonSupport) :
    E.disagreementCount = if E.miscrossing then 1 else 0 := by
  cases E with
  | mk cells left right =>
      rcases hsingleton with ⟨φ, hcells⟩
      subst hcells
      rcases hdef with ⟨hleft, hright⟩
      have hhead :
          Charge.isInconsistency (LenticleJoinSection left right φ) =
            LenticleSectionDisagreement left right φ :=
        lenticleSection_inconsistency_eq_disagreement_at left right φ
          (hleft φ (by simp)) (hright φ (by simp))
      simp [disagreementCount, LenticleDisagreementCount, miscrossing,
        LenticleMiscrossingSomewhere, hhead]

end LenticleSectionEntry

/-- The finite supports of a list of pairwise lenticle section entries. -/
def PairwiseSectionSupports (entries : List LenticleSectionEntry) :
    List (List PredicationCell) :=
  entries.map LenticleSectionEntry.cells

/-- The total disagreement census across pairwise lenticle section entries. -/
def PairwiseSectionDisagreementCount : List LenticleSectionEntry → Nat
  | [] => 0
  | E :: rest => E.disagreementCount + PairwiseSectionDisagreementCount rest

/-- The entry-level count of pairwise lenticles that mis-cross somewhere. -/
def PairwiseSectionMiscrossingCount (entries : List LenticleSectionEntry) : Nat :=
  entries.countP (fun E => E.miscrossing)

/-- All entries have definite restricted sections on their finite supports. -/
def PairwiseSectionDefinite (entries : List LenticleSectionEntry) : Prop :=
  ∀ E, E ∈ entries → E.DefiniteOnSupport

/-- All entries are singleton-support lenticle loci.  Under this hypothesis, a
cell census and a lenticle-entry census have the same granularity. -/
def PairwiseSectionSingletonSupport (entries : List LenticleSectionEntry) : Prop :=
  ∀ E, E ∈ entries → E.SingletonSupport

/-- A global induced valuation agrees with every pairwise lenticle entry on its
own finite support. -/
def PairwiseSectionCompatible (v : Valuation) (entries : List LenticleSectionEntry) :
    Prop :=
  ∀ E, E ∈ entries → E.Compatible v

/-- For a realized finite list of pairwise lenticle section entries, `H⁰_⊤` on
the induced flattened support is exactly the total disagreement census. -/
theorem pairwiseSection_h0top_eq_disagreement_count
    (v : Valuation) (entries : List LenticleSectionEntry)
    (hdef : PairwiseSectionDefinite entries)
    (hcompat : PairwiseSectionCompatible v entries) :
    InconSheaf.H0top v (PairwiseSectionSupports entries).flatten =
      PairwiseSectionDisagreementCount entries := by
  induction entries with
  | nil =>
      simp [PairwiseSectionSupports, PairwiseSectionDisagreementCount,
        InconSheaf.H0top]
  | cons E rest ih =>
      have hdefE : E.DefiniteOnSupport := hdef E (by simp)
      have hcompatE : E.Compatible v := hcompat E (by simp)
      have hdefRest : PairwiseSectionDefinite rest := by
        intro E' hE'
        exact hdef E' (List.mem_cons.2 (Or.inr hE'))
      have hcompatRest : PairwiseSectionCompatible v rest := by
        intro E' hE'
        exact hcompat E' (List.mem_cons.2 (Or.inr hE'))
      rw [show (PairwiseSectionSupports (E :: rest)).flatten =
          E.cells ++ (PairwiseSectionSupports rest).flatten by rfl]
      rw [h0top_append]
      rw [E.h0top_eq_disagreement_count_of_compatible v hdefE hcompatE]
      rw [ih hdefRest hcompatRest]
      rfl

/-- If every entry is a singleton-support lenticle locus, the section-disagreement
cell census is exactly the count of mis-crossing lenticle entries. -/
theorem pairwiseSection_disagreement_count_eq_miscrossing_count
    (entries : List LenticleSectionEntry)
    (hdef : PairwiseSectionDefinite entries)
    (hsingleton : PairwiseSectionSingletonSupport entries) :
    PairwiseSectionDisagreementCount entries =
      PairwiseSectionMiscrossingCount entries := by
  induction entries with
  | nil =>
      rfl
  | cons E rest ih =>
      have hdefE : E.DefiniteOnSupport := hdef E (by simp)
      have hsingletonE : E.SingletonSupport := hsingleton E (by simp)
      have hdefRest : PairwiseSectionDefinite rest := by
        intro E' hE'
        exact hdef E' (List.mem_cons.2 (Or.inr hE'))
      have hsingletonRest : PairwiseSectionSingletonSupport rest := by
        intro E' hE'
        exact hsingleton E' (List.mem_cons.2 (Or.inr hE'))
      rw [PairwiseSectionDisagreementCount]
      rw [LenticleSectionEntry.disagreementCount_eq_miscount_of_singleton
        E hdefE hsingletonE]
      rw [ih hdefRest hsingletonRest]
      unfold PairwiseSectionMiscrossingCount
      rw [List.countP_cons]
      exact Nat.add_comm _ _

/-- Under singleton-support granularity, `H⁰_⊤` is exactly the count of
mis-crossing lenticle entries, not merely the count of inconsistent cells. -/
theorem pairwiseSection_h0top_eq_miscrossing_count
    (v : Valuation) (entries : List LenticleSectionEntry)
    (hdef : PairwiseSectionDefinite entries)
    (hcompat : PairwiseSectionCompatible v entries)
    (hsingleton : PairwiseSectionSingletonSupport entries) :
    InconSheaf.H0top v (PairwiseSectionSupports entries).flatten =
      PairwiseSectionMiscrossingCount entries := by
  rw [pairwiseSection_h0top_eq_disagreement_count v entries hdef hcompat]
  exact pairwiseSection_disagreement_count_eq_miscrossing_count entries hdef hsingleton

/-- The total census over a finite family of pairwise lenticle supports. -/
def PairwiseLenticleCensus (v : Valuation) : List (List PredicationCell) → Nat
  | [] => 0
  | cells :: rest => LenticleCensus v cells + PairwiseLenticleCensus v rest

/-- The pairwise lenticle census is exactly `H⁰_⊤` on the induced finite support. -/
theorem pairwiseLenticleCensus_eq_h0top (v : Valuation) :
    ∀ supports : List (List PredicationCell),
      PairwiseLenticleCensus v supports = InconSheaf.H0top v supports.flatten
  | [] => rfl
  | cells :: rest => by
      rw [PairwiseLenticleCensus, pairwiseLenticleCensus_eq_h0top v rest]
      rw [(InconSheaf.h0top_is_inconsistency_count v (List.flatten (cells :: rest))).1]
      rw [(InconSheaf.h0top_is_inconsistency_count v (List.flatten rest)).1]
      simp [LenticleCensus]

/-- The pairwise lenticle census is explicitly the inconsistency-cell count
given by `InconSheaf.h0top_is_inconsistency_count` on the flattened induced
support.  Repeated cells in different pairwise overlaps are counted with their
overlap multiplicity because the support is flattened from the pairwise cover
list. -/
theorem pairwiseLenticleCensus_is_inconsistency_count
    (v : Valuation) (supports : List (List PredicationCell)) :
    PairwiseLenticleCensus v supports =
      supports.flatten.countP (fun φ => Charge.isInconsistency (v φ)) := by
  rw [pairwiseLenticleCensus_eq_h0top v supports]
  exact (InconSheaf.h0top_is_inconsistency_count v supports.flatten).1

/-- The pairwise lenticle census is positive exactly when the flattened induced
support has inconsistency content in the inconsistency sheaf. -/
theorem pairwiseLenticleCensus_pos_iff_inconsistencyContent
    (v : Valuation) (supports : List (List PredicationCell)) :
    0 < PairwiseLenticleCensus v supports ↔
      inconsistencyContent supports.flatten v = true := by
  rw [pairwiseLenticleCensus_eq_h0top v supports]
  exact (InconSheaf.h0top_is_inconsistency_count v supports.flatten).2

/-! ## Pairwise lenticles extracted from finite covers -/

/-- All pairwise lenticles of a finite patch list, each one the overlap of an earlier
patch with a later patch. -/
def PairwiseLenticles : List Site.Clopen → List Site.Clopen
  | [] => []
  | U :: rest => rest.map (Lenticle U) ++ PairwiseLenticles rest

/-- A two-member cover has exactly one pairwise lenticle. -/
theorem pairwiseLenticles_two (U₁ U₂ : Site.Clopen) :
    PairwiseLenticles [U₁, U₂] = [Lenticle U₁ U₂] := rfl

/-- A finite site cover with an induced finite support for every clopen. -/
structure FiniteSiteCover (Q : Type) where
  /-- The site object being covered. -/
  site : Site.SiteObj Q
  /-- The finite list of clopen patches. -/
  patches : List Site.Clopen
  /-- The patches cover the site's clopen support. -/
  covers : Site.Covers site.U patches
  /-- The induced finite cell support carried by each clopen. -/
  support : Site.Clopen → List PredicationCell

/-- A finite support realization records the cell mask induced by each clopen, together
with a finite list that is complete for that mask.  The lenticle mask is the
conjunction of the two patch masks, matching the fact that a lenticle is an
overlap. -/
structure FiniteSupportRealization where
  /-- The cell-level mask induced by a clopen. -/
  mask : Site.Clopen → PredicationCell → Bool
  /-- A finite list enumerating the masked cells of each clopen. -/
  support : Site.Clopen → List PredicationCell
  /-- The list support is extensionally complete for the mask. -/
  support_complete : ∀ U φ, φ ∈ support U ↔ mask U φ = true
  /-- Lenticle support is mask-theoretic overlap. -/
  lenticle_mask :
    ∀ U₁ U₂ φ, mask (Lenticle U₁ U₂) φ = (mask U₁ φ && mask U₂ φ)

/-- A finite Stone-side support model: a finite universe of predication cells,
together with a classifier assigning each cell to a point of the two-point
pairwise-Stone dual.  This is enough to derive the clopen masks and their
finite supports, including the lenticle-overlap law. -/
structure FiniteStoneSupportModel where
  /-- The finite cell universe of the realized site. -/
  cells : List PredicationCell
  /-- The active finite part of the ambient predication-cell type. -/
  active : PredicationCell → Bool
  /-- Completeness of the finite universe for the active realized site. -/
  complete : ∀ φ : PredicationCell, φ ∈ cells ↔ active φ = true
  /-- The pairwise-Stone point in which a cell is observed. -/
  side : PredicationCell → Stone.FourDual

namespace FiniteStoneSupportModel

/-- The clopen mask induced by the Stone-side classifier. -/
def mask (M : FiniteStoneSupportModel) (U : Site.Clopen) (φ : PredicationCell) : Bool :=
  M.active φ && Stone.ClopenUp.mem U (M.side φ)

/-- The finite support induced by a clopen is the finite universe filtered by its
Stone membership predicate. -/
def support (M : FiniteStoneSupportModel) (U : Site.Clopen) : List PredicationCell :=
  M.cells.filter (fun φ => M.mask U φ)

/-- The filtered finite support is complete for the induced clopen mask. -/
theorem support_complete (M : FiniteStoneSupportModel) (U : Site.Clopen)
    (φ : PredicationCell) :
    φ ∈ M.support U ↔ M.mask U φ = true := by
  constructor
  · intro h
    exact (List.mem_filter.1 h).2
  · intro h
    have hactive : M.active φ = true := by
      unfold mask at h
      cases ha : M.active φ
      · simp [ha] at h
      · rfl
    exact List.mem_filter.2 ⟨(M.complete φ).2 hactive, h⟩

/-- Stone membership turns clopen meet into pointwise Boolean conjunction. -/
theorem mask_lenticle (M : FiniteStoneSupportModel) (U₁ U₂ : Site.Clopen)
    (φ : PredicationCell) :
    M.mask (Lenticle U₁ U₂) φ = (M.mask U₁ φ && M.mask U₂ φ) := by
  unfold mask Lenticle Site.meet Stone.ClopenUp.meet
  cases M.active φ <;> cases M.side φ <;> rfl

/-- The support model derives a full finite support realization. -/
def toFiniteSupportRealization (M : FiniteStoneSupportModel) : FiniteSupportRealization where
  mask := M.mask
  support := M.support
  support_complete := M.support_complete
  lenticle_mask := M.mask_lenticle

@[simp] theorem toFiniteSupportRealization_mask
    (M : FiniteStoneSupportModel) (U : Site.Clopen) :
    M.toFiniteSupportRealization.mask U = M.mask U := rfl

@[simp] theorem toFiniteSupportRealization_support
    (M : FiniteStoneSupportModel) (U : Site.Clopen) :
    M.toFiniteSupportRealization.support U = M.support U := rfl

/-- A Stone-side model realizes one counted lenticle locus when the support of
the clopen overlap is a singleton list.  This is intentionally stated as an
explicit support-shape condition: the finite cell list need not be duplicate
free, so singleton countedness is not implied by pointwise uniqueness alone. -/
def SingletonLenticleSupport (M : FiniteStoneSupportModel)
    (U₁ U₂ : Site.Clopen) : Prop :=
  ∃ φ, M.support (Lenticle U₁ U₂) = [φ]

/-- A Stone-side singleton lenticle support discharges the corresponding
finite-support realization obligation. -/
theorem singletonLenticleSupport_toFiniteSupportRealization
    (M : FiniteStoneSupportModel) (U₁ U₂ : Site.Clopen) :
    M.SingletonLenticleSupport U₁ U₂ →
      ∃ φ, M.toFiniteSupportRealization.support (Lenticle U₁ U₂) = [φ] := by
  intro h
  rcases h with ⟨φ, hφ⟩
  exact ⟨φ, by simpa [toFiniteSupportRealization_support] using hφ⟩

/-- A one-cell Stone support universe whose cell is active and lies in both
patches realizes a singleton lenticle support. -/
theorem singletonLenticleSupport_of_singleton_cells
    (M : FiniteStoneSupportModel) (U₁ U₂ : Site.Clopen) (φ : PredicationCell)
    (hcells : M.cells = [φ])
    (hactive : M.active φ = true)
    (hleft : Stone.ClopenUp.mem U₁ (M.side φ) = true)
    (hright : Stone.ClopenUp.mem U₂ (M.side φ) = true) :
    M.SingletonLenticleSupport U₁ U₂ := by
  refine ⟨φ, ?_⟩
  unfold support
  rw [hcells]
  have hmask : M.mask (Lenticle U₁ U₂) φ = true := by
    rw [mask_lenticle]
    unfold mask
    simp [hactive, hleft, hright]
  simpa [Lenticle] using hmask

end FiniteStoneSupportModel

namespace FiniteSupportRealization

/-- A cell belongs to the realized lenticle support exactly when it is in both
patch masks. -/
theorem lenticle_mem_iff (R : FiniteSupportRealization) (U₁ U₂ : Site.Clopen)
    (φ : PredicationCell) :
    φ ∈ R.support (Lenticle U₁ U₂) ↔
      R.mask U₁ φ = true ∧ R.mask U₂ φ = true := by
  rw [R.support_complete, R.lenticle_mask]
  cases R.mask U₁ φ <;> cases R.mask U₂ φ <;> simp

/-- Boolean form of `lenticle_mem_iff`. -/
theorem lenticle_mask_eq_and (R : FiniteSupportRealization) (U₁ U₂ : Site.Clopen)
    (φ : PredicationCell) :
    R.mask (Lenticle U₁ U₂) φ = true ↔
      R.mask U₁ φ = true ∧ R.mask U₂ φ = true := by
  rw [R.lenticle_mask]
  cases R.mask U₁ φ <;> cases R.mask U₂ φ <;> simp

/-- Restriction to the realized lenticle mask is the same as restricting through
the two patch masks. -/
theorem restrict_lenticle_eq_restrict_pair (R : FiniteSupportRealization)
    (U₁ U₂ : Site.Clopen) (c : AssocSheaf.Cochain) :
    AssocSheaf.restrict (R.mask (Lenticle U₁ U₂)) c =
      AssocSheaf.restrict (R.mask U₁) (AssocSheaf.restrict (R.mask U₂) c) := by
  funext φ
  simp only [AssocSheaf.restrict]
  rw [R.lenticle_mask]
  cases R.mask U₁ φ <;> cases R.mask U₂ φ <;> rfl

/-- Restricting a charge-valued section to the lenticle mask preserves it on the
realized finite lenticle support. -/
theorem restrictChargeSection_eq_on_lenticleSupport
    (R : FiniteSupportRealization) (U₁ U₂ : Site.Clopen) (offMask : Charge)
    (s : PredicationCell → Charge) {φ : PredicationCell}
    (hφ : φ ∈ R.support (Lenticle U₁ U₂)) :
    RestrictChargeSection (R.mask (Lenticle U₁ U₂)) offMask s φ = s φ :=
  restrictChargeSection_eq_of_mask (R.mask (Lenticle U₁ U₂)) offMask s
    ((R.support_complete (Lenticle U₁ U₂) φ).1 hφ)

/-- The local lenticle mis-crossing theorem applied to charge-valued sections
induced by restriction to the realized lenticle mask. -/
theorem restricted_lenticleSection_miscrossing_somewhere_iff_disagreement
    (R : FiniteSupportRealization) (U₁ U₂ : Site.Clopen)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₂ φ)) :
    LenticleMiscrossingSomewhere (R.support (Lenticle U₁ U₂))
        (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₁ c₁)
        (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₂ c₂) = true ↔
      LenticleDisagreementSomewhere (R.support (Lenticle U₁ U₂))
        (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₁ c₁)
        (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₂ c₂) = true := by
  apply lenticleSection_miscrossing_somewhere_iff_disagreement_on_support
  · intro φ hφ
    rw [restrictChargeSection_eq_on_lenticleSupport R U₁ U₂ off₁ c₁ hφ]
    exact h₁ φ hφ
  · intro φ hφ
    rw [restrictChargeSection_eq_on_lenticleSupport R U₁ U₂ off₂ c₂ hφ]
    exact h₂ φ hφ

end FiniteSupportRealization

/-- Pull back a charge-valued section along a fixed-fiber site morphism by
restricting it to the source support retained by the morphism. -/
def FiberPullbackChargeSection
    {Q : Type} {src dst : Site.SiteObj Q} (R : FiniteSupportRealization)
    (f : Site.FiberHom Q src dst) (offMask : Charge)
    (s : PredicationCell → Charge) : PredicationCell → Charge :=
  RestrictChargeSection (R.mask f.support) offMask s

namespace FiniteSiteCover

/-- The finite supports induced by all pairwise lenticles of the cover. -/
def pairwiseSupports {Q : Type} (C : FiniteSiteCover Q) : List (List PredicationCell) :=
  (PairwiseLenticles C.patches).map C.support

end FiniteSiteCover

/-- For any finite site cover, the pairwise lenticle census is exactly `H⁰_⊤`
on the induced support of all pairwise overlaps. -/
theorem finiteSiteCover_pairwise_lenticle_census_eq_h0top
    {Q : Type} (C : FiniteSiteCover Q) (v : Valuation) :
    PairwiseLenticleCensus v C.pairwiseSupports =
      InconSheaf.H0top v C.pairwiseSupports.flatten :=
  pairwiseLenticleCensus_eq_h0top v C.pairwiseSupports

/-- For a finite site cover, the pairwise lenticle census is the inconsistency
count on the flattened family of induced pairwise-overlap supports. -/
theorem finiteSiteCover_pairwise_lenticle_census_is_inconsistency_count
    {Q : Type} (C : FiniteSiteCover Q) (v : Valuation) :
    PairwiseLenticleCensus v C.pairwiseSupports =
      C.pairwiseSupports.flatten.countP (fun φ => Charge.isInconsistency (v φ)) :=
  pairwiseLenticleCensus_is_inconsistency_count v C.pairwiseSupports

/-- For a finite site cover, a positive pairwise lenticle census is exactly
inconsistency content on the flattened induced pairwise-overlap support. -/
theorem finiteSiteCover_pairwise_lenticle_census_pos_iff_inconsistencyContent
    {Q : Type} (C : FiniteSiteCover Q) (v : Valuation) :
    0 < PairwiseLenticleCensus v C.pairwiseSupports ↔
      inconsistencyContent C.pairwiseSupports.flatten v = true :=
  pairwiseLenticleCensus_pos_iff_inconsistencyContent v C.pairwiseSupports

/-- In the two-member case, the finite-cover support extraction is the single
support of the literal overlap. -/
theorem finiteSiteCover_two_pairwiseSupports
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂]) (support : Site.Clopen → List PredicationCell) :
    (FiniteSiteCover.pairwiseSupports
      ({ site := S, patches := [U₁, U₂], covers := hcov, support := support } :
        FiniteSiteCover Q)) =
      [support (Lenticle U₁ U₂)] := rfl

/-- A finite site cover whose support is realized by a cell mask with the correct
lenticle-overlap law. -/
structure RealizedFiniteSiteCover (Q : Type) where
  /-- The site object being covered. -/
  site : Site.SiteObj Q
  /-- The finite list of clopen patches. -/
  patches : List Site.Clopen
  /-- The patches cover the site's clopen support. -/
  covers : Site.Covers site.U patches
  /-- The finite support realization for every clopen. -/
  realization : FiniteSupportRealization

namespace RealizedFiniteSiteCover

/-- Forget the realization witness, retaining only the finite support map. -/
def toFiniteSiteCover {Q : Type} (C : RealizedFiniteSiteCover Q) : FiniteSiteCover Q :=
  { site := C.site, patches := C.patches, covers := C.covers, support := C.realization.support }

/-- The pairwise supports induced by all realized pairwise lenticles of the cover. -/
def pairwiseSupports {Q : Type} (C : RealizedFiniteSiteCover Q) : List (List PredicationCell) :=
  C.toFiniteSiteCover.pairwiseSupports

/-- Realized finite covers inherit the lenticle census theorem. -/
theorem pairwise_lenticle_census_eq_h0top
    {Q : Type} (C : RealizedFiniteSiteCover Q) (v : Valuation) :
    PairwiseLenticleCensus v C.pairwiseSupports =
      InconSheaf.H0top v C.pairwiseSupports.flatten :=
  finiteSiteCover_pairwise_lenticle_census_eq_h0top C.toFiniteSiteCover v

/-- Realized finite covers inherit the explicit inconsistency-count form of the
lenticle census theorem. -/
theorem pairwise_lenticle_census_is_inconsistency_count
    {Q : Type} (C : RealizedFiniteSiteCover Q) (v : Valuation) :
    PairwiseLenticleCensus v C.pairwiseSupports =
      C.pairwiseSupports.flatten.countP (fun φ => Charge.isInconsistency (v φ)) :=
  finiteSiteCover_pairwise_lenticle_census_is_inconsistency_count C.toFiniteSiteCover v

/-- Realized finite covers inherit the positive-census/inconsistency-content
equivalence on their flattened pairwise lenticle supports. -/
theorem pairwise_lenticle_census_pos_iff_inconsistencyContent
    {Q : Type} (C : RealizedFiniteSiteCover Q) (v : Valuation) :
    0 < PairwiseLenticleCensus v C.pairwiseSupports ↔
      inconsistencyContent C.pairwiseSupports.flatten v = true :=
  finiteSiteCover_pairwise_lenticle_census_pos_iff_inconsistencyContent
    C.toFiniteSiteCover v

/-- In the two-member realized case, the extracted support is the support of the
literal overlap. -/
theorem two_pairwiseSupports
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂]) (R : FiniteSupportRealization) :
    (RealizedFiniteSiteCover.pairwiseSupports
      ({ site := S, patches := [U₁, U₂], covers := hcov, realization := R } :
        RealizedFiniteSiteCover Q)) =
      [R.support (Lenticle U₁ U₂)] := rfl

/-- In a realized cover, cells of the two-member lenticle support are exactly cells
lying in both patch masks. -/
theorem two_lenticle_support_mem_iff
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂]) (R : FiniteSupportRealization)
    (φ : PredicationCell) :
    φ ∈ (RealizedFiniteSiteCover.pairwiseSupports
      ({ site := S, patches := [U₁, U₂], covers := hcov, realization := R } :
        RealizedFiniteSiteCover Q)).flatten ↔
      R.mask U₁ φ = true ∧ R.mask U₂ φ = true := by
  rw [two_pairwiseSupports S U₁ U₂ hcov R]
  simpa [Lenticle] using FiniteSupportRealization.lenticle_mem_iff R U₁ U₂ φ

end RealizedFiniteSiteCover

/-- A realized finite cover equipped with the charge-valued section data on each
pairwise lenticle support.  The `support_eq` field says the section entries are
not a detached list: their supports are exactly the pairwise lenticle supports
extracted from the realized cover. -/
structure SectionRealizedFiniteSiteCover (Q : Type) where
  /-- The realized finite cover. -/
  cover : RealizedFiniteSiteCover Q
  /-- The section data carried by the pairwise lenticles of the cover. -/
  entries : List LenticleSectionEntry
  /-- The entry supports are the realized cover's pairwise lenticle supports. -/
  support_eq : PairwiseSectionSupports entries = cover.pairwiseSupports
  /-- The restricted sections are definite on every finite lenticle support. -/
  definite : PairwiseSectionDefinite entries

namespace SectionRealizedFiniteSiteCover

/-- The total section-disagreement census carried by a section-realized cover. -/
def disagreementCount {Q : Type} (C : SectionRealizedFiniteSiteCover Q) : Nat :=
  PairwiseSectionDisagreementCount C.entries

/-- The entry-level count of pairwise lenticles of the cover that mis-cross
somewhere. -/
def miscrossingCount {Q : Type} (C : SectionRealizedFiniteSiteCover Q) : Nat :=
  PairwiseSectionMiscrossingCount C.entries

/-- A valuation is induced by the section-realized cover when it agrees with
each pairwise lenticle entry's joined restricted sections on that entry's
support. -/
def Compatible {Q : Type} (C : SectionRealizedFiniteSiteCover Q) (v : Valuation) : Prop :=
  PairwiseSectionCompatible v C.entries

/-- The cover has singleton-support pairwise lenticle entries, so its cell census
and lenticle-entry census have the same granularity. -/
def SingletonSupports {Q : Type} (C : SectionRealizedFiniteSiteCover Q) : Prop :=
  PairwiseSectionSingletonSupport C.entries

/-- For a section-realized finite cover, the induced inconsistency-sheaf
`H⁰_⊤` count is exactly the cover's pairwise lenticle disagreement census. -/
theorem h0top_eq_disagreement_count
    {Q : Type} (C : SectionRealizedFiniteSiteCover Q) (v : Valuation)
    (hcompat : C.Compatible v) :
    InconSheaf.H0top v C.cover.pairwiseSupports.flatten =
      C.disagreementCount := by
  rw [← C.support_eq]
  exact pairwiseSection_h0top_eq_disagreement_count v C.entries C.definite hcompat

/-- Symmetric form: the cover's pairwise lenticle disagreement census is the
`H⁰_⊤` count of any compatible induced valuation. -/
theorem disagreement_count_eq_h0top
    {Q : Type} (C : SectionRealizedFiniteSiteCover Q) (v : Valuation)
    (hcompat : C.Compatible v) :
    C.disagreementCount =
      InconSheaf.H0top v C.cover.pairwiseSupports.flatten := by
  rw [h0top_eq_disagreement_count C v hcompat]

/-- If the realized pairwise lenticles are singleton-support loci, `H⁰_⊤` is
exactly the number of pairwise lenticle entries that mis-cross. -/
theorem h0top_eq_miscrossing_count
    {Q : Type} (C : SectionRealizedFiniteSiteCover Q) (v : Valuation)
    (hcompat : C.Compatible v) (hsingleton : C.SingletonSupports) :
    InconSheaf.H0top v C.cover.pairwiseSupports.flatten =
      C.miscrossingCount := by
  rw [← C.support_eq]
  exact pairwiseSection_h0top_eq_miscrossing_count
    v C.entries C.definite hcompat hsingleton

/-- Under singleton-support granularity, the cover's carried mis-crossing
lenticle count is directly the inconsistency-cell count of the compatible
induced valuation on the flattened pairwise lenticle support. -/
theorem miscrossingCount_is_inconsistency_count
    {Q : Type} (C : SectionRealizedFiniteSiteCover Q) (v : Valuation)
    (hcompat : C.Compatible v) (hsingleton : C.SingletonSupports) :
    C.miscrossingCount =
      C.cover.pairwiseSupports.flatten.countP (fun φ => Charge.isInconsistency (v φ)) := by
  rw [← h0top_eq_miscrossing_count C v hcompat hsingleton]
  exact (InconSheaf.h0top_is_inconsistency_count v C.cover.pairwiseSupports.flatten).1

/-- Under singleton-support granularity, the cover's carried mis-crossing
lenticle count is positive exactly when the induced inconsistency sheaf has
inconsistency content on the flattened pairwise lenticle support. -/
theorem miscrossingCount_pos_iff_inconsistencyContent
    {Q : Type} (C : SectionRealizedFiniteSiteCover Q) (v : Valuation)
    (hcompat : C.Compatible v) (hsingleton : C.SingletonSupports) :
    0 < C.miscrossingCount ↔
      inconsistencyContent C.cover.pairwiseSupports.flatten v = true := by
  rw [← h0top_eq_miscrossing_count C v hcompat hsingleton]
  exact (InconSheaf.h0top_is_inconsistency_count v C.cover.pairwiseSupports.flatten).2

end SectionRealizedFiniteSiteCover

/-! ## Global finite-cover lenticle census -/

/-- A finite realized cover with section data on every pairwise lenticle and a
compatible induced valuation.  The singleton-support field records the
granularity needed to count lenticle entries rather than only cells. -/
structure FiniteCoverLenticleCensusRealization (Q : Type) where
  /-- The realized cover together with pairwise lenticle section entries. -/
  cover : SectionRealizedFiniteSiteCover Q
  /-- The valuation induced by the pairwise lenticle section entries. -/
  valuation : Valuation
  /-- The valuation agrees with every joined pairwise lenticle section on its support. -/
  compatible : cover.Compatible valuation
  /-- Every pairwise lenticle entry is a single counted locus. -/
  singleton_supports : cover.SingletonSupports

namespace FiniteCoverLenticleCensusRealization

/-- The supports of the carried section entries are exactly the pairwise
lenticle supports extracted from the realized finite cover. -/
theorem supports_are_pairwise_lenticles
    {Q : Type} (D : FiniteCoverLenticleCensusRealization Q) :
    PairwiseSectionSupports D.cover.entries = D.cover.cover.pairwiseSupports :=
  D.cover.support_eq

/-- The total number of mis-crossing pairwise lenticles carried by the realized
finite cover is exactly the `H⁰_⊤` inconsistency-sheaf count on the induced
pairwise lenticle support. -/
theorem global_carrier
    {Q : Type} (D : FiniteCoverLenticleCensusRealization Q) :
    InconSheaf.H0top D.valuation D.cover.cover.pairwiseSupports.flatten =
      D.cover.miscrossingCount :=
  SectionRealizedFiniteSiteCover.h0top_eq_miscrossing_count
    D.cover D.valuation D.compatible D.singleton_supports

/-- The symmetric census statement: the carried mis-crossing lenticle count is
the same number as the induced `H⁰_⊤` count. -/
theorem miscrossingCount_eq_h0top
    {Q : Type} (D : FiniteCoverLenticleCensusRealization Q) :
    D.cover.miscrossingCount =
      InconSheaf.H0top D.valuation D.cover.cover.pairwiseSupports.flatten := by
  rw [global_carrier D]

/-- The carried global lenticle census is directly the inconsistency-cell count
on the induced flattened pairwise lenticle support. -/
theorem global_carrier_is_inconsistency_count
    {Q : Type} (D : FiniteCoverLenticleCensusRealization Q) :
    D.cover.miscrossingCount =
      D.cover.cover.pairwiseSupports.flatten.countP
        (fun φ => Charge.isInconsistency (D.valuation φ)) :=
  SectionRealizedFiniteSiteCover.miscrossingCount_is_inconsistency_count
    D.cover D.valuation D.compatible D.singleton_supports

/-- The carried global lenticle census is positive exactly when the induced
inconsistency sheaf has inconsistency content on the flattened pairwise
lenticle support. -/
theorem global_carrier_pos_iff_inconsistencyContent
    {Q : Type} (D : FiniteCoverLenticleCensusRealization Q) :
    0 < D.cover.miscrossingCount ↔
      inconsistencyContent D.cover.cover.pairwiseSupports.flatten D.valuation = true :=
  SectionRealizedFiniteSiteCover.miscrossingCount_pos_iff_inconsistencyContent
    D.cover D.valuation D.compatible D.singleton_supports

end FiniteCoverLenticleCensusRealization

/-- The single section entry induced by restricting two charge-valued local
sections to the lenticle of a two-member realized cover. -/
def twoMemberSectionEntry
    (R : FiniteSupportRealization) (U₁ U₂ : Site.Clopen)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge) :
    LenticleSectionEntry where
  cells := R.support (Lenticle U₁ U₂)
  left := RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₁ c₁
  right := RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₂ c₂

/-- The two-member section entry has exactly the realized lenticle support. -/
@[simp] theorem twoMemberSectionEntry_cells
    (R : FiniteSupportRealization) (U₁ U₂ : Site.Clopen)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge) :
    (twoMemberSectionEntry R U₁ U₂ off₁ off₂ c₁ c₂).cells =
      R.support (Lenticle U₁ U₂) := rfl

/-- The left section of a two-member lenticle entry is the pullback of the left
local section along the lenticle-to-left-patch fiber morphism. -/
theorem twoMemberSectionEntry_left_eq_fiberPullback
    {Q : Type} (S : Site.SiteObj Q) (R : FiniteSupportRealization)
    (U₁ U₂ : Site.Clopen)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge) :
    (twoMemberSectionEntry R U₁ U₂ off₁ off₂ c₁ c₂).left =
      FiberPullbackChargeSection R (lenticleToLeftFiberHom S U₁ U₂) off₁ c₁ := rfl

/-- The right section of a two-member lenticle entry is the pullback of the right
local section along the lenticle-to-right-patch fiber morphism. -/
theorem twoMemberSectionEntry_right_eq_fiberPullback
    {Q : Type} (S : Site.SiteObj Q) (R : FiniteSupportRealization)
    (U₁ U₂ : Site.Clopen)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge) :
    (twoMemberSectionEntry R U₁ U₂ off₁ off₂ c₁ c₂).right =
      FiberPullbackChargeSection R (lenticleToRightFiberHom S U₁ U₂) off₂ c₂ := rfl

/-- Definiteness of the original local sections on the lenticle support gives
definiteness of the restricted two-member section entry. -/
theorem twoMemberSectionEntry_definite
    (R : FiniteSupportRealization) (U₁ U₂ : Site.Clopen)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₂ φ)) :
    (twoMemberSectionEntry R U₁ U₂ off₁ off₂ c₁ c₂).DefiniteOnSupport := by
  constructor
  · intro φ hφ
    have hmem : φ ∈ R.support (Lenticle U₁ U₂) := by
      simpa [twoMemberSectionEntry] using hφ
    change DefiniteCharge
      (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₁ c₁ φ)
    rw [FiniteSupportRealization.restrictChargeSection_eq_on_lenticleSupport
      R U₁ U₂ off₁ c₁ hmem]
    exact h₁ φ hmem
  · intro φ hφ
    have hmem : φ ∈ R.support (Lenticle U₁ U₂) := by
      simpa [twoMemberSectionEntry] using hφ
    change DefiniteCharge
      (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₂ c₂ φ)
    rw [FiniteSupportRealization.restrictChargeSection_eq_on_lenticleSupport
      R U₁ U₂ off₂ c₂ hmem]
    exact h₂ φ hmem

/-- A two-member realized finite cover, together with two local charge-valued
sections, induces a one-entry section-realized cover. -/
def twoMemberSectionRealizedCover
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂])
    (R : FiniteSupportRealization)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₂ φ)) :
    SectionRealizedFiniteSiteCover Q where
  cover := { site := S, patches := [U₁, U₂], covers := hcov, realization := R }
  entries := [twoMemberSectionEntry R U₁ U₂ off₁ off₂ c₁ c₂]
  support_eq := by
    rfl
  definite := by
    intro E hE
    simp only [List.mem_singleton] at hE
    cases hE
    exact twoMemberSectionEntry_definite R U₁ U₂ off₁ off₂ c₁ c₂ h₁ h₂

/-- In the two-member section-realized cover, the induced `H⁰_⊤` count is the
single lenticle section-disagreement census. -/
theorem twoMemberSectionRealizedCover_h0top_eq_disagreement_count
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂])
    (R : FiniteSupportRealization)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₂ φ))
    (v : Valuation)
    (hcompat :
      (twoMemberSectionRealizedCover S U₁ U₂ hcov R off₁ off₂ c₁ c₂ h₁ h₂).Compatible v) :
    InconSheaf.H0top v
        (RealizedFiniteSiteCover.pairwiseSupports
          ({ site := S, patches := [U₁, U₂], covers := hcov, realization := R } :
            RealizedFiniteSiteCover Q)).flatten =
      (twoMemberSectionEntry R U₁ U₂ off₁ off₂ c₁ c₂).disagreementCount := by
  have h :=
    SectionRealizedFiniteSiteCover.h0top_eq_disagreement_count
      (twoMemberSectionRealizedCover S U₁ U₂ hcov R off₁ off₂ c₁ c₂ h₁ h₂) v hcompat
  simpa [SectionRealizedFiniteSiteCover.disagreementCount,
    PairwiseSectionDisagreementCount, twoMemberSectionRealizedCover] using h

/-- An overlapping two-cover, together with realized finite support and local
sections, induces the corresponding section-realized finite cover. -/
def overlappingTwoCoverSectionRealizedCover
    {Q : Type} (C : OverlappingTwoCover Q)
    (R : FiniteSupportRealization)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle C.left C.right) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle C.left C.right) → DefiniteCharge (c₂ φ)) :
    SectionRealizedFiniteSiteCover Q :=
  twoMemberSectionRealizedCover C.site C.left C.right C.covers R off₁ off₂ c₁ c₂ h₁ h₂

/-- In the original overlapping two-cover setup, the non-bottom lenticle witness
is retained and the induced `H⁰_⊤` count is exactly the restricted-section
disagreement census on that lenticle. -/
theorem overlappingTwoCoverSection_h0top_eq_disagreement_count
    {Q : Type} (C : OverlappingTwoCover Q)
    (R : FiniteSupportRealization)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle C.left C.right) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle C.left C.right) → DefiniteCharge (c₂ φ))
    (v : Valuation)
    (hcompat :
      (overlappingTwoCoverSectionRealizedCover C R off₁ off₂ c₁ c₂ h₁ h₂).Compatible v) :
    LenticleNonempty C.left C.right ∧
      InconSheaf.H0top v
          (RealizedFiniteSiteCover.pairwiseSupports
            ({ site := C.site, patches := [C.left, C.right], covers := C.covers,
               realization := R } :
              RealizedFiniteSiteCover Q)).flatten =
        (twoMemberSectionEntry R C.left C.right off₁ off₂ c₁ c₂).disagreementCount := by
  constructor
  · exact C.nonempty
  · have h :=
      twoMemberSectionRealizedCover_h0top_eq_disagreement_count C.site C.left C.right
        C.covers R off₁ off₂ c₁ c₂ h₁ h₂ v hcompat
    simpa [overlappingTwoCoverSectionRealizedCover] using h

/-- In the original overlapping two-cover setup, when the realized lenticle is a
single counted locus, `H⁰_⊤` is exactly the entry-level mis-crossing census: one
for a mis-crossing lenticle and zero otherwise. -/
theorem overlappingTwoCoverSection_h0top_eq_miscrossing_count_of_singleton
    {Q : Type} (C : OverlappingTwoCover Q)
    (R : FiniteSupportRealization)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle C.left C.right) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle C.left C.right) → DefiniteCharge (c₂ φ))
    (v : Valuation)
    (hcompat :
      (overlappingTwoCoverSectionRealizedCover C R off₁ off₂ c₁ c₂ h₁ h₂).Compatible v)
    (hsingleton : ∃ φ, R.support (Lenticle C.left C.right) = [φ]) :
    LenticleNonempty C.left C.right ∧
      InconSheaf.H0top v
          (RealizedFiniteSiteCover.pairwiseSupports
            ({ site := C.site, patches := [C.left, C.right], covers := C.covers,
               realization := R } :
              RealizedFiniteSiteCover Q)).flatten =
        PairwiseSectionMiscrossingCount
          (overlappingTwoCoverSectionRealizedCover C R off₁ off₂ c₁ c₂ h₁ h₂).entries := by
  constructor
  · exact C.nonempty
  · have hcover :
        (overlappingTwoCoverSectionRealizedCover C R off₁ off₂ c₁ c₂ h₁ h₂).SingletonSupports := by
      intro E hE
      simp [overlappingTwoCoverSectionRealizedCover, twoMemberSectionRealizedCover] at hE
      cases hE
      exact hsingleton
    have h :=
      SectionRealizedFiniteSiteCover.h0top_eq_miscrossing_count
        (overlappingTwoCoverSectionRealizedCover C R off₁ off₂ c₁ c₂ h₁ h₂)
        v hcompat hcover
    simpa [overlappingTwoCoverSectionRealizedCover, twoMemberSectionRealizedCover,
      SectionRealizedFiniteSiteCover.miscrossingCount] using h

/-- A finite site cover realized by a finite active cell universe and a
Stone-side incidence map.  This is the concrete form of a finite cover whose
lenticle supports are induced rather than supplied as arbitrary lists. -/
structure StoneRealizedFiniteSiteCover (Q : Type) where
  /-- The site object being covered. -/
  site : Site.SiteObj Q
  /-- The finite list of clopen patches. -/
  patches : List Site.Clopen
  /-- The patches cover the site's clopen support. -/
  covers : Site.Covers site.U patches
  /-- The finite active-cell and Stone-side realization. -/
  supportModel : FiniteStoneSupportModel

namespace StoneRealizedFiniteSiteCover

/-- Forget the Stone incidence model down to a realized finite support cover. -/
def toRealizedFiniteSiteCover {Q : Type}
    (C : StoneRealizedFiniteSiteCover Q) : RealizedFiniteSiteCover Q :=
  { site := C.site,
    patches := C.patches,
    covers := C.covers,
    realization := C.supportModel.toFiniteSupportRealization }

/-- The pairwise lenticle supports induced by the Stone realization. -/
def pairwiseSupports {Q : Type}
    (C : StoneRealizedFiniteSiteCover Q) : List (List PredicationCell) :=
  C.toRealizedFiniteSiteCover.pairwiseSupports

/-- For any Stone-realized finite site cover, the pairwise lenticle census is
exactly `H⁰_⊤` on the induced pairwise-overlap support. -/
theorem pairwise_lenticle_census_eq_h0top
    {Q : Type} (C : StoneRealizedFiniteSiteCover Q) (v : Valuation) :
    PairwiseLenticleCensus v C.pairwiseSupports =
      InconSheaf.H0top v C.pairwiseSupports.flatten :=
  RealizedFiniteSiteCover.pairwise_lenticle_census_eq_h0top
    C.toRealizedFiniteSiteCover v

/-- Stone-realized finite covers inherit the explicit inconsistency-count form
of the lenticle census theorem. -/
theorem pairwise_lenticle_census_is_inconsistency_count
    {Q : Type} (C : StoneRealizedFiniteSiteCover Q) (v : Valuation) :
    PairwiseLenticleCensus v C.pairwiseSupports =
      C.pairwiseSupports.flatten.countP (fun φ => Charge.isInconsistency (v φ)) :=
  RealizedFiniteSiteCover.pairwise_lenticle_census_is_inconsistency_count
    C.toRealizedFiniteSiteCover v

/-- Stone-realized finite covers inherit the positive-census/inconsistency-content
equivalence on their flattened pairwise lenticle supports. -/
theorem pairwise_lenticle_census_pos_iff_inconsistencyContent
    {Q : Type} (C : StoneRealizedFiniteSiteCover Q) (v : Valuation) :
    0 < PairwiseLenticleCensus v C.pairwiseSupports ↔
      inconsistencyContent C.pairwiseSupports.flatten v = true :=
  RealizedFiniteSiteCover.pairwise_lenticle_census_pos_iff_inconsistencyContent
    C.toRealizedFiniteSiteCover v

/-- In a two-member Stone-realized finite cover, the extracted pairwise support is
the support of the literal overlap, derived from the finite Stone support model. -/
theorem two_pairwiseSupports
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂]) (M : FiniteStoneSupportModel) :
    (StoneRealizedFiniteSiteCover.pairwiseSupports
      ({ site := S, patches := [U₁, U₂], covers := hcov, supportModel := M } :
        StoneRealizedFiniteSiteCover Q)) =
      [M.support (Lenticle U₁ U₂)] := rfl

/-- In a two-member Stone-realized finite cover, membership in the induced
pairwise support is exactly active membership in both patch clopens. -/
theorem two_lenticle_support_mem_iff
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂]) (M : FiniteStoneSupportModel)
    (φ : PredicationCell) :
    φ ∈ (StoneRealizedFiniteSiteCover.pairwiseSupports
      ({ site := S, patches := [U₁, U₂], covers := hcov, supportModel := M } :
        StoneRealizedFiniteSiteCover Q)).flatten ↔
      M.active φ = true ∧
        Stone.ClopenUp.mem U₁ (M.side φ) = true ∧
          Stone.ClopenUp.mem U₂ (M.side φ) = true := by
  rw [two_pairwiseSupports S U₁ U₂ hcov M]
  constructor
  · intro h
    have hm := (FiniteStoneSupportModel.support_complete M (Lenticle U₁ U₂) φ).1
      (by simpa using h)
    unfold FiniteStoneSupportModel.mask Lenticle Site.meet Stone.ClopenUp.meet at hm
    obtain ⟨u₁p, u₁m⟩ := U₁
    obtain ⟨u₂p, u₂m⟩ := U₂
    cases ha : M.active φ <;> cases hs : M.side φ <;>
      cases u₁p <;> cases u₁m <;> cases u₂p <;> cases u₂m <;>
        simp [Stone.ClopenUp.mem, ha, hs] at hm ⊢
  · intro h
    have hm : FiniteStoneSupportModel.mask M (Lenticle U₁ U₂) φ = true := by
      unfold FiniteStoneSupportModel.mask Lenticle Site.meet Stone.ClopenUp.meet
      obtain ⟨u₁p, u₁m⟩ := U₁
      obtain ⟨u₂p, u₂m⟩ := U₂
      cases ha : M.active φ <;> cases hs : M.side φ <;>
        cases u₁p <;> cases u₁m <;> cases u₂p <;> cases u₂m <;>
          simp [Stone.ClopenUp.mem, ha, hs] at h ⊢
    have hmem := (FiniteStoneSupportModel.support_complete M (Lenticle U₁ U₂) φ).2 hm
    simpa using hmem

end StoneRealizedFiniteSiteCover

/-! ## Refraction/diffraction branch carrier -/

/-- The dynamical branch selected by a lenticle-local charge. -/
inductive LenticleBranch
  | refraction
  | diffraction
  deriving DecidableEq, Repr

namespace LenticleBranch

/-- A local charge selects refraction when defect-free and diffraction when inconsistent. -/
def ofCharge (c : Charge) : LenticleBranch :=
  if Charge.isInconsistency c then .diffraction else .refraction

/-- A finite lenticle support selects refraction when the joined local sections
are defect-free there, and diffraction when they mis-cross somewhere. -/
def ofSections (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge) :
    LenticleBranch :=
  if LenticleMiscrossingSomewhere cells c₁ c₂ then .diffraction else .refraction

/-- The support-level branch is diffraction exactly when the joined sections
mis-cross somewhere on that support. -/
theorem ofSections_diffraction_iff_miscrossing
    (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge) :
    ofSections cells c₁ c₂ = .diffraction ↔
      LenticleMiscrossingSomewhere cells c₁ c₂ = true := by
  unfold ofSections
  cases LenticleMiscrossingSomewhere cells c₁ c₂ <;> simp

/-- The support-level branch is refraction exactly when the joined sections are
defect-free on that support. -/
theorem ofSections_refraction_iff_no_miscrossing
    (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge) :
    ofSections cells c₁ c₂ = .refraction ↔
      LenticleMiscrossingSomewhere cells c₁ c₂ = false := by
  unfold ofSections
  cases LenticleMiscrossingSomewhere cells c₁ c₂ <;> simp

end LenticleBranch

namespace LenticleSectionEntry

/-- The refraction/diffraction branch selected by this lenticle entry. -/
def branch (E : LenticleSectionEntry) : LenticleBranch :=
  LenticleBranch.ofSections E.cells E.left E.right

/-- The entry branch is diffraction exactly when this lenticle entry mis-crosses. -/
theorem branch_diffraction_iff_miscrossing (E : LenticleSectionEntry) :
    E.branch = .diffraction ↔ E.miscrossing = true :=
  LenticleBranch.ofSections_diffraction_iff_miscrossing E.cells E.left E.right

/-- The entry branch is refraction exactly when this lenticle entry is
defect-free on its finite support. -/
theorem branch_refraction_iff_no_miscrossing (E : LenticleSectionEntry) :
    E.branch = .refraction ↔ E.miscrossing = false :=
  LenticleBranch.ofSections_refraction_iff_no_miscrossing E.cells E.left E.right

end LenticleSectionEntry

/-- For definite local sections on a finite support, the branch selector is
diffraction exactly when the sections disagree somewhere. -/
theorem lenticleBranch_ofSections_diffraction_iff_disagreement_on_support
    (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ cells → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ cells → DefiniteCharge (c₂ φ)) :
    LenticleBranch.ofSections cells c₁ c₂ = .diffraction ↔
      LenticleDisagreementSomewhere cells c₁ c₂ = true := by
  constructor
  · intro hbranch
    have hmisc :=
      (LenticleBranch.ofSections_diffraction_iff_miscrossing cells c₁ c₂).1 hbranch
    exact (lenticleSection_miscrossing_somewhere_iff_disagreement_on_support
      cells c₁ c₂ h₁ h₂).1 hmisc
  · intro hdis
    have hmisc :=
      (lenticleSection_miscrossing_somewhere_iff_disagreement_on_support
        cells c₁ c₂ h₁ h₂).2 hdis
    exact (LenticleBranch.ofSections_diffraction_iff_miscrossing cells c₁ c₂).2 hmisc

namespace LenticleSectionEntry

/-- For definite sections, the entry branch is diffraction exactly when the two
restricted sections disagree somewhere on the entry support. -/
theorem branch_diffraction_iff_disagreement
    (E : LenticleSectionEntry) (hdef : E.DefiniteOnSupport) :
    E.branch = .diffraction ↔
      LenticleDisagreementSomewhere E.cells E.left E.right = true :=
  lenticleBranch_ofSections_diffraction_iff_disagreement_on_support
    E.cells E.left E.right hdef.1 hdef.2

/-- For definite sections, the entry branch is refraction exactly when the two
restricted sections do not disagree anywhere on the entry support. -/
theorem branch_refraction_iff_no_disagreement
    (E : LenticleSectionEntry) (hdef : E.DefiniteOnSupport) :
    E.branch = .refraction ↔
      LenticleDisagreementSomewhere E.cells E.left E.right = false := by
  have hiff :=
    lenticleSection_miscrossing_somewhere_iff_disagreement_on_support
      E.cells E.left E.right hdef.1 hdef.2
  unfold branch LenticleBranch.ofSections
  cases hm : LenticleMiscrossingSomewhere E.cells E.left E.right <;>
    cases hd : LenticleDisagreementSomewhere E.cells E.left E.right <;>
      simp [hm, hd] at hiff ⊢

end LenticleSectionEntry

namespace FiniteSupportRealization

/-- For realized restricted sections on a lenticle support, the branch selector is
diffraction exactly when the restricted sections disagree somewhere. -/
theorem restricted_lenticleBranch_diffraction_iff_disagreement
    (R : FiniteSupportRealization) (U₁ U₂ : Site.Clopen)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₂ φ)) :
    LenticleBranch.ofSections (R.support (Lenticle U₁ U₂))
        (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₁ c₁)
        (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₂ c₂) = .diffraction ↔
      LenticleDisagreementSomewhere (R.support (Lenticle U₁ U₂))
        (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₁ c₁)
        (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₂ c₂) = true := by
  apply lenticleBranch_ofSections_diffraction_iff_disagreement_on_support
  · intro φ hφ
    rw [restrictChargeSection_eq_on_lenticleSupport R U₁ U₂ off₁ c₁ hφ]
    exact h₁ φ hφ
  · intro φ hφ
    rw [restrictChargeSection_eq_on_lenticleSupport R U₁ U₂ off₂ c₂ hφ]
    exact h₂ φ hφ

end FiniteSupportRealization

/-- For definite local sections, the diffraction branch is exactly the disagreement branch. -/
theorem lenticleBranch_diffraction_iff_disagreement
    (c₁ c₂ : Charge) (h₁ : DefiniteCharge c₁) (h₂ : DefiniteCharge c₂) :
    LenticleBranch.ofCharge (Charge.joinK c₁ c₂) = .diffraction ↔
      ChargeDisagreement c₁ c₂ := by
  rcases h₁ with rfl | rfl <;> rcases h₂ with rfl | rfl <;>
    simp [LenticleBranch.ofCharge, ChargeDisagreement, Charge.isInconsistency, Charge.joinK,
      Charge.tTop, Charge.tBot, Charge.kTop, Charge.ofSlots, Charge.pos, Charge.neg,
      Articulating.Corner.toStatus, Articulating.Corner.ofStatus]

/-- An obstruction term for recovering absorption along the diffraction branch. -/
structure LenticleObstruction (F : AperiodicOrder.Tiling.Settle.SettleFrame) where
  /-- The additional term inserted after one propagation step. -/
  term : F.carrier → F.carrier
  /-- The obstruction term restores absorption at the settled value. -/
  absorbs : ∀ x, F.settle (term (F.step x)) = F.settle x

/-- Refraction is direct one-step closure-absorption in any `SettleFrame`. -/
theorem lenticle_refraction_absorbs
    (F : AperiodicOrder.Tiling.Settle.SettleFrame) (x : F.carrier) :
    F.settle (F.step x) = F.settle x :=
  F.settle_step x

/-- A bare `SettleFrame` is branch-blind: absorption after one step holds without
knowing whether the lenticle is assigned to refraction or diffraction.  The
stronger claim that diffraction requires an obstruction therefore needs extra
dynamical structure beyond the current `SettleFrame` fields. -/
theorem lenticle_settleFrame_absorbs_independent_of_branch
    (F : AperiodicOrder.Tiling.Settle.SettleFrame) (_branch : LenticleBranch) (x : F.carrier) :
    F.settle (F.step x) = F.settle x :=
  F.settle_step x

/-- Diffraction recovers absorption once an explicit obstruction term is supplied. -/
theorem lenticle_diffraction_absorbs_with_obstruction
    (F : AperiodicOrder.Tiling.Settle.SettleFrame) (O : LenticleObstruction F)
    (x : F.carrier) :
    F.settle (O.term (F.step x)) = F.settle x :=
  O.absorbs x

/-! ## A branch-sensitive chromatic obstruction carrier -/

namespace LenticleChromatic

open AperiodicOrder.Tiling

/-- A chromatic marking together with a pending-obstruction bit. -/
abbrev Marking : Type := (Nat → Bool) × Bool

/-- The ordinary chromatic step preserves whether an obstruction is pending. -/
def step (x : Marking) : Marking :=
  (ChromaticLorentzian.step x.1, x.2)

/-- Settling reads the chromatic past-closure when no obstruction is pending, and
reads the pending obstruction as saturated unresolved support. -/
def settle (x : Marking) : Marking :=
  if x.2 then (fun _ => true, true) else (ChromaticLorentzian.settle x.1, false)

/-- The obstruction-sensitive chromatic lift still satisfies closure-absorption
for the ordinary step. -/
theorem settle_step (x : Marking) : settle (step x) = settle x := by
  rcases x with ⟨f, pending⟩
  cases pending
  · simp [settle, step, ChromaticLorentzian.settle_step]
  · simp [settle, step]

/-- The obstruction-sensitive chromatic settling frame. -/
def frame : AperiodicOrder.Tiling.Settle.SettleFrame where
  carrier := Marking
  step := step
  settle := settle
  settle_step := settle_step

/-- The lifted ordinary step is still non-idempotent on the chromatic marking
component. -/
theorem step_not_idempotent : ∃ x : Marking, step (step x) ≠ step x := by
  refine ⟨(ChromaticLorentzian.mark0, false), ?_⟩
  intro h
  exact ChromaticLorentzian.step_not_idempotent (congrArg Prod.fst h)

/-- Refraction is ordinary propagation through the chromatic step. -/
def refraction (x : Marking) : Marking := step x

/-- Diffraction propagates one chromatic step and records a pending obstruction. -/
def diffraction (x : Marking) : Marking := (ChromaticLorentzian.step x.1, true)

/-- Clearing the obstruction bit is the explicit extra term needed by the lifted
diffraction branch. -/
def clearObstruction (x : Marking) : Marking := (x.1, false)

/-- Refraction absorbs in one step. -/
theorem refraction_absorbs (x : Marking) :
    frame.settle (refraction x) = frame.settle x :=
  settle_step x

/-- Diffraction records the pending obstruction. -/
theorem diffraction_carries_obstruction (x : Marking) :
    (diffraction x).2 = true := rfl

/-- The empty marking witnesses that raw diffraction is not already absorbed in
the obstruction-sensitive carrier. -/
theorem diffraction_not_absorbed_at_empty :
    frame.settle (diffraction (fun _ => false, false)) ≠
      frame.settle (fun _ => false, false) := by
  intro h
  have hp := congrArg Prod.snd h
  simp [frame, settle, diffraction] at hp

/-- Once the obstruction bit is cleared, diffraction recovers the same settled
value as the original unobstructed marking. -/
theorem diffraction_absorbs_after_clear (f : Nat → Bool) :
    frame.settle (clearObstruction (diffraction (f, false))) =
      frame.settle (f, false) := by
  change (ChromaticLorentzian.settle (ChromaticLorentzian.step f), false) =
    (ChromaticLorentzian.settle f, false)
  rw [ChromaticLorentzian.settle_step]

/-- Branch-indexed propagation for the obstruction-sensitive chromatic lift. -/
def propagate : LenticleBranch → Marking → Marking
  | .refraction, x => refraction x
  | .diffraction, x => diffraction x

/-- The refraction branch of branch-indexed propagation is one-step absorbing. -/
theorem propagate_refraction_absorbs (x : Marking) :
    frame.settle (propagate .refraction x) = frame.settle x :=
  refraction_absorbs x

/-- The diffraction branch of branch-indexed propagation carries the obstruction
bit that the refraction branch does not introduce. -/
theorem propagate_diffraction_carries_obstruction (x : Marking) :
    (propagate .diffraction x).2 = true :=
  diffraction_carries_obstruction x

/-- The diffraction branch recovers absorption after the explicit obstruction
clearing term. -/
theorem propagate_diffraction_absorbs_after_clear (f : Nat → Bool) :
    frame.settle (clearObstruction (propagate .diffraction (f, false))) =
      frame.settle (f, false) :=
  diffraction_absorbs_after_clear f

/-- For an initially unobstructed marking, a selected branch has the expected
chromatic behavior: refraction absorbs directly, while diffraction carries an
obstruction and absorbs after that obstruction is cleared. -/
theorem branch_dynamics (branch : LenticleBranch) (f : Nat → Bool) :
    (branch = .refraction →
      frame.settle (propagate branch (f, false)) = frame.settle (f, false))
    ∧
    (branch = .diffraction →
      (propagate branch (f, false)).2 = true ∧
        frame.settle (clearObstruction (propagate branch (f, false))) =
          frame.settle (f, false)) := by
  cases branch
  · constructor
    · intro _
      exact propagate_refraction_absorbs (f, false)
    · intro h
      cases h
  · constructor
    · intro h
      cases h
    · intro _
      exact ⟨propagate_diffraction_carries_obstruction (f, false),
        propagate_diffraction_absorbs_after_clear f⟩

/-- The obstruction-sensitive chromatic lift realizes the dynamical dichotomy:
its settling frame is non-idempotent, refraction is absorbed immediately,
diffraction carries an obstruction, and raw diffraction is not already absorbed
at the empty marking before the obstruction is cleared. -/
theorem frame_dichotomy (f : Nat → Bool) :
    (∃ x : Marking, frame.step (frame.step x) ≠ frame.step x)
    ∧
    frame.settle (propagate .refraction (f, false)) = frame.settle (f, false)
    ∧
    (propagate .diffraction (f, false)).2 = true
    ∧
    frame.settle (clearObstruction (propagate .diffraction (f, false))) =
      frame.settle (f, false)
    ∧
    frame.settle (propagate .diffraction (fun _ => false, false)) ≠
      frame.settle (fun _ => false, false) := by
  exact ⟨step_not_idempotent,
    propagate_refraction_absorbs (f, false),
    propagate_diffraction_carries_obstruction (f, false),
    propagate_diffraction_absorbs_after_clear f,
    by simpa [propagate] using diffraction_not_absorbed_at_empty⟩

/-- The branch selected by a finite lenticle support controls the chromatic
refraction/diffraction dynamics. -/
theorem selected_branch_dynamics
    (cells : List PredicationCell) (c₁ c₂ : PredicationCell → Charge) (f : Nat → Bool) :
    let branch := LenticleBranch.ofSections cells c₁ c₂
    (branch = .refraction →
      frame.settle (propagate branch (f, false)) = frame.settle (f, false))
    ∧
    (branch = .diffraction →
      (propagate branch (f, false)).2 = true ∧
        frame.settle (clearObstruction (propagate branch (f, false))) =
          frame.settle (f, false)) :=
  branch_dynamics (LenticleBranch.ofSections cells c₁ c₂) f

end LenticleChromatic

namespace LenticleSectionEntry

/-- The branch selected by this lenticle entry controls the chromatic
refraction/diffraction dynamics. -/
theorem branch_dynamics (E : LenticleSectionEntry) (f : Nat → Bool) :
    let branch := E.branch
    (branch = .refraction →
      LenticleChromatic.frame.settle (LenticleChromatic.propagate branch (f, false)) =
        LenticleChromatic.frame.settle (f, false))
    ∧
    (branch = .diffraction →
      (LenticleChromatic.propagate branch (f, false)).2 = true ∧
        LenticleChromatic.frame.settle
            (LenticleChromatic.clearObstruction
              (LenticleChromatic.propagate branch (f, false))) =
          LenticleChromatic.frame.settle (f, false)) :=
  LenticleChromatic.branch_dynamics E.branch f

/-- The source transcript's refraction/diffraction branch split is selected by
whether the lenticle entry mis-crosses: defect-free entries absorb directly;
mis-crossing entries carry the diffraction obstruction and absorb after it is
cleared. -/
theorem dynamics_selected_by_miscrossing
    (E : LenticleSectionEntry) (f : Nat → Bool) :
    (E.miscrossing = false →
      LenticleChromatic.frame.settle
          (LenticleChromatic.propagate E.branch (f, false)) =
        LenticleChromatic.frame.settle (f, false))
    ∧
    (E.miscrossing = true →
      (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
        LenticleChromatic.frame.settle
            (LenticleChromatic.clearObstruction
              (LenticleChromatic.propagate E.branch (f, false))) =
          LenticleChromatic.frame.settle (f, false)) := by
  have hdyn := LenticleChromatic.branch_dynamics E.branch f
  constructor
  · intro hfree
    exact hdyn.1 ((E.branch_refraction_iff_no_miscrossing).2 hfree)
  · intro hmisc
    exact hdyn.2 ((E.branch_diffraction_iff_miscrossing).2 hmisc)

/-- For definite sections, the same refraction/diffraction dynamics are selected
by the disagreement condition from the local lenticle theorem. -/
theorem dynamics_selected_by_disagreement
    (E : LenticleSectionEntry) (hdef : E.DefiniteOnSupport) (f : Nat → Bool) :
    (LenticleDisagreementSomewhere E.cells E.left E.right = false →
      LenticleChromatic.frame.settle
          (LenticleChromatic.propagate E.branch (f, false)) =
        LenticleChromatic.frame.settle (f, false))
    ∧
    (LenticleDisagreementSomewhere E.cells E.left E.right = true →
      (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
        LenticleChromatic.frame.settle
            (LenticleChromatic.clearObstruction
              (LenticleChromatic.propagate E.branch (f, false))) =
          LenticleChromatic.frame.settle (f, false)) := by
  have hdyn := LenticleChromatic.branch_dynamics E.branch f
  constructor
  · intro hfree
    exact hdyn.1 ((E.branch_refraction_iff_no_disagreement hdef).2 hfree)
  · intro hdis
    exact hdyn.2 ((E.branch_diffraction_iff_disagreement hdef).2 hdis)

/-- The full chromatic dichotomy, selected at this lenticle entry by the local
disagreement condition.  This packages the non-idempotent settling frame witness
with the branch law: no disagreement selects direct refraction absorption, while
disagreement selects diffraction with a carried obstruction and recovery after
clearing that obstruction. -/
theorem chromatic_dichotomy_selected_by_disagreement
    (E : LenticleSectionEntry) (hdef : E.DefiniteOnSupport) (f : Nat → Bool) :
    (∃ x : LenticleChromatic.Marking,
      LenticleChromatic.frame.step (LenticleChromatic.frame.step x) ≠
        LenticleChromatic.frame.step x)
    ∧
    (LenticleDisagreementSomewhere E.cells E.left E.right = false →
      LenticleChromatic.frame.settle
          (LenticleChromatic.propagate E.branch (f, false)) =
        LenticleChromatic.frame.settle (f, false))
    ∧
    (LenticleDisagreementSomewhere E.cells E.left E.right = true →
      (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
        LenticleChromatic.frame.settle
            (LenticleChromatic.clearObstruction
              (LenticleChromatic.propagate E.branch (f, false))) =
          LenticleChromatic.frame.settle (f, false))
    ∧
    LenticleChromatic.frame.settle
        (LenticleChromatic.propagate .diffraction (fun _ => false, false)) ≠
      LenticleChromatic.frame.settle (fun _ => false, false) := by
  have hframe := LenticleChromatic.frame_dichotomy f
  have hselected := E.dynamics_selected_by_disagreement hdef f
  exact ⟨hframe.1, hselected.1, hselected.2, hframe.2.2.2.2⟩

end LenticleSectionEntry

namespace SectionRealizedFiniteSiteCover

/-- Every pairwise lenticle entry carried by a section-realized cover has its
chromatic branch selected by its local section-disagreement condition. -/
theorem entry_dynamics_selected_by_disagreement
    {Q : Type} (C : SectionRealizedFiniteSiteCover Q)
    {E : LenticleSectionEntry} (hE : E ∈ C.entries) (f : Nat → Bool) :
    (LenticleDisagreementSomewhere E.cells E.left E.right = false →
      LenticleChromatic.frame.settle
          (LenticleChromatic.propagate E.branch (f, false)) =
        LenticleChromatic.frame.settle (f, false))
    ∧
    (LenticleDisagreementSomewhere E.cells E.left E.right = true →
      (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
        LenticleChromatic.frame.settle
            (LenticleChromatic.clearObstruction
              (LenticleChromatic.propagate E.branch (f, false))) =
          LenticleChromatic.frame.settle (f, false)) :=
  E.dynamics_selected_by_disagreement (C.definite E hE) f

/-- Every pairwise lenticle entry carried by a section-realized cover also
inherits the full non-idempotent chromatic dichotomy package selected by its
local section-disagreement condition. -/
theorem entry_chromatic_dichotomy_selected_by_disagreement
    {Q : Type} (C : SectionRealizedFiniteSiteCover Q)
    {E : LenticleSectionEntry} (hE : E ∈ C.entries) (f : Nat → Bool) :
    (∃ x : LenticleChromatic.Marking,
      LenticleChromatic.frame.step (LenticleChromatic.frame.step x) ≠
        LenticleChromatic.frame.step x)
    ∧
    (LenticleDisagreementSomewhere E.cells E.left E.right = false →
      LenticleChromatic.frame.settle
          (LenticleChromatic.propagate E.branch (f, false)) =
        LenticleChromatic.frame.settle (f, false))
    ∧
    (LenticleDisagreementSomewhere E.cells E.left E.right = true →
      (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
        LenticleChromatic.frame.settle
            (LenticleChromatic.clearObstruction
              (LenticleChromatic.propagate E.branch (f, false))) =
          LenticleChromatic.frame.settle (f, false))
    ∧
    LenticleChromatic.frame.settle
        (LenticleChromatic.propagate .diffraction (fun _ => false, false)) ≠
      LenticleChromatic.frame.settle (fun _ => false, false) :=
  E.chromatic_dichotomy_selected_by_disagreement (C.definite E hE) f

end SectionRealizedFiniteSiteCover

namespace FiniteCoverLenticleCensusRealization

/-- Every pairwise lenticle entry carried by a finite-cover census realization
has its chromatic branch selected by its local section-disagreement condition. -/
theorem entry_dynamics_selected_by_disagreement
    {Q : Type} (D : FiniteCoverLenticleCensusRealization Q)
    {E : LenticleSectionEntry} (hE : E ∈ D.cover.entries) (f : Nat → Bool) :
    (LenticleDisagreementSomewhere E.cells E.left E.right = false →
      LenticleChromatic.frame.settle
          (LenticleChromatic.propagate E.branch (f, false)) =
        LenticleChromatic.frame.settle (f, false))
    ∧
    (LenticleDisagreementSomewhere E.cells E.left E.right = true →
      (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
        LenticleChromatic.frame.settle
            (LenticleChromatic.clearObstruction
              (LenticleChromatic.propagate E.branch (f, false))) =
          LenticleChromatic.frame.settle (f, false)) :=
  SectionRealizedFiniteSiteCover.entry_dynamics_selected_by_disagreement D.cover hE f

/-- Every pairwise lenticle entry carried by a finite-cover census realization
inherits the full non-idempotent chromatic dichotomy package selected by its
local section-disagreement condition. -/
theorem entry_chromatic_dichotomy_selected_by_disagreement
    {Q : Type} (D : FiniteCoverLenticleCensusRealization Q)
    {E : LenticleSectionEntry} (hE : E ∈ D.cover.entries) (f : Nat → Bool) :
    (∃ x : LenticleChromatic.Marking,
      LenticleChromatic.frame.step (LenticleChromatic.frame.step x) ≠
        LenticleChromatic.frame.step x)
    ∧
    (LenticleDisagreementSomewhere E.cells E.left E.right = false →
      LenticleChromatic.frame.settle
          (LenticleChromatic.propagate E.branch (f, false)) =
        LenticleChromatic.frame.settle (f, false))
    ∧
    (LenticleDisagreementSomewhere E.cells E.left E.right = true →
      (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
        LenticleChromatic.frame.settle
            (LenticleChromatic.clearObstruction
              (LenticleChromatic.propagate E.branch (f, false))) =
          LenticleChromatic.frame.settle (f, false))
    ∧
    LenticleChromatic.frame.settle
        (LenticleChromatic.propagate .diffraction (fun _ => false, false)) ≠
      LenticleChromatic.frame.settle (fun _ => false, false) :=
  SectionRealizedFiniteSiteCover.entry_chromatic_dichotomy_selected_by_disagreement
    D.cover hE f

end FiniteCoverLenticleCensusRealization

/-! ## Bundled realized two-member carrier -/

/-- For a two-member realized finite cover, the formal carriers of the lenticle
identification line up: the restricted-section branch is diffraction exactly at
lenticle disagreement, the pairwise lenticle census is the `H⁰_⊤` count on the
induced support, and the selected branch drives the chromatic
refraction/diffraction dynamics. -/
theorem realized_twoMember_lenticle_carrier
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂])
    (R : FiniteSupportRealization)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle U₁ U₂) → DefiniteCharge (c₂ φ))
    (v : Valuation) (f : Nat → Bool) :
    let rc₁ := RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₁ c₁
    let rc₂ := RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₂ c₂
    let cells := R.support (Lenticle U₁ U₂)
    let branch := LenticleBranch.ofSections cells rc₁ rc₂
    (branch = .diffraction ↔ LenticleDisagreementSomewhere cells rc₁ rc₂ = true)
      ∧
    PairwiseLenticleCensus v
        (RealizedFiniteSiteCover.pairwiseSupports
          ({ site := S, patches := [U₁, U₂], covers := hcov, realization := R } :
            RealizedFiniteSiteCover Q)) =
      InconSheaf.H0top v
        (RealizedFiniteSiteCover.pairwiseSupports
          ({ site := S, patches := [U₁, U₂], covers := hcov, realization := R } :
            RealizedFiniteSiteCover Q)).flatten
      ∧
    ((branch = .refraction →
        LenticleChromatic.frame.settle (LenticleChromatic.propagate branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (branch = .diffraction →
        (LenticleChromatic.propagate branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))) := by
  dsimp
  constructor
  · exact FiniteSupportRealization.restricted_lenticleBranch_diffraction_iff_disagreement
      R U₁ U₂ off₁ off₂ c₁ c₂ h₁ h₂
  · constructor
    · exact RealizedFiniteSiteCover.pairwise_lenticle_census_eq_h0top
        ({ site := S, patches := [U₁, U₂], covers := hcov, realization := R } :
          RealizedFiniteSiteCover Q) v
    · exact LenticleChromatic.selected_branch_dynamics
        (R.support (Lenticle U₁ U₂))
        (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₁ c₁)
        (RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₂ c₂) f

/-- The bundled two-member carrier specialized to a finite Stone-side support
model, so the clopen masks and lenticle support are derived from a finite cell
universe plus `PredicationCell → FourDual` incidence data. -/
theorem stoneSupport_twoMember_lenticle_carrier
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂])
    (M : FiniteStoneSupportModel)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ :
      ∀ φ, φ ∈ M.support (Lenticle U₁ U₂) → DefiniteCharge (c₁ φ))
    (h₂ :
      ∀ φ, φ ∈ M.support (Lenticle U₁ U₂) → DefiniteCharge (c₂ φ))
    (v : Valuation) (f : Nat → Bool) :
    let R := M.toFiniteSupportRealization
    let rc₁ := RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₁ c₁
    let rc₂ := RestrictChargeSection (R.mask (Lenticle U₁ U₂)) off₂ c₂
    let cells := R.support (Lenticle U₁ U₂)
    let branch := LenticleBranch.ofSections cells rc₁ rc₂
    (branch = .diffraction ↔ LenticleDisagreementSomewhere cells rc₁ rc₂ = true)
      ∧
    PairwiseLenticleCensus v
        (RealizedFiniteSiteCover.pairwiseSupports
          ({ site := S, patches := [U₁, U₂], covers := hcov, realization := R } :
            RealizedFiniteSiteCover Q)) =
      InconSheaf.H0top v
        (RealizedFiniteSiteCover.pairwiseSupports
          ({ site := S, patches := [U₁, U₂], covers := hcov, realization := R } :
            RealizedFiniteSiteCover Q)).flatten
      ∧
    ((branch = .refraction →
        LenticleChromatic.frame.settle (LenticleChromatic.propagate branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (branch = .diffraction →
        (LenticleChromatic.propagate branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))) := by
  dsimp
  exact realized_twoMember_lenticle_carrier S U₁ U₂ hcov M.toFiniteSupportRealization
    off₁ off₂ c₁ c₂ h₁ h₂ v f

/-- The bundled carrier for the original overlapping two-cover setup, still
requiring an explicit finite support realization for the charge sections.  The
first component keeps the non-bottom lenticle hypothesis visible; the remaining
components are the realized local/global/dynamical carrier. -/
theorem realized_overlappingTwoCover_lenticle_carrier
    {Q : Type} (C : OverlappingTwoCover Q)
    (R : FiniteSupportRealization)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle C.left C.right) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle C.left C.right) → DefiniteCharge (c₂ φ))
    (v : Valuation) (f : Nat → Bool) :
    LenticleNonempty C.left C.right ∧
    let rc₁ := RestrictChargeSection (R.mask (Lenticle C.left C.right)) off₁ c₁
    let rc₂ := RestrictChargeSection (R.mask (Lenticle C.left C.right)) off₂ c₂
    let cells := R.support (Lenticle C.left C.right)
    let branch := LenticleBranch.ofSections cells rc₁ rc₂
    (branch = .diffraction ↔ LenticleDisagreementSomewhere cells rc₁ rc₂ = true)
      ∧
    PairwiseLenticleCensus v
        (RealizedFiniteSiteCover.pairwiseSupports
          ({ site := C.site, patches := [C.left, C.right], covers := C.covers,
             realization := R } :
            RealizedFiniteSiteCover Q)) =
      InconSheaf.H0top v
        (RealizedFiniteSiteCover.pairwiseSupports
          ({ site := C.site, patches := [C.left, C.right], covers := C.covers,
             realization := R } :
            RealizedFiniteSiteCover Q)).flatten
      ∧
    ((branch = .refraction →
        LenticleChromatic.frame.settle (LenticleChromatic.propagate branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (branch = .diffraction →
        (LenticleChromatic.propagate branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))) := by
  constructor
  · exact C.nonempty
  · exact realized_twoMember_lenticle_carrier C.site C.left C.right C.covers R
      off₁ off₂ c₁ c₂ h₁ h₂ v f

/-- The overlapping two-cover carrier specialized to the finite Stone-side
support model.  This keeps the original non-bottom-overlap setup while deriving
the support masks from a finite active-cell universe and Stone incidence map. -/
theorem stoneSupport_overlappingTwoCover_lenticle_carrier
    {Q : Type} (C : OverlappingTwoCover Q)
    (M : FiniteStoneSupportModel)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ :
      ∀ φ, φ ∈ M.support (Lenticle C.left C.right) → DefiniteCharge (c₁ φ))
    (h₂ :
      ∀ φ, φ ∈ M.support (Lenticle C.left C.right) → DefiniteCharge (c₂ φ))
    (v : Valuation) (f : Nat → Bool) :
    LenticleNonempty C.left C.right ∧
    let R := M.toFiniteSupportRealization
    let rc₁ := RestrictChargeSection (R.mask (Lenticle C.left C.right)) off₁ c₁
    let rc₂ := RestrictChargeSection (R.mask (Lenticle C.left C.right)) off₂ c₂
    let cells := R.support (Lenticle C.left C.right)
    let branch := LenticleBranch.ofSections cells rc₁ rc₂
    (branch = .diffraction ↔ LenticleDisagreementSomewhere cells rc₁ rc₂ = true)
      ∧
    PairwiseLenticleCensus v
        (RealizedFiniteSiteCover.pairwiseSupports
          ({ site := C.site, patches := [C.left, C.right], covers := C.covers,
             realization := R } :
            RealizedFiniteSiteCover Q)) =
      InconSheaf.H0top v
        (RealizedFiniteSiteCover.pairwiseSupports
          ({ site := C.site, patches := [C.left, C.right], covers := C.covers,
             realization := R } :
            RealizedFiniteSiteCover Q)).flatten
      ∧
    ((branch = .refraction →
        LenticleChromatic.frame.settle (LenticleChromatic.propagate branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (branch = .diffraction →
        (LenticleChromatic.propagate branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))) := by
  constructor
  · exact C.nonempty
  · exact stoneSupport_twoMember_lenticle_carrier C.site C.left C.right C.covers M
      off₁ off₂ c₁ c₂ h₁ h₂ v f

/-- A named realization object for the conditional Lenticle Identification
carrier.  This is the formal meaning, at the current frontier, of a two-member
overlapping cover "realizing" the lenticle statement: finite support, restricted
local sections, a compatible induced valuation, and singleton lenticle support
are explicit data. -/
structure LenticleIdentificationRealization {Q : Type} (C : OverlappingTwoCover Q) where
  /-- The finite support realization used to restrict clopen supports. -/
  realization : FiniteSupportRealization
  /-- Off-support value used to totalize the left restricted section. -/
  offLeft : Charge
  /-- Off-support value used to totalize the right restricted section. -/
  offRight : Charge
  /-- The left local charge-valued section before restriction to the lenticle. -/
  leftSection : PredicationCell → Charge
  /-- The right local charge-valued section before restriction to the lenticle. -/
  rightSection : PredicationCell → Charge
  /-- The left section is definite on the realized lenticle support. -/
  definite_left :
    ∀ φ, φ ∈ realization.support (Lenticle C.left C.right) →
      DefiniteCharge (leftSection φ)
  /-- The right section is definite on the realized lenticle support. -/
  definite_right :
    ∀ φ, φ ∈ realization.support (Lenticle C.left C.right) →
      DefiniteCharge (rightSection φ)
  /-- The valuation induced by the joined restricted sections. -/
  valuation : Valuation
  /-- The induced valuation is compatible with the section-realized cover. -/
  compatible :
    (overlappingTwoCoverSectionRealizedCover C realization offLeft offRight
      leftSection rightSection definite_left definite_right).Compatible valuation
  /-- The realized lenticle is a single counted locus. -/
  singleton_support : ∃ φ, realization.support (Lenticle C.left C.right) = [φ]

namespace LenticleIdentificationRealization

/-- The two-member lenticle entry carried by a realization. -/
def entry {Q : Type} {C : OverlappingTwoCover Q}
    (D : LenticleIdentificationRealization C) : LenticleSectionEntry :=
  twoMemberSectionEntry D.realization C.left C.right D.offLeft D.offRight
    D.leftSection D.rightSection

/-- The section-realized cover carried by a realization. -/
def sectionCover {Q : Type} {C : OverlappingTwoCover Q}
    (D : LenticleIdentificationRealization C) : SectionRealizedFiniteSiteCover Q :=
  overlappingTwoCoverSectionRealizedCover C D.realization D.offLeft D.offRight
    D.leftSection D.rightSection D.definite_left D.definite_right

end LenticleIdentificationRealization

/-- Conditional carrier for the Lenticle Identification conjecture.  It does not
claim that a bare finite `SiteObj` automatically supplies the needed realization
data; instead it records the exact statement that holds once an overlapping
two-cover is equipped with a finite support realization, restricted sections, a
compatible induced valuation, and singleton lenticle support. -/
theorem overlappingTwoCover_lenticleIdentification_conditional_carrier
    {Q : Type} (C : OverlappingTwoCover Q)
    (R : FiniteSupportRealization)
    (off₁ off₂ : Charge) (c₁ c₂ : PredicationCell → Charge)
    (h₁ : ∀ φ, φ ∈ R.support (Lenticle C.left C.right) → DefiniteCharge (c₁ φ))
    (h₂ : ∀ φ, φ ∈ R.support (Lenticle C.left C.right) → DefiniteCharge (c₂ φ))
    (v : Valuation)
    (hcompat :
      (overlappingTwoCoverSectionRealizedCover C R off₁ off₂ c₁ c₂ h₁ h₂).Compatible v)
    (hsingleton : ∃ φ, R.support (Lenticle C.left C.right) = [φ])
    (f : Nat → Bool) :
    Lenticle C.left C.right = Site.meet C.left C.right ∧
    LenticleNonempty C.left C.right ∧
    let E := twoMemberSectionEntry R C.left C.right off₁ off₂ c₁ c₂
    let SC := overlappingTwoCoverSectionRealizedCover C R off₁ off₂ c₁ c₂ h₁ h₂
    (E.left =
        FiberPullbackChargeSection R (lenticleToLeftFiberHom C.site C.left C.right) off₁ c₁
      ∧
      E.right =
        FiberPullbackChargeSection R (lenticleToRightFiberHom C.site C.left C.right) off₂ c₂)
      ∧
    (E.branch = .diffraction ↔
      LenticleDisagreementSomewhere E.cells E.left E.right = true)
      ∧
    InconSheaf.H0top v SC.cover.pairwiseSupports.flatten =
      PairwiseSectionMiscrossingCount SC.entries
      ∧
    ((LenticleDisagreementSomewhere E.cells E.left E.right = false →
        LenticleChromatic.frame.settle
            (LenticleChromatic.propagate E.branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (LenticleDisagreementSomewhere E.cells E.left E.right = true →
        (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate E.branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))) := by
  constructor
  · rfl
  · constructor
    · exact C.nonempty
    · dsimp
      have hdefE :
          (twoMemberSectionEntry R C.left C.right off₁ off₂ c₁ c₂).DefiniteOnSupport :=
        twoMemberSectionEntry_definite R C.left C.right off₁ off₂ c₁ c₂ h₁ h₂
      constructor
      · exact ⟨rfl, rfl⟩
      · constructor
        · exact (twoMemberSectionEntry R C.left C.right off₁ off₂ c₁ c₂)
            |>.branch_diffraction_iff_disagreement hdefE
        · constructor
          · have hglobal :=
              (overlappingTwoCoverSection_h0top_eq_miscrossing_count_of_singleton
                C R off₁ off₂ c₁ c₂ h₁ h₂ v hcompat hsingleton).2
            simpa [overlappingTwoCoverSectionRealizedCover, twoMemberSectionRealizedCover] using
              hglobal
          · exact (twoMemberSectionEntry R C.left C.right off₁ off₂ c₁ c₂)
              |>.dynamics_selected_by_disagreement hdefE f

/-- The conditional Lenticle Identification carrier read from a named
realization object.  This is the compact API for the theorem above: once the
realization data are supplied, the local, global, pullback, and dynamical parts
are available together. -/
theorem LenticleIdentificationRealization.conditional_carrier
    {Q : Type} {C : OverlappingTwoCover Q}
    (D : LenticleIdentificationRealization C) (f : Nat → Bool) :
    Lenticle C.left C.right = Site.meet C.left C.right ∧
    LenticleNonempty C.left C.right ∧
    let E := D.entry
    let SC := D.sectionCover
    (E.left =
        FiberPullbackChargeSection D.realization
          (lenticleToLeftFiberHom C.site C.left C.right) D.offLeft D.leftSection
      ∧
      E.right =
        FiberPullbackChargeSection D.realization
          (lenticleToRightFiberHom C.site C.left C.right) D.offRight D.rightSection)
      ∧
    (E.branch = .diffraction ↔
      LenticleDisagreementSomewhere E.cells E.left E.right = true)
      ∧
    InconSheaf.H0top D.valuation SC.cover.pairwiseSupports.flatten =
      PairwiseSectionMiscrossingCount SC.entries
      ∧
    ((LenticleDisagreementSomewhere E.cells E.left E.right = false →
        LenticleChromatic.frame.settle
            (LenticleChromatic.propagate E.branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (LenticleDisagreementSomewhere E.cells E.left E.right = true →
        (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate E.branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))) := by
  simpa [LenticleIdentificationRealization.entry,
    LenticleIdentificationRealization.sectionCover] using
    overlappingTwoCover_lenticleIdentification_conditional_carrier
      C D.realization D.offLeft D.offRight D.leftSection D.rightSection
      D.definite_left D.definite_right D.valuation D.compatible D.singleton_support f

/-! ## Raw two-member site-cover realization -/

/-- A named realization object for the raw `SiteObj` two-cover setup.  This is
the same realization data as `LenticleIdentificationRealization`, but indexed
directly by the site object, the two clopen patches, and the cover witness from
the conjecture statement. -/
structure SiteLenticleIdentificationRealization
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂]) where
  /-- The lenticle is a non-bottom overlap. -/
  nonempty : LenticleNonempty U₁ U₂
  /-- The finite support realization used to restrict clopen supports. -/
  realization : FiniteSupportRealization
  /-- Off-support value used to totalize the left restricted section. -/
  offLeft : Charge
  /-- Off-support value used to totalize the right restricted section. -/
  offRight : Charge
  /-- The left local charge-valued section before restriction to the lenticle. -/
  leftSection : PredicationCell → Charge
  /-- The right local charge-valued section before restriction to the lenticle. -/
  rightSection : PredicationCell → Charge
  /-- The left section is definite on the realized lenticle support. -/
  definite_left :
    ∀ φ, φ ∈ realization.support (Lenticle U₁ U₂) → DefiniteCharge (leftSection φ)
  /-- The right section is definite on the realized lenticle support. -/
  definite_right :
    ∀ φ, φ ∈ realization.support (Lenticle U₁ U₂) → DefiniteCharge (rightSection φ)
  /-- The valuation induced by the joined restricted sections. -/
  valuation : Valuation
  /-- The induced valuation is compatible with the raw two-member section cover. -/
  compatible :
    (twoMemberSectionRealizedCover S U₁ U₂ hcov realization offLeft offRight
      leftSection rightSection definite_left definite_right).Compatible valuation
  /-- The realized lenticle is a single counted locus. -/
  singleton_support : ∃ φ, realization.support (Lenticle U₁ U₂) = [φ]

namespace SiteLenticleIdentificationRealization

/-- The overlapping-cover wrapper determined by a raw site-cover realization. -/
def toOverlappingTwoCover
    {Q : Type} {S : Site.SiteObj Q} {U₁ U₂ : Site.Clopen}
    {hcov : Site.Covers S.U [U₁, U₂]}
    (D : SiteLenticleIdentificationRealization S U₁ U₂ hcov) :
    OverlappingTwoCover Q where
  site := S
  left := U₁
  right := U₂
  covers := hcov
  nonempty := D.nonempty

/-- The single lenticle entry carried by a raw site-cover realization. -/
def entry
    {Q : Type} {S : Site.SiteObj Q} {U₁ U₂ : Site.Clopen}
    {hcov : Site.Covers S.U [U₁, U₂]}
    (D : SiteLenticleIdentificationRealization S U₁ U₂ hcov) :
    LenticleSectionEntry :=
  twoMemberSectionEntry D.realization U₁ U₂ D.offLeft D.offRight
    D.leftSection D.rightSection

/-- The section-realized cover carried by a raw site-cover realization. -/
def sectionCover
    {Q : Type} {S : Site.SiteObj Q} {U₁ U₂ : Site.Clopen}
    {hcov : Site.Covers S.U [U₁, U₂]}
    (D : SiteLenticleIdentificationRealization S U₁ U₂ hcov) :
    SectionRealizedFiniteSiteCover Q :=
  twoMemberSectionRealizedCover S U₁ U₂ hcov D.realization D.offLeft D.offRight
    D.leftSection D.rightSection D.definite_left D.definite_right

/-- The conditional Lenticle Identification carrier read directly from the raw
`SiteObj` two-cover setup.  This is the formal bridge from the conjecture's
parameters to the local/global/dynamical carrier; the realization fields
remain explicit because they are not data of `SiteObj` itself. -/
theorem conditional_carrier
    {Q : Type} {S : Site.SiteObj Q} {U₁ U₂ : Site.Clopen}
    {hcov : Site.Covers S.U [U₁, U₂]}
    (D : SiteLenticleIdentificationRealization S U₁ U₂ hcov) (f : Nat → Bool) :
    Lenticle U₁ U₂ = Site.meet U₁ U₂ ∧
    LenticleNonempty U₁ U₂ ∧
    let E := D.entry
    let SC := D.sectionCover
    (E.left =
        FiberPullbackChargeSection D.realization
          (lenticleToLeftFiberHom S U₁ U₂) D.offLeft D.leftSection
      ∧
      E.right =
        FiberPullbackChargeSection D.realization
          (lenticleToRightFiberHom S U₁ U₂) D.offRight D.rightSection)
      ∧
    (E.branch = .diffraction ↔
      LenticleDisagreementSomewhere E.cells E.left E.right = true)
      ∧
    InconSheaf.H0top D.valuation SC.cover.pairwiseSupports.flatten =
      PairwiseSectionMiscrossingCount SC.entries
      ∧
    ((LenticleDisagreementSomewhere E.cells E.left E.right = false →
        LenticleChromatic.frame.settle
            (LenticleChromatic.propagate E.branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (LenticleDisagreementSomewhere E.cells E.left E.right = true →
        (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate E.branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))) := by
  constructor
  · rfl
  · constructor
    · exact D.nonempty
    · dsimp [entry, sectionCover]
      have hdefE :
          (twoMemberSectionEntry D.realization U₁ U₂ D.offLeft D.offRight
            D.leftSection D.rightSection).DefiniteOnSupport :=
        twoMemberSectionEntry_definite D.realization U₁ U₂ D.offLeft D.offRight
          D.leftSection D.rightSection D.definite_left D.definite_right
      constructor
      · exact ⟨rfl, rfl⟩
      · constructor
        · exact (twoMemberSectionEntry D.realization U₁ U₂ D.offLeft D.offRight
            D.leftSection D.rightSection).branch_diffraction_iff_disagreement hdefE
        · constructor
          · have hcover :
                (twoMemberSectionRealizedCover S U₁ U₂ hcov D.realization
                  D.offLeft D.offRight D.leftSection D.rightSection
                  D.definite_left D.definite_right).SingletonSupports := by
              intro E hE
              simp [twoMemberSectionRealizedCover] at hE
              cases hE
              exact D.singleton_support
            have hglobal :=
              SectionRealizedFiniteSiteCover.h0top_eq_miscrossing_count
                (twoMemberSectionRealizedCover S U₁ U₂ hcov D.realization
                  D.offLeft D.offRight D.leftSection D.rightSection
                  D.definite_left D.definite_right)
                D.valuation D.compatible hcover
            simpa [SectionRealizedFiniteSiteCover.miscrossingCount] using hglobal
          · exact (twoMemberSectionEntry D.realization U₁ U₂ D.offLeft D.offRight
              D.leftSection D.rightSection).dynamics_selected_by_disagreement hdefE f

/-- Strengthened conditional carrier for the raw `SiteObj` two-cover setup.
Compared with `conditional_carrier`, this exposes the global statement directly
as the inconsistency-cell count supplied by `InconSheaf.h0top_is_inconsistency_count`
and packages the full non-idempotent chromatic refraction/diffraction dichotomy
selected by the local disagreement condition. -/
theorem strengthened_conditional_carrier
    {Q : Type} {S : Site.SiteObj Q} {U₁ U₂ : Site.Clopen}
    {hcov : Site.Covers S.U [U₁, U₂]}
    (D : SiteLenticleIdentificationRealization S U₁ U₂ hcov) (f : Nat → Bool) :
    Lenticle U₁ U₂ = Site.meet U₁ U₂ ∧
    LenticleNonempty U₁ U₂ ∧
    let E := D.entry
    let SC := D.sectionCover
    (E.left =
        FiberPullbackChargeSection D.realization
          (lenticleToLeftFiberHom S U₁ U₂) D.offLeft D.leftSection
      ∧
      E.right =
        FiberPullbackChargeSection D.realization
          (lenticleToRightFiberHom S U₁ U₂) D.offRight D.rightSection)
      ∧
    (E.branch = .diffraction ↔
      LenticleDisagreementSomewhere E.cells E.left E.right = true)
      ∧
    PairwiseSectionMiscrossingCount SC.entries =
      SC.cover.pairwiseSupports.flatten.countP
        (fun φ => Charge.isInconsistency (D.valuation φ))
      ∧
    (0 < PairwiseSectionMiscrossingCount SC.entries ↔
      inconsistencyContent SC.cover.pairwiseSupports.flatten D.valuation = true)
      ∧
    ((∃ x : LenticleChromatic.Marking,
        LenticleChromatic.frame.step (LenticleChromatic.frame.step x) ≠
          LenticleChromatic.frame.step x)
      ∧
      (LenticleDisagreementSomewhere E.cells E.left E.right = false →
        LenticleChromatic.frame.settle
            (LenticleChromatic.propagate E.branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (LenticleDisagreementSomewhere E.cells E.left E.right = true →
        (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate E.branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))
      ∧
      LenticleChromatic.frame.settle
          (LenticleChromatic.propagate .diffraction (fun _ => false, false)) ≠
        LenticleChromatic.frame.settle (fun _ => false, false)) := by
  constructor
  · rfl
  · constructor
    · exact D.nonempty
    · dsimp [entry, sectionCover]
      have hdefE :
          (twoMemberSectionEntry D.realization U₁ U₂ D.offLeft D.offRight
            D.leftSection D.rightSection).DefiniteOnSupport :=
        twoMemberSectionEntry_definite D.realization U₁ U₂ D.offLeft D.offRight
          D.leftSection D.rightSection D.definite_left D.definite_right
      have hcover :
          (twoMemberSectionRealizedCover S U₁ U₂ hcov D.realization
            D.offLeft D.offRight D.leftSection D.rightSection
            D.definite_left D.definite_right).SingletonSupports := by
        intro E hE
        simp [twoMemberSectionRealizedCover] at hE
        cases hE
        exact D.singleton_support
      constructor
      · exact ⟨rfl, rfl⟩
      · constructor
        · exact (twoMemberSectionEntry D.realization U₁ U₂ D.offLeft D.offRight
            D.leftSection D.rightSection).branch_diffraction_iff_disagreement hdefE
        · constructor
          · simpa [SectionRealizedFiniteSiteCover.miscrossingCount] using
              SectionRealizedFiniteSiteCover.miscrossingCount_is_inconsistency_count
                (twoMemberSectionRealizedCover S U₁ U₂ hcov D.realization
                  D.offLeft D.offRight D.leftSection D.rightSection
                  D.definite_left D.definite_right)
                D.valuation D.compatible hcover
          · constructor
            · simpa [SectionRealizedFiniteSiteCover.miscrossingCount] using
                SectionRealizedFiniteSiteCover.miscrossingCount_pos_iff_inconsistencyContent
                  (twoMemberSectionRealizedCover S U₁ U₂ hcov D.realization
                    D.offLeft D.offRight D.leftSection D.rightSection
                    D.definite_left D.definite_right)
                  D.valuation D.compatible hcover
            · exact (twoMemberSectionEntry D.realization U₁ U₂ D.offLeft D.offRight
                D.leftSection D.rightSection).chromatic_dichotomy_selected_by_disagreement
                  hdefE f

end SiteLenticleIdentificationRealization

/-- Strengthened conditional carrier read from the named overlapping two-cover
realization object.  This is the same stronger statement as the raw `SiteObj`
carrier, transported through the overlapping-cover wrapper. -/
theorem LenticleIdentificationRealization.strengthened_conditional_carrier
    {Q : Type} {C : OverlappingTwoCover Q}
    (D : LenticleIdentificationRealization C) (f : Nat → Bool) :
    Lenticle C.left C.right = Site.meet C.left C.right ∧
    LenticleNonempty C.left C.right ∧
    let E := D.entry
    let SC := D.sectionCover
    (E.left =
        FiberPullbackChargeSection D.realization
          (lenticleToLeftFiberHom C.site C.left C.right) D.offLeft D.leftSection
      ∧
      E.right =
        FiberPullbackChargeSection D.realization
          (lenticleToRightFiberHom C.site C.left C.right) D.offRight D.rightSection)
      ∧
    (E.branch = .diffraction ↔
      LenticleDisagreementSomewhere E.cells E.left E.right = true)
      ∧
    PairwiseSectionMiscrossingCount SC.entries =
      SC.cover.pairwiseSupports.flatten.countP
        (fun φ => Charge.isInconsistency (D.valuation φ))
      ∧
    (0 < PairwiseSectionMiscrossingCount SC.entries ↔
      inconsistencyContent SC.cover.pairwiseSupports.flatten D.valuation = true)
      ∧
    ((∃ x : LenticleChromatic.Marking,
        LenticleChromatic.frame.step (LenticleChromatic.frame.step x) ≠
          LenticleChromatic.frame.step x)
      ∧
      (LenticleDisagreementSomewhere E.cells E.left E.right = false →
        LenticleChromatic.frame.settle
            (LenticleChromatic.propagate E.branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (LenticleDisagreementSomewhere E.cells E.left E.right = true →
        (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate E.branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))
      ∧
      LenticleChromatic.frame.settle
          (LenticleChromatic.propagate .diffraction (fun _ => false, false)) ≠
        LenticleChromatic.frame.settle (fun _ => false, false)) := by
  let Dsite : SiteLenticleIdentificationRealization C.site C.left C.right C.covers :=
    { nonempty := C.nonempty
      realization := D.realization
      offLeft := D.offLeft
      offRight := D.offRight
      leftSection := D.leftSection
      rightSection := D.rightSection
      definite_left := D.definite_left
      definite_right := D.definite_right
      valuation := D.valuation
      compatible := D.compatible
      singleton_support := D.singleton_support }
  simpa [Dsite, LenticleIdentificationRealization.entry,
    LenticleIdentificationRealization.sectionCover,
    SiteLenticleIdentificationRealization.entry,
    SiteLenticleIdentificationRealization.sectionCover,
    overlappingTwoCoverSectionRealizedCover] using
    SiteLenticleIdentificationRealization.strengthened_conditional_carrier Dsite f

/-! ## Stone-side raw two-member realization -/

/-- A raw `SiteObj` two-cover realization whose finite support is derived from a
finite Stone-side active-cell model.  This keeps the same section, valuation,
and singleton-support obligations as `SiteLenticleIdentificationRealization`,
but obtains the support realization from `FiniteStoneSupportModel`. -/
structure StoneSiteLenticleIdentificationRealization
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂]) where
  /-- The lenticle is a non-bottom overlap. -/
  nonempty : LenticleNonempty U₁ U₂
  /-- The finite Stone-side active-cell model realizing clopen support. -/
  supportModel : FiniteStoneSupportModel
  /-- Off-support value used to totalize the left restricted section. -/
  offLeft : Charge
  /-- Off-support value used to totalize the right restricted section. -/
  offRight : Charge
  /-- The left local charge-valued section before restriction to the lenticle. -/
  leftSection : PredicationCell → Charge
  /-- The right local charge-valued section before restriction to the lenticle. -/
  rightSection : PredicationCell → Charge
  /-- The left section is definite on the realized lenticle support. -/
  definite_left :
    ∀ φ, φ ∈ supportModel.toFiniteSupportRealization.support (Lenticle U₁ U₂) →
      DefiniteCharge (leftSection φ)
  /-- The right section is definite on the realized lenticle support. -/
  definite_right :
    ∀ φ, φ ∈ supportModel.toFiniteSupportRealization.support (Lenticle U₁ U₂) →
      DefiniteCharge (rightSection φ)
  /-- The valuation induced by the joined restricted sections. -/
  valuation : Valuation
  /-- The induced valuation is compatible with the Stone-derived section cover. -/
  compatible :
    (twoMemberSectionRealizedCover S U₁ U₂ hcov supportModel.toFiniteSupportRealization
      offLeft offRight leftSection rightSection definite_left definite_right).Compatible valuation
  /-- The realized lenticle is a single counted locus. -/
  singleton_support :
    ∃ φ, supportModel.toFiniteSupportRealization.support (Lenticle U₁ U₂) = [φ]

namespace StoneSiteLenticleIdentificationRealization

/-- Build the raw Stone-side realization from the native Stone singleton-support
predicate. -/
def ofStoneSingletonSupport
    {Q : Type} (S : Site.SiteObj Q) (U₁ U₂ : Site.Clopen)
    (hcov : Site.Covers S.U [U₁, U₂])
    (nonempty : LenticleNonempty U₁ U₂)
    (supportModel : FiniteStoneSupportModel)
    (offLeft offRight : Charge)
    (leftSection rightSection : PredicationCell → Charge)
    (definite_left :
      ∀ φ, φ ∈ supportModel.toFiniteSupportRealization.support (Lenticle U₁ U₂) →
        DefiniteCharge (leftSection φ))
    (definite_right :
      ∀ φ, φ ∈ supportModel.toFiniteSupportRealization.support (Lenticle U₁ U₂) →
        DefiniteCharge (rightSection φ))
    (valuation : Valuation)
    (compatible :
      (twoMemberSectionRealizedCover S U₁ U₂ hcov supportModel.toFiniteSupportRealization
        offLeft offRight leftSection rightSection definite_left definite_right).Compatible
        valuation)
    (singleton_support : supportModel.SingletonLenticleSupport U₁ U₂) :
    StoneSiteLenticleIdentificationRealization S U₁ U₂ hcov where
  nonempty := nonempty
  supportModel := supportModel
  offLeft := offLeft
  offRight := offRight
  leftSection := leftSection
  rightSection := rightSection
  definite_left := definite_left
  definite_right := definite_right
  valuation := valuation
  compatible := compatible
  singleton_support :=
    FiniteStoneSupportModel.singletonLenticleSupport_toFiniteSupportRealization
      supportModel U₁ U₂ singleton_support

/-- Forget the Stone-side presentation to the raw finite-support realization
object. -/
def toSiteRealization
    {Q : Type} {S : Site.SiteObj Q} {U₁ U₂ : Site.Clopen}
    {hcov : Site.Covers S.U [U₁, U₂]}
    (D : StoneSiteLenticleIdentificationRealization S U₁ U₂ hcov) :
    SiteLenticleIdentificationRealization S U₁ U₂ hcov where
  nonempty := D.nonempty
  realization := D.supportModel.toFiniteSupportRealization
  offLeft := D.offLeft
  offRight := D.offRight
  leftSection := D.leftSection
  rightSection := D.rightSection
  definite_left := D.definite_left
  definite_right := D.definite_right
  valuation := D.valuation
  compatible := D.compatible
  singleton_support := D.singleton_support

/-- The Stone-side support of the realized lenticle is the finite active cells
whose Stone side lies in both patches. -/
theorem lenticle_support_mem_iff
    {Q : Type} {S : Site.SiteObj Q} {U₁ U₂ : Site.Clopen}
    {hcov : Site.Covers S.U [U₁, U₂]}
    (D : StoneSiteLenticleIdentificationRealization S U₁ U₂ hcov)
    (φ : PredicationCell) :
    φ ∈ D.supportModel.toFiniteSupportRealization.support (Lenticle U₁ U₂) ↔
      D.supportModel.active φ = true ∧
        Stone.ClopenUp.mem U₁ (D.supportModel.side φ) = true ∧
        Stone.ClopenUp.mem U₂ (D.supportModel.side φ) = true := by
  rw [FiniteStoneSupportModel.toFiniteSupportRealization_support]
  rw [FiniteStoneSupportModel.support_complete]
  rw [FiniteStoneSupportModel.mask_lenticle]
  unfold FiniteStoneSupportModel.mask
  cases D.supportModel.active φ <;>
    cases Stone.ClopenUp.mem U₁ (D.supportModel.side φ) <;>
    cases Stone.ClopenUp.mem U₂ (D.supportModel.side φ) <;>
    simp

/-- The raw two-cover Lenticle Identification carrier read from a finite
Stone-side active-cell model. -/
theorem conditional_carrier
    {Q : Type} {S : Site.SiteObj Q} {U₁ U₂ : Site.Clopen}
    {hcov : Site.Covers S.U [U₁, U₂]}
    (D : StoneSiteLenticleIdentificationRealization S U₁ U₂ hcov) (f : Nat → Bool) :
    Lenticle U₁ U₂ = Site.meet U₁ U₂ ∧
    LenticleNonempty U₁ U₂ ∧
    let E := D.toSiteRealization.entry
    let SC := D.toSiteRealization.sectionCover
    (E.left =
        FiberPullbackChargeSection D.supportModel.toFiniteSupportRealization
          (lenticleToLeftFiberHom S U₁ U₂) D.offLeft D.leftSection
      ∧
      E.right =
        FiberPullbackChargeSection D.supportModel.toFiniteSupportRealization
          (lenticleToRightFiberHom S U₁ U₂) D.offRight D.rightSection)
      ∧
    (E.branch = .diffraction ↔
      LenticleDisagreementSomewhere E.cells E.left E.right = true)
      ∧
    InconSheaf.H0top D.valuation SC.cover.pairwiseSupports.flatten =
      PairwiseSectionMiscrossingCount SC.entries
      ∧
    ((LenticleDisagreementSomewhere E.cells E.left E.right = false →
        LenticleChromatic.frame.settle
            (LenticleChromatic.propagate E.branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (LenticleDisagreementSomewhere E.cells E.left E.right = true →
        (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate E.branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))) := by
  simpa [toSiteRealization] using
    SiteLenticleIdentificationRealization.conditional_carrier D.toSiteRealization f

/-- The strengthened raw two-cover Lenticle Identification carrier read from a
finite Stone-side active-cell model. -/
theorem strengthened_conditional_carrier
    {Q : Type} {S : Site.SiteObj Q} {U₁ U₂ : Site.Clopen}
    {hcov : Site.Covers S.U [U₁, U₂]}
    (D : StoneSiteLenticleIdentificationRealization S U₁ U₂ hcov) (f : Nat → Bool) :
    Lenticle U₁ U₂ = Site.meet U₁ U₂ ∧
    LenticleNonempty U₁ U₂ ∧
    let E := D.toSiteRealization.entry
    let SC := D.toSiteRealization.sectionCover
    (E.left =
        FiberPullbackChargeSection D.supportModel.toFiniteSupportRealization
          (lenticleToLeftFiberHom S U₁ U₂) D.offLeft D.leftSection
      ∧
      E.right =
        FiberPullbackChargeSection D.supportModel.toFiniteSupportRealization
          (lenticleToRightFiberHom S U₁ U₂) D.offRight D.rightSection)
      ∧
    (E.branch = .diffraction ↔
      LenticleDisagreementSomewhere E.cells E.left E.right = true)
      ∧
    PairwiseSectionMiscrossingCount SC.entries =
      SC.cover.pairwiseSupports.flatten.countP
        (fun φ => Charge.isInconsistency (D.valuation φ))
      ∧
    (0 < PairwiseSectionMiscrossingCount SC.entries ↔
      inconsistencyContent SC.cover.pairwiseSupports.flatten D.valuation = true)
      ∧
    ((∃ x : LenticleChromatic.Marking,
        LenticleChromatic.frame.step (LenticleChromatic.frame.step x) ≠
          LenticleChromatic.frame.step x)
      ∧
      (LenticleDisagreementSomewhere E.cells E.left E.right = false →
        LenticleChromatic.frame.settle
            (LenticleChromatic.propagate E.branch (f, false)) =
          LenticleChromatic.frame.settle (f, false))
      ∧
      (LenticleDisagreementSomewhere E.cells E.left E.right = true →
        (LenticleChromatic.propagate E.branch (f, false)).2 = true ∧
          LenticleChromatic.frame.settle
              (LenticleChromatic.clearObstruction
                (LenticleChromatic.propagate E.branch (f, false))) =
            LenticleChromatic.frame.settle (f, false))
      ∧
      LenticleChromatic.frame.settle
          (LenticleChromatic.propagate .diffraction (fun _ => false, false)) ≠
        LenticleChromatic.frame.settle (fun _ => false, false)) := by
  simpa [toSiteRealization] using
    SiteLenticleIdentificationRealization.strengthened_conditional_carrier
      D.toSiteRealization f

end StoneSiteLenticleIdentificationRealization

end Obsmetrologia
