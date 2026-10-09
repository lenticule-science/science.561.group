---
kind: theorem
status: proved
symbol: F
lean:
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberFunctor
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberConv_apply
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberSubj_apply
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberObj_apply
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberFunctor_map_op_conv
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberFunctor_map_op_subj
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberFunctor_map_op_obj
depends-on: [predicate-category, predication-fiber-algebra, bilattice-homomorphism, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection]
title: Predication fiber functor
description: The assignment of each predicate $p$ to its predication fiber algebra $Ap = \mathbf{L}^{\bowtie\, E \times E}$ extends to a contravariant functor
---

# Predication fiber functor

The assignment of each [predicate](../../research/2026/07/31/lenticule-import/concepts/predicate.md) $p$ to its [predication fiber algebra](../../research/2026/07/31/lenticule-import/objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie\, E \times E}$ extends to a contravariant functor

$$F : \mathcal{C}^{\mathrm{op}} \longrightarrow \mathbf{DBiLat}(\mathbf{L})$$

from the [predicate category](../../research/2026/07/31/lenticule-import/objects/predicate-category.md) $\mathcal{C}$ (op-ed) to the category of distributive [bilattices](../../research/2026/07/31/lenticule-import/objects/bilattice.md) over $\mathbf{L}$ (with [bilattice homomorphisms](../../research/2026/07/31/lenticule-import/morphisms/bilattice-homomorphism.md) as morphisms), with the four generator classes of $\mathcal{C}$ acting as follows:

- A [predicate specialization](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md) $f : q \to p$ with inclusion $\iota_f : \mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p)$ induces $F(f) = f^* : A_p \to A_q$ by
$$f^*(v)(s, o) = \begin{cases} v(s, o) & \text{if } (s, o) \in \mathrm{dom}(q), \\ \bot & \text{otherwise.} \end{cases}$$
- A [predicate converse](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-converse.md) $f : p^c \to p$ induces $F(f) = f^*(v)(s, o) = v(o, s)$.
- A [predicate subject-projection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-subject-projection.md) $f : q \to p$ induces $F(f) = f^*(v)(s, o) = v(s, s)$.
- A [predicate object-projection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-object-projection.md) $f : q \to p$ induces $F(f) = f^*(v)(s, o) = v(o, o)$.

## Proof

Each generator acts on the uniform fiber algebra $\mathbf{L}^{\bowtie\, E \times E}$ by cellwise reindexing
$$f^*(v)(s, o) = v(g(s, o))$$
for an index map $g : E \times E \to E \times E$ — partial for specialization, where off-$\mathrm{dom}(q)$ cells return $\bot$. Specifically: specialization is restriction along $\iota_f$; converse is the swap $(s, o) \mapsto (o, s)$; subject-projection is the collapse $(s, o) \mapsto (s, s)$; object-projection is the collapse $(s, o) \mapsto (o, o)$.

Because the bilattice operations $\wedge_t, \vee_t, \wedge_k, \vee_k$ and the [negation](../../research/2026/07/31/lenticule-import/morphisms/negation.md) $\sim$ are all pointwise on the $E \times E$ index, any such cellwise reindexing preserves them and therefore defines a bilattice homomorphism.

**Functoriality.** $F(\mathrm{id}_p) = \mathrm{id}_{A_p}$ because the identity specialization (with $\mathrm{dom}(q) = \mathrm{dom}(p)$ and $\iota_f = \mathrm{id}$) induces the identity restriction. For composition, $F(g \circ f) = F(f) \circ F(g)$ follows from composition of index maps: the four generator types are closed under composition. For example:

- two specializations compose as a specialization with nested sub-support;
- two converses compose to the identity via the double swap;
- converse composed with subject-projection yields object-projection via $(s, o) \mapsto (o, s) \mapsto (o, o)$;
- subject-projection composed with subject-projection yields subject-projection.

Each resulting composite lies in the same four-class inventory, so $F$ is well-defined on all of $\mathcal{C}$. $\square$
