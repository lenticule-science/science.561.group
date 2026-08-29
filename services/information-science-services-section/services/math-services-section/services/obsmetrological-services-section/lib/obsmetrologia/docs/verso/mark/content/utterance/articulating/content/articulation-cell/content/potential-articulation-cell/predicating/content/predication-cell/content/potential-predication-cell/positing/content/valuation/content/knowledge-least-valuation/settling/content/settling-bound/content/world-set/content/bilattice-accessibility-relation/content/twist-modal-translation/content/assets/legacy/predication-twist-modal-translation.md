---
kind: definition
type: translation
symbol: "\\nu"
depends-on: [twist-product, four-bilattice, bilattice-accessibility-relation, evidence]
---

# Twist modal translation

To each formula $\phi$ in the modal language over $\mathbf{L}^\bowtie$, assign a pair

$$\nu(\phi) = (\nu_1(\phi), \nu_2(\phi))$$

of classical-bimodal-language formulas, where $\nu_1$ extracts the positive-[evidence](../concepts/evidence.md) component and $\nu_2$ extracts the negative-evidence component.

For modal formulas, the translation is defined recursively:

$$\nu_1(\Box \phi) := \Box_+ \nu_1(\phi) \wedge \Box_- \sim \nu_2(\phi),$$

$$\nu_2(\Box \phi) := \sim \Box_+ \sim \nu_2(\phi),$$

where $\Box_+, \Box_-$ are two classical modal operators corresponding to the positive and negative components of the [bilattice accessibility relation](bilattice-accessibility-relation.md) $R$.

Non-modal cases follow the standard twist-product translation for $\mathbf{L}^\bowtie$ ([@rivieccio-et-al2017], Proposition 5.20).
