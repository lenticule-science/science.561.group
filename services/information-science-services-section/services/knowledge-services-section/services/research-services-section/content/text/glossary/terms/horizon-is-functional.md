---
constraint-pattern: horizon
constraint-type: functional
constraint-violation: horizon-violation
---

# horizon is functional

A plan has one horizon (session/week/month/quarter/year/indefinite). Two horizons on the same plan is a drift violation.

The engine's constraint morphism derives a `horizon-violation` claim at any subject that carries more than one distinct object with positive evidence under `horizon`. Violations are witnessing, not rejection — the claims all stay; the substrate just flags the conflict.
