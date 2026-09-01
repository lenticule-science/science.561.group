---
type: narrative
discusses: [predication-hyperdoctrine, frobenius-for-knowledge-and-truth-meets, frobenius-for-fusion-fails, twist-product, residuated-lattice]
---

# Relation to [@maruyama2021]

Maruyama's 2021 Full Lambek hyperdoctrine is the closest predecessor to the [predication hyperdoctrine](../objects/predication-hyperdoctrine.md). Both are substructural hyperdoctrines with residuated fiber structure; both handle non-cartesian-closed fibers; both yield completeness for classes of non-classical predicate logics. Two distinctions matter.

## Fiber structure: integrality

Maruyama's fibers are Full Lambek algebras with *integral* fusion: the $\otimes$-unit equals the lattice top. The predication hyperdoctrine's fibers are distributive bilattices with *non-integral* residuation: the $\odot$-unit $(1, 1) = \top$ is not the lattice-top $\mathbf{t}$, and the $\odot$-absorber $\mathbf{f}$ is not the $\leq_k$-bottom $\bot$. Non-integrality has a direct consequence: [Frobenius reciprocity for fusion fails](../theorems/frobenius-for-fusion-fails.md). Where Maruyama states $\exists_f(f^*\alpha \otimes \phi) \cong \alpha \otimes \exists_f \phi$, this work uses [$\wedge_k$- and $\wedge_t$-Frobenius](../theorems/frobenius-for-knowledge-and-truth-meets.md) instead. The bilattice setting forces the conjunction-choice; the integral hyperdoctrine literature does not.

## One adjoint system vs. two

Maruyama has one adjoint triple per hyperdoctrine. The predication hyperdoctrine carries two: $\exists_f^k \dashv f^* \dashv \forall_f^k$ for the [knowledge order](../concepts/knowledge-order.md), and $\exists_f^t \dashv f^* \dashv \forall_f^t$ for the [truth order](../concepts/truth-order.md). They coexist on one fibration without contradiction. The bilattice's two orders each support full hyperdoctrinal structure, and the [two-internal-logics](../theorems/two-internal-logics.md) result makes the parallel logics formal.

The two-system structure is absent from Maruyama; the predication hyperdoctrine takes it as the central structural distinction, and [Lawvere's diagonal-$\Sigma$ construction](../theorems/lawvere-comprehension-classical.md) yielding two parallel equality predicates is the most visible payoff.
