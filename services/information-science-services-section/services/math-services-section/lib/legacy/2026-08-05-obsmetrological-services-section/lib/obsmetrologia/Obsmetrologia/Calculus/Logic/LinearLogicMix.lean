import Obsmetrologia.Calculus.Logic.LinearLogicChu
import Obsmetrologia.Language.Positing.TruthOrder

/-!
# LinearLogicMix — the par `⅋` on FOUR, the lax MIX, and exactly where they diverge

`LinearLogicChu` transported the fusion `⊙` and residual `⇒` to `Charge` and proved
the `⊗ ⊣ ⊸` adjunction over the truth order (`chargeFuse_tle_iff`), exhibiting FOUR
as ✳-autonomous. A ✳-autonomous alphabet carries a *second* multiplicative — the
**par** `⅋`, the De Morgan dual of the tensor through the linear involution
(`Charge.negate`): `a ⅋ b := ∼(∼a ⊙ ∼b)`. This module builds that par on `Charge`
and settles the MIX question at the alphabet level:

* `chargePar` — the par `⅋` on charges, `negate (chargeFuse (negate a) (negate b))`.
* `chargePar_comm`, `chargePar_negate` — commutativity and the De Morgan law
  `∼(a ⅋ b) = ∼a ⊙ ∼b`.
* `chargeMix` — **the lax MIX inequality** `a ⊙ b ≤ₜ a ⅋ b`, for every pair of
  charges: tensor never exceeds par in the truth order.
* `chargeMix_strict` — MIX is **not** an equality: `t ⊙ f = f` while `t ⅋ f = t`.
  FOUR's two multiplicatives genuinely differ; the alphabet is not compact.
* `chargePar_eq_chargeFuse_iff` — the exact divergence locus: `⅋` and `⊙` agree on
  a pair iff one side is `⊤ₖ` or the two sides are equal and not `⊥ₖ`. Equivalently,
  the strict gap is supported exactly on the pairs where at least one side is
  uncommitted (`⊥ₖ`, excluding the `⊥ₖ/⊤ₖ` pairing) or the two sides directly
  conflict (`t` against `f`).

The space-level question — tensor and par of `ChuSpace`s themselves, and whether a
canonical `A ⊗ B ⟶ A ⅋ B` transform exists with adjointness as FOUR-equality — is
not built here; this module settles the alphabet, on which any space-level mix must
evaluate entrywise.
-/

namespace Obsmetrologia

/-- **The par `⅋` on `Charge`** — the De Morgan dual of the fusion through the
linear involution: `a ⅋ b := ∼(∼a ⊙ ∼b)`. -/
def chargePar (a b : Charge) : Charge :=
  Charge.negate (chargeFuse (Charge.negate a) (Charge.negate b))

/-- `⅋` is commutative, inherited from the commutativity of `⊙`. -/
theorem chargePar_comm (a b : Charge) : chargePar a b = chargePar b a := by
  cases a <;> cases b <;> decide

/-- **De Morgan for the multiplicatives**: `∼(a ⅋ b) = ∼a ⊙ ∼b`. -/
theorem chargePar_negate (a b : Charge) :
    Charge.negate (chargePar a b) = chargeFuse (Charge.negate a) (Charge.negate b) := by
  cases a <;> cases b <;> decide

/-- **The lax MIX on FOUR**: `a ⊙ b ≤ₜ a ⅋ b` for every pair of charges. The
tensor never exceeds the par in the truth order. -/
theorem chargeMix (a b : Charge) : Charge.TLE (chargeFuse a b) (chargePar a b) := by
  cases a <;> cases b <;> decide

/-- **MIX is strict**: on the conflict pair the two multiplicatives disagree —
`t ⊙ f = f` while `t ⅋ f = t`. FOUR is ✳-autonomous but not compact: `⊗ ≠ ⅋`. -/
theorem chargeMix_strict :
    chargeFuse Charge.tTop Charge.tBot ≠ chargePar Charge.tTop Charge.tBot := by
  decide

/-- **The exact divergence locus of `⊙` and `⅋`**: they agree on `(a, b)` iff one
side is `⊤ₖ`, or `a = b` and neither is `⊥ₖ`. The strict MIX gap is therefore
supported exactly on the pairs with an uncommitted side (`⊥ₖ` against `⊥ₖ`, `t`,
or `f`) and on the direct conflicts (`t` against `f`). -/
theorem chargePar_eq_chargeFuse_iff (a b : Charge) :
    chargePar a b = chargeFuse a b ↔
      (a = Charge.kTop ∨ b = Charge.kTop ∨ (a = b ∧ a ≠ Charge.kBot)) := by
  cases a <;> cases b <;> decide

end Obsmetrologia
