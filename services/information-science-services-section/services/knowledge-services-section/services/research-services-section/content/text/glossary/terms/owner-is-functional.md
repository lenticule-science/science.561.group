---
constraint-pattern: owner
constraint-type: functional
constraint-violation: owner-violation
---

# owner is functional

One owning office per plan or project.

The engine's constraint morphism derives a `owner-violation` claim at any subject that carries more than one distinct object with positive evidence under `owner`. Violations are witnessing, not rejection — the claims all stay; the substrate just flags the conflict.
