import Infomaterial.Language.Settling

/-!
# Ordinal (core) — the chain's own number, generated at settling

The corpus's closure ordinal is "the least **ordinal** `τ` with `Fᵗ⁺¹ = Fᵗ`", bounded by
`|PrFib|⁺` (`content/.../settling/closure-ordinal`). So the number that counts settling
stages is **ordinal from birth**, transfinite-capable; the strict-finite `κ ≤ 3` over the
FOUR lattice is only its restriction to a finite object class. This module generates that
ordinal — `Ord` = `zero | succ | limit(fundamentalSequence)` (the Brouwer / tree ordinal of
`lib/relating`'s `settling/closure`) — at the settling stage, *before* the closure ordinal
that consumes it, so `κ` can be ordinal-valued where it is first defined.

It carries only the bare ordinal: the type, the finite embedding `ofNat`, `ω`, structural
`isFinite`, and the order `≤` with the limit-as-supremum law. Reading the four **regimes**
off an ordinal needs the regime carrier and lives downstream in `Closure/Ordinal.lean`,
which imports this.

Our ℕ is the **finite fragment** of `Ord` (`ofNat`, the `isFinite` successor-towers). The one
place Lean core `Nat` still appears is the limit's fundamental-sequence index
(`limit : (Nat → Ord) → Ord`): the standing frontier where `Ord` is not yet shown to index
itself by its own finite fragment.
-/

namespace Infomaterial

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

/-- **`ofNat` is monotone** — the finite ordinals embed `Nat`'s order into `Ord`. This is
what makes a `Nat`-indexed stage count (an orbit stage, a closure step) genuinely a *finite
ordinal* in the real ordinal order, rather than borrowed metatheory arithmetic. -/
theorem ofNat_mono {m n : Nat} (h : m ≤ n) : Le (ofNat m) (ofNat n) := by
  induction n with
  | zero => rw [Nat.le_zero.1 h]; exact le_refl _
  | succ k ih =>
    rcases Nat.lt_or_ge m (k + 1) with hlt | hge
    · exact Le.le_succ (ih (Nat.lt_succ_iff.1 hlt))
    · rw [Nat.le_antisymm h hge]; exact le_refl _

end Ord
end Infomaterial
