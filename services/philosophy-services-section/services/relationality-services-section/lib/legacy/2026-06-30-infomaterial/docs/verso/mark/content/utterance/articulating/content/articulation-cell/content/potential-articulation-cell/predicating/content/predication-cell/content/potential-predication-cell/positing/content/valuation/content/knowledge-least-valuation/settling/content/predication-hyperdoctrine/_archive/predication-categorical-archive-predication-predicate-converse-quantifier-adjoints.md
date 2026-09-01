---
type: theorem
status: proved
lean:
  - PredicationCategories.Categorical.PredicateMap.fiberConv_involutive
  - PredicationCategories.Categorical.PredicateMap.fiberConv_galois_K
  - PredicationCategories.Categorical.PredicateMap.fiberConv_galois_T
depends-on: [predicate-converse, predication-fiber-algebra, knowledge-order, truth-order]
---

# Converse quantifier adjoints

For a [predicate converse](../morphisms/predicate-converse.md) $f : p^c \to p$, the induced fiber map $f^* : A_p \to A_{p^c}$ is its own adjoint in both bilattice orders:

$$\exists_f^k = f^* = \forall_f^k, \qquad \exists_f^t = f^* = \forall_f^t,$$

with $\exists_f^{k/t}(w)(s, o) = w(o, s)$ on the [predication fiber algebra](../objects/predication-fiber-algebra.md).

## Proof

The converse acts on cells as the swap $(s, o) \mapsto (o, s)$, which is its own inverse: $(f^*)^2 = \mathrm{id}$. A bijective involution on a poset is self-adjoint. Both [knowledge-order](teaching/explanations/knowledge-order.md) and [truth-order](teaching/explanations/truth-order.md) enrichments give the same adjoint conditions because the swap is order-preserving in both. $\square$
