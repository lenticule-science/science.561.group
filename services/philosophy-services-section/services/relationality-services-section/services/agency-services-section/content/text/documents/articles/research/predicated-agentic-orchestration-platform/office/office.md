---
type: concept
class: agent
depends-on: [agent, scope]
see-also: [governance, dispatch]
title: Office
description: "An agent entity whose distinguishing predications declare its governance role: what scope it presides over, what work-types it accepts, what other offices report to it, and what other offices it reports to."
---

# Office

An [agent](agent.md) entity whose distinguishing predications declare its *governance role*: what scope it presides over, what work-types it accepts, what other offices report to it, and what other offices it reports to.
An office is the engineering pattern for organizational structure on the [predication substrate](../../teaching/explanations/predication-substrate.md).
The "tasks office", the "publishing office", the "mud-server office" are entities; their relationships are predications.

Three classes of distinguishing predications:

- **Governance predications.** What [scope](../scope/scope.md) the office presides over, what predicates it has authority over, what closure rules apply within its scope.
  These are the predications that identify the office's "jurisdiction."
- **Reporting predications.** Which other offices this office reports to (for [escalation](../governance/escalation/escalation.md)) and which other offices report to it (for [dispatch](dispatch.md) of work it cannot directly handle).
  The reporting graph is itself a sub-graph of the [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md).
- **Capability predications.** What [skills](skill.md) and [runbooks](runbook.md) the office can invoke — the procedures admissible within its scope.

An office is a *kind* of agent — it is an agent-as-entity, but with the additional governance structure that makes it a node in an organizational graph.
A non-office agent (an individual human, an AI agent acting solo) lacks governance predications: it operates in a scope but does not preside over one.
A meaningful contrast is between an office like "the publishing office" (a governance node delegating work to subordinate skills and agents) versus an individual agent invoking skills directly (an agent invoking skills directly).

introduced offices as first-class.
The modern formulation makes the predication-graph structure explicit: an office is its predications; the organizational hierarchy is the reporting graph; reorganizing is editing predications.
This is the engineering content of "the org chart is in the same store as the rest of the data" — a property that makes the platform's [agential self-generation](../agent/agential-self-generation/agential-self-generation.md) include the org chart itself.
