---
type: question
status: resolved
explores:
- laplacianizability
- moduli-of-laplacianizers
resolution: No canonical functor; universal property is the stratified-orbifold structure of the moduli of Laplacianizers.
references:
- key: aksoy2025reimagining
  type: article
  authors:
  - Aksoy, Sinan G.
  - Young, Stephen J.
  year: 2025
  title: Re-imagining Spectral Graph Theory
  eprint: '2504.10624'
  eprinttype: arxiv
---

# Is there a universal Laplacianization?

## Resolution

Originally framed as: "is the Hilbert lift functor $L: \mathcal C \to \mathbf{HilbCh}$ part of an adjunction?" The answer is **no, not in the form originally hoped**.

The adjoint conjecture was settled negatively by the worked computation on $\partial \Delta^3$ ([gauge-fiber-structure](../../teaching-articles/examples/gauge-fiber-structure.md)):
- The gauge group of the moduli is *not* a subgroup of the chain automorphism group $G$.
- The fiber is a smooth foliation but *not* a homogeneous space.
- Different Hilbert lifts produce genuinely different Laplacians, with no canonical pick.

So there is no canonical Laplacianizer for a generic $(\mathcal C, H^\bullet)$.

## What replaces this question

The universal property *is* there — but it's structural rather than object-level. The current statement ([stratified-moduli-of-laplacianizations](../stratified-moduli-of-laplacianizations.md)):

> The moduli of Laplacianizers of $(\mathcal C, H^\bullet)$ is a *stratified orbifold* whose strata are indexed by eigenvalue-multiplicity invariants of the Hodge Laplacian, with explicit codim and stab dim formulas ([stab-codim-formula](../stab-codim-formula.md)). The structural fact making "Laplacianization" coherent across categories is the universality of this orbifold-stratification *pattern*, not the existence of a canonical functor.

The pattern shows up across categories with no a priori connection — graphs [@aksoy2025reimagining], Einstein metrics (Einstein moduli 2025), cellular sheaves (this program). That cross-category universality is the universal property the original question was reaching for.

## Refined open questions

- **Is the orbifold-stratification pattern truly universal across all $(\mathcal C, H^\bullet)$ admitting a Hilbert lift?** Empirical pattern across multiple settings; category-free theorem is open (see [categorical-free-cross-category](categorical-free-cross-category.md)).
- **What is the universal *invariant* of moduli of Laplacianizers?** Codim formulas are intrinsic to bipartite multipartition; stab dim is category-specific ([universal-vs-categorical-stratification](../universal-vs-categorical-stratification.md)). The "intrinsic" part may be the cleanest universal data.
