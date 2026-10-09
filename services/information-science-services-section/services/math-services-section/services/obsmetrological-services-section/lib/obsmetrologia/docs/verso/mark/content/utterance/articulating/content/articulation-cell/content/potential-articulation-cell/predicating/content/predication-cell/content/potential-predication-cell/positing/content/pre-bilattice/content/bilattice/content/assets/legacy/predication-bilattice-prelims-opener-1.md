---
type: narrative
introduces: [pre-bilattice, residuated-lattice, twist-product, knowledge-order, truth-order, entity-set]
see-also: [avron-representation, four-bilattice, jung-rivieccio-duality, knowledge-order, truth-order, twist-product-residuation]
kind: narrative
---

# Bilattice machinery

The value domain throughout the program is a *distributive bilattice* — an algebra equipped with two lattice orders simultaneously, the [truth order](../../../../truth-order/truth-order.md) $\leq_t$ and the [knowledge order](../concepts/knowledge-order.md) $\leq_k$. The smallest non-trivial example, [Belnap's $\mathbf{FOUR}$](../objects/four-bilattice.md) on the four states $\{\mathbf{t}, \mathbf{f}, \bot, \top\}$, supplies the canonical motivation: epistemic knowledge of a proposition can be *told true*, *told false*, *told both*, or *told neither*, and the two orders capture two different information-comparison axes.

The structure theorem that does most of the work is Avron's representation: every interlaced bilattice is a [twist product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) of two lattices. So although bilattice axiomatics are abstract, the concrete object the program uses is always a twist product $\mathbf{L}^{\bowtie}$ of a single bounded lattice $\mathbf{L}$ with itself — the second factor encoding negative evidence as the order-dual of the first. See [Avron representation](../theorems/avron-representation.md).

When $\mathbf{L}$ carries a [residuated-lattice](../objects/residuated-lattice.md) structure — a fusion product $\cdot$ residuated by $\to$ — the twist product inherits its own residuation, with explicit formulas; see [twist-product residuation](../../../../../../residuated-lattice/content/twist-product/references/twist-product-residuation.md). This is what licenses the linear-logical reading of bilattice values used in the settling dynamics and the [Jung–Rivieccio duality](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md) used downstream for the Priestley dualization.

The next several notes lay out the algebra: residuated lattices, twist products, the four-element specialization $\mathbf{FOUR}$, residuation theorems, and the bilattice homomorphisms that the four-generator predicate-category morphisms will eventually instantiate. The bilattice machinery is purely algebraic and stands without reference to the settling or predication structure — those are built on top of it.

Two finer technical results round out the residuation toolkit used downstream. The [residuation orbit monotonicity](../../predication-fiber-algebra/references/residuation-orbit-monotonicity.md) lemma records that the left-multiplication and left-residuation operators behave well under $\leq_t$ — the basic ingredient for orbit-style arguments on twist-product fusion. And on $\mathbf{FOUR}$ specifically, the [$\bot$-alternation oscillation](../../four-bilattice/references/four-bilattice-bot-alternation.md) result identifies the unique period-2 orbit under alternating fusion/residuation, isolating the only genuinely oscillatory finite dynamics — every other alternating orbit converges in $\leq 2$ steps.
