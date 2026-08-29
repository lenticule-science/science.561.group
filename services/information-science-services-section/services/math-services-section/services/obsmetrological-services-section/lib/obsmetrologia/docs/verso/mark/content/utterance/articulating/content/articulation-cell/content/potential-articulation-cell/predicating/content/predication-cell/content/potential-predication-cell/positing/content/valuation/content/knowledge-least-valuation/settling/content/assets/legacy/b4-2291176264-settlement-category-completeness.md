---
type: theorem
status: proved
depends-on: [predication-settling, predication-settling-category, predication-settling-preorder-morphism, predication-fiber-algebra, knowledge-order]
---

# predication settling category completeness and cocompleteness

The [predication settling category](../objects/predication-settling-category.md) $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ has all small limits and colimits, computed pointwise.

## Proof

An [predication settling](../objects/predication-settling.md) is a $\leq_k$-monotone family of valuations in $\prod_p A_p$, indexed by the set-sized ordinal $\lambda$. Pointwise meet (respectively, join) of a small family of such predication settlings gives another $\leq_k$-monotone family in $\prod_p A_p$, because each [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie E \times E}$ is a complete lattice in the [knowledge order](../concepts/knowledge-order.md) and monotonicity is preserved by pointwise operations. Under the preorder-enriched morphism structure given by [predication-settling preorder morphisms](../morphisms/predication-settling-preorder-morphism.md), pointwise meet is the categorical product (limit over a discrete diagram) and pointwise join is the coproduct; general small limits and colimits follow the same pattern. $\square$

## Corollary

The pointwise $\vee_k$-join of two predication settlings $v, v'$ — that is,

$$(v \vee_k v')_\tau(p)(s, o) := v_\tau(p)(s, o) \vee_k v'_\tau(p)(s, o)$$

— is a $\leq_k$-semilattice operation on predication settlings. This pointwise join serves as the merge operation for distributed predication settling replicas, established formally in the [CRDT convergence theorem](crdt-convergence.md).
