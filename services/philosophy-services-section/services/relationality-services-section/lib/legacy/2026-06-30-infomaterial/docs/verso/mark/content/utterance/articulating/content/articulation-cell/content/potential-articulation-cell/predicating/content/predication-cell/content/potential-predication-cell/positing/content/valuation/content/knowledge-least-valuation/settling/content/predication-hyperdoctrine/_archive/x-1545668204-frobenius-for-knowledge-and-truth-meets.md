---
type: theorem
status: proved
lean:
  - PredicationCategories.Categorical.PredicateMap.fiberConv_frobenius_K
  - PredicationCategories.Categorical.PredicateMap.fiberConv_frobenius_T
  - PredicationCategories.Categorical.PredicateMap.frobenius_subj_K
  - PredicationCategories.Categorical.PredicateMap.frobenius_subj_T
  - PredicationCategories.Categorical.PredicateMap.frobenius_obj_K
  - PredicationCategories.Categorical.PredicateMap.frobenius_obj_T
depends-on: [predication-hyperdoctrine, specialization-hyperdoctrinal-adjoints, predicate-converse-quantifier-adjoints, predicate-subject-projection-quantifier-adjoints, predicate-object-projection-quantifier-adjoints, knowledge-order, truth-order]
---

# Frobenius reciprocity for knowledge and truth meets

For any [predicate-category](../objects/predicate-category.md) generator $f : q \to p$, any $\alpha$ in the fiber at $p$, and any $\phi$ in the fiber at $q$, both Frobenius reciprocity identities hold:

$$\exists_f^k(f^*(\alpha) \wedge_k \phi) \cong \alpha \wedge_k \exists_f^k(\phi),$$

$$\exists_f^t(f^*(\alpha) \wedge_t \phi) \cong \alpha \wedge_t \exists_f^t(\phi).$$

## Proof

Case-by-case on the four generators. The structural reason is that the [knowledge-order](../concepts/knowledge-order.md) meet $\wedge_k$ has $\bot$ as its absorber — aligned with [specialization](../morphisms/predicate-specialization.md)'s $\exists_f^k$-extension by $\bot$ — and the [truth-order](../concepts/truth-order.md) meet $\wedge_t$ has $\mathbf{f}$ as its absorber, aligned with $\exists_f^t$'s extension by $\mathbf{f}$.

**Specialization, $\leq_k$-system.** On $(s, o) \in \mathrm{dom}(q)$, both sides equal $\alpha(s, o) \wedge_k \phi(s, o)$. Off $\mathrm{dom}(q)$, the left-hand side is $\bot$ (extension by $\bot$); the right-hand side is $\alpha(s, o) \wedge_k \bot = \bot$ (since $\bot$ is the $\wedge_k$-absorber). Equal. ✓

**Subject-projection, $\leq_k$-system.** At the diagonal cell $(s, s)$:

$$\exists_f^k(f^*\alpha \wedge_k \phi)(s, s) = \bigvee_k\{\alpha(s, s) \wedge_k \phi(s, o') : o' \in E\} = \alpha(s, s) \wedge_k \bigvee_{o'}^k \phi(s, o')$$

by bilattice distributivity. The right-hand side equals the same expression. Off-diagonal, both sides are $\bot$. ✓

[Converse](../morphisms/predicate-converse.md) and [object-projection](../morphisms/predicate-object-projection.md) are analogous. The $\leq_t$-cases mirror with $\mathbf{f}$ replacing $\bot$ and $\wedge_t, \vee_t$ replacing $\wedge_k, \vee_k$. $\square$
