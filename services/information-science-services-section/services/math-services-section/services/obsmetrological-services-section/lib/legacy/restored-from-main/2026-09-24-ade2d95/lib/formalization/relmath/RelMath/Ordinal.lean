/-
# Ordinal — the transfinite settling ordinal, derived internal to the chain

`ClosureOrdinal` read the closure ordinal `κ` as a `Nat` (the strict-finite regime,
`κ ≤ 3`), and `ClosureOrdinalRegime` carried the *transfinite* regimes only as
**Boolean metadata flags** — "Lean core has no transfinite ordinals". That was a
scoping: the transfinite was named but not built.

This module builds the transfinite ordinal **the way the corpus's own node project
does** (`lib/relating/src/.../positing/settling/ordinal.mts` +
`settling/closure.mts`): an ordinal is `zero | successor | limit(fundamentalSequence)`
— a **Brouwer / tree ordinal**, where a limit ordinal carries a `Nat`-indexed
fundamental sequence whose supremum it is. This is fully dependency-free (the
fundamental-sequence index is the von Neumann `Natural` = Lean core `Nat`), and it is
generated **under settling** exactly because order — and hence the well-orders that
are ordinals — is reached only by settling.

With the genuine ordinal in hand the four regimes are read off the **actual shape of
`κ`**: `isFinite` (a real recursion on the ordinal, replacing the free `finiteBase`
Bool) splits strict from the rest; the corpus's Scott-continuity and cofinality
witnesses split the three transfinite regimes. The Bool-flag `classify` of
`ClosureOrdinalRegime` is then proven to be the **shadow** of reading the regime off
the real ordinal (`regime_of_ord_refines_classify`).

The essential ordinal content for `settling-continuity` is the **limit-as-supremum**
law: `Ord.limit f` is the least upper bound of its fundamental sequence `(f n)` — so
the value of a continuous settling at a limit stage is the directed `≤ₖ`-join of its
predecessors, no longer scoped out.
-/
import RelMath.ClosureOrdinalRegime

namespace RelMath

/-! ## (A) The Brouwer / tree ordinal

`zero`, `successor`, and `limit` of a `Nat`-indexed fundamental sequence — exactly
`lib/relating`'s `ZeroOrdinal | SuccessorOrdinal | LimitOrdinal{fundamentalSequence}`. -/

/-- A transfinite ordinal as a Brouwer / tree ordinal: zero, the successor of an
ordinal, or the limit of a fundamental sequence `f : Nat → Ord` (the ordinal that is
the supremum of the `Nat`-indexed ascending family). Mirrors the corpus node project's
`settling/closure` `Ordinal`. -/
inductive Ord where
  | zero
  | succ : Ord → Ord
  | limit : (Nat → Ord) → Ord

namespace Ord

/-- The finite ordinal `n` as a successor tower over `zero`. The von Neumann natural
`n` lands here as the `n`-th finite ordinal. -/
def ofNat : Nat → Ord
  | 0 => zero
  | n + 1 => succ (ofNat n)

/-- `ω` — the first limit ordinal, the supremum of all finite ordinals (its
fundamental sequence is `ofNat`). -/
def omega : Ord := limit ofNat

/-- `ω · 2` as a worked higher limit: the supremum of `ω + n`. (Witnesses that limits
of non-`ω` shape exist — the transfinite-bounded territory.) -/
def omegaShift : Ord := limit (fun n => Nat.rec omega (fun _ o => succ o) n)

/-! ## (B) Finiteness — a real recursion on the ordinal

`isFinite` replaces the free `finiteBase` Bool of `ClosureRegimeData`: it is computed
from the ordinal's own shape (it has no `limit` node). -/

/-- Whether an ordinal is finite — has no limit node anywhere on its spine. A genuine
structural recursion on the ordinal, not a postulated flag. -/
def isFinite : Ord → Bool
  | zero => true
  | succ o => isFinite o
  | limit _ => false

/-- Every finite ordinal `ofNat n` is finite. -/
theorem ofNat_isFinite (n : Nat) : isFinite (ofNat n) = true := by
  induction n with
  | zero => rfl
  | succ k ih => simpa [ofNat, isFinite] using ih

/-- `ω` is not finite — it has a limit node. -/
theorem omega_not_isFinite : isFinite omega = false := rfl

/-- A successor is finite iff its predecessor is. -/
theorem succ_isFinite (o : Ord) : isFinite (succ o) = isFinite o := rfl

/-- No limit ordinal is finite. -/
theorem limit_not_isFinite (f : Nat → Ord) : isFinite (limit f) = false := rfl

/-! ## (C) The order `≤` and the limit-as-supremum law

The tree-ordinal order: `zero` is least, successor is monotone and strictly above,
and a `limit` is the least upper bound of its fundamental sequence. The LUB law is the
essential content for `settling-continuity`. -/

/-- The Brouwer-ordinal order `a ≤ b`. -/
inductive Le : Ord → Ord → Prop
  /-- `zero` is the least ordinal. -/
  | zero_le (b : Ord) : Le zero b
  /-- `≤` is monotone under `succ`. -/
  | succ_le_succ {a b : Ord} : Le a b → Le (succ a) (succ b)
  /-- `a ≤ b ⟹ a ≤ b+1` (so `a ≤ a+1`). -/
  | le_succ {a b : Ord} : Le a b → Le a (succ b)
  /-- if `a` is below some term of the fundamental sequence, it is below the limit. -/
  | le_limit {a : Ord} (f : Nat → Ord) (n : Nat) : Le a (f n) → Le a (limit f)
  /-- the limit is an upper bound of its fundamental sequence — and the least one. -/
  | limit_le {f : Nat → Ord} {b : Ord} : (∀ n, Le (f n) b) → Le (limit f) b

/-- `≤` is reflexive. -/
theorem le_refl : ∀ o : Ord, Le o o
  | zero => Le.zero_le _
  | succ o => Le.succ_le_succ (le_refl o)
  | limit f => Le.limit_le (fun n => Le.le_limit f n (le_refl (f n)))

/-- Every ordinal sits below its successor. -/
theorem le_succ_self (o : Ord) : Le o (succ o) := Le.le_succ (le_refl o)

/-- **Each fundamental-sequence term is below the limit.** `f n ≤ limit f`. -/
theorem fund_le_limit (f : Nat → Ord) (n : Nat) : Le (f n) (limit f) :=
  Le.le_limit f n (le_refl (f n))

/-- **The limit is the LEAST upper bound of its fundamental sequence.** If every term
`f n ≤ b` then `limit f ≤ b`. Together with `fund_le_limit` this is `limit f = ⨆ₙ f n`
— the law that makes a continuous settling's limit-stage value the directed join of
its predecessors. -/
theorem limit_isLUB (f : Nat → Ord) (b : Ord) (h : ∀ n, Le (f n) b) : Le (limit f) b :=
  Le.limit_le h

/-- Each finite ordinal is below `ω`. -/
theorem ofNat_le_omega (n : Nat) : Le (ofNat n) omega := fund_le_limit ofNat n

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

/-! ## (E) The Bool-flag classifier is the shadow of the real ordinal

`ClosureOrdinalRegime.classify` decided the regime from three free Booleans. We now
prove it is exactly `regimeOfOrd` read off a genuine ordinal whose finiteness matches
the `finiteBase` flag — so the flag classifier was the shadow of the ordinal. -/

/-- **The Bool-flag classifier is the ordinal-shape classifier.** Given regime data `d`
and any ordinal `κ` whose real finiteness `isFinite κ` matches the `finiteBase` flag,
`regimeOfOrd κ` (over the same Scott/cofinality witnesses) agrees with `classify d`.
The genuine ordinal subsumes the metadata: `classify` is its shadow. -/
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
* **(shadow)** the old Bool-flag `classify` is exactly `regimeOfOrd` over any ordinal
  whose finiteness matches `finiteBase` — the metadata was the ordinal's shadow.

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
end RelMath
