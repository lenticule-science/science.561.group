---
title: "Archive confirmation: predication-categories' residuated-lattice"
date: 2026-05-28
date-created: 2026-05-28
description: The residuated-lattice.md in the potential body at this $thing root already covers the integral commutative residuated-lattice structure (with ⊗ = ⊓ when L is a Heyting algebra, etc.), with appropriate identification of L^⋈^(E×E) as the…
---

The `residuated-lattice.md` in the potential body at this $thing root already covers the integral commutative residuated-lattice structure (with `⊗ = ⊓` when L is a Heyting algebra, etc.), with appropriate identification of `L^⋈^(E×E)` as the parameter for each predication-fiber-algebra.

The archive's version of the same concept lives at `docs/dev/scraps/residuated-lattice-from-predication-categories.md`. Key checks against the existing body:

- ✓ Both use commutativity of the fusion product.
- ✓ Both treat the integral case (`1 = ⊤`) as canonical.
- ✓ Both cite the two-element Boolean lattice with `· = ∧` and `x → y := ¬x ∨ y` as the canonical integral commutative example.
- ✓ Both cite Heyting algebras as a sub-class.
- The archive additionally cites MV-algebras as integral commutative residuated lattices with `·` as Łukasiewicz strong conjunction — not mentioned in the existing body but consistent.
- The archive's Lean module reference is `PredicationCategories.Homebrew.Algebra.ResiduatedLattice.IntegralResiduatedLattice`.

No re-derivation needed; the existing $thing body is consistent with the archive's account. The scrap is preserved for historical reference.
