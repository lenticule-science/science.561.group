---
type: morphism
realizes: [predicate-category-naturality]
class: morphism
symbol: "f_{\\mathrm{spec}}"
lean:
  - PredicationCategories.Categorical.PredicateMap.specPullback
  - PredicationCategories.Categorical.PredicateMap.specPullbackHom
  - PredicationCategories.Categorical.PredicateMap.fiberSpec
  - PredicationCategories.Categorical.PredicateMap.specPullback_infT
  - PredicationCategories.Categorical.PredicateMap.specPullback_supT
  - PredicationCategories.Categorical.PredicateMap.specPullback_infK
  - PredicationCategories.Categorical.PredicateMap.specPullback_supK
  - PredicationCategories.Categorical.PredicateMap.specPullback_negation
  - PredicationCategories.Categorical.PredicateMap.specRestrict
  - PredicationCategories.Categorical.PredicateMap.specRestrictHom
depends-on: [predicate, predicate-category, predication-fiber-algebra, entity-set]
lean:
  - PredicationCategories.Categorical.PredicateMap.specPullback
  - PredicationCategories.Categorical.PredicateMap.specPullback_mem
  - PredicationCategories.Categorical.PredicateMap.specPullback_not_mem
  - PredicationCategories.Categorical.PredicateMap.fiberSpec
  - PredicationCategories.Categorical.PredicateMap.fiberSpec_apply
---

# Predicate specialization

A morphism in the [predicate category](../../research/2026/07/31/lenticule-import/objects/predicate-category.md), denoted $f : q \to p$, given by a pair of [predicates](../../research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/predicate.md) $q, p$ together with a sub-support inclusion
$$\iota_f : \mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p)$$
where $\mathrm{dom}(p), \mathrm{dom}(q) \subseteq E \times E$ are structurally designated sub-supports attached to $p, q$ within the [entity set](../../research/2026/07/31/lenticule-import/objects/entity-set.md) $E$.

The induced fiber-algebra map $f^* : A_p \to A_q$ is restriction along $\iota_f$:

$$f^*(v)(s, o) = \begin{cases} v(s, o) & \text{if } (s, o) \in \mathrm{dom}(q) \\ \bot & \text{otherwise.} \end{cases}$$

A specialization encodes that $q$ is a sub-predicate of $p$: $q$'s predication cells are the structurally designated sub-class $\mathrm{dom}(q) \subseteq \mathrm{dom}(p)$, with $q$'s values taken from $p$'s values on that sub-support and $\bot$ outside.
