---
type: example
depends-on: [coarse-settling-moduli, four-bilattice, moduli-classifying-function, rigid-moduli-point, base-admissibility-of-regimes, trivial-settling]
instantiates: [coarse-settling-moduli, base-admissibility-of-regimes, rigid-moduli-point]
lineage: 1
---

# Single-entity moduli

The simplest non-trivial [coarse settling moduli](../objects/coarse-settling-moduli.md): every point is rigid in the strict regime.

**Lineage 1** instance: the moduli stack on the L1 single-cell base ($E = \{a\}$, single $P$, $\lambda = 1$). Provides the moduli-side counterpart to the cohomology-side L1 examples ([strict-regime-d-frame-computation](strict-regime-d-frame-computation.md) and following).

## Base

$\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \{a\}$ (one entity), [predicate category](../objects/predicate-category.md) $\mathcal{C}$ the one-object category on $P$, [settling bound](../objects/settling-bound.md) $\lambda = 1$.

## Fiber algebra

$A_P = \mathbf{2}^{\bowtie 1 \times 1} = $ [$\mathbf{FOUR}$](../objects/four-bilattice.md). Single cell $(a, a)$, bilattice values $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$.

## Settlings

Each settling over this base is a single valuation $v_0(P)(a, a) \in \mathbf{FOUR}$. Four settlings total: $v_\bot, v_\mathbf{t}, v_\mathbf{f}, v_\top$.

## Regime

Finite $\mathbf{L}, E, \mathcal{C}$: by [base admissibility](../theorems/base-admissibility-of-regimes.md), only the strict regime admits settlings over this base. All four settlings are in the strict regime with $\kappa = 0$.

## MLD-classes

[Mutually-locally-derivable](teaching/explanations/mutually-locally-derivable.md) equivalence requires a cellwise bijection of the single-element $E \times E$, which is trivially the identity. Two settlings are MLD iff they have equal values at $(a, a)$. Hence four MLD-classes, one per $\mathbf{FOUR}$-value.

## Classifying invariant

The [moduli classifying function](../morphisms/moduli-classifying-function.md) $\mathcal{I}_B$ has image four classes:

- $v_\bot$: $\mathcal{F}_U^{(t)} = 0$, $\mathcal{F}_U^{(k)} = 0$. No designated cell of either kind.
- $v_\mathbf{t}$: $\mathcal{F}_U^{(t)}$ has one generator at $(a, a)$ at stage 0; $\mathcal{F}_U^{(k)}$ likewise (since $\mathbf{t}$ is also Belnap-designated).
- $v_\mathbf{f}$: $\mathcal{F}_U^{(t)} = 0$ — $\mathbf{f}$ is not $\mathbf{t}$-designated, and the truth-side sheaf does not see it. The $\mathbf{f}$-content is not separately tracked in the present cohomological apparatus, so $\mathbf{t}$-side cohomology collapses $v_\mathbf{f}$ with $v_\bot$. The combinatorial cell-by-cell MLD definition still distinguishes them, since their valuations differ pointwise.
- $v_\top$: $\mathcal{F}_U^{(t)} = 0$ but the [paraconsistent settling-associated sheaf](../objects/paraconsistent-settling-associated-sheaf.md) $\mathcal{F}_U^{(k)}$ has one generator at $(a, a)$ tracking the $\top$-cell, distinguishing $v_\top$ from both $v_\mathbf{f}$ and $v_\bot$ at the cohomological level.

So $\mathcal{I}_B$ on the truth-side $\mathcal{F}_U^{(t)}$ alone has image of size 2 ($v_\mathbf{t}$ vs the rest), while the combinatorial classification of [stabilizing regimes](../theorems/stabilizing-regimes-combinatorial-classification.md) — comparing pointwise cell values — gives the full 4-class partition. The two agree on $\{v_\bot, v_\mathbf{t}\}$ vs the others; resolving the remaining $\{v_\mathbf{f}, v_\bot\}$ collapse cohomologically would require the $\mathbf{f}$-tracking variant flagged in [equivariant settling cohomology](../theorems/equivariant-settling-cohomology.md).

## Visible automorphisms

$\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) = \{1\}$ for each settling — single-entity settlings admit only the identity natural automorphism. All four points are [rigid](teaching/explanations/rigid-moduli-point.md).

## Summary

$$|\mathrm{KP}^{\mathrm{vis}}(B)| \;=\; 4 \text{ points, all rigid, all in the strict regime}.$$

The simplest non-trivial moduli; baseline for moduli computations and a sanity check that the moduli machinery produces the expected result on a finite obvious case.
