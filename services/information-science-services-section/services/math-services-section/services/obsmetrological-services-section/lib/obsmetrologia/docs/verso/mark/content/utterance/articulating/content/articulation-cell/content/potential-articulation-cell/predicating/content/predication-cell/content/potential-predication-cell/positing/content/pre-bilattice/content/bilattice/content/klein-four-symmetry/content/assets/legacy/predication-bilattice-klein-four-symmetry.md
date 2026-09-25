---
type: question
class: internal
status: partial
explores: [four-bilattice, negation, internal-z2-gauge, strong-mld-via-composed-duality, d-frame-verdier-composition]
---

# Bilattice Klein-four symmetry on settlings

> **Progress.** The conflation action on settlings is now characterized by the [conflation-strong-MLD theorem](../theorems/conflation-strong-mld.md): conflation-self-dual settlings are those whose firings are all on the truth axis $\{\mathbf{t}, \mathbf{f}\}$, complementary to the negation-self-dual stratum (firings on $\{\bot, \top\}$). The [Klein-four self-duality on named substitutions](../examples/klein-four-self-duality-on-named-substitutions.md) example computes orbit data on Fibonacci, Padovan, Tribonacci, Tetranacci, Thue-Morse. The geometric interpretation in sub-question 3 is now formalized via the [bilattice two-orders duality theorem](../theorems/bilattice-two-orders-duality.md), introducing the order-swap involution $\sigma$ and an 8-element extended group $G_8 = \langle \mathrm{neg}, \mathrm{conf}, \sigma \rangle$ acting on FOUR. The [dihedral symmetry on twist-products theorem](../theorems/dihedral-symmetry-on-twist-products.md) extends $\sigma$ canonically to any de Morgan-based twist-product $\mathbf{L}^\bowtie$ via $\sigma\langle a, b\rangle = \langle a, \neg_L b\rangle$, identifies $G_8 \cong D_4$ (dihedral group of order 8 — the symmetry group of the square, not just "an 8-element non-abelian group"), and resolves sub-question 3 for the symmetric de Morgan-based class. Still open: full $G_8$-orbit classification on substitution settlings; the non-symmetric case $\mathbf{L}_1 \otimes \mathbf{L}_2$ with $\mathbf{L}_1 \neq \mathbf{L}_2$; and beyond-de-Morgan bilattices like $\mathbf{NINE}$.

The bilattice $\mathbf{FOUR}$ has a built-in $\mathbb{Z}/2 \times \mathbb{Z}/2$ symmetry group that the corpus has only partially used:

- **Negation** $\neg$: $\mathbf{t} \leftrightarrow \mathbf{f}$, fixes $\bot, \top$. Used extensively in the [strong-MLD theorem](../theorems/strong-mld-via-composed-duality.md) and the [d-frame Verdier composition](../../../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md).
- **Conflation** $-$: $\bot \leftrightarrow \top$, fixes $\mathbf{t}, \mathbf{f}$. Acknowledged in [@avron1996] but not used as a structural action on settlings in the corpus.
- **Their product** $-\circ\neg$: swaps both pairs. Effectively a "double-flip" combining negation and conflation.

Three questions:

## What does conflation do to settlings?

Negation gives the firing-pattern characterization of self-duality and the strong-MLD orbit structure. **Conflation has its own action**: it swaps $\bot$-firings with $\top$-firings while fixing truth-only and falsity-only firings. So a settling's *conflation orbit* is a different equivalence relation than its negation orbit. For Tetranacci with the default $a:\bot, b:\mathbf{t}, c:\mathbf{f}, d:\top$ labeling, conflation swaps the $a$-firing and the $d$-firing.

What's conflation-self-dual? A settling whose ⊥-firings and ⊤-firings come in pairs. What does this distinguish? Open.

## What's the full Klein-four orbit structure?

Each of the three non-trivial involutions gives a duality-orbit refinement of MLD-equivalence. Taking all three together gives a $\mathbb{Z}/2 \times \mathbb{Z}/2$-equivariant classification that's strictly finer than negation-only or conflation-only. The strong-MLD theorem covers one axis; the full theorem would cover both.

## Geometric / categorical interpretation

The bilattice's two orders are dual in the sense that $\leq_k$ has $\bot$-min, $\top$-max, $\mathbf{t}, \mathbf{f}$ as incomparable middles, while $\leq_t$ has $\mathbf{f}$-min, $\mathbf{t}$-max, $\bot, \top$ as incomparable middles. The negation involution swaps the *truth-extreme* pair $(\mathbf{t}, \mathbf{f})$; conflation swaps the *knowledge-extreme* pair $(\bot, \top)$. Each involution corresponds to an order-preserving duality of one of the orders. Is there a categorical statement that says "every distributive bilattice has a canonical $\mathbb{Z}/2 \times \mathbb{Z}/2$-action coming from its two-order duality structure"?
