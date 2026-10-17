---
type: narrative
discusses: [predication-fiber-algebra, twist-product, twist-product-residuation, twist-product-chu-correspondence, twist-product-fusion, twist-product-right-residual]
kind: narrative
---

# Predication fibers as concrete linear-logic models

The residuation $\odot \dashv \Rightarrow$ on a [predication fiber algebra](../objects/predication-fiber-algebra.md) is more than an internal adjunction — restricted to the sub-algebra of *consistent* values $\{(a_+, a_-) \in \mathbf{L}^\bowtie : a_+ \wedge a_- = 0\}$, it is exactly the $\otimes \dashv \multimap$ of classical multiplicative linear logic on the Chu space $\mathrm{Chu}(\mathbf{L}, 0)$, by [twist-product–Chu correspondence](../../../../../../residuated-lattice/content/twist-product/references/twist-product-chu-correspondence.md). Each fiber is therefore a concrete linear-logic model.

This places the predication fiber algebras in the lineage of *concrete models of classical linear logic* — coherence spaces (Girard), game models (Abramsky–Jagadeesan, Blass), phase spaces, the Chu construction itself, and so on. The structural distinguishing feature of the present family is the spatial-and-temporal indexing: not a single linear-logic model, but a family of models indexed compatibly by predicate $p$ and settling step $\tau$, each fiber connected to its neighbours through the [predication fiber functor](../../predication-fiber-algebra/references/predication-fiber-functor.md) and the settling dynamics.

The full [twist product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}^\bowtie$ extends the linear-logic model past the consistency constraint $a_+ \wedge a_- = 0$. The inconsistent point $\top = (1, 1)$ — corresponding to $a_+ \wedge a_- = 1$ — sits outside the standard Chu space but is treated as a legitimate value here. The extension is what allows the bilattice valuation to record "told both" as a designated state rather than a degenerate one. From the linear-logic point of view, this is a *paraconsistent extension* of the Chu model: the multiplicative connectives still satisfy their adjunction laws, but the model now hosts inconsistent points whose presence does not trivialize anything.

The reading is structural rather than ornamental: every theorem about $\odot$ and $\Rightarrow$ has a linear-logic translation, and the [twist-product fusion](../morphisms/twist-product-fusion.md) and [right-residual](../morphisms/twist-product-right-residual.md) computations are simultaneously bilattice computations and linear-logic-connective computations. The [predication fiber residuation](../../predication-fiber-algebra/references/predication-fiber-residuation.md) lemma certifies that the $\odot \dashv \Rightarrow$ adjunction transports cellwise from $\mathbf{L}^\bowtie$ to the entity-pair-indexed fiber $A_p = \mathbf{L}^{\bowtie\, E \times E}$ — making the linear-logic reading available pointwise on every cell of every predicate.
