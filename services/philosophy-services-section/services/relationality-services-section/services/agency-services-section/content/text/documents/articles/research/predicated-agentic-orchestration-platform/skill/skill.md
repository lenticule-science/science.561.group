---
type: concept
class: skill
depends-on: [agent, self-representation]
see-also: [runbook, dispatch, skill-invocation]
title: Skill
description: An invocable procedure represented as a predication-graph store entity.
---

# Skill

An invocable procedure represented as a [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) entity.
A skill entity carries predications declaring its name, its preconditions (what predications must hold before invocation is admissible), its body (the work it does — typically a sequence of [closure-rule applications](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md), shell commands, or external API calls), its postconditions (what predications it ensures are present after successful completion), and its [witness](../../teaching/explanations/witness.md) format.

A skill is the unit at which an [agent](agent.md) acts on the substrate.
Per [self-representation](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), skills are entities; the predication graph stores not just the data the skills operate on but the skills themselves.
Editing a skill is editing predications on the skill entity; an event in the [event log](../../../objects/event-log.md) records the edit; a re-derivation of the predication-graph from the event log shows the skill's evolution.

Three properties are load-bearing:

- **Skills are first-class.** A query for "what skills can be invoked at this scope?" is a [traversal](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md) of capability predications, not a call into a privileged registry.
  A new skill is added by inserting a skill entity, not by recompiling.
- **Skills declare their preconditions and postconditions.** Pre/postconditions are predicate patterns over the [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md).
  Pre-invocation, the [skill-invocation](skill-invocation/skill-invocation.md) operator checks that the preconditions match; post-invocation, it checks that the postconditions hold.
  A skill that does not declare these is not admissible — the invocation cannot be checked against its specification.
- **Skill invocations are recorded.** Every invocation produces a witness: which agent invoked the skill, on what scope, with what input, with what output.
  The witness is appended to the event log; a replay reproduces the invocation; an audit verifies it.

The platform's skill registry is the [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) itself: there is no separate registry, no compiled list of available skills, no service layer that mediates skill discovery.
Skills are entities, and the discovery operation is a substrate-level traversal.
