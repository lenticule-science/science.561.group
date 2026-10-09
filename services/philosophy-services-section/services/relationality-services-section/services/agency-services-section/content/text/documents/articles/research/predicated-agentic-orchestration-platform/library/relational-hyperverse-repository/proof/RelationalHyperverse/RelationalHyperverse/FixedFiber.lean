import Mathlib.Order.Heyting.Basic
import RelationalHyperverse.Proposition

-- Establishes: fixed-fiber

/-!
# FixedFiber: the sub-Heyting-algebra H* = Fix(σ) ∩ Fix(Δ)

Corresponds to `math/fixed-fiber.md`.

The **fixed fiber** H*_t = Fix(σ_t) ∩ Fix(Δ_t) at a history t is the doubly-stable
layer of the fiber algebra H_t. It is the "observable content" of H_t: the set of
all doubly-stable propositions (see `Proposition.lean`).

This file establishes that H* is a sub-Heyting-algebra of H by showing the set of
doubly-stable propositions is closed under ⊓, ⊤, ⊥, and ⇨. The ⊓-closure is
already in `FiberAlgebras` (`fixedFiber_inf_closed`); ⊤ and ⇨ follow directly from
`Proposition` (`doublyStable_top`, `doublyStable_himp_closed`). The two new results
here are ⊥-membership (when nuclei preserve ⊥) and the π-nucleated join.

## Main results
- `BiNucleus.fixedFiber_top`        : ⊤ ∈ H*  (derived from `doublyStable_top`)
- `BiNucleus.fixedFiber_himp_closed` : a ⇨ b ∈ H* for a, b ∈ H*
  (derived from `doublyStable_himp_closed`)
- `BiNucleus.fixedFiber_bot`        : ⊥ ∈ H* when both nuclei preserve ⊥
- `BiNucleus.fixedFiber_pi_join`    : π(a ⊔ b) ∈ H*
-/

namespace BiNucleus

/-- ⊤ is always in the fixed fiber.
    Derived from `doublyStable_top`: the top element is a doubly-stable proposition,
    and DoublyStable is definitionally membership in fixedFiber. -/
theorem fixedFiber_top {H : Type*} [HeytingAlgebra H] (bn : BiNucleus H) :
    (⊤ : H) ∈ bn.fixedFiber :=
  doublyStable_top bn

/-- H* is closed under Heyting implication: if a, b ∈ H*, then a ⇨ b ∈ H*.

    Derived from `doublyStable_himp_closed`: implication of doubly-stable propositions
    is doubly-stable. Together with `fixedFiber_inf_closed` and `fixedFiber_top`, this
    establishes H* as a sub-HA of H, as required by `math/fixed-fiber.md`. -/
theorem fixedFiber_himp_closed {H : Type*} [HeytingAlgebra H] (bn : BiNucleus H)
    {a b : H} (ha : a ∈ bn.fixedFiber) (hb : b ∈ bn.fixedFiber) :
    a ⇨ b ∈ bn.fixedFiber :=
  doublyStable_himp_closed bn ha hb

/-- ⊥ is in the fixed fiber when both nuclei preserve ⊥.

    This completes the sub-Heyting-algebra structure of H*:
    together with `fixedFiber_top`, `fixedFiber_inf_closed`, and `fixedFiber_himp_closed`,
    this establishes that H* contains both constants and is closed under all HA operations.

    The hypothesis `j(⊥) = ⊥` means the nucleus does not "inflate" the bottom element —
    a natural condition for nuclei arising from the presheaf reindexing. -/
theorem fixedFiber_bot {H : Type*} [HeytingAlgebra H] (bn : BiNucleus H)
    (hσ : bn.σ.toFun ⊥ = ⊥) (hΔ : bn.Δ.toFun ⊥ = ⊥) :
    (⊥ : H) ∈ bn.fixedFiber :=
  ⟨bn.σ.mem_fixedPoints.mpr hσ, bn.Δ.mem_fixedPoints.mpr hΔ⟩

/-- The π-nucleated join of any two elements lies in H*.

    In H*, joins are not a ⊔ b (the lattice join) but π(a ⊔ b) (the π-closure of the join).
    This is the join operation of the internal Heyting algebra H* viewed as the quotient H/π.
    The fact that π(a ⊔ b) ∈ H* follows immediately from π being a retraction. -/
theorem fixedFiber_pi_join {H : Type*} [Lattice H] (bn : BiNucleus H) (a b : H) :
    bn.pi (a ⊔ b) ∈ bn.fixedFiber :=
  bn.pi_mem_fixedFiber _

end BiNucleus
