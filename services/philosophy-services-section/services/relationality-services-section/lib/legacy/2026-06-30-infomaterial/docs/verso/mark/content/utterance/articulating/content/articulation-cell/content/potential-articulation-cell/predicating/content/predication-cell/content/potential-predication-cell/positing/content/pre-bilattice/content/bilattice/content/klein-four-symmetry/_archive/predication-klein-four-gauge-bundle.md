---
name: Klein-four gauge bundle
description: The K_4-equivariant sheaf on the bitopological settling site arising from the four bilattice involutions of K_4 acting fiberwise on the settling-associated sheaf. A gauge-theory object every predication settling carries; its equivariant cohomology decomposes into four isotypic sectors indexed by the irreducible characters of K_4.
negating: klein-four-gauge-bundle
conflating: klein-four-gauge-bundle
---

The **Klein-four gauge bundle** of a predication settling is the $(\mathbb{Z}/2 \times \mathbb{Z}/2)$-equivariant sheaf on the bitopological settling site arising from the four bilattice involutions of $K_4$ acting fiberwise on the settling-associated sheaf. It extends the internal $\mathbb{Z}/2$ gauge — the negation action — to the full [Klein-four symmetry](klein-four-symmetry.md) group of $\mathbf{FOUR}$.

## Construction

Let $v$ be a [predication settling](predication-settling.md) on the bitopological settling site, with settling-associated sheaf $\mathcal{F}_v$. The **Klein-four gauge bundle** $\mathcal{G}_v$ is the $K_4$-equivariant sheaf:

$$\mathcal{G}_v \;:=\; \mathcal{F}_v \;+\; K_4\text{-equivariant structure},$$

where the $K_4$-equivariant structure is the data of natural transformations $\rho_g : \mathcal{F}_v \to g^*\mathcal{F}_v$ for each $g \in K_4$, satisfying:

- $\rho_\mathrm{id} = \mathrm{id}$,
- $\rho_{gh} = \rho_h \circ \rho_g$ (cocycle condition),
- Each $\rho_g$ is an isomorphism of sheaves.

The four $K_4$ elements act on the settling-associated sheaf at each site point by:

- $\mathrm{id}$: identity.
- $\sim$ (negation): exchanges truth-side firings with falsity-side firings.
- $-$ (conflation): exchanges $\top$-valued firings with $\bot$-valued configurations.
- $\sim\circ-$: composition of the above.

The cocycle conditions are satisfied because $\sim$ and $-$ are bilattice automorphisms that commute.

## Isotypic decomposition

Since $K_4$ is abelian, its representation theory is exhausted by the four characters $\widehat{K_4} = \{\chi_\mathrm{id}, \chi_\sim, \chi_-, \chi_{\sim\circ-}\}$ (cf. [klein-four-symmetry](klein-four-symmetry.md)). The **$\chi$-isotypic component** of $\mathcal{G}_v$ is:

$$\mathcal{G}_v^\chi \;:=\; \{s \in \mathcal{G}_v : g \cdot s = \chi(g) \cdot s \text{ for all } g \in K_4\}.$$

The four isotypic components are:

- $\mathcal{G}_v^\mathrm{id}$: $K_4$-invariant sections — the $\bot$-content (consistent and undesignated on both sides).
- $\mathcal{G}_v^{\chi_\sim}$: negation-antisymmetric — truth-versus-falsity content (antisymmetric under $\sim$, symmetric under $-$).
- $\mathcal{G}_v^{\chi_-}$: conflation-antisymmetric — $\top$-versus-$\bot$ content (symmetric under $\sim$, antisymmetric under $-$).
- $\mathcal{G}_v^{\chi_{\sim\circ-}}$: doubly-antisymmetric — mixed truth-and-consistency content.

## Equivariant cohomology decomposition

The equivariant cohomology of $\mathcal{G}_v$ decomposes along the four characters:

$$H^*(\mathcal{G}_v) \;\cong\; H^*(\mathcal{G}_v^\mathrm{id}) \oplus H^*(\mathcal{G}_v^{\chi_\sim}) \oplus H^*(\mathcal{G}_v^{\chi_-}) \oplus H^*(\mathcal{G}_v^{\chi_{\sim\circ-}}).$$

In degree 1 specifically, this is the four-sector decomposition $H^1_\mathrm{id}, H^1_{\chi_\sim}, H^1_{\chi_-}, H^1_{\chi_{\sim\circ-}}$. The non-vanishing of the conflation-antisymmetric sectors $H^1_{\chi_-}$ and $H^1_{\chi_{\sim\circ-}}$ is the obstruction detected by the [verify-certifiability-sectors](verify-certifiability-sectors.md) closure rule.

## Position

Every predication settling carries a Klein-four gauge bundle — it is not additional structure but an inherent feature of the $\mathbf{FOUR}$-valued cell structure. The bundle makes explicit the gauge-theoretic content implicit in the bilattice's $K_4$ symmetry. Its equivariant cohomology decomposition into four isotypic sectors is the structural origin of the $K_4$-equivariant Mayer-Vietoris decomposition.
