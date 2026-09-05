---
specialization: relations-system-blueprint
within: agential-relations-system
governs:
  - skill
  - structural-procedure
lacks: declared-agent-community
date-created: 2026-03-18
date-modified: 2026-03-18
---

# Agential Relations System Blueprint

## What this is

An **AgentialRelationsSystemBlueprint** is a [RelationsSystemBlueprint](relational-system-blueprint.md) within an [AgentialRelationsSystem](agential-relations-system.md).

An AgentialRelationsSystemBlueprint MUST satisfy all requirements of [AgentialRelationsSystemOutpost](agential-relations-system-outpost.md).
It MUST have shapes (condition 5) governing which skill invocations are valid within its scope.
It MUST have at least one structural procedure (condition 6) operating on it.
It CANNOT declare a governing soul or agent community — those are charter-level and locale-level concerns.
It CANNOT have a live inbox or accumulate cross-session memory — condition 7 is not satisfied.

It is a node that has satisfied conditions 1–6 within the ARS: it has a named skill surface (condition 4), shapes governing which skill invocations are valid (condition 5), and structural procedures operating on it (condition 6: runbooks, improvement operations).
The specification is complete.
But no agent community has been declared for this scope, and the entity is not yet live.

An agent encountering an ARS blueprint finds: a fully equipped operational surface with skills, constraint shapes governing those skills, and runbooks that operate on the scope.
What the agent does not find: a declaration of who the agents for this scope are, what their operational policies are, or any live inbox receiving new work.

## Self-generation at the blueprint level

An ARS blueprint satisfies partial self-generation: the skills it uses to operate on itself are nodes in the system (conditions 4–6 provide first-class skill, shape, and runbook objects).
But the full self-generation condition R = U_G(R) at the scope level requires that the agent community and their governing principles are also representable — which requires the charter and locale steps.

## Open questions
