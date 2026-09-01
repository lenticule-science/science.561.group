---
inversion: has-finding
---

# scopes-work-item

Reference predicate carried by `finding-on-work` records pointing at the work-item being reviewed. Inversion populates `has-finding` at the work-item subject so all review findings on a work-item are queryable from the work-item.

Note: the engine's inversion morphism (see `engine/packages/predication-algebra/morphisms/inversion.js`) negates the bilattice value on the derived claim. For reciprocal-view reference predicates, this is engine-current behavior; the value-negation may be revisited at the engine level later.
