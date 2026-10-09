---
inversion: is-assigned-via
---

# assigns-work-item

Reference predicate carried by `assignment-of-work` records pointing at the work-item being assigned. Inversion populates `is-assigned-via` at the work-item subject so a query at any work-item returns its assignment records.

Note: the engine's inversion morphism (see `engine/packages/predication-algebra/morphisms/inversion.js`) negates the bilattice value on the derived claim. For reciprocal-view reference predicates, this is engine-current behavior; the value-negation may be revisited at the engine level later.
