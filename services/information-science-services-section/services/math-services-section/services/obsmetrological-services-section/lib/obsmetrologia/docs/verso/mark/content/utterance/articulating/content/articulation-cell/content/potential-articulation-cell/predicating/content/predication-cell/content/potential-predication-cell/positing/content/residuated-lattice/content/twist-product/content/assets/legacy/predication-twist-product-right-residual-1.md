---
kind: morphism
type: operation
symbol: "⇒"
lean: SpatiotemporalKnowledgeSystem.Homebrew.Algebra.TwistProduct.twResiduum
depends-on: [residuated-lattice, twist-product]
class: operation
---

# Twist-product right residual

A binary operation $\Rightarrow$ on the carrier $L \times L$ of the [twist product](../../../twist-product.md) $\mathbf{L}^\bowtie$ over an integral commutative [residuated lattice](../objects/residuated-lattice.md) $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$:

$$\langle x, y \rangle \Rightarrow \langle z, v \rangle := \langle (x \to z) \wedge (v \to y),\ x \cdot v \rangle.$$

The first component tests implication in both directions of the residuated-lattice structure; the second component collects the product of the antecedent's positive [evidence](../concepts/evidence.md) with the consequent's negative evidence.

Together with the [twist-product fusion](twist-product-fusion.md), the right residual forms an adjoint pair under the [truth order](../../../../../../pre-bilattice/content/truth-order/truth-order.md), as established in the [twist-product residuation theorem](../../../references/twist-product-residuation.md).
