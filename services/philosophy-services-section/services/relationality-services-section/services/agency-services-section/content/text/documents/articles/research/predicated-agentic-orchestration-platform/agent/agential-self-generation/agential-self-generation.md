---
type: concept
class: invariant
depends-on: [agent, skill, runbook, shape]
see-also: [agential-relations-system]
title: Agential self-generation
description: "The platform's defining structural commitment: every operative element is a substrate entity."
---

# Agential self-generation

The platform's defining structural commitment: *every operative element is a substrate entity*.
Every [agent](agent.md), every [skill](skill.md), every [runbook](runbook.md), every [shape](../../scope/shape/shape.md), every [office](office.md), every [governance](governance.md) rule is itself in the [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md).
There is no privileged "agent runtime" or "skill registry" living outside the substrate; the agential machinery is *in* the substrate, subject to the same operators as the data the agents act on.

The principle is the substrate-level [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) discipline applied to the agential layer.
Where self-representation requires that the substrate's *substrate-level* operative elements (closure rules, shapes, operator specifications) are entities, agential self-generation extends the requirement to the *agential* operative elements (agents, skills, runbooks, governance rules).
The agential layer's machinery, including the layer's own definition of what it means to be an agent or a skill, is in the same substrate the agents act on.

Three engineering consequences:

- **Skills can describe skills.** A skill that audits skills is a skill.
  A skill that improves skills is a skill.
  The system is its own metalanguage at the skill level, just as the substrate is its own metalanguage at the data level.
  An agent that cannot represent the skills it uses cannot improve them; the engineering content of "self-improvement" rests on this.
- **Shapes can validate shapes.** The shape that classifies "valid shape entity" is itself a shape.
  The system can check whether a newly-edited shape is well-formed using the shape-validation skill, which is itself a skill recorded as predications.
  The recursion is bounded: shape-validating-shapes converge to a fixed point at finite depth.
- **The org chart is in the store.** The [office](office.md) graph, the [governance](governance.md) rules, the [scope](../../scope/scope.md) hierarchy are all sub-graphs of the [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md).
  Reorganizing the org chart is editing predications, recorded in the [event log](../../../objects/event-log.md).
  There is no separate "configuration" out-of-band; the configuration is *in* the substrate.

Agential self-generation is *asymptotic*, not absolute.
A platform need not have every operative element representable from day one; it can start with externally-defined operative tools and progressively migrate them into the substrate.
The asymptote is approached as more skills are defined using skills, more shapes validate shapes, more runbooks generate runbooks.
A platform that is not making progress on the asymptote has off-substrate machinery the substrate cannot see, audit, or modify — that machinery is a substrate gap.

The structural distinction is sharp: a multi-agent system that records *what its agents did* in a substrate is not yet agentially self-generating; an agential orchestration platform that additionally records *what its agents are, what their skills are, and what governs their actions* in the same substrate is.
The first is the substrate-level [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) discipline applied to the agents' actions; the second is the agential-level commitment that the agents themselves and their machinery are substrate content.
