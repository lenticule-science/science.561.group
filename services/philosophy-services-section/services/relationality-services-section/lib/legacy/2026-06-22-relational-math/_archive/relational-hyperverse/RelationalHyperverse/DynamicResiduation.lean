import RelationalHyperverse.HaNucl

-- Establishes: dynamic-residuation

/-!
# DynamicResiduation: the Galois connection for nuclei

Corresponds to `math/dynamic-residuation.md`.

The **dynamic residuation** `j⊃(a,b) = max{x | j(a ∧ x) ≤ j(b)}` gives a right adjoint
to the operation `x ↦ j(a ∧ x)`. The Galois connection is:

  `j(a ∧ b) ≤ j(c) ↔ j(b) ≤ j(a) ⇨ j(c)`

This is proved purely from the nucleus axioms and Heyting adjunction.

## Main results
- `Nucleus.galois_connection_meet` : the Galois connection for dynamic residuation
- `Nucleus.galois_connection_stability` : transitivity / stability under composition
-/

namespace Nucleus

section HeytingAlgebra

variable {H : Type*} [HeytingAlgebra H] (j : Nucleus H)

/-- Galois connection for the dynamic residuation (`math/dynamic-residuation.md` §Galois-connection).

    The dynamic residuation j⊃(a,b) = max{x | j(a ∧ x) ≤ j(b)} satisfies:
      j(a ∧ b) ≤ j(c) ↔ j(b) ≤ j(a) ⇨ j(c).

    We prove this biconditional directly from Heyting adjunction and meet-preservation.
    The residuation maximum itself requires finiteness or completeness of the fiber
    (OPEN: see `math/stable-envelope.md`).

    Proof (→): j(a∧b) = j(a)∧j(b) ≤ j(c), so j(b) ≤ j(a)⇨j(c) by Heyting adjunction.
    Proof (←): j(b) ≤ j(a)⇨j(c) → j(b)∧j(a) ≤ j(c) → j(a∧b) = j(a)∧j(b) ≤ j(c). -/
theorem galois_connection_meet (a b c : H) :
    j.toFun (a ⊓ b) ≤ j.toFun c ↔ j.toFun b ≤ j.toFun a ⇨ j.toFun c := by
  constructor
  · intro h
    rw [le_himp_iff]
    calc j.toFun b ⊓ j.toFun a
        = j.toFun (b ⊓ a) := (j.meet_pres _ _).symm
      _ = j.toFun (a ⊓ b) := by rw [inf_comm]
      _ ≤ j.toFun c       := h
  · intro h
    calc j.toFun (a ⊓ b)
        = j.toFun a ⊓ j.toFun b := j.meet_pres _ _
      _ ≤ j.toFun a ⊓ (j.toFun a ⇨ j.toFun c) := inf_le_inf_left _ h
      _ ≤ j.toFun c := by rw [inf_comm]; exact le_himp_iff.mp le_rfl

-- ── Stability under composition ───────────────────────────────────────────────

/-- Stability under composition (`math/dynamic-residuation.md` §dynamic-residuation-stability).

    If j(a ∧ b) ≤ j(c) and j(c ∧ d) ≤ j(e), then j(a ∧ b ∧ d) ≤ j(e).

    This is the categorical content of transitivity for the dynamic residuation:
    the j-implication relation is stable under composition.

    Proof: j(a∧b∧d) = j(a∧b) ∧ j(d) (meet-preservation) ≤ j(c) ∧ j(d) = j(c∧d) ≤ j(e). -/
theorem galois_connection_stability {a b c d e : H}
    (h1 : j.toFun (a ⊓ b) ≤ j.toFun c)
    (h2 : j.toFun (c ⊓ d) ≤ j.toFun e) :
    j.toFun (a ⊓ b ⊓ d) ≤ j.toFun e :=
  calc j.toFun (a ⊓ b ⊓ d)
      = j.toFun (a ⊓ b) ⊓ j.toFun d := j.meet_pres _ _
    _ ≤ j.toFun c ⊓ j.toFun d       := inf_le_inf_right _ h1
    _ = j.toFun (c ⊓ d)             := (j.meet_pres _ _).symm
    _ ≤ j.toFun e                   := h2

end HeytingAlgebra

end Nucleus
