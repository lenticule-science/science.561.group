import Obsmetrologia.CausalSets.Dimension.OrderingFraction
import Obsmetrologia.Calculus.Real.Internal

/-!
# Myrheim–Meyer real interpretation — the rational ordering fraction lifted into the internal reals

`MyrheimMeyer` scoped out the real-valued dimension $d_{MM}=f^{-1}(r)$ because it needed
reals, the $\Gamma$ function, and an inverse. Now that `Real.Internal` exists (the constructive
$\kappa=\omega$ settling completion of the rationals), the *rational-to-real* part is no longer
blocked: the diamond's ordering fraction $r=5/6$ has a faithful internal-real interpretation. The
$\Gamma$/inversion part — the dimension itself — stays red.

Following the build note's Approach B, the ordering fraction is rebuilt directly in the internal
rationals (avoiding a core-`Rat`-to-internal-`Rat` bridge) and embedded into the internal reals. No
free data: the value is computed from `CausalSets.Dimension.OrderingFraction.apexCount` and `orderedPairCount`, and the
equality $10/12 = 5/6$ is the cross-multiplication `Quotient.sound`.

## Main definitions

* `mkIRat` — an internal rational `n/d` from naturals with a positive denominator.
* `diamondOrderingFractionIRat` / `diamondOrderingFractionReal` — the diamond fraction, internal
  rational and internal real.

## Main results

* `diamond_orderingFractionIRat_eq` — the internal rational diamond fraction is `5/6`.
* `diamond_orderingFractionReal_eq` — its internal-real embedding is `5/6`.
* `diamond_myrheim_meyer_real_bridge` — the bundled headline.

## References

`content/.../myrheim-meyer-dimension`. Built on `Obsmetrologia.CausalSets.Dimension.OrderingFraction` and
`Obsmetrologia.Real.Internal`.

## Tags

Myrheim--Meyer, ordering fraction, internal reals, causal set dimension, real interpretation
-/

namespace Obsmetrologia
namespace CausalSets.Dimension.Fingerprint

/-! ## (A) Internal-rational fractions -/

/-- An internal rational `n/d` from naturals, with a positive-denominator witness. -/
def mkIRat (n d : Nat) (hd : 0 < d) : Real.Internal.Rat :=
  Real.Internal.Rat.mk { num := (n : Int), den := (d : Int), den_pos := by exact_mod_cast hd }

/-- The internal rational `5/6`. -/
def iFiveSixths : Real.Internal.Rat := mkIRat 5 6 (by decide)

/-- The diamond's ordering fraction `2·apex / ordered-pairs = 10/12`, as an internal rational,
computed from the Myrheim–Meyer apex count and ordered-pair count. -/
def diamondOrderingFractionIRat : Real.Internal.Rat :=
  mkIRat (2 * CausalSets.Dimension.OrderingFraction.apexCount CausalSets.Dimension.OrderingFraction.fourEvents CausalSets.Dimension.OrderingFraction.diamondPrec)
         (CausalSets.Dimension.OrderingFraction.orderedPairCount CausalSets.Dimension.OrderingFraction.fourEvents.length)
         (by decide)

/-! ## (B) The internal-real embedding -/

/-- The internal real `5/6`. -/
def rFiveSixths : Real.Internal.RReal := Real.Internal.RReal.ofRat iFiveSixths

/-- The diamond ordering fraction as an internal real. -/
def diamondOrderingFractionReal : Real.Internal.RReal :=
  Real.Internal.RReal.ofRat diamondOrderingFractionIRat

/-! ## (C) The projection equalities -/

/-- The internal rational diamond ordering fraction is exactly `5/6` — the cross-multiplication
`10·6 = 5·12`. -/
theorem diamond_orderingFractionIRat_eq :
    diamondOrderingFractionIRat = iFiveSixths := by
  apply Quotient.sound
  show Real.Internal.PreRat.equiv _ _
  unfold Real.Internal.PreRat.equiv
  decide

/-- The internal-real diamond ordering fraction is exactly `5/6`. -/
theorem diamond_orderingFractionReal_eq :
    diamondOrderingFractionReal = rFiveSixths := by
  unfold diamondOrderingFractionReal rFiveSixths
  rw [diamond_orderingFractionIRat_eq]

/-! ## (D) The bundled headline -/

/-- **The diamond's Myrheim–Meyer real interpretation.** The rational ordering fraction `r=5/6` has a
faithful internal-rational value and internal-real embedding, both equal to `5/6`. The dimension
`d_MM = f⁻¹(r)` itself remains red — it needs the `Γ` function and an inverse. -/
theorem diamond_myrheim_meyer_real_bridge :
    diamondOrderingFractionIRat = iFiveSixths
    ∧ diamondOrderingFractionReal = rFiveSixths :=
  ⟨diamond_orderingFractionIRat_eq, diamond_orderingFractionReal_eq⟩

end CausalSets.Dimension.Fingerprint
end Obsmetrologia
