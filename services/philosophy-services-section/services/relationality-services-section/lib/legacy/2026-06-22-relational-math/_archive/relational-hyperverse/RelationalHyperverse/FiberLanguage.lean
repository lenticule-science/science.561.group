import RelationalHyperverse.FiberAlgebras

-- OPEN: see math/fiber-nuclear-language-axiom.md

/-!
# FiberLanguage: the FiberNuclearLanguage axiom (overview)

Corresponds to `math/fiber-nuclear-language-axiom.md`.

FiberNuclearLanguage is the syntactic layer of the fiber algebras: a propositional language
over variables with Heyting connectives and two KZ modal operators (Saturate = σ, Transfer = Δ),
interpreted in any `HeytingAlgebra + BiNucleus`.

The language is defined in `FiberNuclearLanguage.lean`; fiber-level soundness is in `Soundness.lean`.
Normalization (canonical forms) is in `Normalization.lean` (OPEN).

OPEN: not yet formalized as a standalone unit. See `math/fiber-nuclear-language-axiom.md`.
-/
