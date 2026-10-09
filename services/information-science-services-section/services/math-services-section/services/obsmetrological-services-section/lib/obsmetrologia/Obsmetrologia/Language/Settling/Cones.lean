import Obsmetrologia.Language.Settling
import Obsmetrologia.Language.Positing.Evidence
import Obsmetrologia.Language.Positing.Valuation

/-!
# The two cones and the void

A valued valuation (`CValuation`) assigns each
predication cell a `Valued`, not a bare `Reading`: value plus evidence.
Settling a valued valuation under a closure can be read two ways, and they
are genuinely different cones:

* **`settle`**, the *unit* cone: close the value exactly as measured — the
  least the givens force.
* **`brim`**, the *counit* cone: first presume every free side to present
  (`Valued.presumeFree`), *then* close — the most the givens allow.

`Reading.Closure` (`Language/Settling.lean`) is a closure on one reading
(`op`, `infl`, `mono`, `idem`), and `Reading.settle c seed := c.op seed`; there
is no valuation-level closure operator here, so both cones are **pointwise**:
apply the one-reading closure at each cell, to the cell's own `settle`/`brim`
input value. `settle_le_brim` records that the unit cone never outruns the
counit cone — presumption only climbs (`presumeFree_ge`), and closing is
monotone (`c.mono`).

**The void** (`Void`) is where the two cones disagree — the cells whose
reading is still under-determined by what has actually been measured. A value
witnessed on one coordinate only is void on its free coordinate under the
identity-ish closure `joinClosure kBot` (`oneSided_void`): measured, it is only
`potential`; presumed, it climbs to `stable`. A *cancelled* conflict — both sides
witnessed, meeting to ⊥ₖ in value — is not void (`cancelled_not_void`):
there is no free side left for presumption to raise, so the two cones agree
on the spot. The monograph's reading (2026-06-17): **the void is space**
(`Void`, the gap between the cones at a cell) and **the apex is time** (the
settling chain climbing a cell from its unit toward its counit as more is
measured).
-/

namespace Obsmetrologia

/-- A valued valuation: each predication cell carries a `Valued` — value
plus evidence — not a bare reading. -/
abbrev CValuation := PredicationCell → Valued

namespace CValuation

/-- Forget the evidence: the bare-reading valuation underlying a valued one. -/
def value (v : CValuation) : Valuation := fun φ => (v φ).value

/-- **The unit cone**: close the measured value exactly — the least the
givens force. Pointwise, since `Reading.Closure` closes one reading at a time. -/
def settle (c : Reading.Closure) (v : CValuation) : Valuation :=
  fun φ => Reading.settle c (v φ).value

/-- **The counit cone**: presume every free side to present, then close — the
most the givens allow. -/
def brim (c : Reading.Closure) (v : CValuation) : Valuation :=
  fun φ => Reading.settle c (Valued.presumeFree (v φ)).value

/-- The unit cone never outruns the counit cone: presumption only climbs, and
closing is monotone. -/
theorem settle_le_brim (c : Reading.Closure) (v : CValuation) (φ : PredicationCell) :
    Reading.KLE (settle c v φ) (brim c v φ) :=
  c.mono (v φ).value (Valued.presumeFree (v φ)).value (Valued.presumeFree_ge (v φ))

/-- **The void**: the cells the two cones disagree on — the slack, the
under-determined. Space, in the monograph's reading. -/
def Void (c : Reading.Closure) (v : CValuation) (φ : PredicationCell) : Prop :=
  settle c v φ ≠ brim c v φ

/-- A cell is void exactly when the counit cone fails to sit back down at the
unit cone — since the unit cone is always below the counit cone, they differ
exactly when the counit cone is not `≤ₖ` the unit cone. -/
theorem void_iff (c : Reading.Closure) (v : CValuation) (φ : PredicationCell) :
    Void c v φ ↔ ¬ Reading.KLE (brim c v φ) (settle c v φ) := by
  constructor
  · intro hvoid hle
    exact hvoid (Reading.kle_antisymm _ _ (settle_le_brim c v φ) hle)
  · intro hnle heq
    apply hnle
    rw [← heq]
    exact Reading.kle_refl (settle c v φ)

/-- When both sides already carry a witness, presumption changes nothing
(`presumeFree_of_full`), so the two cones agree: a fully-witnessed cell is
never void. -/
theorem not_void_of_full (c : Reading.Closure) (v : CValuation) (φ : PredicationCell)
    (h1 : (v φ).evidence.1 ≠ []) (h2 : (v φ).evidence.2 ≠ []) : ¬ Void c v φ := by
  intro hvoid
  apply hvoid
  show Reading.settle c (v φ).value = Reading.settle c (Valued.presumeFree (v φ)).value
  rw [Valued.presumeFree_of_full (v φ) h1 h2]

/-- **A one-sided value is void on its free coordinate.** Measured, it is only
`potential` (first coordinate witnessed, second free); presumed, the free
coordinate climbs to `stable`. The constant valuation, under `joinClosure kBot`
(closing changes nothing further once already climbed): unit = potential,
counit = stable. -/
theorem oneSided_void (t : Token) (φ : PredicationCell) :
    Void (Reading.joinClosure Reading.kBot)
      (fun _ => Valued.oneSided t) φ := by
  show Reading.tTop ≠ Reading.kTop
  intro h
  cases h

/-- **A cancelled conflict is not void.** Both coordinates witnessed, meeting to
⊥ₖ in value — but there is no *free* coordinate left for presumption to raise, so
the two cones already agree. -/
theorem cancelled_not_void (t w : Token) (φ : PredicationCell) :
    ¬ Void (Reading.joinClosure Reading.kBot)
      (fun _ => Valued.meetK (Valued.oneSided t) ⟨.active, ([], [w])⟩) φ := by
  apply not_void_of_full
  · show t :: ([] : Slot) ≠ []
    exact List.cons_ne_nil _ _
  · show w :: ([] : Slot) ≠ []
    exact List.cons_ne_nil _ _

end CValuation
end Obsmetrologia
