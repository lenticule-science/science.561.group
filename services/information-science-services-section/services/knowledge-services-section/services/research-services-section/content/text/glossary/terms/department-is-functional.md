---
constraint-pattern: department
constraint-type: functional
constraint-violation: department-violation
---

# department is functional

One department per task/plan.

The engine's constraint morphism derives a `department-violation` claim at any subject that carries more than one distinct object with positive evidence under `department`. Violations are witnessing, not rejection — the claims all stay; the substrate just flags the conflict.
