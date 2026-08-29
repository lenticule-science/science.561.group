---
title: Policy Stack
keywords:
  - policy
  - permissions
  - governance
depends_on:
  - discipline
  - filter
  - govern-regime
  - theorem/internal/module-wiring
  - theorem/internal/distribution-stack
---
# Policy Stack

Acts such as `Discipline`, `Filter`, and `GovernRegime` already encode policy and
permission structures.  Together with the module wiring and distribution stacks,
they provide a coherent policy layer as an internal structure: recognitions are
partitioned into policy-relevant strata, admissible flows are filtered, and
regimes determine how those filters compose.

1. **Discipline/filter rules.**
   `Discipline` partitions recognitions into layers; `Filter` defines admissible
   covering families that represent allowed flows.

2. **Governance.**
   `GovernRegime` spells out how policies compose and how regimes are applied to
   traces or contexts.

Thus the calculus already provides a policy stack at the theorem level:
policies are earned via acts, discipline/filter/regime data form the policy
structure, and the module wiring and distribution stacks are required to
respect that structure. Specification and architecture documents describe how
concrete modules, services, and runbooks implement these policy constraints in
practice.
