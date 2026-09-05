import Infomaterial.Closure.Ordinal.Finite

/-!
# Closure 2-monad — KZ / lax-idempotence and the settling engine

The closure-2-monad `Cl` is the **operational engine of settling**: a KZ
(Kock–Zöberlein), *lax-idempotent* 2-monad with unit `η` (inclusion-into-closure =
inflation) and multiplication `μ` (nested-closure collapse). Lax-idempotence is
Kelly–Lack (K1): `μ ⊣ η_Cl` with identity counit, so being a `Cl`-algebra is a
*property*, not data (K2). The settling-endofunctor is `F_U(v) = Cl(v) ∨ₖ u_τ` —
saturate under consequences, then merge the increment.

This module derives the genuinely available, faithful **1-categorical reduction** of
that structure, connected to `Settling.Closure` and `ClosureOrdinal`:

1. **`kz_iff_strict`** — on the *antisymmetric* knowledge order, the KZ inequality
   `f(f a) ≤ₖ f a` is **equivalent** to strict idempotence `f(f a) = f a`. This is
   the order-theoretic reduction of *lax-idempotence + Scott-continuity ⟹ strict
   idempotence*: in a thin 2-category (a poset) antisymmetry forces strict; the
   genuine 2-cell `μ` only survives where antisymmetry fails (the aperiodic regime,
   κ ≥ ω₁, where the orbit never stabilizes and carries all KZ-diamond 2-cell data).
2. **`no_periodic_orbits`** — the closure has *no non-trivial periodic orbits*:
   `iter c k v = v` (k ≥ 1) ⟹ `c v = v`. Only period 1 (fixed points).
3. **`settleStep` / `settleStep_settles`** — the settling-endofunctor `F_U = Cl ∨ₖ u`
   is monotone-inflationary, so it reaches its fixed point in `≤ 3` steps
   (strict-finite regime, via `ClosureOrdinal`).

The two nuclei the aperiodic regime carries — **saturation** `σ` (past-facing) and
**transfer** `Δ` (future-facing), commuting via *commutating* `σΔ = Δσ` — are the
`NuclearSquare` of `Positing.Bigraded`, met here as the closure's KZ-diamond.

No free data.
-/

namespace Infomaterial
namespace Charge

/-- **KZ ⟺ strict, on a poset.** For a monotone-inflationary `f`, the Kock–Zöberlein
inequality `f(f a) ≤ₖ f a` (lax-idempotence) is equivalent to strict idempotence —
because the knowledge order is antisymmetric. This is the projection of *lax-idempotence
+ Scott-continuity ⟹ strict idempotence*: collapse happens exactly where the order
is thin. -/
theorem kz_iff_strict (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) :
    (∀ a, KLE (f (f a)) (f a)) ↔ (∀ a, f (f a) = f a) := by
  constructor
  · intro hkz a; exact kle_antisymm _ _ (hkz a) (hf (f a))
  · intro hstrict a; rw [hstrict a]; exact kle_refl _

/-- The orbit is monotone in the index: `iter f m v ≤ₖ iter f (m+d) v`. -/
theorem iter_le_add (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (v : Charge) (m : Nat) :
    ∀ d, KLE (iter f m v) (iter f (m + d) v)
  | 0 => kle_refl _
  | d + 1 => kle_trans _ _ _ (iter_le_add f hf v m d) (iter_step_le f hf v (m + d))

/-- **No non-trivial periodic orbits.** A closure operator has only period-1 orbits:
if iterating returns to the start, the start was already a fixed point. (The
dynamical face of lax-idempotence: the orbit ascends and cannot cycle.) -/
theorem no_periodic_orbits (c : Closure) (v : Charge) {k : Nat} (hk : 1 ≤ k)
    (h : iter c.op k v = v) : c.op v = v := by
  have hge : KLE v (c.op v) := c.infl v
  have hle : KLE (c.op v) v := by
    obtain ⟨d, rfl⟩ := Nat.le.dest hk
    have h1 := iter_le_add c.op c.infl v 1 d
    rw [h] at h1; exact h1
  exact kle_antisymm _ _ hle hge

/-! ## The settling-endofunctor `F_U = Cl ∨ₖ u` -/

/-- One settling step: saturate under the closure, then knowledge-join the external
increment `u`. The closure-2-monad is the inferential engine; `u` is the input. -/
def settleStep (c : Closure) (u : Charge) (v : Charge) : Charge := joinK (c.op v) u

/-- The settling step is inflationary: each step only adds knowledge. -/
theorem settleStep_infl (c : Closure) (u : Charge) (v : Charge) :
    KLE v (settleStep c u v) :=
  kle_trans _ _ _ (c.infl v) (le_joinK_left (c.op v) u)

/-- **Settling terminates.** The settling-endofunctor reaches its fixed point in `≤ 3`
steps — the strict-finite regime, via the closure-ordinal bound. -/
theorem settleStep_settles (c : Closure) (u : Charge) (v : Charge) :
    iter (settleStep c u) 3 v = iter (settleStep c u) 4 v :=
  settles_by_three (settleStep c u) (settleStep_infl c u) v

/-! ## The KZ monad data (η, μ) of a closure, and the K1 counit -/

/-- The unit `η` of the closure monad: inclusion-into-closure (inflation). -/
theorem unit (c : Closure) (v : Charge) : KLE v (c.op v) := c.infl v

/-- The multiplication `μ` of the closure monad: nested-closure collapse
(idempotence — the strict `μ`). -/
theorem mult (c : Closure) (v : Charge) : c.op (c.op v) = c.op v := c.idem v

/-- The Kelly–Lack (K1) counit triangle `μ · η_Cl = 1_Cl`: at `c v`, the composite
`c v →^η c(c v) →^μ c v` is the identity. Here it is exactly idempotence at `c v`. -/
theorem counit_triangle (c : Closure) (v : Charge) : c.op (c.op v) = c.op v := c.idem v

end Charge
end Infomaterial
