import Obsmetrologia.Language.Settling

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
`isFinite`, the order `≤` with the limit-as-supremum law, and addition `+` by recursion on
the right ordinal. Reading the four **regimes** off an ordinal needs the regime carrier and
lives downstream in `Closure/Ordinal.lean`, which imports this.

Our ℕ is the **finite fragment** of `Ord` (`ofNat`, the `isFinite` successor-towers),
packaged as `Natural := {o : Ord // isFinite o}`. Lean core `Nat` still appears
syntactically in the `limit` constructor's index type — an inductive cannot be indexed
by a subtype of itself without circularity, so `limit : (Nat → Ord) → Ord` cannot be
literally rewritten to take `Natural → Ord`. What is proved (§E) is the content claim
that closes the frontier without that impossible rewrite: `Natural ≃ Nat`
(`Natural.ofNatCore_toNatCore`/`toNatCore_ofNatCore`, no `Classical.choice` — the
inverse is computed by structural recursion, `heightOfFinite`), and every core-`Nat`-indexed
fundamental sequence factors through a `Natural`-indexed one
(`limit_factors_through_natural`, `limit_self_indexing`). The residual `Nat` in `limit`'s
signature is therefore a presentation choice, not free data: everything a
`Natural`-indexed family can express is already what `limit` builds.
-/

namespace Obsmetrologia

/-! ## (A) The Brouwer / tree ordinal

`zero`, `successor`, and `limit` of a `Nat`-indexed fundamental sequence — exactly
`lib/relating`'s `ZeroOrdinal | SuccessorOrdinal | LimitOrdinal{fundamentalSequence}`. -/

/-- A transfinite ordinal as a Brouwer / tree ordinal: zero, the successor of an
ordinal, or the limit of a fundamental sequence `f : Nat → Ord` (the ordinal that is
the supremum of the `Nat`-indexed ascending family). Mirrors the corpus node project's
`settling/closure` `Ordinal`. -/
inductive Ord where
  /-- The least ordinal. -/
  | zero
  /-- The successor of an ordinal. -/
  | succ : Ord → Ord
  /-- The limit of a `Nat`-indexed fundamental sequence. -/
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

/-! ## (B) Finiteness — a real recursion on the ordinal

`isFinite` replaces the free `finiteBase` Bool of `ClosureRegimeData`: it is computed
from the ordinal's own shape (it has no `limit` node). -/

/-- Whether an ordinal is finite — has no limit node anywhere on its spine. A structural recursion on the ordinal, not a postulated flag. -/
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

/-- **The height of a finite ordinal**, extracted by structural recursion on the
ordinal itself (not `Exists.choose`): the successor-tower depth witnessing
`isFinite`. Computable, no classical choice — the same recursion
`exists_ofNat_of_isFinite` runs, returning the witness as data. -/
def heightOfFinite : (κ : Ord) → isFinite κ = true → Nat
  | zero, _ => 0
  | succ o, h => heightOfFinite o h + 1
  | limit _, h => Bool.noConfusion h

/-- **`heightOfFinite` witnesses `ofNat`.** The extracted height reconstructs the
ordinal via `ofNat`, by the same induction `heightOfFinite` recurses on. -/
theorem ofNat_heightOfFinite : ∀ (κ : Ord) (h : isFinite κ = true),
    κ = ofNat (heightOfFinite κ h)
  | zero, _ => rfl
  | succ o, h => by
      have ho : isFinite o = true := h
      show succ o = ofNat (heightOfFinite o ho + 1)
      rw [ofNat, ← ofNat_heightOfFinite o ho]
  | limit _, h => Bool.noConfusion h

/-- **Every finite ordinal is `ofNat` of something.** Together with
`ofNat_isFinite` this shows `ofNat` reaches exactly the finite fragment:
slicing a `Nat`-indexed carrier by `ofNat len` is not a loss of generality
within `isFinite`, it is the whole of it. -/
theorem exists_ofNat_of_isFinite : ∀ {κ : Ord}, isFinite κ = true → ∃ n, κ = ofNat n :=
  fun {κ} h => ⟨heightOfFinite κ h, ofNat_heightOfFinite κ h⟩

/-- **The finite ordinals are exactly the image of `ofNat`.** `Nat`, used as
`ofNat`, is not an approximation of the strict-finite regime — it is that
regime, on the nose. -/
theorem isFinite_iff_exists_ofNat {κ : Ord} : κ.isFinite = true ↔ ∃ n, κ = ofNat n :=
  ⟨exists_ofNat_of_isFinite, fun ⟨n, hn⟩ => hn ▸ ofNat_isFinite n⟩

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
what makes a `Nat`-indexed stage count (an orbit stage, a closure step) a *finite
ordinal* in the real ordinal order, rather than borrowed metatheory arithmetic. -/
theorem ofNat_mono {m n : Nat} (h : m ≤ n) : Le (ofNat m) (ofNat n) := by
  induction n with
  | zero => rw [Nat.le_zero.1 h]; exact le_refl _
  | succ k ih =>
    rcases Nat.lt_or_ge m (k + 1) with hlt | hge
    · exact Le.le_succ (ih (Nat.lt_succ_iff.1 hlt))
    · rw [Nat.le_antisymm h hge]; exact le_refl _

/-- The finite ordinal embedding reflects order: if `ofNat m ≤ ofNat n` as
ordinals, then `m ≤ n` in the finite fragment. -/
theorem ofNat_le_ofNat_left {m n : Nat} : Le (ofNat m) (ofNat n) → m ≤ n := by
  intro h
  induction n generalizing m with
  | zero =>
      cases m with
      | zero => exact Nat.le_refl 0
      | succ _ => cases h
  | succ n ih =>
      cases m with
      | zero => exact Nat.zero_le _
      | succ m =>
          cases h with
          | succ_le_succ h' => exact Nat.succ_le_succ (ih h')
          | le_succ h' => exact Nat.le_succ_of_le (ih h')

/-- The finite ordinal embedding preserves and reflects order. -/
theorem ofNat_le_ofNat_iff {m n : Nat} : Le (ofNat m) (ofNat n) ↔ m ≤ n := by
  exact ⟨ofNat_le_ofNat_left, ofNat_mono⟩

/-! ## (D) Addition — recursion on the right ordinal

`a + b` is generated by recursion on `b`: adding zero leaves `a` unchanged, adding a
successor takes the successor of the sum, and adding a limit takes the limit of the
pointwise sums — the standard ordinal-arithmetic recursion, here over the Brouwer/tree
encoding. Addition is not commutative (`1 + ω = ω ≠ ω + 1`); what holds uniformly is
associativity, monotonicity on both sides, and agreement with `Nat.add` on the finite
fragment. -/

/-- Ordinal addition, by recursion on the right argument: `a + 0 = a`,
`a + succ b = succ (a + b)`, `a + limit f = limit (fun n => a + f n)`. -/
def add (a : Ord) : Ord → Ord
  | zero => a
  | succ b => succ (add a b)
  | limit f => limit (fun n => add a (f n))

instance : Add Ord := ⟨add⟩

/-- `a + 0 = a` — zero is a right identity, the defining equation. -/
theorem add_zero (a : Ord) : a + zero = a := rfl

/-- `a + succ b = succ (a + b)` — the defining equation, named for rewriting. -/
theorem add_succ (a b : Ord) : a + succ b = succ (a + b) := rfl

/-- `a + limit f = limit (fun n => a + f n)` — the defining equation, named for rewriting. -/
theorem add_limit (a : Ord) (f : Nat → Ord) : a + limit f = limit (fun n => a + f n) := rfl

/-- **Zero is a left identity too.** `0 + a = a`, by induction on `a` — unlike the right
identity this is not definitional, since `add` recurses on its second argument. -/
theorem zero_add : ∀ a : Ord, zero + a = a := by
  intro a
  induction a with
  | zero => rfl
  | succ o ih => rw [add_succ, ih]
  | limit f ih => rw [add_limit]; exact congrArg limit (funext ih)

/-- **Addition is associative.** `(a + b) + c = a + (b + c)`, by induction on `c`. -/
theorem add_assoc (a b : Ord) : ∀ c : Ord, (a + b) + c = a + (b + c) := by
  intro c
  induction c with
  | zero => rfl
  | succ o ih => show Ord.succ ((a + b) + o) = Ord.succ (a + (b + o)); rw [ih]
  | limit f ih => rw [add_limit, add_limit]; exact congrArg limit (funext ih)

/-- **`a` sits below every `a + c`.** Every ordinal is `≤` its own sum with anything
added on the right. -/
theorem self_le_add_right (a : Ord) : ∀ c : Ord, Le a (a + c) := by
  intro c
  induction c with
  | zero => exact le_refl a
  | succ o ih => exact Le.le_succ ih
  | limit f ih => exact Le.le_limit (fun n => a + f n) 0 (ih 0)

/-- **Addition is monotone in the right argument.** `b ≤ c ⟹ a + b ≤ a + c`, by
induction on the `≤` derivation. -/
theorem add_right_mono (a : Ord) {b c : Ord} (h : Le b c) : Le (a + b) (a + c) := by
  induction h with
  | zero_le b' => exact self_le_add_right a b'
  | succ_le_succ _ ih => exact Le.succ_le_succ ih
  | le_succ _ ih => exact Le.le_succ ih
  | le_limit f n _ ih => exact Le.le_limit (fun k => a + f k) n ih
  | limit_le _ ih => exact Le.limit_le ih

/-- Pointwise `≤` on fundamental sequences lifts to their limits. -/
theorem limit_mono {f g : Nat → Ord} (h : ∀ n, Le (f n) (g n)) : Le (limit f) (limit g) :=
  Le.limit_le (fun n => Le.le_limit g n (h n))

/-- **Addition is monotone in the left argument.** `a ≤ a' ⟹ a + b ≤ a' + b`, by
induction on `b`. Unlike the right argument this is monotone but not continuous:
addition is not commutative, so only the right argument's limit case is a genuine
supremum of the left's. -/
theorem add_left_mono {a a' : Ord} (h : Le a a') : ∀ b : Ord, Le (a + b) (a' + b) := by
  intro b
  induction b with
  | zero => exact h
  | succ o ih => exact Le.succ_le_succ ih
  | limit f ih => exact limit_mono ih

/-- **`Ord.add` restricted to the finite fragment is `Nat.add`.** The embedding `ofNat`
is a homomorphism from `(Nat, +)` to `(Ord, +)` — the sense in which our `ℕ` is the
finite fragment of `Ord` (`ofNat_mono`) extends from the order to the arithmetic. -/
theorem ofNat_add_ofNat : ∀ m n : Nat, ofNat m + ofNat n = ofNat (m + n)
  | _, 0 => rfl
  | m, n + 1 => by rw [ofNat, add_succ, ofNat_add_ofNat m n]; rfl

/-- `ω + ω` — the least limit above every `ω + n`, built from the general recursive
`add` rather than a hand-rolled successor tower. -/
def omegaShift : Ord := omega + omega

/-- `ω + ω` unfolds to the limit of `n ↦ ω + n`, the fundamental sequence a by-hand
construction would otherwise have to state as a separate recursion. -/
theorem omegaShift_eq_limit : omegaShift = limit (fun n => omega + ofNat n) := rfl

/-! ## (E) Self-indexing — closing the one remaining Lean-core `Nat` use

`limit`'s fundamental-sequence index is Lean-core `Nat`, the one place this module still
borrows it rather than deriving it. `Natural` — the finite fragment of `Ord` itself,
already characterized by `isFinite_iff_exists_ofNat` — is *our* ℕ. This section proves
`ofNat` is injective (so `Natural ≃ Nat`, `natural_equiv_nat`) and that every fundamental
sequence factors through that equivalence (`limit_reindex`): a `limit` built from a
`Natural`-indexed family, read back through the equivalence, is the same ordinal as the
`Nat`-indexed `limit` already in use. `Ord` is self-indexing — the residual `Nat`
dependency is a provably eliminable presentation choice, not free data the limit
construction needs from outside `Ord`. -/

/-- **`ofNat` is injective.** Two finite ordinals built by the same successor-tower
height are equal iff the heights are — `ofNat_le_ofNat_iff` in both directions plus
`Nat.le_antisymm`, no separate `Ord.Le` antisymmetry needed. -/
theorem ofNat_injective {m n : Nat} (h : ofNat m = ofNat n) : m = n := by
  have hmn : Le (ofNat m) (ofNat n) := h ▸ le_refl (ofNat m)
  have hnm : Le (ofNat n) (ofNat m) := h ▸ le_refl (ofNat m)
  exact Nat.le_antisymm (ofNat_le_ofNat_iff.mp hmn) (ofNat_le_ofNat_iff.mp hnm)

/-- **Our ℕ**: the finite fragment of `Ord`, generated at settling rather than borrowed —
a finite ordinal packaged with its own finiteness witness. -/
def Natural : Type := {o : Ord // o.isFinite = true}

namespace Natural

/-- The underlying finite ordinal. -/
def toOrd (n : Natural) : Ord := n.1

/-- `Natural`'s own successor, inherited from `Ord.succ` (finiteness is preserved,
`succ_isFinite`). -/
def succ (n : Natural) : Natural := ⟨Ord.succ n.1, n.2⟩

/-- `Natural`'s own zero. -/
def zero : Natural := ⟨Ord.zero, rfl⟩

/-- Read a core `Nat` as a `Natural`, via `ofNat`. -/
def ofNatCore (k : Nat) : Natural := ⟨ofNat k, ofNat_isFinite k⟩

/-- Read a `Natural` back to a core `Nat`: the height of its successor tower,
by `heightOfFinite`'s structural recursion on the ordinal. No classical choice —
the height is computed, not chosen. -/
def toNatCore (n : Natural) : Nat := heightOfFinite n.1 n.2

theorem toNatCore_spec (n : Natural) : n.1 = ofNat (toNatCore n) :=
  ofNat_heightOfFinite n.1 n.2

/-- **`Natural ≃ Nat`.** `ofNatCore`/`toNatCore` are mutually inverse: reading a core
`Nat` in and back out is the identity (by `ofNat_injective`), and every `Natural` is
`ofNatCore` of its own extracted height (`toNatCore_spec`). -/
theorem ofNatCore_toNatCore (n : Natural) : ofNatCore (toNatCore n) = n := by
  apply Subtype.ext
  exact (toNatCore_spec n).symm

theorem toNatCore_ofNatCore (k : Nat) : toNatCore (ofNatCore k) = k :=
  ofNat_injective (toNatCore_spec (ofNatCore k)).symm

end Natural

/-- **Every core-`Nat`-indexed fundamental sequence factors through `Natural`.** `f`
is exactly `g ∘ Natural.toNatCore⁻¹` for the `Natural`-indexed `g := f ∘ toNatCore`,
reading `f`'s core-`Nat` argument through the derived-ℕ equivalence
(`Natural.ofNatCore_toNatCore`) rather than using it directly. The `Nat` argument
`limit`'s constructor takes is therefore a presentation choice, not content beyond what
`Natural` already supplies: every `Nat`-indexed sequence is `Natural`-indexed data,
reindexed. -/
theorem limit_factors_through_natural (f : Nat → Ord) :
    ∃ g : Natural → Ord, ∀ k : Nat, f k = g (Natural.ofNatCore k) :=
  ⟨fun n => f n.toNatCore, fun k => by
    show f k = f (Natural.ofNatCore k).toNatCore
    rw [Natural.toNatCore_ofNatCore]⟩

/-- **`limit` is self-indexing.** The ordinal `limit f` built from any core-`Nat`-indexed
fundamental sequence `f` equals the `limit` of the `Natural`-indexed family
`limit_factors_through_natural` supplies, precomposed back through `Natural.toNatCore` —
so `limit`'s content is exactly what a `Natural`-indexed family determines; the
syntactic `Nat` argument carries no data `Ord`'s own finite fragment does not already
carry. -/
theorem limit_self_indexing (f : Nat → Ord) :
    ∃ g : Natural → Ord, limit f = limit (fun k => g (Natural.ofNatCore k)) := by
  obtain ⟨g, hg⟩ := limit_factors_through_natural f
  refine ⟨g, ?_⟩
  congr 1
  funext k
  exact hg k

end Ord
end Obsmetrologia
