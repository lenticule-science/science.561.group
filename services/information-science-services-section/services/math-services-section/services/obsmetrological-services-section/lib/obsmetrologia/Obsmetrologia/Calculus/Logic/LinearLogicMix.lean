import Obsmetrologia.Calculus.Logic.LinearLogicChu
import Obsmetrologia.Language.Positing.TruthOrder

/-!
# LinearLogicMix — the par `⅋` on FOUR, the lax MIX, and exactly where they diverge

`LinearLogicChu` transported the fusion `⊙` and residual `⇒` to `Reading` and proved
the `⊗ ⊣ ⊸` adjunction over the truth order (`readingFuse_tle_iff`), exhibiting FOUR
as ✳-autonomous. A ✳-autonomous alphabet carries a *second* multiplicative — the
**par** `⅋`, the De Morgan dual of the tensor through the linear involution
(`Reading.negate`): `a ⅋ b := ∼(∼a ⊙ ∼b)`. This module builds that par on `Reading`
and settles the MIX question at the alphabet level:

* `readingPar` — the par `⅋` on readings, `negate (readingFuse (negate a) (negate b))`.
* `readingPar_comm`, `readingPar_negate` — commutativity and the De Morgan law
  `∼(a ⅋ b) = ∼a ⊙ ∼b`.
* `readingMix` — **the lax MIX inequality** `a ⊙ b ≤ₜ a ⅋ b`, for every pair of
  readings: tensor never exceeds par in the truth order.
* `readingMix_strict` — MIX is **not** an equality: `t ⊙ f = f` while `t ⅋ f = t`.
  FOUR's two multiplicatives genuinely differ; the alphabet is not compact.
* `readingPar_eq_readingFuse_iff` — the exact divergence locus: `⅋` and `⊙` agree on
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

/-- **The par `⅋` on `Reading`** — the De Morgan dual of the fusion through the
linear involution: `a ⅋ b := ∼(∼a ⊙ ∼b)`. -/
def readingPar (a b : Reading) : Reading :=
  Reading.negate (readingFuse (Reading.negate a) (Reading.negate b))

/-- `⅋` is commutative, inherited from the commutativity of `⊙`. -/
theorem readingPar_comm (a b : Reading) : readingPar a b = readingPar b a := by
  cases a <;> cases b <;> decide

/-- **De Morgan for the multiplicatives**: `∼(a ⅋ b) = ∼a ⊙ ∼b`. -/
theorem readingPar_negate (a b : Reading) :
    Reading.negate (readingPar a b) = readingFuse (Reading.negate a) (Reading.negate b) := by
  cases a <;> cases b <;> decide

/-- **The lax MIX on FOUR**: `a ⊙ b ≤ₜ a ⅋ b` for every pair of readings. The
tensor never exceeds the par in the truth order. -/
theorem readingMix (a b : Reading) : Reading.TLE (readingFuse a b) (readingPar a b) := by
  cases a <;> cases b <;> decide

/-- **MIX is strict**: on the conflict pair the two multiplicatives disagree —
`t ⊙ f = f` while `t ⅋ f = t`. FOUR is ✳-autonomous but not compact: `⊗ ≠ ⅋`. -/
theorem readingMix_strict :
    readingFuse Reading.tTop Reading.tBot ≠ readingPar Reading.tTop Reading.tBot := by
  decide

/-- **The exact divergence locus of `⊙` and `⅋`**: they agree on `(a, b)` iff one
side is `⊤ₖ`, or `a = b` and neither is `⊥ₖ`. The strict MIX gap is therefore
supported exactly on the pairs with an uncommitted side (`⊥ₖ` against `⊥ₖ`, `t`,
or `f`) and on the direct conflicts (`t` against `f`). -/
theorem readingPar_eq_readingFuse_iff (a b : Reading) :
    readingPar a b = readingFuse a b ↔
      (a = Reading.kTop ∨ b = Reading.kTop ∨ (a = b ∧ a ≠ Reading.kBot)) := by
  cases a <;> cases b <;> decide

end Obsmetrologia
