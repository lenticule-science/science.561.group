---
title: Policy Stack
aliases:
  - Policy Stack
  - policy stack
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

# Theorem (Policy Stack)

Acts such as `Discipline`, `Filter`, and `GovernRegime` already encode policy and
permission structures.  Together with the module wiring and distribution stacks,
they provide a coherent policy layer.

1. **Discipline/filter rules.**  
   `Discipline` partitions recognitions into layers; `Filter` defines admissible
   covering families that represent allowed flows.

2. **Governance.**  
   `GovernRegime` spells out how policies compose and how regimes are applied to
   traces or contexts.

3. **Enforcement.**  
   Since module wiring and distribution respect these structures, every module
   interaction can be checked against the discipline/filter rules before data is
   forwarded.

Thus the calculus already provides a policy stack: policies are earned acts,
modules must obey them, and the distribution/scheduling layers enforce them.
