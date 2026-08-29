---
type: theorem
status: proved
lean:
  - PredicationCategories.Categorical.PredicateMap.existsK_obj
  - PredicationCategories.Categorical.PredicateMap.existsK_obj_galois_K
  - PredicationCategories.Categorical.PredicateMap.forallK_obj
  - PredicationCategories.Categorical.PredicateMap.forallK_obj_galois_K
  - PredicationCategories.Categorical.PredicateMap.existsT_obj
  - PredicationCategories.Categorical.PredicateMap.existsT_obj_galois_T
  - PredicationCategories.Categorical.PredicateMap.forallT_obj
  - PredicationCategories.Categorical.PredicateMap.forallT_obj_galois_T
depends-on: [predicate-object-projection, predication-fiber-algebra, knowledge-order, truth-order, entity-set, predicate-subject-projection-quantifier-adjoints]
---

# Object-projection quantifier adjoints

For a [predicate object-projection](../morphisms/predicate-object-projection.md) $f : q \to p$, the induced fiber map $f^* : A_p \to A_q$ has both [knowledge-order](teaching/explanations/knowledge-order.md) and [truth-order](teaching/explanations/truth-order.md) adjoints, dual to those of [subject-projection](predicate-subject-projection-quantifier-adjoints.md):

**$\leq_k$-system.**
- $\exists_f^k(w)(o, o) = \bigvee_k\{w(s', o) : s' \in E\}$ and $\bot$ for $s \neq o$.
- $\forall_f^k(w)(o, o) = \bigwedge_k\{w(s', o) : s' \in E\}$ and $\top$ for $s \neq o$.

**$\leq_t$-system.** Same formulas with $\bigvee_t, \bigwedge_t, \mathbf{f}, \mathbf{t}$ replacing $\bigvee_k, \bigwedge_k, \bot, \top$.

The $\exists_f^{k/t}$ are column-folds onto the diagonal — joining over the column $\{(s', o) : s' \in E\}$ at fixed object $o$. The $\forall_f^{k/t}$ are dual column-meets.

## Proof

Cellwise adjunction check, dual to subject-projection by interchanging subject and object coordinates. $\square$
