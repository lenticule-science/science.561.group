import Mathlib.Order.Heyting.Basic
import Mathlib.Order.Lattice
import RelationalHyperverse.HaNucl

-- Establishes: fiber-algebra

/-!
# FiberAlgebras: two commuting nuclei on a lattice

Corresponds to `math/fiber-algebra.md` (the Axiom of Fiber Algebras).

The **fiber algebra** at a history `t` is a Heyting algebra `H_t` equipped with two
commuting nuclei `σ_t` (saturation) and `Δ_t` (transfer). Their commutativity
`σ ∘ Δ = Δ ∘ σ` is the Axiom of Fiber Algebras.

The **joint projection** `π = σ ∘ Δ` is itself a nucleus, and its fixed-point set
`H* = Fix(σ) ∩ Fix(Δ)` is the doubly-stable layer (see `math/fixed-fiber.md`).

## Main definitions
- `BiNucleus H` : a pair (σ, Δ) of commuting nuclei on a lattice H
- `BiNucleus.pi` : the joint projection π = σ ∘ Δ
- `BiNucleus.fixedFiber` : H* = Fix(σ) ∩ Fix(Δ)
- `BiNucleus.pi_nucleus` : π is a nucleus

## Main results
- `BiNucleus.pi_mem_fixedFiber` : π(a) ∈ H* (π is a retraction)
- `BiNucleus.mem_fixedFiber_iff` : a ∈ H* ↔ π(a) = a
- `BiNucleus.pi_least_above` : π(a) is the least element of H* above a
- `BiNucleus.fixedFiber_inf_closed` : H* is closed under ⊓
-/

/-- A pair of commuting nuclei on a lattice.
    Models the fiber algebra data (H_t, σ_t, Δ_t) from `math/fiber-algebra.md`. -/
structure BiNucleus (H : Type*) [Lattice H] where
  σ       : Nucleus H
  Δ       : Nucleus H
  commute : ∀ a, σ.toFun (Δ.toFun a) = Δ.toFun (σ.toFun a)

namespace BiNucleus

variable {H : Type*} [Lattice H] (bn : BiNucleus H)

/-- The joint projection π = σ ∘ Δ, reflecting onto H*. -/
def pi : H → H := fun a => bn.σ.toFun (bn.Δ.toFun a)

/-- The fixed fiber H* = Fix(σ) ∩ Fix(Δ), the doubly-stable layer.
    Corresponds to `math/fixed-fiber.md`. -/
def fixedFiber : Set H := bn.σ.fixedPoints ∩ bn.Δ.fixedPoints

-- ────────────────────────────────────────────────────────────────────────────
-- π is a nucleus

theorem pi_extensive (a : H) : a ≤ bn.pi a :=
  le_trans (bn.Δ.extensive a) (bn.σ.extensive _)

/-- π is idempotent.
    Proof: π(π(a)) = σ(Δ(σ(Δ(a)))) = σ(σ(Δ(Δ(a)))) [commute] = σ(Δ(a)) [idempotency]. -/
theorem pi_idempotent (a : H) : bn.pi (bn.pi a) = bn.pi a := by
  simp only [pi]
  have h : bn.Δ.toFun (bn.σ.toFun (bn.Δ.toFun a)) =
           bn.σ.toFun (bn.Δ.toFun (bn.Δ.toFun a)) := (bn.commute _).symm
  rw [h, bn.Δ.idempotent, bn.σ.idempotent]

theorem pi_monotone {a b : H} (hab : a ≤ b) : bn.pi a ≤ bn.pi b :=
  bn.σ.monotone (bn.Δ.monotone hab)

theorem pi_meet_pres (a b : H) : bn.pi (a ⊓ b) = bn.pi a ⊓ bn.pi b := by
  simp only [pi, bn.Δ.meet_pres, bn.σ.meet_pres]

/-- π is a nucleus. -/
def pi_nucleus : Nucleus H where
  toFun      := bn.pi
  extensive  := bn.pi_extensive
  idempotent := bn.pi_idempotent
  monotone   := fun h => bn.pi_monotone h
  meet_pres  := bn.pi_meet_pres

-- ────────────────────────────────────────────────────────────────────────────
-- Fixed fiber characterization

/-- a ∈ H* iff π(a) = a.
    (⇒): unfold definitions, apply fixed-point conditions.
    (⇐): if σ(Δ(a)) = a then Δ(a) ≤ σ(Δ(a)) = a ≤ Δ(a), so Δ(a) = a,
         then σ(a) = σ(Δ(a)) = a. -/
theorem mem_fixedFiber_iff {a : H} : a ∈ bn.fixedFiber ↔ bn.pi a = a := by
  constructor
  · rintro ⟨hσ, hΔ⟩
    simp only [Nucleus.mem_fixedPoints] at hσ hΔ
    simp only [pi, hΔ, hσ]
  · intro h
    simp only [pi] at h
    have hΔ : bn.Δ.toFun a = a :=
      le_antisymm
        (le_trans (bn.σ.extensive (bn.Δ.toFun a)) h.le)
        (bn.Δ.extensive a)
    have hσ : bn.σ.toFun a = a := by
      have := h; rw [hΔ] at this; exact this
    exact ⟨bn.σ.mem_fixedPoints.mpr hσ, bn.Δ.mem_fixedPoints.mpr hΔ⟩

/-- π is a retraction: π(a) ∈ H* for every a. -/
theorem pi_mem_fixedFiber (a : H) : bn.pi a ∈ bn.fixedFiber := by
  rw [mem_fixedFiber_iff]
  exact bn.pi_idempotent a

/-- For a ∈ H*, π(a) = a. -/
theorem pi_fixed_of_mem {a : H} (ha : a ∈ bn.fixedFiber) : bn.pi a = a :=
  (bn.mem_fixedFiber_iff.mp ha)

-- ────────────────────────────────────────────────────────────────────────────
-- σ and Δ are both below π

/-- σ(a) ≤ π(a): the saturation nucleus is pointwise below the joint projection. -/
theorem sigma_le_pi (a : H) : bn.σ.toFun a ≤ bn.pi a :=
  bn.σ.monotone (bn.Δ.extensive a)

/-- Δ(a) ≤ π(a): the transfer nucleus is pointwise below the joint projection. -/
theorem delta_le_pi (a : H) : bn.Δ.toFun a ≤ bn.pi a :=
  bn.σ.extensive (bn.Δ.toFun a)

-- ────────────────────────────────────────────────────────────────────────────
-- H* is a meet-sublattice

/-- H* is closed under binary meets. -/
theorem fixedFiber_inf_closed {a b : H}
    (ha : a ∈ bn.fixedFiber) (hb : b ∈ bn.fixedFiber) : a ⊓ b ∈ bn.fixedFiber :=
  ⟨bn.σ.fixedPoints_inf_closed ha.1 hb.1, bn.Δ.fixedPoints_inf_closed ha.2 hb.2⟩

-- ────────────────────────────────────────────────────────────────────────────
-- π is the least nucleus whose fixed-point set is H*

/-- The fixed fiber equals the fixed-point set of π as a nucleus. -/
theorem fixedFiber_eq_piFixed : bn.fixedFiber = bn.pi_nucleus.fixedPoints := by
  ext a
  simp only [Nucleus.mem_fixedPoints, pi_nucleus]
  exact bn.mem_fixedFiber_iff

/-- π(a) is the least element of H* that lies above a:
    if a ≤ b and b ∈ H*, then π(a) ≤ b.
    This is the universal property of the reflection a ↦ π(a). -/
theorem pi_least_above {a b : H} (hab : a ≤ b) (hb : b ∈ bn.fixedFiber) :
    bn.pi a ≤ b :=
  bn.pi_nucleus.le_fixed_of_le hab (bn.fixedFiber_eq_piFixed ▸ hb)

-- ────────────────────────────────────────────────────────────────────────────
-- Absorption for π

/-- π absorbs its own output in joins: π(π(a) ⊔ b) = π(a ⊔ b). -/
theorem pi_absorb_join (a b : H) : bn.pi (bn.pi a ⊔ b) = bn.pi (a ⊔ b) :=
  bn.pi_nucleus.absorb_join a b

end BiNucleus
