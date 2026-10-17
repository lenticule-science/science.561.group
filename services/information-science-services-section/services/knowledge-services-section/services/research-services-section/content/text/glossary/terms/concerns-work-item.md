---
inversion: has-execution-event
---

# concerns-work-item

Reference predicate carried by `execution-event-of-work` records pointing at the work-item being executed. Inversion populates `has-execution-event` at the work-item subject so the execution history of a work-item is a one-fiber walk.

Note: the engine's inversion morphism (see `engine/packages/predication-algebra/morphisms/inversion.js`) negates the bilattice value on the derived claim. For reciprocal-view reference predicates, this is engine-current behavior; the value-negation may be revisited at the engine level later.
