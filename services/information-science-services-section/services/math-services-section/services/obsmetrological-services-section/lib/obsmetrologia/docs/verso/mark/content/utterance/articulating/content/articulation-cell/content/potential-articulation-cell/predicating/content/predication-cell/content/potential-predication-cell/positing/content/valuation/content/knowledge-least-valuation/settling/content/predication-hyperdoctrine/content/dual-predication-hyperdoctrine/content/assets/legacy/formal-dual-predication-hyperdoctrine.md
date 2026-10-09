---
kind: definition
realizes: [predicate-category-naturality]
type: dualized-structure
depends-on: [predication-hyperdoctrine, settling-coalgebra-structure, paired-priestley-space, jung-rivieccio-duality, closure-2-monad, temporal-2-category, settling-endofunctor, predicate-category]
---

# Dual predication hyperdoctrine

The **dual predication hyperdoctrine** of an [predication hyperdoctrine](predication-hyperdoctrine.md) $\mathcal{E}$ over $(\mathbf{L}, \mathcal{C}, E)$ is the tuple

$$(\mathcal{E}^*, \, p^* : \mathcal{E}^* \to \mathcal{C}^{\mathrm{op}}, \, \mathbb{M}^*, \, \mathbb{N}^*, \, \mathrm{Cl}^*, \, \mathbf{T}^*(\mathcal{C}^{\mathrm{op}}, \lambda^{\mathrm{op}}))$$

obtained by piecewise application of the [Jung–Rivieccio duality](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md):

- **Fibers.** $\mathcal{E}^*_q = \mathrm{Spec}(A_q) \in \mathbf{PairedPriSp}$, the Priestley dual of the [predication fiber algebra](predication-fiber-algebra.md).
- **Total category.** $\mathcal{E}^*$ is the Grothendieck construction of the dualized fiberwise data over $\mathcal{C}^{\mathrm{op}}$.
- **Variance flip.** $p^*$ is an opfibration: morphisms in $\mathcal{C}$ stay where they were, but reindexing $(f^*)^*$ runs in the opposite direction in the fibers.
- **Dual fibration-KZ pair.** $\mathbb{M}^*$ is a lax-idempotent 2-comonad; $\mathbb{N}^*$ a colax-idempotent 2-monad.
  The 2-adjunction $\mathbb{M}^* \dashv \mathbb{N}^*$ on $\mathbf{Cat}/\mathcal{C}^{\mathrm{op}}$ has the same diamond shape as the primal $\mathbb{M} \dashv \mathbb{N}$ with monad/comonad roles swapped.
- **Dual closure 2-comonad.** $\mathrm{Cl}^*$ is a colax-idempotent 2-comonad on $\mathbf{PrFib}^*$; its action on dual fibers is *restriction-to-confirming-Priestley-points*, the Stone-dual face of "inflate and add consequences."
- **Dual temporal 2-category.** $\mathbf{T}^*(\mathcal{C}^{\mathrm{op}}, \lambda^{\mathrm{op}})$ has 0-cells $(\tau, X^*)$ for $\tau \in \lambda^{\mathrm{op}}$ and $X^* \in \mathbf{Cat}/\mathcal{C}^{\mathrm{op}}$; 1- and 2-cells dualize via the dual 2-adjunction.
- **Dual settling.** The [knowledge-presheaf settling coalgebra](../../../../settling-coalgebra-structure/settling-coalgebra-structure.md) $c : \mathcal{E} \to F_U(\mathcal{E})$ dualizes to a settling *algebra* $c^* : F_U^*(\mathcal{E}^*) \to \mathcal{E}^*$ on the dual side; the $\leq_k$-monotone primal orbit becomes a co-monotone dual orbit.

Existence and structural coherence of this entire tuple is the content of the [Priestley dualizability theorem](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/references/priestley-dualizability.md).

## Adjoint systems

Both quantifier triples $\exists_f^k \dashv f^* \dashv \forall_f^k$ and $\exists_f^t \dashv f^* \dashv \forall_f^t$ dualize to dual adjoint triples on Priestley side; [Frobenius for $\wedge_k, \wedge_t$](../../../../../../../references/frobenius-for-knowledge-and-truth-meets.md) and [Beck–Chevalley](../theorems/beck-chevalley-commutation-on-predication-bilattices.md) carry across, since both orders correspond to orthogonal directions on the paired Priestley space.

## Generator duals

Each of the four [predicate](../concepts/predicate.md) generators has a Priestley dual:

| Primal | Dual |
|---|---|
| [specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md) | inclusion of Priestley spectra (sub-support → full-support) |
| [converse](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-converse.md) | swap involution on Priestley pairs |
| [subject-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-subject-projection.md) | diagonal-extension lifting a function on diagonal points to a rowwise function |
| [object-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-object-projection.md) | dually, columnwise extension |
