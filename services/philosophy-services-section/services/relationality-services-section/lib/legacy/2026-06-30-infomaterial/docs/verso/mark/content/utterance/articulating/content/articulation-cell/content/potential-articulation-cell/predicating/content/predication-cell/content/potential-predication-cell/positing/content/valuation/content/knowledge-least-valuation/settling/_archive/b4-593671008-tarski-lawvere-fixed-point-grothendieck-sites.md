---
type: theorem
status: sketch
depends-on: [lawvere-laplacian-grothendieck-sites, quantale-enriched-sheaf, bitopological-settling-site]
---

# Tarski–Lawvere fixed point on Grothendieck sites

Layers 2 and 3 of the [cellular extension plan](../narratives/cellular-extension-plan.md). Extends the Tarski–Lawvere Fixed Point Theorem ([@ghrist-et-al2025] Theorem 2.17) — for any $\mathsf Q$-endofunctor on a complete weighted lattice, prefix and suffix points form complete weighted lattices — from countable-cofinality cover structures to **transfinite-cover** Grothendieck sites, in particular to the $\omega_1$-cofinal cover structure of the bitopological settling site in the aperiodic regime.

This is a separate theorem from the [Layer-1 sheaf-compatibility lemma](lawvere-laplacian-grothendieck-sites.md), which is independent of cover cardinality. Here the open content is the convergence of the Tarski–Lawvere iteration at uncountable cofinality.

## Setup

Fix a commutative unital quantale $\mathsf Q$, a small category $\mathbf T$ with Grothendieck topology $J$, and a $\mathsf Q$-enriched sheaf $F$ on $(\mathbf T, J)$. By the [Layer-1 sheaf-compatibility lemma](lawvere-laplacian-grothendieck-sites.md), the Lawvere Laplacian $L : C^0 F \to C^0 F$ restricts to an endofunctor on the sheaf subcategory.

## The fixed-point iteration

The Lawvere Laplacian's iteration

$$x_{n+1} \;=\; x_n \,\wedge\, L(x_n)$$

is the diffusion process whose limit (when it converges) is the largest suffix point of $L$ below $x_0$. The Tarski–Lawvere theorem of [@ghrist-et-al2025] establishes convergence at countable cofinality: the iteration stabilizes at some countable ordinal $\kappa < \omega_1$.

For the bitopological settling site in the strict, Scott-continuous, and transfinite-bounded regimes, the cover structure is finite-or-countable, and the countable-cofinality Tarski–Lawvere theorem applies directly. The aperiodic regime has $\omega_1$-cofinal cover structure, where convergence at $\omega_1$-cofinality is the substantive open question.

## The conjecture

**Conjecture (Tarski–Lawvere on $\omega_1$-cofinal sites).** *For a $\mathsf Q$-enriched sheaf $F$ on a Grothendieck site $(\mathbf T, J)$ whose covers have $\omega_1$-cofinality, the Tarski–Lawvere iteration on $L$ converges to the largest suffix point at some ordinal $\leq \omega_1$.*

The structural reason this should hold: the iteration is monotone and the value lattice is complete, so the limit at $\omega_1$ exists as the meet of all earlier iterates. The question is whether this limit is *itself* a suffix point (i.e., whether the iteration's continuity at $\omega_1$ holds).

## Status: sketch

This is sketch because the convergence argument at $\omega_1$ requires cofinality reasoning beyond what [@ghrist-et-al2025]'s countable case handles. Specifically:

1. **Convergence at $\omega_1$.** The countable-cofinality argument uses the fact that any countable monotone sequence in a complete lattice has a well-defined limit, and that the limit is preserved by the Laplacian under Scott-continuity. The $\omega_1$-cofinal case requires an analogous Scott-continuity-at-$\omega_1$ property of $L$, which depends on the cover structure's cofinality interaction with the value-category's directed-colimit behavior.

2. **Relationship to AB5-axiom analogs.** In the abelian / Grothendieck-topos setting, AB5 (filtered colimits commute with finite limits) is the standard cofinality axiom that makes this kind of argument go through. The $\mathsf Q$-enriched analog of AB5 in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ is partially developed in [@stubbe2005] and [@lopez2024]; whether it suffices for $\omega_1$-cofinal convergence is open.

3. **Avoiding the question via direct-limit definition.** As the [aperiodic-regime d-frame cohomology theorem](aperiodic-regime-d-frame-cohomology.md) notes, the unbounded settling cohomology can be *defined* as the colimit of truncation cohomologies, where each truncation has countable cofinality and the standard Tarski–Lawvere theorem applies. This avoids the $\omega_1$-cofinal convergence question entirely. The conjecture above is the direct statement that would close the cellular-extension-plan's Layer 3 cleanly; the direct-limit workaround is the route the corpus currently uses.

## What's open

- The conjecture itself — convergence of the Tarski–Lawvere iteration at $\omega_1$-cofinal covers.
- The $\mathsf Q$-enriched AB5 axiom's status in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ for the d-frame quantale specifically.
- Whether the direct-limit workaround is structurally equivalent to the conjectured fixed-point convergence (currently they're parallel constructions; whether they always agree is a further open question).
