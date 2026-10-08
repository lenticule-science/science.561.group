---
type: definition
class: catalog
realizes: [agential-self-generation]
depends-on: [agent, skill, runbook, shape, office]
see-also: [agentic-orchestration-platform]
title: Agential relations system
description: "The agent-bearing entity catalog of an agential orchestration platform: the sub-region of the predication-graph store consisting of the agents, skills, runbooks, shapes, offices, and governance rules through which the platform operates."
---

# Agential relations system

The agent-bearing entity catalog of an [agential orchestration platform](agentic-orchestration-platform.md): the sub-region of the [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) consisting of the agents, skills, runbooks, shapes, offices, and governance rules through which the platform operates.
Each component is a set of substrate entities of the corresponding kind:

- the [agent](teaching/explanations/agent.md) entities active or registered in the system;
- the [skill](teaching/explanations/skill.md) entities the agents can invoke;
- the [runbook](teaching/explanations/runbook.md) entities the agents can execute;
- the [shape](../../scope/shape/shape.md) entities classifying admissible predication patterns;
- the [office](teaching/explanations/office.md) entities defining governance roles;
- the [governance](teaching/explanations/governance.md) closure rules that determine how decisions are made.

The defining property is [agential self-generation](../agential-self-generation/agential-self-generation.md): the entire catalog is itself a section of the predication-graph store.
The agents that operate on the catalog can read, edit, and extend it — including their own predications, the predications of other agents, and the governance rules that determine what edits are admissible — through the same operators they use to act on ordinary content.

## Development arc

A new agential relations system passes through stages from declaration to operation:

- **Declared.** The catalog exists as predications, but the closure machinery has not been applied to it; admissibility constraints are unenforced.
- **Operating.** The closure machinery has been bound to the catalog; admissibility constraints are enforced; agents are invoking skills; witness chains accumulate.
- **Self-generating.** Every operative element is representable in the catalog, and every edit goes through the substrate's own operators.
  The platform reaches this stage asymptotically — as more skills are defined using skills, more shapes validate shapes, more runbooks generate runbooks.
  A platform that has not made progress on the asymptote is operating with off-substrate machinery the substrate cannot see.

The asymptote-not-absolute character of the third stage is structural: the platform is *approaching* full self-generation, not arriving at it.
Particular platform realizations declare what fraction of the catalog they consider in-substrate, and the engineering work is increasing that fraction over time.
