---
inversion: has-observation
---

# observes-work-item

Reference predicate carried by `observation-of-work` records pointing at the work-item being observed. Inversion populates `has-observation` at the work-item subject so all tracking observations on a work-item compose into one fiber. Per the Goodhart discipline, observations stay on observation-entities and never on the work-item itself; the inversion only brings reference claims back, not the metric values.

Note: the engine's inversion morphism (see `engine/packages/predication-algebra/morphisms/inversion.js`) negates the bilattice value on the derived claim. For reciprocal-view reference predicates, this is engine-current behavior; the value-negation may be revisited at the engine level later.
