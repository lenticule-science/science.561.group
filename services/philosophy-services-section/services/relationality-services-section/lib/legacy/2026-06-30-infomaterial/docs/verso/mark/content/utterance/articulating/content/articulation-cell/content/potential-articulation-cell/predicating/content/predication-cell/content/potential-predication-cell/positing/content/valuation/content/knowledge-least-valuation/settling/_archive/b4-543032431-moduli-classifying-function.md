---
name: moduli-classifying-function
description: "The function on the coarse settlement moduli sending each MLD-class [v] to the sheaf-isomorphism class of its settling-associated-sheaf F_U. The structural map that connects moduli classification to cohomological classification, well-defined by the biequivalence-cohomological collapse theorem."
kind: function
symbol: "I_B"
domain: "|KP^vis(B)| (the visible coarse settlement moduli over base B)"
codomain: "sheaf-iso classes of F_U on T*(B)"
defined-as: "I_B([v]) := [F_U]_~"
realizes: [cohomological-equivalence]
depends-on: [settlement, settling-associated-sheaf, cohomological-equivalence, mutually-locally-derivable]
derives-from: docs/dev/scraps/moduli-classifying-function.md
---

# Moduli classifying function

The function on the **coarse settlement moduli** that sends each MLD-class to its settling-associated-sheaf's isomorphism class.

For a base `B = (L, C, E, λ)`:

$$\mathcal{I}_B \;:\; |\mathrm{KP}^{\mathrm{vis}}(B)| \;\longrightarrow\; \big\{\, \text{sheaf-iso classes of } \mathcal{F}_U \text{ on } \mathbf{T}^*(B) \,\big\}, \qquad [v] \;\mapsto\; [\mathcal{F}_U]_\sim.$$

The function is the **structural map** that connects moduli classification (the left-hand side: MLD-classes of settlements) to cohomological classification (the right-hand side: sheaf-iso classes of associated sheaves).

## Well-definedness

The function is well-defined by the **biequivalence-cohomological collapse** theorem (archive theorem, not yet pulled): MLD-equivalent settlements have isomorphic settling-associated-sheaves (possibly up to settling-shift). So `I_B` factors through MLD-classes, hence through the coarse moduli.

Without this theorem, `I_B` would be defined only on individual settlements, not on classes. The theorem is what makes the moduli-to-cohomology map exist.

## Injectivity stratification by regime

Whether `I_B` is **injective** (i.e., whether sheaf-iso class determines MLD-class) depends on the regime:

| Regime | Injectivity of `I_B` |
|---|---|
| strict-finite | YES — the sheaf-iso class fully determines the MLD-class for finite-step orbits. |
| Scott-continuous | YES (almost) — minor exceptions for non-classical edge cases. |
| transfinite-bounded | NO — sheaf-iso class may collapse multiple MLD-classes (different inferential paths can produce isomorphic sheaves on the bounded sub-site, distinguished only at higher ordinals). |
| aperiodic | NO — same phenomenon at the uncountable scale. |

This is the **aperiodic-classification subtlety**: cohomological-equivalence (`~_H`, sheaf-iso) is coarser than MLD-equivalence in the higher regimes. `I_B` quotients out the difference; it forgets the fine structure that MLD preserves.

## The complementary direction: sheaf-iso → MLD-class

The inverse direction "given a sheaf-iso class, recover the MLD-class" is the **classification theorem** (archive theorem `aperiodic-regime-classification`). It is provable for the lower regimes; in the aperiodic regime, additional cohomological data (the aperiodic-classifying-invariant in `H^1`) is needed because sheaf-iso alone is insufficient.

So `I_B` is the forward direction; `I_B^{-1}` (when defined) requires the classifying-invariant machinery to invert.

## Why this is a "function" not a "morphism" in the categorical sense

`I_B` is a function in the set-theoretic sense — a map between two sets. It is not a categorical morphism in any structured category; the source and target are sets of isomorphism classes, with no further structure preserved.

A richer formulation might present `I_B` as a functor between groupoids (the moduli groupoid → the sheaf-iso groupoid), preserving more structure than the bare set-map does. The archive's framing is the bare-set-map version; a categorical lift is potential downstream work.

## Position

`finite-settlement-algebra/hacking/library/moduli-classifying-function/`. Settling tier — connects moduli of settlements (settling-tier objects) to cohomology classes (settling-tier invariants).

## Derivation source

Adapted from `predication-categories/morphisms/moduli-classifying-function.md`, preserved at `docs/dev/scraps/`. The well-definedness argument and regime-injectivity table are structural elaborations of the archive's brief framing.
