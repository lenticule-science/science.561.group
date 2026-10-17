---
kind: narrative
introduces: [predication-fibration, predication-hyperdoctrine]
see-also: [settling-coalgebra-structure, settling-endofunctor, settling-monotonicity, cohomology-series-position, gray-street-fibration-monad, priestley-dualizability, scott-continuous-regime-cohomology-vanishing, spatiotemporal-knowledge-presheaf, strict-regime-cohomology-vanishing]
---

# Hyperdoctrine layer

The 1-categorical [knowledge presheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md) is a flat object: a transfinite sequence of valuations satisfying [settling monotonicity](../concepts/settling-monotonicity.md). Sufficient for the [strict](../../../../sheaf/content/settling-cohomology/references/strict-regime-cohomology-vanishing.md) and [Scott-continuous](../../../../sheaf/content/settling-cohomology/references/scott-continuous-regime-cohomology-vanishing.md) regimes — the settling stabilizes, and the fixed point is a presheaf in the literal contravariant-functor sense.

Beyond those regimes, the flat presentation runs out of room. Non-Scott-continuous settlings do not stabilize at any countable ordinal; their structural content lives in coherence 2-cells; and the Priestley-dualization needed for cohomology requires the dual to live somewhere richer than a 1-category. The fix is to express the settling machinery as a 2-categorical structure — and to factor it into a stack of three properties, each a refinement of the previous:

1. The [**predication fibration**](../objects/predication-fibration.md) $\mathcal{E} \to \mathcal{C}$ — a cloven Grothendieck fibration whose fibers are predication fiber algebras and whose reindexing is the four-generator action. This is the "shape" of the indexing: a pseudo-algebra for the [Gray–Street fibration 2-monad](../theorems/gray-street-fibration-monad.md) $\mathbb{M}$.

2. The [**predication hyperdoctrine**](../objects/predication-hyperdoctrine.md) — a predication fibration that additionally supports two parallel adjoint quantifier systems (one in $\leq_k$, one in $\leq_t$), Frobenius reciprocity, Beck–Chevalley commutation, and comprehension. This is the predicate-logical content.

3. The [**settling-equipped predication hyperdoctrine**](../../settling-coalgebra-structure/settling-coalgebra-structure.md) — a hyperdoctrine equipped with a coalgebra for the [settling endofunctor](../morphisms/settling-endofunctor.md). This is the temporal content.

The three strata are layers, not alternatives: every settling-equipped hyperdoctrine *is* a hyperdoctrine, and every hyperdoctrine *is* a fibration. Each layer adds structure, all of it satisfying a property-likeness theorem (Kelly–Lack for the closure layer; the Hermida–Jacobs framework for the fibrational layer) — meaning the structure, when it exists, is unique up to unique iso. There is no choice in the construction; only verification that the structure is present.

The Priestley dualizability of the entire stratification — see [Priestley dualizability](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/references/priestley-dualizability.md) — is what licenses the [cohomological layer](cohomology-series-position.md) downstream.
