---
type: theorem
status: proved
depends-on: [twist-modal-translation, twist-product, modal-necessity-operator]
---

# Twist translation consequence preservation

For a modal bilattice $\mathbf{B} = \mathbf{A}^\bowtie$ over a bimodal Boolean algebra $\mathbf{A}$, and formulas $\Gamma \cup \{\phi\}$ in the four-valued modal language over $\mathbf{L}^\bowtie$,

$$\Gamma \vdash_g \phi \iff \nu_1(\Gamma) \vdash^{cb}_g \nu_1(\phi),$$

and similarly for local consequence, where $\vdash^{cb}$ is classical bimodal consequence and $\nu_1$ is the positive component of the [twist modal translation](../../../../../../valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/content/twist-modal-translation/twist-modal-translation.md).

## Proof

Rivieccio, Jung, and Jansana (2017, Proposition 5.21). $\square$

## Corollary

The four-valued modal logic on predication settling fibers is equi-expressive with classical bimodal logic on the pair $(\nu_1, \nu_2)$-components: each four-valued consequence is classically representable, and each classical bimodal consequence is reflected back through the translation.
