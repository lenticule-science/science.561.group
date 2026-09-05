---
kind: theorem
status: proved
depends-on: [predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection, predicate-category]
---

# Predicate generator pullback closure

The four [predicate-category](../objects/predicate-category.md) generator classes — [specialization](../morphisms/predicate-specialization.md), [converse](../morphisms/predicate-converse.md), [subject-projection](../morphisms/predicate-subject-projection.md), [object-projection](../morphisms/predicate-object-projection.md) — are closed under pullback formation in $\mathcal{C}$.

## Proof

Ten unordered pullback pairs verified case-by-case: spec × spec → spec on intersection of sub-supports; spec × converse → specialization with swap of sub-support; spec × subject-projection → specialization of rows; converse × subject-projection → diagonal; subject-projection × object-projection → diagonal; and analogous cases. All pullbacks yield objects in the four-generator closure. $\square$
