---
type: concept
class: agent
depends-on: [self-representation]
see-also: [skill, runbook, office, agential-self-generation]
title: Agent
description: An entity in the predication-graph store of a predicated computer that bears predications about acting on the substrate.
---

# Agent

An entity in the [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) of a [predicated computer](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predicated-computer.md) that bears predications about *acting on the substrate*.
An agent is not a privileged process living outside the predication graph; it is an entity *in* the graph, addressable like any other entity, whose distinguishing predications declare what work it does, what skills it can invoke, what scope it operates within, and what witnesses it produces.

An agent meets the three conditions of an [agentic system](../../../../artificial-intelligence/theories/agents/terms/agentic-system.md) — environmental action, goal-directed planning, persistent state — *and additionally* satisfies the platform's self-representation invariant: the agent's identity, capabilities, and operative tools are all entities in the same store the agent acts on.
There is no off-substrate agent; if the agent's existence is not recorded as predications, the agent does not exist for the platform's purposes.

Three classes of distinguishing predications:

- **Identity predications.** Who the agent is — name, type (human, AI model identity, automated process), provenance, signing key.
  These are the predications a [witness](../../teaching/explanations/witness.md) cites when recording that *this* agent performed *this* action.
- **Capability predications.** What [skills](skill.md) the agent has access to, what [scope](../scope/scope.md) it operates within, what work-types it can handle.
  Capabilities are predications connecting the agent entity to skill entities; matching an agent to incoming work via [dispatch](dispatch.md) is a [traversal](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md) of these predications.
- **Operative predications.** What the agent has done — every [skill invocation](../skill/skill-invocation/skill-invocation.md), every [runbook](runbook.md) execution, every [tick](tick.md) participation, every [witness](../../teaching/explanations/witness.md) emitted.
  These predications accumulate in the [event log](../../../objects/event-log.md) and constitute the agent's history.

The structural commitment is that an agent that is not representable as predications is outside the platform: the platform treats only agents-as-entities.
This is what makes [agential self-generation](agential-self-generation/agential-self-generation.md) coherent — the agents and the substrate they act on are the same kind of stuff.
