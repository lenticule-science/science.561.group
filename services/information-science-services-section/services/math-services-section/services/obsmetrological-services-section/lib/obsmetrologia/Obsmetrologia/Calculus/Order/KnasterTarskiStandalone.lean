import Obsmetrologia.Calculus.Order.OrderInfra

/-!
# KnasterTarskiStandalone — the fixed-point theorem on a complete lattice

The corpus places this exactly: under `settling/.../preorder/order/lattice/complete-lattice`
the [fixpoint](complete-lattice/content/fixpoint/fixpoint.md) node states the whole
content — for a **monotone** endo `f` on a complete lattice,

> the least fixed point is `lfp(f) = ⋀ {x : f(x) ≤ x}`, the meet of all *pre-fixpoints*,

and *that meet is itself a fixed point*, and it is the **least** one. Completeness is
the exact generating structure: strip it and the defining meet of pre-fixpoints need
not land in the order. This is "the destination [settling] computes": settling iterates
the monotone closure `◇∘□` and converges to the **least fixed point** of that closure
(the [closure-2-monad](../closure-2-monad/closure-2-monad.md) is the inferential engine;
`F_U(E) = Cl(E) ∨ₖ u`, and quiescence is `lfp`). Received Knaster–Tarski is the
degenerate specialization of *this* — order reached only by settling, completeness derived to
make the fixed point exist and be reachable.

This module is **standalone over `Obsmetrologia.Order.CompleteLattice`** (it needs no
finiteness — abstract over any complete lattice). It builds only on `OrderInfra`'s
`sInf`/`sSup` universal properties:

* `Mono C f` — `f` monotone in `C.le`;
* `lfp C f := C.sInf {x | C.le (f x) x}` — the meet of pre-fixpoints;
* `lfp_le_prefix`, `lfp_prefixpoint`, `f_lfp_le_lfp`, `lfp_le_f_lfp`, **`lfp_fixed`**;
* **`lfp_least`** — least over pre-fixpoints (hence over fixed points);
* the dual: `gfp C f := C.sSup {x | C.le x (f x)}`, **`gfp_fixed`**, **`gfp_greatest`**.

No free data.
-/

namespace Obsmetrologia
namespace Order
namespace CompleteLattice

variable (C : CompleteLattice)

/-! ## Monotone endomaps -/

/-- A self-map of the complete lattice that is **monotone** in `C.le`. This is the sole
hypothesis of Knaster–Tarski — no continuity, no finiteness. -/
structure Mono where
  f : C.carrier → C.carrier
  mono : ∀ {a b}, C.le a b → C.le (f a) (f b)

namespace Mono
variable {C}
variable (F : C.Mono)

/-! ## Pre-fixpoints and the least fixed point -/

/-- The set of **pre-fixpoints**: `x` with `f x ≤ x` (the points `f` does not push up). -/
def Prefix (x : C.carrier) : Prop := C.le (F.f x) x

/-- The **least fixed point** as the corpus defines it: `lfp f = ⋀ {x : f x ≤ x}`, the
meet of all pre-fixpoints. The meet exists because the lattice is complete. -/
def lfp : C.carrier := C.sInf (fun x => F.Prefix x)

/-- `lfp` is a **lower bound** of every pre-fixpoint: if `f x ≤ x` then `lfp ≤ x`. This is
just `sInf` being a lower bound. -/
theorem lfp_le_prefix {x : C.carrier} (hx : C.le (F.f x) x) : C.le F.lfp x :=
  C.sInf_le (fun x => F.Prefix x) x hx

/-- **Knaster–Tarski, step 1.** `lfp` is itself a pre-fixpoint: `f (lfp) ≤ lfp`.
Argument: for any pre-fixpoint `x`, `lfp ≤ x` (lower bound), so monotonicity gives
`f (lfp) ≤ f x ≤ x`; thus `f (lfp)` is a lower bound of the pre-fixpoints, and `lfp`,
being their *greatest* lower bound, dominates it. -/
theorem f_lfp_le_lfp : C.le (F.f F.lfp) F.lfp := by
  -- `f lfp` is a lower bound of the pre-fixpoint set.
  apply C.le_sInf
  intro x hx
  -- `hx : F.Prefix x`, i.e. `C.le (F.f x) x`.
  have h1 : C.le F.lfp x := F.lfp_le_prefix hx
  have h2 : C.le (F.f F.lfp) (F.f x) := F.mono h1
  exact C.le_trans h2 hx

/-- **Knaster–Tarski, step 2.** `lfp ≤ f (lfp)`. Apply `f` to step 1: monotonicity gives
`f (f lfp) ≤ f (lfp)`, so `f (lfp)` is *itself* a pre-fixpoint; `lfp`, the least lower
bound of all pre-fixpoints, is therefore `≤ f (lfp)`. -/
theorem lfp_le_f_lfp : C.le F.lfp (F.f F.lfp) := by
  have hpre : C.le (F.f (F.f F.lfp)) (F.f F.lfp) := F.mono F.f_lfp_le_lfp
  exact F.lfp_le_prefix hpre

/-- `lfp` is a pre-fixpoint (step 1, named for the spec). -/
theorem lfp_prefixpoint : F.Prefix F.lfp := F.f_lfp_le_lfp

/-- **Knaster–Tarski (the theorem).** `lfp` is a **fixed point**: `f (lfp) = lfp`. By
antisymmetry of the two inequalities. -/
theorem lfp_fixed : F.f F.lfp = F.lfp :=
  C.le_antisymm F.f_lfp_le_lfp F.lfp_le_f_lfp

/-! ## Leastness -/

/-- **`lfp` is the least pre-fixpoint** — and hence the least fixed point. Any `x` with
`f x ≤ x` satisfies `lfp ≤ x`; in particular any *fixed* point `f x = x` does. This is
the universal property that makes `lfp` *the* destination settling ascends to. -/
theorem lfp_least {x : C.carrier} (hx : C.le (F.f x) x) : C.le F.lfp x :=
  F.lfp_le_prefix hx

/-- The fixed-point specialization of `lfp_least`: any fixed point dominates `lfp`. -/
theorem lfp_least_of_fixed {x : C.carrier} (hx : F.f x = x) : C.le F.lfp x :=
  F.lfp_least (by rw [hx]; exact C.le_refl x)

/-! ## The dual: greatest fixed point -/

/-- The set of **post-fixpoints**: `x` with `x ≤ f x`. -/
def Postfix (x : C.carrier) : Prop := C.le x (F.f x)

/-- The **greatest fixed point**: `gfp f = ⋁ {x : x ≤ f x}`, the join of all post-fixpoints
(dual to `lfp`). The join exists by completeness. -/
def gfp : C.carrier := C.sSup (fun x => F.Postfix x)

/-- `gfp` is an **upper bound** of every post-fixpoint. -/
theorem postfix_le_gfp {x : C.carrier} (hx : C.le x (F.f x)) : C.le x F.gfp :=
  C.le_sSup (fun x => F.Postfix x) x hx

/-- Dual of step 1: `gfp ≤ f (gfp)`, i.e. `gfp` is itself a post-fixpoint. For any
post-fixpoint `x`, `x ≤ gfp` so `x ≤ f x ≤ f gfp`; thus `f gfp` is an upper bound of the
post-fixpoints and `gfp`, their least upper bound, is `≤ f gfp`. -/
theorem gfp_le_f_gfp : C.le F.gfp (F.f F.gfp) := by
  apply C.sSup_le
  intro x hx
  -- `hx : F.Postfix x`, i.e. `C.le x (F.f x)`.
  have h1 : C.le x F.gfp := F.postfix_le_gfp hx
  have h2 : C.le (F.f x) (F.f F.gfp) := F.mono h1
  exact C.le_trans hx h2

/-- Dual of step 2: `f (gfp) ≤ gfp`. `f gfp` is a post-fixpoint (`f gfp ≤ f (f gfp)` by
monotonicity), hence `≤ gfp`. -/
theorem f_gfp_le_gfp : C.le (F.f F.gfp) F.gfp := by
  have hpost : C.le (F.f F.gfp) (F.f (F.f F.gfp)) := F.mono F.gfp_le_f_gfp
  exact F.postfix_le_gfp hpost

/-- **Dual Knaster–Tarski.** `gfp` is a **fixed point**: `f (gfp) = gfp`. -/
theorem gfp_fixed : F.f F.gfp = F.gfp :=
  C.le_antisymm F.f_gfp_le_gfp F.gfp_le_f_gfp

/-- **`gfp` is the greatest post-fixpoint** — hence the greatest fixed point. Any `x`
with `x ≤ f x` satisfies `x ≤ gfp`; in particular any fixed point does. -/
theorem gfp_greatest {x : C.carrier} (hx : C.le x (F.f x)) : C.le x F.gfp :=
  F.postfix_le_gfp hx

/-- The fixed-point specialization of `gfp_greatest`. -/
theorem gfp_greatest_of_fixed {x : C.carrier} (hx : F.f x = x) : C.le x F.gfp :=
  F.gfp_greatest (by rw [hx]; exact C.le_refl x)

/-! ## lfp ≤ gfp — the two fixed points bracket the fixed-point lattice -/

/-- The least fixed point lies below the greatest: `lfp ≤ gfp`. `lfp` is a fixed point,
so it is a post-fixpoint, so it is `≤ gfp`. -/
theorem lfp_le_gfp : C.le F.lfp F.gfp :=
  F.gfp_greatest_of_fixed F.lfp_fixed

end Mono
end CompleteLattice
end Order
end Obsmetrologia
