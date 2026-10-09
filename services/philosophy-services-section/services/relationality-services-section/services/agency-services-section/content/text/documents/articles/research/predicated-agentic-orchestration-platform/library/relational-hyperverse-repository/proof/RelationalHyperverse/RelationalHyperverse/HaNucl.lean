import Mathlib.Order.Heyting.Basic
import Mathlib.Order.Lattice

-- Establishes: nuclear-heyting-algebra

/-!
# HaNucl: nucleus on a Heyting algebra

Corresponds to `math/nuclear-heyting-algebra.md`.

A **nucleus** on a lattice `H` is a map `j : H → H` satisfying:
- **Extensivity**: `a ≤ j a`
- **Idempotency**: `j (j a) = j a`
- **Monotonicity**: `a ≤ b → j a ≤ j b`
- **Meet-preservation**: `j (a ⊓ b) = j a ⊓ j b`

The fixed-point set `Fix(j) = {a | j(a) = a}` inherits the lattice structure from H and
carries a sub-Heyting-algebra structure when H is a HeytingAlgebra.

Note: monotonicity follows from meet-preservation and extensivity, but we include it
explicitly for convenience. Use `Nucleus.mk'` to construct a Nucleus from only 3 axioms.

## Main definitions
- `Nucleus H` : the nucleus structure on H
- `Nucleus.fixedPoints j` : the fixed-point set Fix(j)
- `Nucleus.mk'` : construct a nucleus from extensivity, idempotency, meet-preservation
  (monotonicity is derived)

## Main results
- `Nucleus.monotone_of_meet_pres` : monotonicity is derivable from extensivity + meet-pres
- `Nucleus.fixedPoints_inf_closed` : Fix(j) is closed under ⊓
- `Nucleus.image_subset_fixed` : j(a) ∈ Fix(j) (reflection property)
- `Nucleus.le_fixed_of_le` : j(a) is the least fixed point above a
- `Nucleus.absorb_join` : j(j(a) ⊔ b) = j(a ⊔ b)  (R8/R9 absorption)
- `Nucleus.absorb_join_meet` : j(j(a) ⊓ j(b) ⊔ c) = j(a ⊓ b ⊔ c)  (R16 closure)
- `Nucleus.himp_fixed_of_fixed` : Fix(j) is closed under Heyting implication
-/

/-- A nucleus on a semilattice: monotone, extensive, idempotent, meet-preserving.

    This is the central algebraic object of `math/nuclear-heyting-algebra.md`. Every fiber algebra
    H_t carries two nuclei (σ_t, Δ_t); the category HA_nucl has nuclei as its objects. -/
structure Nucleus (H : Type*) [SemilatticeInf H] where
  toFun      : H → H
  extensive  : ∀ a, a ≤ toFun a
  idempotent : ∀ a, toFun (toFun a) = toFun a
  monotone   : ∀ {a b}, a ≤ b → toFun a ≤ toFun b
  meet_pres  : ∀ a b, toFun (a ⊓ b) = toFun a ⊓ toFun b

-- ── Derived: monotone from meet-pres alone ────────────────────────────────────

/-- Monotonicity is derivable from meet-preservation alone.

    If `a ≤ b`, then `a ⊓ b = a`, so `f(a) = f(a ⊓ b) = f(a) ⊓ f(b) ≤ f(b)`.
    This shows the `monotone` field of `Nucleus` is redundant — it follows from
    `meet_pres` without needing `extensive`. Use `Nucleus.mk'` to avoid providing it. -/
theorem monotone_of_meet_pres {H : Type*} [SemilatticeInf H]
    (toFun : H → H)
    (meet_pres : ∀ a b, toFun (a ⊓ b) = toFun a ⊓ toFun b)
    {a b : H} (h : a ≤ b) : toFun a ≤ toFun b := by
  have key : toFun a = toFun a ⊓ toFun b := by
    rw [← meet_pres, inf_of_le_left h]
  rw [key]
  exact inf_le_right

/-- Construct a `Nucleus` from extensivity, idempotency, and meet-preservation alone.
    Monotonicity is derived via `monotone_of_meet_pres`. -/
def Nucleus.mk' {H : Type*} [SemilatticeInf H]
    (toFun : H → H)
    (extensive : ∀ a, a ≤ toFun a)
    (idempotent : ∀ a, toFun (toFun a) = toFun a)
    (meet_pres : ∀ a b, toFun (a ⊓ b) = toFun a ⊓ toFun b) : Nucleus H where
  toFun      := toFun
  extensive  := extensive
  idempotent := idempotent
  monotone   := monotone_of_meet_pres toFun meet_pres
  meet_pres  := meet_pres

namespace Nucleus

variable {H : Type*}

section SemilatticeInf

variable [SemilatticeInf H] (j : Nucleus H)

/-- The fixed-point set of a nucleus. -/
def fixedPoints : Set H := {a | j.toFun a = a}

@[simp]
theorem mem_fixedPoints {a : H} : a ∈ j.fixedPoints ↔ j.toFun a = a :=
  Iff.rfl

/-- Fixed points are closed under binary meets. -/
theorem fixedPoints_inf_closed {a b : H}
    (ha : a ∈ j.fixedPoints) (hb : b ∈ j.fixedPoints) : a ⊓ b ∈ j.fixedPoints := by
  simp only [mem_fixedPoints] at *
  rw [j.meet_pres, ha, hb]

/-- Every element in the image of j is a fixed point. -/
theorem image_subset_fixed (a : H) : j.toFun a ∈ j.fixedPoints := by
  simp only [mem_fixedPoints]
  exact j.idempotent a

/-- j(a) is the least fixed point above a:
    if a ≤ c and c is a fixed point, then j(a) ≤ c. -/
theorem le_fixed_of_le {a c : H} (hac : a ≤ c) (hc : c ∈ j.fixedPoints) :
    j.toFun a ≤ c := by
  simp only [mem_fixedPoints] at hc
  calc j.toFun a ≤ j.toFun c := j.monotone hac
    _ = c := hc

end SemilatticeInf

section Lattice

variable [Lattice H] (j : Nucleus H)

/-- The key absorption identity: j(j(a) ⊔ b) = j(a ⊔ b).

    This is the semantic content of reduction rules R8/R9 in `math/normalization.md`.
    Proof: both directions from nucleus axioms (extensivity + monotonicity). -/
theorem absorb_join (a b : H) : j.toFun (j.toFun a ⊔ b) = j.toFun (a ⊔ b) := by
  apply le_antisymm
  · calc j.toFun (j.toFun a ⊔ b)
        ≤ j.toFun (j.toFun (a ⊔ b)) := by
          apply j.monotone
          exact sup_le (j.monotone le_sup_left)
                       (le_trans le_sup_right (j.extensive _))
      _ = j.toFun (a ⊔ b) := j.idempotent _
  · apply j.monotone
    exact sup_le (le_trans (j.extensive a) le_sup_left) le_sup_right

/-- Symmetric form: j(b ⊔ j(a)) = j(b ⊔ a). -/
theorem absorb_join' (a b : H) : j.toFun (b ⊔ j.toFun a) = j.toFun (b ⊔ a) := by
  rw [sup_comm, absorb_join, sup_comm]

/-- Rule R16: j(j(a) ⊓ j(b) ⊔ c) = j(a ⊓ b ⊔ c).

    Closes the R3/R8 critical pair in `math/normalization.md`.
    Proof: j(a) ⊓ j(b) = j(a ⊓ b) by meet-preservation, then absorb_join. -/
theorem absorb_join_meet (a b c : H) :
    j.toFun (j.toFun a ⊓ j.toFun b ⊔ c) = j.toFun (a ⊓ b ⊔ c) := by
  rw [← j.meet_pres, j.absorb_join]

end Lattice

-- ── HeytingAlgebra results ────────────────────────────────────────────────────

section HeytingAlgebra

variable [HeytingAlgebra H] (j : Nucleus H)

/-- A nucleus always maps ⊤ to ⊤.
    Proof: j(⊤) ≤ ⊤ trivially; ⊤ ≤ j(⊤) by extensivity. -/
theorem top_fixed : j.toFun ⊤ = ⊤ :=
  le_antisymm le_top (j.extensive ⊤)

/-- A nucleus preserves Heyting implication at fixed points:
    if j(a) = a and j(b) = b, then j(a ⇨ b) = a ⇨ b.

    This is the key lemma for the sub-HA property of Fix(j), as required by
    `math/nuclear-heyting-algebra.md` (the HA_nucl category has HA-morphisms as arrows). -/
theorem himp_fixed_of_fixed {a b : H} (hja : j.toFun a = a) (hjb : j.toFun b = b) :
    j.toFun (a ⇨ b) = a ⇨ b := by
  apply le_antisymm _ (j.extensive _)
  rw [le_himp_iff]
  calc j.toFun (a ⇨ b) ⊓ a
      = j.toFun (a ⇨ b) ⊓ j.toFun a := by rw [hja]
    _ = j.toFun ((a ⇨ b) ⊓ a)       := (j.meet_pres _ _).symm
    _ ≤ j.toFun b                    := j.monotone (le_himp_iff.mp le_rfl)
    _ = b                            := hjb

/-- ⊤ is a fixed point of every nucleus.
    Membership form of `top_fixed`, for use with `fixedPoints_inf_closed` etc. -/
theorem fixedPoints_top : (⊤ : H) ∈ j.fixedPoints :=
  j.mem_fixedPoints.mpr j.top_fixed

/-- Fixed points are closed under Heyting implication.
    Membership form of `himp_fixed_of_fixed`. -/
theorem fixedPoints_himp_closed {a b : H}
    (ha : a ∈ j.fixedPoints) (hb : b ∈ j.fixedPoints) : a ⇨ b ∈ j.fixedPoints :=
  j.mem_fixedPoints.mpr
    (j.himp_fixed_of_fixed (j.mem_fixedPoints.mp ha) (j.mem_fixedPoints.mp hb))

end HeytingAlgebra

end Nucleus
