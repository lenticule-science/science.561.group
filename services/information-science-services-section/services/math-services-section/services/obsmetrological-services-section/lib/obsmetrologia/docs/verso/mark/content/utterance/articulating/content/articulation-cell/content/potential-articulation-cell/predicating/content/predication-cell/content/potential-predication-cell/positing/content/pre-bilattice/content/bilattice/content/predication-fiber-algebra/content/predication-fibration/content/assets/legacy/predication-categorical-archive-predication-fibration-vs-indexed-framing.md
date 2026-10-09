---
type: narrative
discusses: [predication-fibration, predication-hyperdoctrine, settling-coalgebra-structure, gray-street-fibration-monad, emmenegger-fibration-comonad, temporal-2-category]
---

# Why the fibration framing

Lawvere's original indexed-category framing of hyperdoctrines and Grothendieck–Bénabou's fibration framing are formally equivalent — pseudo-functors $\mathcal{C}^{\mathrm{op}} \to \mathbf{Cat}$ correspond to cloven Grothendieck fibrations $\mathcal{E} \to \mathcal{C}$ via the Grothendieck construction. The predication hyperdoctrine work uses the fibration framing throughout, for three reasons that are not stylistic.

## Pseudo- vs strict-algebra structure maps cleanly

The cloven/split distinction on fibrations corresponds exactly to pseudo-/strict-algebra structure for the [Gray–Street fibration 2-monad](../../theorems/gray-street-fibration-monad.md) $\mathbb{M}$ and dually for the [Emmenegger comonad](../../theorems/emmenegger-fibration-comonad.md) $\mathbb{N}$. The predication settling setting needs cloven fibrations — the fiber-functor of the predication algebra is functorial only up to canonical iso, not on the nose — so pseudo-algebras are the natural primitive. The indexed-category framing makes this distinction harder to track because pseudo-functoriality lives in the indexing itself rather than as a separate algebraic property.

## $\mathbf{Cat}/\mathcal{C}$ is the right ambient 2-category

The [temporal 2-category](../../../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}, \lambda)$ is built on the 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$; the diamond of coherence 2-cells lives there natively. Indexed-category framing has no equally natural ambient: pseudo-functor categories work but don't carry the clean 2-adjunction structure that the temporal axis upgrade demands.

## Coalgebraic settlings

The settling is expressed as a coalgebra $c : \mathcal{E} \to F_U(\mathcal{E})$ for an endofunctor on a 2-category of fibrations ([predication settling coalgebra](../../../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/content/settling-coalgebra-structure/settling-coalgebra-structure.md)). Coalgebraic framing requires the ambient category to be a 2-category of fibrations; the fibration view supplies it directly. Indexed-category coalgebras would need awkward translation through the Grothendieck construction.

## Relation to comprehension categories

Jacobs' comprehension categories (1999 Ch 5) strengthen plain hyperdoctrines via a "truth" 1-cell with specific right-adjoint properties beyond the comprehension schema of [Lawvere comprehension (classical)](../../../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-classical.md). The predication hyperdoctrine has comprehension but is not, in the present formulation, a full comprehension category — that gap is real and named here, not entrenched as a pre-committed development.
