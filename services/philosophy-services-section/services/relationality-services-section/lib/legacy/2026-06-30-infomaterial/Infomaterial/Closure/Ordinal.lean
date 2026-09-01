import Infomaterial.Closure.OrdinalCore
import Infomaterial.Closure.Regime

/-!
# Ordinal regimes — the four regimes read off the real ordinal

`OrdinalCore` generated the chain's own ordinal `Ord` (`zero | succ | limit`) with its
finite embedding, `isFinite`, and the limit-as-supremum law. `ClosureOrdinalRegime` carried
the four regimes as **Boolean metadata flags** — "Lean core has no transfinite ordinals".
That was a scoping: the transfinite was named but not built.

With the genuine ordinal in hand the four regimes are read off the **actual shape of `κ`**:
`isFinite` (a real recursion on the ordinal, replacing the free `finiteBase` Bool) splits
strict from the rest; the corpus's Scott-continuity and cofinality witnesses split the three
transfinite regimes. The Bool-flag `classify` of `ClosureOrdinalRegime` is then proven to be
the **projection** of reading the regime off the real ordinal (`regime_of_ord_refines_classify`).
-/

namespace Infomaterial
namespace Ord

/-! ## (D) Regime read off the real ordinal shape

`regimeOfOrd` reads the four-regime stratum from the genuine ordinal: `isFinite`
(a real recursion, not the free `finiteBase` flag) splits strict; the corpus's
Scott-continuity and cofinality witnesses split the three transfinite regimes — the
SAME two witnesses `ClosureRegimeData` uses, now over a real `κ`. -/

/-- Classify a settling by the **shape of its closure ordinal** `κ : Ord`: strict if
`κ` is finite (`κ < ω`); else Scott if the closure is Scott-continuous (`κ = ω`); else
transfinite-bounded if the cofinality is countable (`ω < κ < ω₁`); else aperiodic
(`κ ≥ ω₁`). The `finiteBase` Bool of `ClosureRegimeData` is replaced by the genuine
`isFinite κ`. -/
def regimeOfOrd (κ : Ord) (scottContinuous countableCofinality : Bool) : ClosureRegime :=
  if isFinite κ then ClosureRegime.strict
  else if scottContinuous then ClosureRegime.scott
  else if countableCofinality then ClosureRegime.transfiniteBounded
  else ClosureRegime.aperiodic

/-- **A finite closure ordinal is strict-regime.** `regimeOfOrd (ofNat n) _ _ = strict`
— the strict-finite regime is exactly the finite-ordinal shape, read off `κ` itself. -/
theorem finite_ord_is_strict (n : Nat) (sc cc : Bool) :
    regimeOfOrd (ofNat n) sc cc = ClosureRegime.strict := by
  simp [regimeOfOrd, ofNat_isFinite n]

/-- **`κ = ω` with a Scott-continuous closure is Scott-regime.** -/
theorem omega_scott_is_scott (cc : Bool) :
    regimeOfOrd omega true cc = ClosureRegime.scott := by
  simp [regimeOfOrd, omega_not_isFinite]

/-- **A non-Scott countable-cofinality limit ordinal is transfinite-bounded.** -/
theorem limit_countable_is_transfiniteBounded (f : Nat → Ord) :
    regimeOfOrd (limit f) false true = ClosureRegime.transfiniteBounded := by
  simp [regimeOfOrd, limit_not_isFinite]

/-- **A non-Scott uncountable-cofinality limit ordinal is aperiodic.** -/
theorem limit_uncountable_is_aperiodic (f : Nat → Ord) :
    regimeOfOrd (limit f) false false = ClosureRegime.aperiodic := by
  simp [regimeOfOrd, limit_not_isFinite]

/-! ## (E) The Bool-flag classifier is the projection of the real ordinal

`ClosureOrdinalRegime.classify` decided the regime from three free Booleans. We now
prove it is exactly `regimeOfOrd` read off a genuine ordinal whose finiteness matches
the `finiteBase` flag — so the flag classifier was the projection of the ordinal. -/

/-- **The Bool-flag classifier is the ordinal-shape classifier.** Given regime data `d`
and any ordinal `κ` whose real finiteness `isFinite κ` matches the `finiteBase` flag,
`regimeOfOrd κ` (over the same Scott/cofinality witnesses) agrees with `classify d`.
The genuine ordinal subsumes the metadata: `classify` is its projection. -/
theorem regime_of_ord_refines_classify
    (d : ClosureRegimeData) (κ : Ord) (hκ : isFinite κ = d.finiteBase) :
    regimeOfOrd κ d.scottContinuous d.countableCofinality = classify d := by
  obtain ⟨s, f, c, hsc, hcc⟩ := d
  simp only [regimeOfOrd, classify]
  rw [hκ]

/-! ## (F) Headline -/

/-- **The transfinite ordinal, internal to the chain.** Bundles the four
facts that retire the "Lean core has no transfinite ordinals" scoping:

* **(limit = LUB)** `f n ≤ limit f` and `limit f ≤ b` whenever every `f n ≤ b` — the
  limit ordinal IS the supremum of its fundamental sequence (settling-continuity's
  directed-join-at-limits, now a theorem over a real ordinal);
* **(finite = strict)** a finite closure ordinal `ofNat n` classifies to the strict
  regime, read off the ordinal's own `isFinite`, not a free flag;
* **(ω = Scott)** `ω` is non-finite and, Scott-continuous, classifies to the Scott
  regime;
* **(projection)** the old Bool-flag `classify` is exactly `regimeOfOrd` over any ordinal
  whose finiteness matches `finiteBase` — the metadata was the ordinal's projection.

Depends only on `propext` (`regime_of_ord_refines_classify` via `ClosureRegimeData`
proof fields). -/
theorem transfinite_ordinal_internal
    (f : Nat → Ord) (b : Ord) (n : Nat) (hb : ∀ m, Le (f m) b)
    (d : ClosureRegimeData) (κ : Ord) (hκ : isFinite κ = d.finiteBase) :
    (Le (f n) (limit f) ∧ Le (limit f) b)
    ∧ regimeOfOrd (ofNat n) d.scottContinuous d.countableCofinality = ClosureRegime.strict
    ∧ (isFinite omega = false ∧ regimeOfOrd omega true d.countableCofinality = ClosureRegime.scott)
    ∧ regimeOfOrd κ d.scottContinuous d.countableCofinality = classify d :=
  ⟨⟨fund_le_limit f n, limit_isLUB f b hb⟩,
   finite_ord_is_strict n _ _,
   ⟨omega_not_isFinite, omega_scott_is_scott _⟩,
   regime_of_ord_refines_classify d κ hκ⟩

end Ord
end Infomaterial
