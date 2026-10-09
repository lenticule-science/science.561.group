---
type: theorem
status: proved
lean:
  - PredicationCategories.Categorical.PredicateMap.fiberConv_comp_fiberConv
  - PredicationCategories.Categorical.PredicateMap.fiberSubj_comp_fiberSubj
  - PredicationCategories.Categorical.PredicateMap.fiberObj_comp_fiberObj
  - PredicationCategories.Categorical.PredicateMap.fiberConv_comp_fiberSubj
  - PredicationCategories.Categorical.PredicateMap.fiberSubj_comp_fiberConv
  - PredicationCategories.Categorical.PredicateMap.fiberConv_comp_fiberObj
  - PredicationCategories.Categorical.PredicateMap.fiberObj_comp_fiberConv
  - PredicationCategories.Categorical.PredicateMap.fiberObj_comp_fiberSubj
  - PredicationCategories.Categorical.PredicateMap.fiberSubj_comp_fiberObj
depends-on: [predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection, predicate-category, entity-set]
title: Predicate generator composition table
description: For $|E| \geq 3$, the four predicate-category generator classes are closed under composition.
---

# Predicate generator composition table

For $|E| \geq 3$, the four [predicate-category](../../research/2026/07/31/lenticule-import/objects/predicate-category.md) generator classes are closed under composition. The composition table at the fiber-action level is:

| $\circ$ | id | sw | sp1 | sp2 |
|---|---|---|---|---|
| id | id | sw | sp1 | sp2 |
| sw | sw | id | sp2 | sp1 |
| sp1 | sp1 | sp1 | sp1 | sp2 |
| sp2 | sp2 | sp2 | sp1 | sp2 |

Abbreviations: id = trivial [specialization](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md), sw = [converse](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-converse.md), sp1 = [subject-projection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-subject-projection.md), sp2 = [object-projection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-object-projection.md). Read $g \circ f$ from row $g$ and column $f$. Sub-support restrictions compose by intersection.

## Proof

Direct calculation on the index-map level on the [entity set](../../research/2026/07/31/lenticule-import/objects/entity-set.md) $E$. For example, subject-projection composed with converse: $(s, o) \mapsto (o, s) \mapsto (o, o)$ — object-projection. The remaining cases are similar. $\square$
