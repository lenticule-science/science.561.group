---
type: concept
class: runbook
depends-on: [skill, agent]
see-also: [skill-invocation, runbook-execution]
title: Runbook
description: A composed-procedure entity in the predication-graph store — a sequence of skill invocations, with branching and bound state, that together constitute a higher-level operation an agent can perform.
---

# Runbook

A composed-procedure entity in the [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) — a sequence of [skill](skill.md) invocations, with branching and bound state, that together constitute a higher-level operation an [agent](agent.md) can perform.
Where a skill is the unit (one bounded-radius operation on the substrate), a runbook is the structured combination of skills that addresses a recurring multi-step task: deploying a service, opening a pull request, triaging a directory, executing a release.

A runbook entity carries predications declaring:

- **Steps.** An ordered list of skill-invocation specifications, each citing the skill entity, the scope it operates within, and the binding from prior steps' outputs to this step's inputs.
- **Branching.** Conditional steps — skills invoked only when a prior step's output matches a declared pattern.
- **State.** Local bindings — values produced by intermediate steps, flowing into later steps.
  State is recorded in the [event log](../../../objects/event-log.md) as the runbook executes; an interrupted runbook can be resumed by reading the most-recent state from the log.
- **Witness format.** The composed witness: the canonical hash of the runbook entity, the witnesses of each step's skill invocation in order, the canonical hash of the final outcome.

Per [self-representation](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), runbooks are entities.
Editing a runbook is editing predications.
A runbook can invoke another runbook; the platform admits arbitrary composition.

The runbook concept has two engineering uses that deserve named distinction:

- **Operational runbook.** An incident-response or routine-task procedure: "open a PR cleanup for this stale flag", "triage this directory's contents".
- **Skill-composing runbook.** A higher-level skill that decomposes into lower-level skills.
  The decomposition is itself a runbook entity, and the higher-level skill's body is "execute this runbook."
  In the , slash-commands like `/review` and `/security-review` are runbook-style compositions of constituent skills.

A runbook is not the same as an [agent](agent.md).
The agent invokes the runbook; the runbook is the procedure being invoked.
The same runbook can be invoked by many agents in many scopes; what distinguishes one invocation from another is the witness, which cites both the agent and the scope.
