import RelationalHyperverse.HaNucl

-- Establishes: modal-logic

/-!
# ModalLogic: KZ modal axioms for a nucleus

Corresponds to `math/modal-logic.md`.

Every nucleus `j` on a Heyting algebra is a **KZ modal operator** (lax-idempotent monad).
The two defining axioms of the KZ box modality `□ = j` are:

- **(T)**: `a ≤ □a`  — the unit / extensivity axiom
- **(4)**: `□(□a) = □a` — lax-idempotency

These are exactly the extensivity and idempotency axioms of a nucleus, so every
nucleus is automatically a KZ modality.

The modal operators in the fiber language FiberNuclearLanguage are `Sat = σ` (KZ box for σ) and
`Trans = Δ` (KZ box for Δ), both of which satisfy T and 4.

## Main results
- `Nucleus.kz_T` : a ≤ j(a) (T axiom)
- `Nucleus.kz_4` : j(j(a)) = j(a) (4 axiom)
-/

namespace Nucleus

section HeytingAlgebra

variable {H : Type*} [HeytingAlgebra H] (j : Nucleus H)

/-- KZ modality — T axiom (`math/modal-logic.md` §thm-kz-modal):
    a ≤ □a, where □ = j is the box modality (KZ convention).

    Proof: immediate from extensivity. -/
theorem kz_T (a : H) : a ≤ j.toFun a := j.extensive a

/-- KZ modality — 4 axiom (`math/modal-logic.md` §thm-kz-modal):
    □(□a) = □a — the modality is lax-idempotent.

    Proof: immediate from idempotency. -/
theorem kz_4 (a : H) : j.toFun (j.toFun a) = j.toFun a := j.idempotent a

end HeytingAlgebra

end Nucleus
