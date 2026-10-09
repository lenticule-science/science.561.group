---
kind: theorem
status: proved
lean:
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberConv_comp_fiberConv
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberSubj_comp_fiberSubj
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberObj_comp_fiberObj
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberConv_comp_fiberSubj
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberSubj_comp_fiberConv
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberConv_comp_fiberObj
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberObj_comp_fiberConv
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberObj_comp_fiberSubj
  - SpatiotemporalKnowledgeSystem.Categorical.PredicateMap.fiberSubj_comp_fiberObj
depends-on: [predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection, predicate-category, entity-set]
---

# Predicate generator composition table

For $|E| \geq 3$, the four [predicate-category](../objects/predicate-category.md) generator classes are closed under composition.
The composition table at the fiber-action level is:

| $\circ$ | id | sw | sp1 | sp2 |
|---|---|---|---|---|
| id | id | sw | sp1 | sp2 |
| sw | sw | id | sp2 | sp1 |
| sp1 | sp1 | sp1 | sp1 | sp2 |
| sp2 | sp2 | sp2 | sp1 | sp2 |

Abbreviations: id = trivial [specialization](../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md), sw = [converse](../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-converse.md), sp1 = [subject-projection](../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-subject-projection.md), sp2 = [object-projection](../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-object-projection.md).
Read $g \circ f$ from row $g$ and column $f$.
Sub-support restrictions compose by intersection.

## Proof

Direct calculation on the index-map level on the [entity set](../objects/entity-set.md) $E$.
For example, subject-projection composed with converse: $(s, o) \mapsto (o, s) \mapsto (o, o)$ — object-projection.
The remaining cases are similar. $\square$
