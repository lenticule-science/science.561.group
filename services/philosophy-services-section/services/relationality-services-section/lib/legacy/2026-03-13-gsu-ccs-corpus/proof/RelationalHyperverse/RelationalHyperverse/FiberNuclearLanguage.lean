import Mathlib.Order.Heyting.Basic
import RelationalHyperverse.FiberAlgebras

-- Establishes: fiber-nuclear-language

/-!
# FiberNuclearLanguage: the nuclear Heyting-modal propositional calculus

Corresponds to `math/fiber-nuclear-language.md`.

`Proposition₀` is the **syntactic** layer of the fiber algebras: a propositional language
over variables of type `V` with Heyting connectives and two KZ modal operators:

- `Saturate` — the Saturate modality (σ_t in the fiber algebra)
- `Transfer` — the Transfer modality (Δ_t in the fiber algebra)

FiberNuclearLanguage has no function types; those are metalinguistic. It is not a
general-purpose λ-calculus but specifically the nuclear propositional language of the
fiber Heyting algebras.

The interpretation `interp` maps FiberNuclearLanguage terms into any `HeytingAlgebra + BiNucleus`
under a valuation ρ : V → H.

## Main definitions
- `Proposition V` : FiberNuclearLanguage terms with free variables of type V
- `Proposition.interp` : interpretation into a HeytingAlgebra + BiNucleus
-/

universe u

/-- Syntax of FiberNuclearLanguage: nuclear Heyting-modal propositional calculus.
    `Saturate` is the Saturate operator (the σ nucleus).
    `Transfer` is the Transfer operator (the Δ nucleus).
    FiberNuclearLanguage has no function types; those are metalinguistic.
    Corresponds to `math/fiber-nuclear-language.md`. -/
inductive Proposition (V : Type u) : Type u where
  | var  : V → Proposition V
  | top  : Proposition V
  | bot  : Proposition V
  | conj : Proposition V → Proposition V → Proposition V
  | disj : Proposition V → Proposition V → Proposition V
  | impl : Proposition V → Proposition V → Proposition V
  | Saturate  : Proposition V → Proposition V
  | Transfer  : Proposition V → Proposition V

namespace Proposition

variable {V : Type u} {H : Type*} [HeytingAlgebra H]

/-- The interpretation of a FiberNuclearLanguage term under a valuation ρ : V → H.
    Heyting connectives map to HA operations; Saturate maps to σ, Transfer maps to Δ.
    Corresponds to `math/fiber-nuclear-language-axiom.md` §fiber-language-interpretation. -/
def interp (bn : BiNucleus H) (ρ : V → H) : Proposition V → H
  | var x    => ρ x
  | top      => ⊤
  | bot      => ⊥
  | conj M N => interp bn ρ M ⊓ interp bn ρ N
  | disj M N => interp bn ρ M ⊔ interp bn ρ N
  | impl M N => interp bn ρ M ⇨ interp bn ρ N
  | Saturate M    => bn.σ.toFun (interp bn ρ M)
  | Transfer M    => bn.Δ.toFun (interp bn ρ M)

end Proposition
