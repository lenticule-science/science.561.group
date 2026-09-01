import Infomaterial.Calculus.Real.Internal
import Infomaterial.Language.Positing.Value.Category

/-!
# The real stochastic interval `[0,1]` as a value category

`Probability/Stochastic.lean` modelled stochastic settling over an *abstract* `StochSemiring` with a
`Nat` witness, because it predated the internal reals — it had no genuine `[0,1]`. With
`Real.Internal` now present (the constructive `κ=ω` settling completion of the rationals, proven
to instantiate the value-settling hub), the genuine unit interval of real probabilities can be built:
the subtype `{x : ℝ // 0 ≤ x ≤ 1}` is a `Positing.Value.ValueCategory`, the value layer Markov-kernel
stochastic settling runs over (`content/.../stochastic-settling`). No free data: the order is the
real order restricted to `[0,1]`, and antisymmetry is the reals' antisymmetry plus proof irrelevance.

## Main definitions

* `UnitReal` — a real probability `0 ≤ x ≤ 1`.
* `realUnitIntervalStochVC` — the `[0,1]` value category.

## Main results

* `rzero_le_one` — `0 ≤ 1` in the internal reals.
* `realUnitInterval_is_value_category` — the bundled headline: `[0,1]` is a genuine value category.

## References

`content/.../stochastic-settling`. Built on `Infomaterial.Real.Internal` and
`Infomaterial.Positing.Value.Category`.

## Tags

stochastic settling, unit interval, value category, internal reals, probability
-/

namespace Infomaterial
namespace Probability
namespace RealStochastic

open Infomaterial.Real.Internal

/-! ## (A) The unit interval of real probabilities -/

/-- A real number in the unit interval `[0,1]` — a probability value. -/
structure UnitReal where
  /-- The underlying internal real. -/
  val : RReal
  /-- It is at least `0`. -/
  zero_le : RReal.zero ≤ val
  /-- It is at most `1`. -/
  le_one : val ≤ RReal.one

namespace UnitReal

/-- Unit-interval values are determined by their underlying real (proof irrelevance on the bounds). -/
theorem ext {a b : UnitReal} (h : a.val = b.val) : a = b := by
  cases a; cases b; cases h; rfl

end UnitReal

/-! ## (B) `0 ≤ 1` in the reals, and the seed probability `0` -/

/-- `0 ≤ 1` in the internal rationals. -/
theorem rat_zero_le_one : (0 : Real.Internal.Rat) ≤ (1 : Real.Internal.Rat) :=
  (Real.Internal.Rat.zero_le_mk PreRat.one).mpr (by decide)

/-- `0 ≤ 1` in the internal reals. -/
theorem rzero_le_one : RReal.zero ≤ RReal.one :=
  RReal.ofRat_mono rat_zero_le_one

/-- The probability `0` as a unit-interval value. -/
def zero : UnitReal := ⟨RReal.zero, RReal.le_refl _, rzero_le_one⟩

/-! ## (C) The `[0,1]` value category -/

/-- The **real unit-interval stochastic value category**: the carrier is `[0,1] ⊂ ℝ` with the real
order, a genuine partial order with bottom `0` — the value layer for stochastic settling over real
probabilities. -/
def realUnitIntervalStochVC : Positing.Value.ValueCategory where
  carrier := UnitReal
  le := fun a b => a.val ≤ b.val
  le_refl := fun a => RReal.le_refl a.val
  le_trans := fun h1 h2 => RReal.le_trans h1 h2
  le_antisymm := fun h1 h2 => UnitReal.ext (RReal.le_antisymm h1 h2)
  bot := zero

/-! ## (D) The bundled headline -/

/-- **The real stochastic interval is a value category.** The internally derived constructive reals
support a unit-interval `[0,1]` value category — a genuine partial order (reflexive, transitive,
antisymmetric) with seed `0` — over real probabilities rather than an abstract semiring or counting
witness. -/
theorem realUnitInterval_is_value_category :
    realUnitIntervalStochVC.carrier = UnitReal
    ∧ (∀ a : UnitReal, realUnitIntervalStochVC.le a a)
    ∧ (∀ a b : UnitReal,
        realUnitIntervalStochVC.le a b → realUnitIntervalStochVC.le b a → a = b)
    ∧ realUnitIntervalStochVC.bot = zero :=
  ⟨rfl,
   fun a => realUnitIntervalStochVC.le_refl a,
   fun _ _ h1 h2 => realUnitIntervalStochVC.le_antisymm h1 h2,
   rfl⟩

end RealStochastic
end Probability
end Infomaterial
