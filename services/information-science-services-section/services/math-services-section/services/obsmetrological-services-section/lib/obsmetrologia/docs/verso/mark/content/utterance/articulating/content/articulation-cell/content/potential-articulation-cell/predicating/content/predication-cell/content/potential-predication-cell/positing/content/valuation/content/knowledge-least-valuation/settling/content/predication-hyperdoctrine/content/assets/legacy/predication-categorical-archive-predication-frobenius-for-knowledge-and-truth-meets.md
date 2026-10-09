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
  - PredicationCategories.Categorical.PredicateMap.frobenius_spec_K
  - PredicationCategories.Categorical.PredicateMap.frobenius_spec_T
depends-on: [predication-hyperdoctrine, specialization-hyperdoctrinal-adjoints, predicate-converse-quantifier-adjoints, predicate-subject-projection-quantifier-adjoints, predicate-object-projection-quantifier-adjoints, knowledge-order, truth-order]
---

# Frobenius reciprocity for knowledge and truth meets

For any [predicate-category](../objects/predicate-category.md) generator $f : q \to p$, any $\alpha$ in the fiber at $p$, and any $\phi$ in the fiber at $q$, both Frobenius reciprocity identities hold:

$$\exists_f^k(f^*(\alpha) \wedge_k \phi) \cong \alpha \wedge_k \exists_f^k(\phi),$$

$$\exists_f^t(f^*(\alpha) \wedge_t \phi) \cong \alpha \wedge_t \exists_f^t(\phi).$$

## Proof

Case-by-case on the four generators. The structural reason is that the [knowledge-order](teaching/explanations/knowledge-order.md) meet $\wedge_k$ has $\bot$ as its absorber — aligned with [specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md)'s $\exists_f^k$-extension by $\bot$ — and the [truth-order](../../../../../../../../../pre-bilattice/content/truth-order/truth-order.md) meet $\wedge_t$ has $\mathbf{f}$ as its absorber, aligned with $\exists_f^t$'s extension by $\mathbf{f}$.

**Specialization, $\leq_k$-system.** On $(s, o) \in \mathrm{dom}(q)$, both sides equal $\alpha(s, o) \wedge_k \phi(s, o)$. Off $\mathrm{dom}(q)$, the left-hand side is $\bot$ (extension by $\bot$); the right-hand side is $\alpha(s, o) \wedge_k \bot = \bot$ (since $\bot$ is the $\wedge_k$-absorber). Equal. ✓

**Subject-projection, $\leq_k$-system.** At the diagonal cell $(s, s)$:

$$\exists_f^k(f^*\alpha \wedge_k \phi)(s, s) = \bigvee_k\{\alpha(s, s) \wedge_k \phi(s, o') : o' \in E\} = \alpha(s, s) \wedge_k \bigvee_{o'}^k \phi(s, o')$$

by bilattice distributivity. The right-hand side equals the same expression. Off-diagonal, both sides are $\bot$. ✓

[Converse](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-converse.md) and [object-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-object-projection.md) are analogous. The $\leq_t$-cases mirror with $\mathbf{f}$ replacing $\bot$ and $\wedge_t, \vee_t$ replacing $\wedge_k, \vee_k$. $\square$

Both identities are the aligned instance of the [Frobenius absorber-alignment criterion](frobenius-absorber-alignment-criterion.md): $\bot$ is the absorber of $\wedge_k$ and aligns with the $\leq_k$-extension default $\bot$; $\mathbf{f}$ is the absorber of $\wedge_t$ and aligns with the $\leq_t$-extension default $\mathbf{f}$. The [Frobenius-as-modular-law remark](prose/remarks/frobenius-as-modular-law.md) places the result inside the allegorical lineage of [@carboni-walters1987] and [@freyd-scedrov1990].
