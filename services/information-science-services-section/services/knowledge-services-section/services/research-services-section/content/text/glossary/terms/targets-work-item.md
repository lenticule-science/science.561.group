---
inversion: has-adjustment
---

# targets-work-item

Reference predicate carried by `adjustment-of-work` records pointing at the work-item being adjusted. Inversion populates `has-adjustment` at the work-item subject so the feedback history applied to a work-item is queryable from the work-item.

Note: the engine's inversion morphism (see `engine/packages/predication-algebra/morphisms/inversion.js`) negates the bilattice value on the derived claim. For reciprocal-view reference predicates, this is engine-current behavior; the value-negation may be revisited at the engine level later.
