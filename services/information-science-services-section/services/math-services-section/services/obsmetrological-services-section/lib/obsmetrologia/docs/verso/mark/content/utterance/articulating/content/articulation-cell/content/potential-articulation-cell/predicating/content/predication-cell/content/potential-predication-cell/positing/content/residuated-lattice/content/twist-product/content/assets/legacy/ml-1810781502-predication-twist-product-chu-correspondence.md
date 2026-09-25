---
type: theorem
status: proved
depends-on: [twist-product, twist-product-fusion, twist-product-right-residual, twist-product-residuation, residuated-lattice]
---

# Twist-product Chu correspondence

For $\mathbf{L}$ a Heyting algebra — equivalently, an integral commutative [residuated lattice](../objects/residuated-lattice.md) with $\cdot = \wedge$ and meet-preserving implication — restricted to the consistent sub-algebra

$$\{\langle a_+, a_- \rangle : a_+ \wedge a_- = 0\} \subseteq \mathbf{L}^\bowtie$$

of the [twist product](../../../twist-product.md), the [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$ coincides with the Chu tensor $\otimes$, and the [twist-product right residual](../morphisms/twist-product-right-residual.md) $\Rightarrow$ coincides with the Chu linear implication $\multimap$.

Equivalently, on the consistent sub-algebra the adjunction $\odot \dashv \Rightarrow$ — established for the full twist product by the [twist-product residuation theorem](../../../references/twist-product-residuation.md) — coincides with the $\otimes \dashv \multimap$ adjunction of classical multiplicative linear logic, algebraically instantiated on the $*$-autonomous category $\mathrm{Chu}(\mathbf{L}, 0)$.

## Proof

By Jakl (2025, Lemma 3.1), which establishes the term-definability of the linear-logic connectives of $\mathrm{Chu}(H, 0)$ from the bilattice structure of $H^\bowtie$ for $H$ a Heyting algebra: the Chu tensor $\otimes$ is term-defined as $\odot$ given by formula (4.1) of the [twist-product fusion](../morphisms/twist-product-fusion.md), and the Chu linear implication $\multimap$ is term-defined as $\Rightarrow$ given by formula (4.2) of the [twist-product right residual](../morphisms/twist-product-right-residual.md). Taking $\mathbf{L}$ as the Heyting algebra $H$ and restricting to the consistent sub-algebra $\{\langle a_+, a_- \rangle : a_+ \wedge a_- = 0\}$ — which is exactly the carrier of $\mathrm{Chu}(\mathbf{L}, 0)$ — gives the identification. $\square$

## Remark

The full [twist product](../../../twist-product.md) $\mathbf{L}^\bowtie$ extends the linear-logic model beyond the consistency constraint $a_+ \wedge a_- = 0$: the Chu pairing $a_+ \wedge a_-$ is allowed to take any value in $\mathbf{L}$ rather than being required to be $0$. The inconsistent element $\top = \langle 1, 1 \rangle$ corresponds to $a_+ \wedge a_- = 1$ — maximal simultaneous positive and negative [evidence](teaching/explanations/evidence.md).
