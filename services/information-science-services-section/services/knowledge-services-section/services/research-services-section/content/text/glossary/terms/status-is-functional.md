---
constraint-pattern: status
constraint-type: functional
constraint-violation: status-violation
---

# status is functional

A task/plan/project has one status at a time. Two distinct status values at the same subject indicate drift — either schema or authoring error.

The engine's constraint morphism derives a `status-violation` claim at any subject that carries more than one distinct object with positive evidence under `status`. Violations are witnessing, not rejection — the claims all stay; the substrate just flags the conflict.
