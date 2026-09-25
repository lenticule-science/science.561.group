import Obsmetrologia.AperiodicOrder.Defect

/-!
# C4 affine holonomy in a witnessed ambient frame

An affine seam carries a C4 frame turn and a signed integral displacement.  The
displacement is not inferred from topology: before composition every seam
translation is transported into the named ambient frame, so the carrier has a
single coordinate convention.  This is the executable counterpart of keeping
rotational curvature and translational (Burgers) content distinct.
-/

namespace Obsmetrologia
namespace AperiodicOrder
namespace AffineHolonomy

/-- Integral coordinates in one explicitly named ambient frame. -/
abbrev Vec : Type := Int × Int

def zero : Vec := (0, 0)
def add (u v : Vec) : Vec := (u.1 + v.1, u.2 + v.2)
def neg (u : Vec) : Vec := (-u.1, -u.2)

theorem add_assoc (u v w : Vec) : add (add u v) w = add u (add v w) := by
  simp [add, Int.add_assoc]

theorem add_zero (u : Vec) : add u zero = u := by simp [add, zero]
theorem zero_add (u : Vec) : add zero u = u := by simp [add, zero]

/-- Counter-clockwise quarter-turns in the common ambient frame. -/
def rotate : Fin 4 → Vec → Vec
  | ⟨0, _⟩, v => v
  | ⟨1, _⟩, v => (-v.2, v.1)
  | ⟨2, _⟩, v => (-v.1, -v.2)
  | ⟨3, _⟩, v => (v.2, -v.1)

theorem rotate_add (a b : Fin 4) (v : Vec) :
    rotate (a + b) v = rotate a (rotate b v) := by
  have ha : a = 0 ∨ a = 1 ∨ a = 2 ∨ a = 3 := by omega
  have hb : b = 0 ∨ b = 1 ∨ b = 2 ∨ b = 3 := by omega
  rcases ha with rfl | rfl | rfl | rfl <;> rcases hb with rfl | rfl | rfl | rfl <;> simp [rotate, Fin.add_def]

theorem rotate_preserves_add (a : Fin 4) (u v : Vec) :
    rotate a (add u v) = add (rotate a u) (rotate a v) := by
  have ha : a = 0 ∨ a = 1 ∨ a = 2 ∨ a = 3 := by omega
  rcases ha with rfl | rfl | rfl | rfl <;>
    apply Prod.ext <;> simp only [rotate, add] <;> omega

theorem rotate_preserves_neg (a : Fin 4) (u : Vec) :
    rotate a (neg u) = neg (rotate a u) := by
  have ha : a = 0 ∨ a = 1 ∨ a = 2 ∨ a = 3 := by omega
  rcases ha with rfl | rfl | rfl | rfl <;> simp [rotate, neg]

theorem quarterTurns_add_assoc (a b c : Fin 4) : (a + b) + c = a + (b + c) := by
  have ha : a = 0 ∨ a = 1 ∨ a = 2 ∨ a = 3 := by omega
  have hb : b = 0 ∨ b = 1 ∨ b = 2 ∨ b = 3 := by omega
  have hc : c = 0 ∨ c = 1 ∨ c = 2 ∨ c = 3 := by omega
  rcases ha with rfl | rfl | rfl | rfl <;>
    rcases hb with rfl | rfl | rfl | rfl <;>
    rcases hc with rfl | rfl | rfl | rfl <;> decide

theorem quarterTurns_neg_add (a : Fin 4) : -a + a = 0 := by
  have ha : a = 0 ∨ a = 1 ∨ a = 2 ∨ a = 3 := by omega
  rcases ha with rfl | rfl | rfl | rfl <;> decide

theorem quarterTurns_add_neg (a : Fin 4) : a + -a = 0 := by
  have ha : a = 0 ∨ a = 1 ∨ a = 2 ∨ a = 3 := by omega
  rcases ha with rfl | rfl | rfl | rfl <;> decide

/-- A witnessed affine seam. `frame` is the identifier of the common ambient
coordinate frame into which `translation` has already been transported. -/
structure C4AffineHolonomy (frame : String) where
  quarterTurns : Fin 4
  translation : Vec

def identity (frame : String) : C4AffineHolonomy frame :=
  { quarterTurns := 0, translation := zero }

/-- Composition is right-to-left affine composition in one co-transported
ambient frame: `(r,t) ∘ (s,u) = (r+s, Rr u+t)`. -/
def compose {frame : String} (after before : C4AffineHolonomy frame) : C4AffineHolonomy frame :=
  { quarterTurns := after.quarterTurns + before.quarterTurns
    translation := add (rotate after.quarterTurns before.translation) after.translation }

/-- The affine action on a point of the named ambient frame. -/
def act {frame : String} (h : C4AffineHolonomy frame) (point : Vec) : Vec :=
  add (rotate h.quarterTurns point) h.translation

theorem act_compose {frame : String} (after before : C4AffineHolonomy frame) (point : Vec) :
    act (compose after before) point = act after (act before point) := by
  simp only [act, compose]
  rw [rotate_add, rotate_preserves_add, add_assoc]

def inverse {frame : String} (h : C4AffineHolonomy frame) : C4AffineHolonomy frame :=
  { quarterTurns := -h.quarterTurns
    translation := neg (rotate (-h.quarterTurns) h.translation) }

theorem compose_left_identity {frame : String} (h : C4AffineHolonomy frame) :
    compose (identity frame) h = h := by
  cases h
  simp [compose, identity, zero, add, rotate]

theorem compose_right_identity {frame : String} (h : C4AffineHolonomy frame) :
    compose h (identity frame) = h := by
  cases h with
  | mk turns translation =>
    have ht : turns = 0 ∨ turns = 1 ∨ turns = 2 ∨ turns = 3 := by omega
    rcases ht with rfl | rfl | rfl | rfl <;> simp [compose, identity, zero, add, rotate, Fin.add_def] <;> decide

theorem compose_assoc {frame : String} (a b c : C4AffineHolonomy frame) :
    compose (compose a b) c = compose a (compose b c) := by
  cases a with
  | mk aq av =>
    cases b with
    | mk bq bv =>
      cases c with
      | mk cq cv =>
        simp only [compose, C4AffineHolonomy.mk.injEq]
        constructor
        · exact quarterTurns_add_assoc aq bq cq
        · rw [rotate_add, rotate_preserves_add, add_assoc]

theorem inverse_left {frame : String} (h : C4AffineHolonomy frame) :
    compose (inverse h) h = identity frame := by
  cases h with
  | mk turns translation =>
    simp only [inverse, compose, identity, C4AffineHolonomy.mk.injEq]
    constructor
    · exact quarterTurns_neg_add turns
    · simp only [add, neg, zero]
      apply Prod.ext <;> omega

theorem inverse_right {frame : String} (h : C4AffineHolonomy frame) :
    compose h (inverse h) = identity frame := by
  cases h with
  | mk turns translation =>
    simp only [inverse, compose, identity, C4AffineHolonomy.mk.injEq]
    constructor
    · exact quarterTurns_add_neg turns
    · rw [rotate_preserves_neg, ← rotate_add]
      rw [quarterTurns_add_neg]
      simp only [rotate, add, neg, zero]
      apply Prod.ext <;> omega


def rotationalFlat {frame : String} (h : C4AffineHolonomy frame) : Prop := h.quarterTurns = 0
def translationalFlat {frame : String} (h : C4AffineHolonomy frame) : Prop := h.translation = zero
def closed {frame : String} (h : C4AffineHolonomy frame) : Prop := rotationalFlat h ∧ translationalFlat h

/-- In the shared ambient-frame convention, this is the Burgers residue. -/
def burgers {frame : String} (h : C4AffineHolonomy frame) : Vec := h.translation

theorem closed_iff {frame : String} (h : C4AffineHolonomy frame) :
    closed h ↔ h.quarterTurns = 0 ∧ h.translation = zero := Iff.rfl

theorem four_way_classification {frame : String} (h : C4AffineHolonomy frame) :
    (rotationalFlat h ∧ translationalFlat h) ∨
    (rotationalFlat h ∧ ¬ translationalFlat h) ∨
    (¬ rotationalFlat h ∧ translationalFlat h) ∨
    (¬ rotationalFlat h ∧ ¬ translationalFlat h) := by
  -- `by_cases` on `rotationalFlat h`/`translationalFlat h` directly would fail to see through
  -- these (semireducible) `def`s during `Decidable` instance search and so fall back to
  -- `Classical.propDecidable`. Casing on the underlying, already-decidable propositions
  -- (`Fin`/`Vec` equality) instead keeps this constructive; `hr`/`ht` still fit the
  -- `rotationalFlat h`/`translationalFlat h` slots below by definitional unfolding.
  by_cases hr : h.quarterTurns = 0
  · by_cases ht : h.translation = zero
    · exact Or.inl ⟨hr, ht⟩
    · exact Or.inr (Or.inl ⟨hr, ht⟩)
  · by_cases ht : h.translation = zero
    · exact Or.inr (Or.inr (Or.inl ⟨hr, ht⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨hr, ht⟩))

/-- The identity action is the identity map. -/
theorem identity_act (frame : String) (point : Vec) : act (identity frame) point = point := by
  simp [act, identity, add, rotate, zero]

/-- A rotation-flat seam can still carry a nonzero Burgers displacement. -/
theorem rotation_flat_not_translation_flat :
    ∃ h : C4AffineHolonomy "ambient-Z^2", rotationalFlat h ∧ ¬ translationalFlat h := by
  refine ⟨{ quarterTurns := 0, translation := (1, 0) }, rfl, ?_⟩
  intro h
  have hx : (1 : Int) = 0 := by simpa [zero] using congrArg Prod.fst h
  exact Int.one_ne_zero hx

/-- Consequently, rotational flatness alone does not classify a closed affine loop. -/
theorem rotation_flat_not_closed :
    ∃ h : C4AffineHolonomy "ambient-Z^2", rotationalFlat h ∧ ¬ closed h := by
  obtain ⟨h, hr, ht⟩ := rotation_flat_not_translation_flat
  refine ⟨h, hr, ?_⟩
  intro hc
  exact ht hc.2

end AffineHolonomy
end AperiodicOrder
end Obsmetrologia
