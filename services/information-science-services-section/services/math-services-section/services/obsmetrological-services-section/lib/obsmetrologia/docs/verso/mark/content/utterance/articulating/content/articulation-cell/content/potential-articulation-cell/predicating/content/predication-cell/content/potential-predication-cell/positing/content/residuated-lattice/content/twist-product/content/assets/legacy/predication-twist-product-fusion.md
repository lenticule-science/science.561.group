---
type: morphism
class: operation
symbol: "⊙"
lean: PredicationCategories.Homebrew.Algebra.TwistProduct.fusion
depends-on: [residuated-lattice, twist-product]
---

# Twist-product fusion

A binary operation $\odot$ on the carrier $L \times L$ of the [twist product](../../../twist-product.md) $\mathbf{L}^\bowtie$ over an integral commutative [residuated lattice](../objects/residuated-lattice.md) $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$:

$$\langle x, y \rangle \odot \langle z, v \rangle := \langle x \cdot z,\ (x \to v) \wedge (z \to y) \rangle.$$

The first component is the monoid product of positive-[evidence](teaching/explanations/evidence.md) components; the second component cross-tests each side's positive evidence against the other side's negative evidence.

Together with the [twist-product right residual](twist-product-right-residual.md), the fusion forms an adjoint pair under the [truth order](../../../../../../pre-bilattice/content/truth-order/truth-order.md), as established in the [twist-product residuation theorem](../../../references/twist-product-residuation.md). The monoidal unit is $\langle 1, 1 \rangle$.
