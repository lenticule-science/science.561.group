import ObsmetrologiaPhysicalScience.CausalSets.BlackHoles.Hole
import ObsmetrologiaPhysicalScience.CausalSets.Causal.Diamond

/-!
# Hole diamond causal sets

This module builds the kinematic space of causal diamonds of a causal set. A
`DiamondPoint C` is a pair of already listed causal events whose
underlying points are strictly reachable in `C`.

The nesting relation has a self-edge at every diamond point, so it cannot carry
the `Graph.StrictOrderClosure` demanded by `CausalSet`.  The sequencing relation
`(a,b) ≺ (a',b')` when `b ≤ a'` is transitive and irreflexive, so it packages
the diamond points as a new causal set, the `HoleDiamondKinematicSpace`. The
existing `Hole` construction and its closure theorems then instantiate directly
on that derived causal set.

The final section runs the same test against the current concrete Obsmetrologia
diamond, `CausalSets.Causal.Diamond.diamondCausalSet`, rather than
leaving the result only at the generic level.
-/

namespace Obsmetrologia
namespace CausalSets.BlackHoles

open Obsmetrologia.Discrete
open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone

instance eventDecidableEq {E : Type} (C : CausalSet E) [DecidableEq E] : DecidableEq (Event C) := by
  intro a b
  cases a with
  | mk ap _ =>
    cases b with
    | mk bp _ =>
      by_cases h : ap = bp
      · subst bp
        exact isTrue rfl
      · exact isFalse (by
          intro hab
          apply h
          cases hab
          rfl)

/-- A causal diamond, carried as two listed events whose lower endpoint strictly reaches the upper. -/
structure DiamondPoint {E : Type} (C : CausalSet E) where
  /-- The lower listed event. -/
  lower : Event C
  /-- The upper listed event. -/
  upper : Event C
  /-- The lower event strictly reaches the upper event. -/
  reaches_upper : C.reaches lower.point upper.point

instance diamondPointDecidableEq {E : Type} (C : CausalSet E) [DecidableEq E] :
    DecidableEq (DiamondPoint C) := by
  intro p q
  cases p with
  | mk pl pu _ =>
    cases q with
    | mk ql qu _ =>
      by_cases hl : pl = ql
      · subst ql
        by_cases hu : pu = qu
        · subst qu
          exact isTrue rfl
        · exact isFalse (by
            intro h
            apply hu
            cases h
            rfl)
      · exact isFalse (by
          intro h
          apply hl
          cases h
          rfl)

namespace DiamondPoint

variable {E : Type} (C : CausalSet E)

/-- The listed diamond points obtained from the listed event carrier. -/
def events [DecidableRel C.reaches] : List (DiamondPoint C) :=
  C.events.attach.flatMap fun a =>
    C.events.attach.filterMap fun b =>
      if h : C.reaches a.val b.val then
        some { lower := ⟨a.val, a.property⟩, upper := ⟨b.val, b.property⟩, reaches_upper := h }
      else none

private theorem attach_nodup_of_nodup
    {α : Type} {xs : List α}
    (h : xs.Nodup) : xs.attach.Nodup := by
  exact h.pmap (fun x hx => hx)
    (fun {x} hx {y} hy hne heq => hne (congrArg Subtype.val heq))

private theorem filterMap_nodup_of_some_injective
    {α β : Type} {xs : List α} {f : α → Option β}
    (hxs : xs.Nodup)
    (hinjective :
      ∀ ⦃a b : α⦄, a ∈ xs → b ∈ xs →
      ∀ ⦃y : β⦄, f a = some y → f b = some y → a = b) :
    (xs.filterMap f).Nodup := by
  induction xs with
  | nil => simp
  | cons a as ih =>
      have htail : as.Nodup := (List.nodup_cons.mp hxs).2
      have hnot : a ∉ as := (List.nodup_cons.mp hxs).1
      have hinjTail :
          ∀ ⦃b c : α⦄, b ∈ as → c ∈ as →
          ∀ ⦃y : β⦄, f b = some y → f c = some y → b = c := by
        intro b c hb hc y hby hcy
        exact hinjective (by simp [hb]) (by simp [hc]) hby hcy
      rw [List.filterMap_cons]
      cases hfa : f a with
      | none => exact ih htail hinjTail
      | some y =>
          apply List.nodup_cons.mpr
          constructor
          · intro hymem
            rw [List.mem_filterMap] at hymem
            obtain ⟨b, hb, hby⟩ := hymem
            have hab : a = b := hinjective (by simp) (by simp [hb]) hfa hby
            exact hnot (hab ▸ hb)
          · exact ih htail hinjTail

private theorem flatMap_nodup_of_pairwise_disjoint
    {α β : Type} {xs : List α} {f : α → List β}
    (hxs : xs.Nodup)
    (heach : ∀ a, a ∈ xs → (f a).Nodup)
    (hdisjoint :
      ∀ ⦃a b : α⦄, a ∈ xs → b ∈ xs → a ≠ b →
      ∀ ⦃y : β⦄, y ∈ f a → y ∈ f b → False) :
    (xs.flatMap f).Nodup := by
  induction xs with
  | nil => simp
  | cons a as ih =>
      have hnot : a ∉ as := (List.nodup_cons.mp hxs).1
      have htail : as.Nodup := (List.nodup_cons.mp hxs).2
      have heachTail : ∀ b, b ∈ as → (f b).Nodup := by
        intro b hb
        exact heach b (by simp [hb])
      have hdisjointTail :
          ∀ ⦃b c : α⦄, b ∈ as → c ∈ as → b ≠ c →
          ∀ ⦃y : β⦄, y ∈ f b → y ∈ f c → False := by
        intro b c hb hc hbc y hyb hyc
        exact hdisjoint (by simp [hb]) (by simp [hc]) hbc hyb hyc
      rw [List.flatMap_cons]
      apply List.nodup_append.mpr
      refine ⟨heach a (by simp), ih htail heachTail hdisjointTail, ?_⟩
      intro y hy z hz hyz
      rw [List.mem_flatMap] at hz
      obtain ⟨b, hb, hzb⟩ := hz
      have hab : a ≠ b := fun heq => hnot (heq ▸ hb)
      subst z
      exact hdisjoint (by simp) (by simp [hb]) hab hy hzb

private def eventsFromLower
    [DecidableRel C.reaches]
    (lower : {x // x ∈ C.events}) : List (DiamondPoint C) :=
  C.events.attach.filterMap fun upper =>
    if h : C.reaches lower.val upper.val then
      some
        { lower := ⟨lower.val, lower.property⟩
          upper := ⟨upper.val, upper.property⟩
          reaches_upper := h }
    else none

private theorem events_eq_flatMap_eventsFromLower
    [DecidableRel C.reaches] :
    DiamondPoint.events C =
      C.events.attach.flatMap (eventsFromLower C) := rfl

private theorem eventsFromLower_some_injective
    [DecidableRel C.reaches]
    (lower : {x // x ∈ C.events})
    {upper₁ upper₂ : {x // x ∈ C.events}}
    {point : DiamondPoint C}
    (h₁ : (if h : C.reaches lower.val upper₁.val then
              some
                { lower := ⟨lower.val, lower.property⟩
                  upper := ⟨upper₁.val, upper₁.property⟩
                  reaches_upper := h }
            else none) = some point)
    (h₂ : (if h : C.reaches lower.val upper₂.val then
              some
                { lower := ⟨lower.val, lower.property⟩
                  upper := ⟨upper₂.val, upper₂.property⟩
                  reaches_upper := h }
            else none) = some point) :
    upper₁ = upper₂ := by
  by_cases hr₁ : C.reaches lower.val upper₁.val
  · by_cases hr₂ : C.reaches lower.val upper₂.val
    · simp only [hr₁, dite_true, Option.some.injEq] at h₁
      simp only [hr₂, dite_true, Option.some.injEq] at h₂
      apply Subtype.ext
      exact (congrArg (fun p : DiamondPoint C => p.upper.point) h₁).trans
        (congrArg (fun p : DiamondPoint C => p.upper.point) h₂).symm
    · simp [hr₂] at h₂
  · simp [hr₁] at h₁

private theorem eventsFromLower_nodup
    [DecidableRel C.reaches]
    (hC : C.events.Nodup)
    (lower : {x // x ∈ C.events}) :
    (eventsFromLower C lower).Nodup := by
  unfold eventsFromLower
  apply filterMap_nodup_of_some_injective (attach_nodup_of_nodup hC)
  intro upper₁ upper₂ _ _ point h₁ h₂
  exact eventsFromLower_some_injective C lower h₁ h₂

private theorem eventsFromLower_disjoint
    [DecidableRel C.reaches]
    {lower₁ lower₂ : {x // x ∈ C.events}}
    (hne : lower₁ ≠ lower₂)
    {point : DiamondPoint C}
    (h₁ : point ∈ eventsFromLower C lower₁)
    (h₂ : point ∈ eventsFromLower C lower₂) : False := by
  unfold eventsFromLower at h₁ h₂
  rw [List.mem_filterMap] at h₁ h₂
  obtain ⟨upper₁, _, h₁⟩ := h₁
  obtain ⟨upper₂, _, h₂⟩ := h₂
  by_cases hr₁ : C.reaches lower₁.val upper₁.val
  · by_cases hr₂ : C.reaches lower₂.val upper₂.val
    · simp only [hr₁, dite_true, Option.some.injEq] at h₁
      simp only [hr₂, dite_true, Option.some.injEq] at h₂
      apply hne
      apply Subtype.ext
      exact (congrArg (fun p : DiamondPoint C => p.lower.point) h₁).trans
        (congrArg (fun p : DiamondPoint C => p.lower.point) h₂).symm
    · simp [hr₂] at h₂
  · simp [hr₁] at h₁

/-- The generated diamond-point support is duplicate-free whenever the source
causal set's event support is duplicate-free. -/
theorem events_nodup
    [DecidableRel C.reaches]
    (hC : C.events.Nodup) :
    (DiamondPoint.events C).Nodup := by
  rw [events_eq_flatMap_eventsFromLower]
  exact flatMap_nodup_of_pairwise_disjoint
    (attach_nodup_of_nodup hC)
    (fun lower _ => eventsFromLower_nodup C hC lower)
    (fun _ _ _ _ hne _ h₁ h₂ =>
      eventsFromLower_disjoint C hne h₁ h₂)

end DiamondPoint

variable {E : Type} (C : CausalSet E) [CausalLeDecision C]

/-- Diamond nesting: `(a,b)` is contained in `(a',b')` when `a' ≤ a` and `b ≤ b'`. -/
def nestingPrec0 (p q : DiamondPoint C) : Bool :=
  CausalLeBool C q.lower.point p.lower.point && CausalLeBool C p.upper.point q.upper.point

/-- Nesting has a self-edge at every diamond point. -/
theorem nesting_self_edge (p : DiamondPoint C) : nestingPrec0 C p p = true := by
  have hlo : CausalLeBool C p.lower.point p.lower.point = true :=
    (causalLeBool_eq_true_iff C p.lower.point p.lower.point).2 (causalLe_refl C p.lower.point)
  have hup : CausalLeBool C p.upper.point p.upper.point = true :=
    (causalLeBool_eq_true_iff C p.upper.point p.upper.point).2 (causalLe_refl C p.upper.point)
  simp [nestingPrec0, hlo, hup]

/-- Nesting cannot provide a strict-order closure once there is any diamond point. -/
theorem nesting_no_strictOrderClosure_of_point (p : DiamondPoint C) :
    Graph.StrictOrderClosure (nestingPrec0 C) → False := by
  intro h
  exact h.lt_irrefl p (h.edge_lt (nesting_self_edge C p))

/-- Diamond sequencing: `(a,b)` precedes `(a',b')` when the upper endpoint `b` is before `a'`. -/
def sequencingPrec0 (p q : DiamondPoint C) : Bool :=
  CausalLeBool C p.upper.point q.lower.point

/-- The Boolean sequencing edge presents endpoint causal precedence. -/
theorem sequencing_prec0_eq_true_iff (p q : DiamondPoint C) :
    sequencingPrec0 C p q = true ↔ CausalLe C p.upper.point q.lower.point := by
  exact causalLeBool_eq_true_iff C p.upper.point q.lower.point

omit [CausalLeDecision C] in
/-- Sequencing is transitive because the middle diamond carries `a' < b'`. -/
theorem sequencing_lt_trans {p q r : DiamondPoint C}
    (hpq : CausalLe C p.upper.point q.lower.point)
    (hqr : CausalLe C q.upper.point r.lower.point) :
    CausalLe C p.upper.point r.lower.point :=
  causalLe_trans C (causalLe_trans C hpq (Or.inr q.reaches_upper)) hqr

omit [CausalLeDecision C] in
/-- Sequencing is irreflexive because each diamond already has `lower < upper`. -/
theorem sequencing_lt_irrefl (p : DiamondPoint C) :
    ¬ CausalLe C p.upper.point p.lower.point := by
  intro h
  have hforward : CausalLe C p.lower.point p.upper.point := Or.inr p.reaches_upper
  have heq : p.upper.point = p.lower.point := causalLe_antisymm C h hforward
  exact C.reaches_irrefl p.lower.point (by simpa [heq] using p.reaches_upper)

/-- The sequencing relation carries the strict-order closure required by `CausalSet`. -/
def sequencingStrictOrderClosure : Graph.StrictOrderClosure (sequencingPrec0 C) where
  lt := fun p q => CausalLe C p.upper.point q.lower.point
  edge_lt := by
    intro p q h
    exact (sequencing_prec0_eq_true_iff C p q).1 h
  lt_trans := by
    intro _ _ _ hpq hqr
    exact sequencing_lt_trans C hpq hqr
  lt_irrefl := by
    intro p
    exact sequencing_lt_irrefl C p

/-- The causal set whose events are causal diamonds and whose direct order is sequencing. -/
def sequencingCausalSet [DecidableRel C.reaches] : CausalSet (DiamondPoint C) where
  events := DiamondPoint.events C
  events_nodup := DiamondPoint.events_nodup C C.events_nodup
  prec0 := sequencingPrec0 C
  acyclic := sequencingStrictOrderClosure C

/-- The kinematic space of causal diamonds: diamond endpoints ordered by sequencing. -/
abbrev HoleDiamondKinematicSpace [DecidableRel C.reaches] : CausalSet (DiamondPoint C) :=
  sequencingCausalSet C

/-- Boolean sequencing is transitively closed. -/
theorem sequencing_prec0_trans_bool {p q r : DiamondPoint C}
    (hpq : sequencingPrec0 C p q = true) (hqr : sequencingPrec0 C q r = true) :
    sequencingPrec0 C p r = true := by
  exact (sequencing_prec0_eq_true_iff C p r).2
    (sequencing_lt_trans C ((sequencing_prec0_eq_true_iff C p q).1 hpq)
      ((sequencing_prec0_eq_true_iff C q r).1 hqr))

/-- Reachability in the sequencing causal set collapses to one sequencing edge. -/
theorem sequencing_reaches_to_prec0 [DecidableRel C.reaches] {p q : DiamondPoint C}
    (h : (sequencingCausalSet C).reaches p q) : sequencingPrec0 C p q = true := by
  induction h with
  | last e => exact e
  | cons e _ ih => exact sequencing_prec0_trans_bool C e ih

/-- Boolean reflexive causal precedence in the sequencing causal set. -/
def sequencingCausalLeBool [DecidableEq E] (p q : DiamondPoint C) : Bool :=
  decide (p = q) || sequencingPrec0 C p q

instance sequencingCausalLeDecision [DecidableEq E] [DecidableRel C.reaches] :
    CausalLeDecision (sequencingCausalSet C) where
  leq := sequencingCausalLeBool C
  leq_iff_causalLe := by
    intro p q
    constructor
    · intro h
      unfold sequencingCausalLeBool at h
      rw [Bool.or_eq_true_iff] at h
      rcases h with heq | hseq
      · exact Or.inl (of_decide_eq_true heq)
      · exact Or.inr (CausalSet.reaches.last hseq)
    · intro h
      unfold sequencingCausalLeBool
      rcases h with heq | hreach
      · subst q
        simp
      · rw [Bool.or_eq_true_iff]
        exact Or.inr (sequencing_reaches_to_prec0 C hreach)

/-- The `Hole` construction instantiated on sequencing-ordered diamond points. -/
def sequencingHole [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) : Hole (DiamondPoint C) :=
  Hole.ofReadout (sequencingCausalSet C) readout

/-- The event horizon instantiated on sequencing-ordered diamond points. -/
def sequencingEventHorizon [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) : EventHorizon (DiamondPoint C) :=
  EventHorizon.ofReadout (sequencingCausalSet C) readout

/-- The hole region on sequencing-ordered diamond points. -/
def sequencingHoleRegion [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) : Region (DiamondPoint C) :=
  HoleRegion (sequencingCausalSet C) readout

/-- The readout exterior on sequencing-ordered diamond points. -/
def sequencingReadoutExterior [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) : Region (DiamondPoint C) :=
  ReadoutExterior (sequencingCausalSet C) readout

/-- The shroud on sequencing-ordered diamond points. -/
def sequencingShroud [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) : Region (DiamondPoint C) :=
  Shroud (sequencingCausalSet C) readout

/-- The existing future-closure theorem typechecks on sequencing-ordered diamond points. -/
theorem sequencing_hole_future_closed [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) {x y : DiamondPoint C}
    (hx : HoleRegion (sequencingCausalSet C) readout x = true)
    (hxy : CausalLe (sequencingCausalSet C) x y) :
    HoleRegion (sequencingCausalSet C) readout y = true :=
  hole_future_closed (sequencingCausalSet C) readout hx hxy

/-- The existing exterior past-closure theorem typechecks on sequencing-ordered diamond points. -/
theorem sequencing_readoutExterior_past_closed [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) {x y : DiamondPoint C}
    (hxy : CausalLe (sequencingCausalSet C) x y)
    (hy : ReadoutExterior (sequencingCausalSet C) readout y = true) :
    ReadoutExterior (sequencingCausalSet C) readout x = true :=
  readoutExterior_past_closed (sequencingCausalSet C) readout hxy hy

/-- The existing disjointness theorem typechecks on sequencing-ordered diamond points. -/
theorem sequencing_hole_exterior_disjoint [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) (x : DiamondPoint C) :
    ¬ (HoleRegion (sequencingCausalSet C) readout x = true ∧
      ReadoutExterior (sequencingCausalSet C) readout x = true) :=
  hole_exterior_disjoint (sequencingCausalSet C) readout x

/-- The existing no-future-to-exterior theorem typechecks on sequencing-ordered diamond points. -/
theorem sequencing_hole_no_future_to_exterior [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) {x y : DiamondPoint C}
    (hin : HoleRegion (sequencingCausalSet C) readout x = true)
    (hout : ReadoutExterior (sequencingCausalSet C) readout y = true) :
    ¬ CausalLe (sequencingCausalSet C) x y :=
  hole_no_future_to_exterior (sequencingCausalSet C) readout hin hout

/-- The hole-region kinematic space of causal diamonds is the sequencing causal set.

The theorem also records the boundary of the construction: nesting cannot be the
causal-set order because it self-loops, while sequencing supports the ordinary
hole-region cut laws on diamond points. -/
theorem holeDiamond_kinematic_space [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) :
    (DiamondPoint C → Graph.StrictOrderClosure (nestingPrec0 C) → False)
      ∧ (∀ {p q r : DiamondPoint C},
          sequencingPrec0 C p q = true → sequencingPrec0 C q r = true →
            sequencingPrec0 C p r = true)
      ∧ (∀ {x y : DiamondPoint C},
          HoleRegion (HoleDiamondKinematicSpace C) readout x = true →
            CausalLe (HoleDiamondKinematicSpace C) x y →
              HoleRegion (HoleDiamondKinematicSpace C) readout y = true)
      ∧ (∀ {x y : DiamondPoint C},
          CausalLe (HoleDiamondKinematicSpace C) x y →
            ReadoutExterior (HoleDiamondKinematicSpace C) readout y = true →
              ReadoutExterior (HoleDiamondKinematicSpace C) readout x = true)
      ∧ (∀ x : DiamondPoint C,
          ¬ (HoleRegion (HoleDiamondKinematicSpace C) readout x = true ∧
            ReadoutExterior (HoleDiamondKinematicSpace C) readout x = true))
      ∧ (∀ {x y : DiamondPoint C},
          HoleRegion (HoleDiamondKinematicSpace C) readout x = true →
            ReadoutExterior (HoleDiamondKinematicSpace C) readout y = true →
              ¬ CausalLe (HoleDiamondKinematicSpace C) x y) := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro p
    exact nesting_no_strictOrderClosure_of_point C p
  · intro p q r hpq hqr
    exact sequencing_prec0_trans_bool C hpq hqr
  · intro x y hx hxy
    exact sequencing_hole_future_closed C readout hx hxy
  · intro x y hxy hy
    exact sequencing_readoutExterior_past_closed C readout hxy hy
  · intro x
    exact sequencing_hole_exterior_disjoint C readout x
  · intro x y hin hout
    exact sequencing_hole_no_future_to_exterior C readout hin hout

/-! ## Concrete Obsmetrologia diamond test -/

/-- The current concrete four-event diamond causal set in the Obsmetrologia relational spine. -/
abbrev actualObsmetrologiaDiamondCausalSet : CausalSet (Fin 4) :=
  CausalSets.Causal.Diamond.diamondCausalSet

instance actualObsmetrologiaDiamondReachesDecidable :
    DecidableRel actualObsmetrologiaDiamondCausalSet.reaches := by
  intro a b
  by_cases h : CausalSets.Dimension.OrderingFraction.diamondPrec a b = true
  · exact isTrue (CausalSet.reaches.last h)
  · exact isFalse (by
      intro hr
      exact h (CausalSets.Causal.Diamond.reaches_imp_prec hr))

instance actualObsmetrologiaDiamondCausalLeDecision :
    CausalLeDecision actualObsmetrologiaDiamondCausalSet where
  leq := fun x y =>
    decide (x = y) || CausalSets.Dimension.OrderingFraction.diamondPrec x y
  leq_iff_causalLe := by
    intro x y
    constructor
    · intro h
      rw [Bool.or_eq_true_iff] at h
      rcases h with heq | hxy
      · exact Or.inl (of_decide_eq_true heq)
      · exact Or.inr (CausalSet.reaches.last hxy)
    · intro h
      rw [Bool.or_eq_true_iff]
      rcases h with heq | hreach
      · exact Or.inl (by
          subst y
          simp)
      · exact Or.inr (CausalSets.Causal.Diamond.reaches_imp_prec hreach)

/-- The actual listed diamond point `(0,1)` in the current Obsmetrologia diamond. -/
def actualObsmetrologiaDiamondPoint01 : DiamondPoint actualObsmetrologiaDiamondCausalSet where
  lower := ⟨0, by decide⟩
  upper := ⟨1, by decide⟩
  reaches_upper := CausalSet.reaches.last (by decide)

/-- In the actual Obsmetrologia diamond, nesting has a self-edge at `(0,1)`. -/
theorem actualObsmetrologiaDiamond_nesting_self_edge :
    nestingPrec0 actualObsmetrologiaDiamondCausalSet
      actualObsmetrologiaDiamondPoint01 actualObsmetrologiaDiamondPoint01 = true :=
  nesting_self_edge actualObsmetrologiaDiamondCausalSet actualObsmetrologiaDiamondPoint01

/-- In the actual Obsmetrologia diamond, nesting cannot be a causal-set order. -/
theorem actualObsmetrologiaDiamond_nesting_no_strictOrderClosure :
    Graph.StrictOrderClosure (nestingPrec0 actualObsmetrologiaDiamondCausalSet) → False :=
  nesting_no_strictOrderClosure_of_point actualObsmetrologiaDiamondCausalSet
    actualObsmetrologiaDiamondPoint01

/-- The actual Obsmetrologia diamond points form a causal set under sequencing. -/
def actualObsmetrologiaDiamondSequencingCausalSet :
    CausalSet (DiamondPoint actualObsmetrologiaDiamondCausalSet) :=
  sequencingCausalSet actualObsmetrologiaDiamondCausalSet

instance actualObsmetrologiaDiamondSequencingCausalLeDecision :
    CausalLeDecision actualObsmetrologiaDiamondSequencingCausalSet := by
  unfold actualObsmetrologiaDiamondSequencingCausalSet
  infer_instance

/-- The `Hole` construction instantiated on actual Obsmetrologia diamond points. -/
def actualObsmetrologiaDiamondSequencingHole
    (readout : Region (DiamondPoint actualObsmetrologiaDiamondCausalSet)) :
    Hole (DiamondPoint actualObsmetrologiaDiamondCausalSet) :=
  sequencingHole actualObsmetrologiaDiamondCausalSet readout

/-- The event horizon instantiated on actual Obsmetrologia diamond points. -/
def actualObsmetrologiaDiamondSequencingEventHorizon
    (readout : Region (DiamondPoint actualObsmetrologiaDiamondCausalSet)) :
    EventHorizon (DiamondPoint actualObsmetrologiaDiamondCausalSet) :=
  sequencingEventHorizon actualObsmetrologiaDiamondCausalSet readout

/-- The existing future-closure theorem typechecks on the actual Obsmetrologia diamond points. -/
theorem actualObsmetrologiaDiamond_hole_future_closed
    (readout : Region (DiamondPoint actualObsmetrologiaDiamondCausalSet))
    {x y : DiamondPoint actualObsmetrologiaDiamondCausalSet}
    (hx : HoleRegion actualObsmetrologiaDiamondSequencingCausalSet readout x = true)
    (hxy : CausalLe actualObsmetrologiaDiamondSequencingCausalSet x y) :
    HoleRegion actualObsmetrologiaDiamondSequencingCausalSet readout y = true :=
  hole_future_closed actualObsmetrologiaDiamondSequencingCausalSet readout hx hxy

/-- The existing exterior past-closure theorem typechecks on the actual Obsmetrologia diamond points. -/
theorem actualObsmetrologiaDiamond_readoutExterior_past_closed
    (readout : Region (DiamondPoint actualObsmetrologiaDiamondCausalSet))
    {x y : DiamondPoint actualObsmetrologiaDiamondCausalSet}
    (hxy : CausalLe actualObsmetrologiaDiamondSequencingCausalSet x y)
    (hy : ReadoutExterior actualObsmetrologiaDiamondSequencingCausalSet readout y = true) :
    ReadoutExterior actualObsmetrologiaDiamondSequencingCausalSet readout x = true :=
  readoutExterior_past_closed actualObsmetrologiaDiamondSequencingCausalSet readout hxy hy

/-- The existing disjointness theorem typechecks on the actual Obsmetrologia diamond points. -/
theorem actualObsmetrologiaDiamond_hole_exterior_disjoint
    (readout : Region (DiamondPoint actualObsmetrologiaDiamondCausalSet))
    (x : DiamondPoint actualObsmetrologiaDiamondCausalSet) :
    ¬ (HoleRegion actualObsmetrologiaDiamondSequencingCausalSet readout x = true ∧
      ReadoutExterior actualObsmetrologiaDiamondSequencingCausalSet readout x = true) :=
  hole_exterior_disjoint actualObsmetrologiaDiamondSequencingCausalSet readout x

/-- The existing no-future-to-exterior theorem typechecks on the actual Obsmetrologia diamond points. -/
theorem actualObsmetrologiaDiamond_hole_no_future_to_exterior
    (readout : Region (DiamondPoint actualObsmetrologiaDiamondCausalSet))
    {x y : DiamondPoint actualObsmetrologiaDiamondCausalSet}
    (hin : HoleRegion actualObsmetrologiaDiamondSequencingCausalSet readout x = true)
    (hout : ReadoutExterior actualObsmetrologiaDiamondSequencingCausalSet readout y = true) :
    ¬ CausalLe actualObsmetrologiaDiamondSequencingCausalSet x y :=
  hole_no_future_to_exterior actualObsmetrologiaDiamondSequencingCausalSet readout hin hout

end CausalSets.BlackHoles
end Obsmetrologia
