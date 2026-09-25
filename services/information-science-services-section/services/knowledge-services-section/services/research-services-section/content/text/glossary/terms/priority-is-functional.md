---
constraint-pattern: priority
constraint-type: functional
constraint-violation: priority-violation
---

# priority is functional

A single priority per work record.

The engine's constraint morphism derives a `priority-violation` claim at any subject that carries more than one distinct object with positive evidence under `priority`. Violations are witnessing, not rejection — the claims all stay; the substrate just flags the conflict.
