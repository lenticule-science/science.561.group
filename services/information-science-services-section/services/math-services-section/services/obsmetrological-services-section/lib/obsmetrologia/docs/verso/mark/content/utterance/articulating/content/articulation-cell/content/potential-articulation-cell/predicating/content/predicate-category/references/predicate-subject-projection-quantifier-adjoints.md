---
kind: theorem
status: proved
lean:
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.existsK_subj
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.existsK_subj_galois_K
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.forallK_subj
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.forallK_subj_galois_K
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.existsT_subj
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.existsT_subj_galois_T
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.forallT_subj
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.forallT_subj_galois_T
depends-on: [predicate-subject-projection, predication-fiber-algebra, knowledge-order, truth-order, entity-set]
---

# Subject-projection quantifier adjoints

For a [predicate subject-projection](../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-subject-projection.md) $f : q \to p$, the induced fiber map $f^* : A_p \to A_q$ has both [knowledge-order](../concepts/knowledge-order.md) and [truth-order](../../predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md) adjoints:

**$\leq_k$-system.** - $\exists_f^k(w)(s, s) = \bigvee_k\{w(s, o') : o' \in E\}$ and $\exists_f^k(w)(s, o) = \bot$ for $s \neq o$. - $\forall_f^k(w)(s, s) = \bigwedge_k\{w(s, o') : o' \in E\}$ and $\forall_f^k(w)(s, o) = \top$ for $s \neq o$.

**$\leq_t$-system.** - $\exists_f^t(w)(s, s) = \bigvee_t\{w(s, o') : o' \in E\}$ and $\exists_f^t(w)(s, o) = \mathbf{f}$ for $s \neq o$. - $\forall_f^t(w)(s, s) = \bigwedge_t\{w(s, o') : o' \in E\}$ and $\forall_f^t(w)(s, o) = \mathbf{t}$ for $s \neq o$.

The $\exists_f^{k/t}$ are row-folds onto the diagonal — joining over the row $\{(s, o') : o' \in E\}$ at fixed subject $s$.
The $\forall_f^{k/t}$ are dual row-meets, with $\top$ or $\mathbf{t}$ off-diagonal.

## Proof

Adjunction check is cellwise.
For $\exists_f^k$: $\exists_f^k(w) \leq_k v$ holds iff $\exists_f^k(w)(s, o) \leq_k v(s, o)$ at every cell.
On the diagonal $(s, s)$: $\bigvee_k\{w(s, o') : o'\} \leq_k v(s, s)$ iff $w(s, o') \leq_k v(s, s)$ for all $o'$, equivalently $w(s, o') \leq_k f^*v(s, o')$ since $f^*v(s, o') = v(s, s)$.
Off-diagonal: $\bot \leq_k v(s, o)$, always.
So $\exists_f^k(w) \leq_k v \iff w \leq_k f^*v$.
The remaining three adjunctions follow analogously by the duality between row-fold $\bigvee_k$ and row-meet $\bigwedge_k$, and similarly in the $\leq_t$-system. $\square$
