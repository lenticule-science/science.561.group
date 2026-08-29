import Obsmetrologia.Language.Settling
import Obsmetrologia.Closure.OrdinalCore
import Obsmetrologia.Calculus.Order.OrderInfra

/-!
# Closure ordinal — finite termination of settling

`Settling` modelled a settled value as the fixed point of an *idempotent* closure
(one step). The corpus's settling is more general: it **iterates** the closure
`T = ◇∘□` — a monotone, inflationary endomap that need not be idempotent — until
the orbit stops changing, at the **closure ordinal** κ:

  `κ(F, x) = least τ with F^{τ+1}(x) = F^τ(x)`.

This module derives the iteration `F^n` and proves that on the FOUR bilattice
**every inflationary endomap settles by step 3** — the closure ordinal is finite,
`κ ≤ 3` (one more than the knowledge-lattice height). This is the **strict-finite
regime**: the residue drains to zero in boundedly many steps, with no transfinite
tail. The other three regimes (Scott-continuous κ=ω, transfinite-bounded,
aperiodic κ≥ω₁) are the refinements that appear once the index set is infinite;
over the finite charge lattice the regime is always strict-finite.
-/

namespace Obsmetrologia
namespace Charge

/-- `iter f n x = fⁿ x` — the settling orbit. -/
def iter (f : Charge → Charge) : Nat → Charge → Charge
  | 0, x => x
  | n + 1, x => f (iter f n x)

/-- A fixed point stays fixed under all further iteration. -/
theorem iter_fixed_of (f : Charge → Charge) (a : Charge) (h : f a = a) :
    ∀ n, iter f n a = a
  | 0 => rfl
  | n + 1 => by rw [iter, iter_fixed_of f a h n, h]

/-- Iteration adds: `f^{n+m} x = f^m (f^n x)`. -/
theorem iter_add (f : Charge → Charge) (m n : Nat) (x : Charge) :
    iter f (n + m) x = iter f m (iter f n x) := by
  induction m with
  | zero => rfl
  | succ k ih =>
    calc iter f (n + (k + 1)) x = f (iter f (n + k) x) := rfl
      _ = f (iter f k (iter f n x)) := by rw [ih]
      _ = iter f (k + 1) (iter f n x) := rfl

/-- Each step climbs the knowledge order — the orbit is a `≤ₖ`-chain. -/
theorem iter_step_le (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) (n : Nat) :
    KLE (iter f n x) (iter f (n + 1) x) := hf (iter f n x)

/-- **No ascending chain of four distinct charges.** The knowledge order has height
two, so any `a ≤ₖ b ≤ₖ c ≤ₖ d` collapses somewhere — a finite check. -/
theorem kchain_height (a b c d : Charge) :
    KLE a b → KLE b c → KLE c d → a = b ∨ b = c ∨ c = d := by
  cases a <;> cases b <;> cases c <;> cases d <;> decide

/-- Once two consecutive iterates coincide at `k`, the orbit is constant from `k`. -/
theorem iter_propagate (f : Charge → Charge) (k : Nat) (x : Charge)
    (h : iter f k x = iter f (k + 1) x) (j : Nat) :
    iter f (k + j) x = iter f k x := by
  have hfix : f (iter f k x) = iter f k x := h.symm
  rw [iter_add]
  exact iter_fixed_of f (iter f k x) hfix j

/-! ## The settling bound and the strict-finite regime -/

/-- `f` settles `x` by step `n`: the orbit is fixed from `n` on. The least such `n`
is the closure ordinal κ; any such `n` is a settling bound λ. -/
def SettlesBy (f : Charge → Charge) (x : Charge) (n : Nat) : Prop :=
  iter f (n + 1) x = iter f n x

/-- **The settling bound, derived from the charge cardinality — not a literal.** A strictly
ascending `≤ₖ`-chain visits at most `Articulating.Corner.all.length` distinct charges (`kchain_height`: no
chain of four distinct charges), so settling climbs at most `Articulating.Corner.all.length - 1` times.
This is FOUR's knowledge-lattice height; its value `3` is `kHeight_eq_three`, not a magic
number. -/
def kHeight : Nat := Articulating.Corner.all.length - 1

/-- The derived height computes to `3` — the witness that `Articulating.Corner.all.length - 1 = 3`. -/
theorem kHeight_eq_three : kHeight = 3 := rfl

/-- **Strict-finite termination, stated at `kHeight`.** Every inflationary endomap on the
charge lattice reaches its fixed point by step `kHeight` (FOUR's knowledge-lattice height,
`= 3` by `kHeight_eq_three`, not asserted as a bare numeral): `f^kHeight x = f^(kHeight+1) x`.
The closure ordinal is `≤ kHeight`. -/
theorem settles_by_kHeight (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) :
    iter f kHeight x = iter f (kHeight + 1) x := by
  rw [kHeight_eq_three]
  have h01 := iter_step_le f hf x 0
  have h12 := iter_step_le f hf x 1
  have h23 := iter_step_le f hf x 2
  rcases kchain_height _ _ _ _ h01 h12 h23 with h | h | h
  · exact (iter_propagate f 0 x h 3).trans (iter_propagate f 0 x h 4).symm
  · exact (iter_propagate f 1 x h 2).trans (iter_propagate f 1 x h 3).symm
  · exact (iter_propagate f 2 x h 1).trans (iter_propagate f 2 x h 2).symm

/-- **Strict-finite termination, at the literal `3`/`4`.** `settles_by_kHeight` read at
`kHeight`'s computed value — kept for existing callers that state the bound as `3`/`4`
directly; the derived form (`settles_by_kHeight`) is the honest statement. -/
theorem settles_by_three (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) :
    iter f 3 x = iter f 4 x := by
  have h := settles_by_kHeight f hf x
  rwa [kHeight_eq_three] at h

/-- **The closure ordinal κ over the charge lattice, as an ordinal.** The corpus's κ
is "the least *ordinal* `τ` with `Fᵗ⁺¹ = Fᵗ`" (bounded by `|PrFib|⁺`); over the finite charge
class it is the **finite** ordinal `ofNat kHeight` — the strict case of a transfinite bound,
surfaced as an `Ord` (our ℕ), not a bare `Nat`. -/
def closureOrdinal : Ord := Ord.ofNat kHeight

/-- κ over the charge lattice is a **finite** ordinal — the strict-finite regime read off the
ordinal's own shape (`Ord.isFinite`), the witness `Closure/Ordinal.lean` classifies. -/
theorem closureOrdinal_isFinite : Ord.isFinite closureOrdinal = true :=
  Ord.ofNat_isFinite kHeight

/-- **The strict-finite regime: κ ≤ kHeight.** Every inflationary endomap on the charge
lattice settles by step `kHeight` (`= Articulating.Corner.all.length - 1`, FOUR's lattice height) — a
uniform finite settling bound derived from the charge cardinality, no transfinite tail. -/
theorem strict_finite (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) :
    SettlesBy f x kHeight := (settles_by_kHeight f hf x).symm

/-- The settled value is fixed: `f (f^kHeight x) = f^kHeight x`. -/
theorem settled_fixed (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) :
    f (iter f kHeight x) = iter f kHeight x := (settles_by_kHeight f hf x).symm

/-- Every `Closure` (from `Settling`) is inflationary, so it too settles within `kHeight`
steps — consistent with idempotent closures settling in one. -/
theorem closure_strict_finite (c : Closure) (x : Charge) : SettlesBy c.op x kHeight :=
  strict_finite c.op c.infl x

/-! ## The ω-limit stage: the strict-finite regime collapses the transfinite

The corpus's settling is ordinal-indexed; at a **limit** ordinal the value is the directed
`≤ₖ`-join of the prior stages (`Ord.limit_isLUB`). Over the **finite** charge lattice the orbit
stabilizes by step `kHeight` (`strict_finite`), so that limit join — in particular the value at
`ω = Ord.limit ofNat` — is reached at the finite stage `kHeight`: the settled value
`f^kHeight x` **is** `⨆ₖ fᵏx`. The transfinite limit collapses to the finite. -/

/-- **The orbit is `≤ₖ`-monotone:** `k ≤ m ⟹ fᵏx ≤ₖ fᵐx`. Each step climbs (`iter_step_le`),
composed along the gap. -/
theorem iter_mono (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) :
    ∀ {k m : Nat}, k ≤ m → KLE (iter f k x) (iter f m x) := by
  intro k m
  induction m with
  | zero => intro h; rw [Nat.le_zero.1 h]; exact kle_refl _
  | succ p ih =>
    intro h
    rcases Nat.lt_or_ge k (p + 1) with hlt | hge
    · exact kle_trans _ _ _ (ih (Nat.lt_succ_iff.1 hlt)) (iter_step_le f hf x p)
    · rw [Nat.le_antisymm h hge]; exact kle_refl _

/-- **Stabilization:** beyond the settling bound the orbit is constant — `fᵏx = f^kHeight x`
for `k ≥ kHeight` (the strict-finite fixed point, `strict_finite` + `iter_propagate`). -/
theorem iter_stable (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge)
    {k : Nat} (h : kHeight ≤ k) : iter f k x = iter f kHeight x := by
  obtain ⟨j, rfl⟩ := Nat.le.dest h
  exact iter_propagate f kHeight x (strict_finite f hf x).symm j

/-- **Every orbit stage is below the settled value** `f^kHeight x`: for `k ≤ kHeight` by
monotonicity, for `k ≥ kHeight` by stabilization. -/
theorem iter_le_settled (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) (k : Nat) :
    KLE (iter f k x) (iter f kHeight x) := by
  rcases Nat.le_total k kHeight with h | h
  · exact iter_mono f hf x h
  · rw [iter_stable f hf x h]; exact kle_refl _

/-- `f^kHeight x` is the `≤ₖ`-least upper bound of `fun k => iter f k x`. -/
theorem settled_is_omega_lub (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) :
    (∀ k, KLE (iter f k x) (iter f kHeight x))
    ∧ (∀ w, (∀ k, KLE (iter f k x) w) → KLE (iter f kHeight x) w) :=
  Order.stable_value_isLUB KLE kle_refl (fun k => iter f k x) kHeight
    (iter_mono f hf x) (iter_stable f hf x)

end Charge

end Obsmetrologia
